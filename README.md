1. [DGSnackBar](#DGSnackBar)
2. [Requirements](#Requirements)
3. [Installation](#Installation)
4. [Usage](#Usage)
5. [Properties](#Properties)


# DGSnackBar
SnackBar that responds to the keyboard and shows a message at the bottom of the screen.


<div>
<img src="https://user-images.githubusercontent.com/34573243/148552603-c615e240-0a33-4e1b-b8e9-5610d312aefc.gif" width=250 />
<img src="https://user-images.githubusercontent.com/34573243/148552616-42e418d7-22f9-4b8b-a6b2-1e57ed037d8c.gif" width=250 />
</div>

## Requirements
- iOS 13.0+
- Swift 5.0+
- Xcode 10.0+


## Installation

### SPM
```
File > Add Packages > https://github.com/donggyushin/DGSnackBar/edit/main/README.md
```

### CocoaPod
```
pod 'DGSnackBar', :git => 'https://github.com/donggyushin/DGSnackBar'
```

## Usage
```
DGSnackBar.shared.showToast("Hi")
```

## Properties


| Properties  | Description | Default | Type |
| ------------- | ------------- | ------------- | ------------- |
| backgroundColor  | Snackbar's background color  | .systemBackground | UIColor |
| textColor  | Snackbar's text color  | .label | UIColor |
| duration  | Snackbar's visual duration time  | 2.5 | CGFloat |
| textAlignment  | Snackbar's text alignement  | .natural | NSTextAlignment |
| alpha  | Snackbar's alpha  | 0.8 | CGFloat |
| cornerRadius  | Snackbar's border radius  | 10 | CGFloat |


