//
//  HeaderView.m
//  TOCropViewControllerExample
//
//  Created by Мария Анисович on 13.12.2024.
//  Copyright © 2024 Tim Oliver. All rights reserved.
//

#import "HeaderView.h"

@interface HeaderView ()

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UILabel *logoLabel;

@end

@implementation HeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];

        [self setupTextField];
        [self setupLogoLabel];
    }
    return self;
}

- (void)setupTextField {
    self.textField = [[UITextField alloc] init];
    self.textField.translatesAutoresizingMaskIntoConstraints = NO;
    self.textField.userInteractionEnabled = NO;
    self.textField.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1.0];
    self.textField.layer.cornerRadius = 4;
    self.textField.layer.borderWidth = 1;
    self.textField.layer.borderColor = [UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1.0].CGColor;
    self.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.textField.font = [UIFont fontWithName:@"OpenSans-Regular" size:14];
    self.textField.textColor = [UIColor colorWithRed:45/255.0 green:45/255.0 blue:45/255.0 alpha:1.0];
    
    NSAttributedString *placeholder = [[NSAttributedString alloc] initWithString:@"Search images" attributes:@{
        NSForegroundColorAttributeName: [UIColor colorWithRed:116/255.0 green:116/255.0 blue:116/255.0 alpha:1.0]
    }];
    self.textField.attributedPlaceholder = placeholder;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(13, 5, 14, 14)];
    imageView.image = [[UIImage imageNamed:@"icon_search"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIView *imageContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 24)];
    [imageContainerView addSubview:imageView];
    self.textField.leftView = imageContainerView;
    self.textField.leftViewMode = UITextFieldViewModeAlways;
    self.textField.tintColor = [UIColor colorWithRed:87/255.0 green:87/255.0 blue:87/255.0 alpha:1.0];

    [self addSubview:self.textField];

    [NSLayoutConstraint activateConstraints:@[
        [self.textField.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
        [self.textField.topAnchor constraintEqualToAnchor:self.topAnchor constant:55],
        [self.textField.widthAnchor constraintEqualToConstant:215],
        [self.textField.heightAnchor constraintEqualToConstant:52]
    ]];
}

- (void)setupLogoLabel {
    self.logoLabel = [[UILabel alloc] init];
    self.logoLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.logoLabel.text = @"P";
    self.logoLabel.backgroundColor = [UIColor colorWithRed:67/255.0 green:11/255.0 blue:224/255.0 alpha:1.0];
    self.logoLabel.layer.masksToBounds = YES;
    self.logoLabel.layer.cornerRadius = 5;
    self.logoLabel.textAlignment = NSTextAlignmentCenter;
    self.logoLabel.font = [UIFont fontWithName:@"Pattaya-Regular" size:32];
    self.logoLabel.textColor = [UIColor whiteColor];

    [self addSubview:self.logoLabel];

    [NSLayoutConstraint activateConstraints:@[
        [self.logoLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:55],
        [self.logoLabel.widthAnchor constraintEqualToConstant:52],
        [self.logoLabel.heightAnchor constraintEqualToConstant:52],
        [self.logoLabel.rightAnchor constraintEqualToAnchor:self.textField.leftAnchor constant:-16]
    ]];
}

@end


