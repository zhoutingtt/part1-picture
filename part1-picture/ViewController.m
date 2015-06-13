//
//  ViewController.m
//  part1-picture
//
//  Created by Apple on 15/6/12.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic, assign)int index;
@property (nonatomic,strong)NSArray *imageDicts;

@end

@implementation ViewController

- (NSArray *)imageDicts{

    if (!_imageDicts) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"imageDate.plist" ofType:nil];
        _imageDicts = [NSArray arrayWithContentsOfFile:path];
    
    }
        return _imageDicts;
}

- (IBAction)leftBtnOnclick:(UIButton *)sender {
    self.index++;
    [self BtnClickChange];
    
}
- (IBAction)rightBtnOnclick:(id)sender {
    self.index++;
    [self BtnClickChange];
    
}

-(void)BtnClickChange{
    self.topLabel.text = [NSString stringWithFormat:@"%d/%d", (self.index+1),self.imageDicts.count];
    
    self.detailLabel.text = self.imageDicts[self.index][@"description"];
    self.imageView.image = [UIImage imageNamed:self.imageDicts[self.index][@"name"]];
    
    self.leftBtn.enabled =(self.index != 0);
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
