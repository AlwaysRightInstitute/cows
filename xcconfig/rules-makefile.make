# GNUmakefile

# Variables to set:
#   xyz_SWIFT_MODULES          - modules in the same package
#   xyz_EXTERNAL_SWIFT_MODULES - modules in a different package
#   xyz_SWIFT_FILES            - defaults to *.swift */*.swift
#   xyz_TYPE - [tool / library]
#   xys_INCLUDE_DIRS
#   xys_LIB_DIRS
#   xys_LIBS

ifeq ($($(PACKAGE)_TYPE),library)
  ifeq ($(UNAME_S),Darwin)
    LIBRARY_SWIFT_MODULE_INTERNAL_LINK_FLAGS += -install_name @rpath/$(SHARED_LIBRARY_PREFIX)$(PACKAGE)$(SHARED_LIBRARY_SUFFIX)
  endif
  SWIFT_INTERNAL_LINK_FLAGS += $(addprefix -Xlinker ,$(LIBRARY_SWIFT_MODULE_INTERNAL_LINK_FLAGS))
endif


# link against all Noze modules, if the user didn't explicitly specify modules
ifeq ($($(PACKAGE)_SWIFT_MODULES),)
ifneq ($(NOZE_DIR),)
$(PACKAGE)_SWIFT_MODULES = $(NOZE_ALL_MODULES)
endif
endif

# linked modules
$(PACKAGE)_LIBS += \
	$($(PACKAGE)_SWIFT_MODULES) \
	$($(PACKAGE)_EXTERNAL_SWIFT_MODULES)

# lookup modules in parent directory (the directory above the Package.swift dir)
ifneq ($($(PACKAGE)_EXTERNAL_SWIFT_MODULES),)
EXT_DIR=$(PACKAGE_DIR)/..
$(PACKAGE)_INCLUDE_DIRS += \
  $(addsuffix /$(SWIFT_REL_BUILD_DIR),$(addprefix $(EXT_DIR)/,$($(PACKAGE)_EXTERNAL_SWIFT_MODULES)))
$(PACKAGE)_LIB_DIRS     += \
  $(addsuffix /$(SWIFT_REL_BUILD_DIR),$(addprefix $(EXT_DIR)/,$($(PACKAGE)_EXTERNAL_SWIFT_MODULES)))
endif

# lookup modules in Noze directory (when set)
ifneq ($(NOZE_DIR),)
$(PACKAGE)_INCLUDE_DIRS += $(NOZE_DIR)/$(SWIFT_REL_BUILD_DIR)
$(PACKAGE)_LIB_DIRS     += $(NOZE_DIR)/$(SWIFT_REL_BUILD_DIR)
endif


# Linking flags (TODO: name is bad)
$(PACKAGE)_SWIFT_LINK_FLAGS = \
  $(addprefix -Xlinker ,$($(PACKAGE)_LDFLAGS)) \
  $(addprefix -I,$($(PACKAGE)_INCLUDE_DIRS)) \
  $(addprefix -L,$($(PACKAGE)_LIB_DIRS)) \
  $(SWIFT_INTERNAL_LINK_FLAGS) $(SWIFT_INTERNAL_INCLUDE_FLAGS) \
  $(addprefix -l,$($(PACKAGE)_LIBS))


# rules

ifeq ($($(PACKAGE)_TYPE),tool)
all : all-tool
endif
ifeq ($($(PACKAGE)_TYPE),library)
all : all-library
endif
ifeq ($($(PACKAGE)_TYPE),testsuite)
all : all-testsuite
endif

TOOL_BUILD_RESULT      = $(SWIFT_BUILD_DIR)/$(PACKAGE)
LIBRARY_BUILD_RESULT   = $(SWIFT_BUILD_DIR)/$(SHARED_LIBRARY_PREFIX)$(PACKAGE)$(SHARED_LIBRARY_SUFFIX)
TESTSUITE_BUILD_RESULT = $(SWIFT_BUILD_DIR)/$(SHARED_LIBRARY_PREFIX)$(PACKAGE)TestSuite$(SHARED_LIBRARY_SUFFIX)

clean :
	rm -rf $(TOOL_BUILD_RESULT) $(LIBRARY_BUILD_RESULT) \
	       $(APACHE_C_MODULE_BUILD_RESULT) $(APACHE_SWIFT_MODULE_BUILD_RESULT) \
	       *.o *.slo *.la *.lo Sources/*.o Sources/*.slo Sources/*.la Sources/*.lo \
	       .libs Sources/.libs
# rm -rf $(SWIFT_BUILD_DIR)

all-tool : $(TOOL_BUILD_RESULT)

all-library : $(LIBRARY_BUILD_RESULT)

all-testsuite : $(TESTSUITE_BUILD_RESULT)


# TODO: would be nice to make build dependend on other modules

$(TOOL_BUILD_RESULT) : $($(PACKAGE)_SWIFT_FILES)
	@mkdir -p $(@D)
	$(SWIFTC) $(SWIFT_INTERNAL_BUILD_FLAGS) \
	   -emit-executable \
	   -emit-module -module-name $(PACKAGE) \
           $($(PACKAGE)_SWIFT_FILES) \
           -o $@ $($(PACKAGE)_SWIFT_LINK_FLAGS)

$(LIBRARY_BUILD_RESULT) : $($(PACKAGE)_SWIFT_FILES)
	@mkdir -p $(@D)
	$(SWIFTC) $(SWIFT_INTERNAL_BUILD_FLAGS) \
	   -emit-library \
	   -emit-module -module-name $(PACKAGE) \
           $($(PACKAGE)_SWIFT_FILES) \
           -o $@ $($(PACKAGE)_SWIFT_LINK_FLAGS)

# load extra rules

-include rules-$($(PACKAGE)_TYPE).make
