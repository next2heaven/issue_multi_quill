# Showcasing issue with Flutter Quill editor in a scrollview (on iOS and Android)

To replicate issue, click and hold in the text field on iOS then release to view the 'paste' option. Paste a bunch of text in the editor and it'll create an error. ALSO, select a word and move the start or end selectors to view another error. 

I need this to work because I'll end up having multiple Quill editors in a listview all with unknown heights.


## Pasting Text Issue (iOS)
When doing the 'paste text' action it will produce:

*Failed assertion: line 107 pos 12: '_positions.isNotEmpty': ScrollController not attached to any scroll views.*


## Selecting Text Issue (iOS and Android)
When selecting a word and then moving the start or end handles to extent the selection it will produce this error:

*ScrollController not attached to any scroll views.
'package:flutter/src/widgets/scroll_controller.dart':
package:flutter/…/widgets/scroll_controller.dart:1
Failed assertion: line 107 pos 12: '_positions.isNotEmpty'*