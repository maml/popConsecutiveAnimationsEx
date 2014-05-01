#
#  Be sure to run `pod spec lint MAMLPopSpringView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "MAMLPopSpringView"
  s.version      = "0.0.1"
  s.summary      = "A view that animates out and back in when touched"

  s.description  = <<-DESC
                   This is experimental - It's a view with that renders a circle and a label that
                   when touched animates out and back in again.

                   To use - drage an instance of UIView to the storyboard and make its dimanesions
                   square. Set the following runtime attributes: onColor, onText, offColor, and offText.
                   And that's it.

                   The animations are currently not configurable.

                   DESC

  s.homepage     = "https://github.com/maml/popConsecutiveAnimationsEx"
  s.screenshots  = "https://raw.githubusercontent.com/maml/popConsecutiveAnimationsEx/master/pop-consecutive-animations-ex.gif"

  s.license      = "MIT"

  s.author             = { "Matthew Loseke" => "mloseke@gmail.com" }
  s.social_media_url   = "http://twitter.com/mattloseke"

  s.platform     = :ios, "7.0"

  s.source       = { :git => "git@github.com:maml/popConsecutiveAnimationsEx.git", :commit => "1dba102" }
  s.source_files  = "Library/", "Library/*.{h,m}"
end
