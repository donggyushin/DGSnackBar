1. [DGSnackBar](#DGSnackBar)
2. [Requirements](#Requirements)
3. [Installation](#Installation)
4. [Usage](#Usage)
5. [Properties](#Properties)


# DGSnackBar
Functional SnackBar that responds to the keyboard and shows a message at the bottom of the screen. 


<div>
<img src="https://user-images.githubusercontent.com/34573243/148552603-c615e240-0a33-4e1b-b8e9-5610d312aefc.gif" width=250 />
<img src="https://user-images.githubusercontent.com/34573243/148552616-42e418d7-22f9-4b8b-a6b2-1e57ed037d8c.gif" width=250 />
<img src="https://user-images.githubusercontent.com/34573243/148643147-05ee6901-95e4-484c-bd2f-49cc2b25e158.gif" width=250 />
</div>

## Requirements
- iOS 12.0+
- Swift 5.5+
- Xcode 10.0+


## Installation

### SPM
```
File > Add Packages > https://github.com/donggyushin/DGSnackBar
```

### CocoaPod
```
pod 'DGSnackBar', :git => 'https://github.com/donggyushin/DGSnackBar.git'
```

## Usage
```
DGSnackBar.shared.showToast("Hi") {
    print("Add here a function that you want to execute when user tapped the snackbar view")
}

// If you want to show SnackBar with title message
DGSnackBar.shared.showToast("Description text", "Title text")
```

## Properties


| Properties  | Description | Default | Type |
| ------------- | ------------- | ------------- | ------------- |
| backgroundColor  | Snackbar's background color  | .black | UIColor |
| textColor  | Snackbar's text color  | .white | UIColor |
| duration  | Snackbar's visual duration time  | 2.5 | CGFloat |
| textAlignment  | Snackbar's description text alignement  | .natural | NSTextAlignment |
| titleTextAlignment | Snackbar's title text alignment | .natural | NSTextAlignment |
| alpha  | Snackbar's alpha  | 0.8 | CGFloat |
| cornerRadius  | Snackbar's border radius  | 10 | CGFloat |


