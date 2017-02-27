# 简介

CFBlurHUD 是基于 UIVisualEffectView 实现的指示器，拥有虚化模糊效果。

![CFBlurHUD效果演示](res/github_iOS-CFBlurHUD-show.gif)

# 支持

最低支持版本：iOS 8

# 安装

1. Cocoapods

```
pod 'CFBlurHUD'
```

2. 手动安装

将 CFBlurHUD 下的所有内容拖入你的项目中

# 使用

普通 Loading 指示器

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

如果你不希望显示信息，参数可以填入 `nil` 或者 `@""`

```
[CFBlurHUD show:@""];
[CFBlurHUD showSuccess:@""];
[CFBlurHUD showFaild:@""];
```

# 自定义

如果你不喜欢 CFBlurHUD 的颜色，提供以下方法：

```
+ (void)configBorderColor:(UIColor *)color;

+ (void)configMessageColor:(UIColor *)color;
```

# 反馈

如果有什么修改建议，可以发送邮件到coderfish@163.com，也欢迎到[我的博客](http://zhoulingyu.com)

