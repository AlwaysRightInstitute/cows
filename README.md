# cows

![Swift3](https://img.shields.io/badge/swift-3-blue.svg)
![Swift4](https://img.shields.io/badge/swift-4-blue.svg)
![Swift5](https://img.shields.io/badge/swift-5-blue.svg)
![macOS](https://img.shields.io/badge/os-macOS-green.svg?style=flat)
![tuxOS](https://img.shields.io/badge/os-tuxOS-green.svg?style=flat)
![Wasm](https://img.shields.io/badge/os-Wasm-green.svg?style=flat)

> 400+ ASCII 🐮s

The list is just an array of strings and can be used wherever.

![](https://cloud.githubusercontent.com/assets/170270/13090998/a9cdd6b0-d52b-11e5-83ec-614143c9a3bb.png)

## Examples

```
         (__)
         (oo)
  /-------\/
 / |     ||
+  ||----||
   ~~    ~~
     Cow


       \(:)/
       (o|o)
  /-----\_/
 /|      |
^ ||----||
  ^^    ^^
 Klingon Cow


                 ________________
         ^__^   /                \
         (oo)  ( Milk is logical. )
  /-------\/ --'\________________/
 / |     ||
*  ||W---||
   ^^    ^^
Mr Spock's cow


      (__)
    /   oo      ______
   |  /\_|     |      \
   |  |___     |       |
   |   ---@    |_______|
*  |  |   ----   |    |
 \ |  |_____
  \|________|
        CompuCow


        ___________________________
       | (__)  (__)  (__)   (__)  |
       | ( oo  ( oo  ( oo   ( oo  |
_______| /\_|  /\_|  /\_|   /\_|  |________
|                                         |
|   _____                        _____    |
|___|   |________________________|   |____|
    |___|                        |___|
              Cow-pooling


  /--------------------/
 / |     ||           /          (__)
*  ||----||          /-----------(oo)
   ^^    ^^                       \/
        Network Virtual Cow
(with separate frontend and backend)


         (__)               (__)  |    |  (__)
         (--)               (--)  |    |  (--)
  /-------\/   /o    /-------\/   |    I   \/-------\
 / |  M  |----< o   / |  L  |----<T    I>----|  D  | \
*  ||----|   /  o  *  ||----|     I    I     |----||  *
   ^^    ^      |     ^^    ^          |     ^    ^^
                |                      |
              Teenage Mutant Ninja Cows

                                  @
               (__)    (__) _____/
            /| (oo) _  (oo)/----/_____    *
  _o\______/_|\_\/_/_|__\/|____|//////== *- *  * -
 /_________   \   00 |   00 |       /== -* * -
[_____/^^\_____\_____|_____/^^\_____]     *- * -
      \__/                 \__/
               Cow-mobile
```


## Usage

```swift
import cows

cows.allCows

let someCow = vaca()
```


## API

### `allCows`

Returns an array of cows.

Usage:
```swift
#!/usr/bin/swift sh
import cows // @AlwaysRightInstitute

for cow in cows.allCows {
  print("Cow:")
  print(cow)
  print("---")
}
```

### `vaca()`

Returns a random cow.

Usage:
```swift
#!/usr/bin/swift sh
import cows // @AlwaysRightInstitute

print(cows.vaca())
```

## `vaca` Commandline Tool

The Swift 5 package now includes a commandline tool called `vaca`. When invoked
w/ no arguments it returns a random cow. Otherwise it tries to lookup a cow
matching the argument.

Example:
```bash
$ swift run vaca
        iiiiIiiii
         '|o o|`
   ________\_/
 / |        |
#  ||ww____||
   ||      ||
   ~~      ~~
 Happy Hannucow!

$ swift run vaca compiler
          (__)
        /  .\/.     ______
       |  /\_|     |      \
       |  |___     |       |
       |   ---@    |_______|
    *  |  |   ----   |    |
     \ |  |_____
      \|________|
CompuCow Discovers Bug in Compiler
```

## Related

- Original:
  - [cows](https://github.com/sindresorhus/cows) - Node.js cows, the original
  - [vaca](https://github.com/sindresorhus/vaca) - Get a random ASCII cow 🐮
  - [cows-docker](https://github.com/alexellis/cows-docker) - ASCII cows on Docker


## License

MIT © [Sindre Sorhus](http://sindresorhus.com)
Noze.io port: MIT © [ZeeZide GmbH](http://zeezide.de)
