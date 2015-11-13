# DPImageGenerator

Easily to generate image for default photo profile, etc.
DPImageGenerator is tested on iOS 9.
This awesome library is wrote on swift 2.1


## Usage

``` swift
// Initialize an image generator. It's required.
let imageGen:DPImageGenerator = DPImageGenerator()

// Set frame using UIImage frame. It's required.
imageGen.imageFrame = img_image.frame

// Set font for text inside image. The default is system font with font size 70.
imageGen.textFont = UIFont(name: "HelveticaNeue", size: 80)

// Set text color. The default is white
imageGen.textColor = UIColor.whiteColor()

// Set maximum character allowed inside image. 
// The option are two and one. And two as default value.
imageGen.maxChar = maxCharacter.two

// Set text. It is required.
imageView.image = imageGen.imageGenerator("Dwi Putra")
```

## Sample

![Screenshot](http://s4.postimg.org/5w9s8vqlp/i_OSputra27kenji11132015075025.png)
![Screenshot](http://s4.postimg.org/oicjn438t/i_OSputra27kenji11132015075047.png)

[Youtube Sample](http://www.youtube.com/watch?v=hxBvk4Esj08)

## Installation 

Manual installation.
Will be available on cocoapods soon.

## Thanks To
soffes --> https://github.com/soffes/GradientView
