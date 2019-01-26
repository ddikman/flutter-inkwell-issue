# inkwell_issue

This repository illustrates an issue with the InkWell widget.

## How to reproduce

1. Start the app
2. Using two fingers, press two of the coloured boxes at the same time

*Expected:*
One or both might "flash" with the splash tap circle but only one activates the dialog and the flash disappears.

*Actual:*
The highlight sticks on the 2nd card clicked. It only goes back on full redraw of the tree.

## Observations
The same behaviour have been observed without the dialog but something in the displaying of the dialog seems especially prone to causing the highlight not to complete/disappear.

## Recorded
![Recorded reproduction](inkwell_issue.gif)

