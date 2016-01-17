# DPImageGenerator

Easily to generate image for default photo profile, etc.
DPImageGenerator is tested on iOS 9.
This awesome library is wrote on swift 2.1


## Usage

``` swift
// Initialize an image generator. It's required.
let imageGen:DPImageGenerator = DPImageGenerator()

// Set frame using UIImage frame. It's required.
imageGen.image_frame = img_image.frame

// Set font for text inside image. The default is system font with font size 70.
imageGen.text_font = UIFont(name: "HelveticaNeue", size: 80)

// Set text color. The default is white
imageGen.text_color = UIColor.whiteColor()

// Set maximum character allowed inside image. 
// The option are two and one. And two as default value.
imageGen.max_char = maxCharacter.two

// Set text. It is required.
imageView.image = imageGen.imageGenerator("Dwi Putra")

/* Set dynamic gradient. 
Gradient color will be changed for every generate (true). 
Gradient color will be changed when it gets different char lenght (false). 
The default is true
*/
imageGen.dynamic_gradient = false
```

## Sample

![Screenshot](http://s29.postimg.org/pnglt4snb/i_OSputra27kenji11132015075025.png)
![Screenshot](http://s2.postimg.org/nuxvuceh5/i_OSputra27kenji11132015075047.png)
![gif](http://i.giphy.com/xTcnTaXMKftZO3Zbxe.gif =480x)

[This is the video sample](http://www.youtube.com/watch?v=hxBvk4Esj08)

## Installation 

Manual installation. Just copy DPImageGenerator folder to your project.
Will be available on cocoapods soon.

## Thanks To

soffes --> https://github.com/soffes/GradientView

## License

DPImageGenerator is released under the MIT license. See LICENSE for details.
