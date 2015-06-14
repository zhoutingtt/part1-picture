//
//  ViewController.m
//  part1-picture
//
//  Created by Apple on 15/6/12.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//这里不知道到底声明的是什么啦。不懂！！！
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
//也不知道这些括号里是什么啦！！
@property (nonatomic, assign)int index;
//更不知道，这个数组是怎么回事！！！
@property (nonatomic,strong)NSArray *imageDicts;

@end

@implementation ViewController

- (NSArray *)imageDicts{
//我猜：这个方法是从plist里取图片的路径呢吧
    if (!_imageDicts) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"imageDate.plist" ofType:nil];
        _imageDicts = [NSArray arrayWithContentsOfFile:path];
    
    }
        return _imageDicts;
}

- (IBAction)leftBtnOnclick:(UIButton *)sender {
    /*
     点击向左按钮时的动作
     先将检索位减一，也就是要跳转的位置
     再调用按钮的点击事件；
     */
    self.index --;
    [self BtnClickChange];
    
}
- (IBAction)rightBtnOnclick:(id)sender {
    /*
     点吉向右按钮动作
     先将检索位加一
     再调用点击事件；
     */
    self.index ++;
    [self BtnClickChange];
    
}

-(void)BtnClickChange{
    //顶部的页数/总共几张
    self.topLabel.text = [NSString stringWithFormat:@"%d/%d", (self.index+1),self.imageDicts.count];
    //每一个label对应的描述
    self.detailLabel.text = self.imageDicts[self.index][@"description"];
    //对应的plist里的图片，按index检索的位置取图片name
    self.imageView.image = [UIImage imageNamed:self.imageDicts[self.index][@"name"]];
    //如果第一张图片，左边按钮不可用
    self.leftBtn.enabled =(self.index != 0);
    //如果是最后一张图片，右边按钮不可用
    self.rightBtn.enabled =(self.index!= 4);

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
