# 简介
CFBlurHUD是基于UIVisualEffectView实现的指示器，拥有虚化模糊效果。

![CFBlurHUD效果演示](http://7xnrog.com1.z0.glb.clouddn.com/github_iOS-CFBlurHUD-show.gif)

----

# 支持
最低支持版本：iOS 8

# 安装
将CFBlurHUD下的所有内容拖入你的项目中

# 使用

普通Loading指示器

```
[CFBlurHUD show:@"你的信息"];

```

成功指示器

```
[CFBlurHUD showSuccess:@"成功"];

```

失败指示器

```
[CFBlurHUD showFaild:@"错误"];

```

如果你不希望显示信息，参数可以填入nil或者@""

```
[CFBlurHUD show:@""];
[CFBlurHUD showSuccess:@""];
[CFBlurHUD showFaild:@""];

```

# 自定义
如果你不喜欢CFBlurHUD的颜色，可以在CFBlurHUD.m的宏定义部分更改参数。

```
#define CFBlurHUDBorderColor [UIColor colorWithRed:98/255.0 green:98/255.0 blue:98/255.0 alpha:0.5]
#define CFBlurHUDMessageColor [UIColor colorWithRed:110/255.0 green:110/255.0 blue:110/255.0 alpha:1]
#define CFBlurHUDActivityIndicatorColor [UIColor colorWithRed:142/255.0 green:155/255.0 blue:236/255.0 alpha:1]

```

# 提示
如果你有需要更改CFBlurHUD的代码，请尽量不要更改CFBlurHUD的边框。因为UIVisualEffectView的Light样式在背景是白色情况下会难以被看见。