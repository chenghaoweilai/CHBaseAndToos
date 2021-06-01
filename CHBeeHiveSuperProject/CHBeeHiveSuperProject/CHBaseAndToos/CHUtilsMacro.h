//
//  CHUtilsMacro.h
//  CHBeeHiveSuperProject
//
//  Created by 程浩MAC on 2021/5/22.
//

#ifndef CHUtilsMacro_h
#define CHUtilsMacro_h


// 获取主屏幕的高度
#define kMainScreenHeight   ([UIScreen mainScreen].bounds.size.height)
// 获取主屏幕的宽度
#define kMainScreenWidth    ([UIScreen mainScreen].bounds.size.width)

//设备宽高
#define kMainDevicesHeight   MAX((kMainScreenHeight), (kMainScreenWidth))//设备高
#define kMainDevicesWidth    MIN((kMainScreenHeight), (kMainScreenWidth))//设备宽

// 状态栏的高度
#define kStatusBarHeight                        [UIApplication sharedApplication].statusBarFrame.size.height
// 导航栏高度
#define kNavBarHeight       44
// 状态栏+导航栏高度 默认44
#define kTopBarHeight       (kStatusBarHeight + kNavBarHeight)
// 工具栏高度
#define kToolBarHeight      44
// TabBar 高度
//#define kTabBarSafeHeight   (IS_IPhoneX ? 34.0f:0.0f)

#define kTabBarHeight       (isIPhoneXSeries()? 83 : 49)

/** 防止循环引用 */
#define WS(weakSelf)                __weak __typeof(&*self) weakSelf = self;
#define SS(weakSelf)                __strong __typeof(weakSelf) strongSelf = weakSelf;

// 判断是否是iPad
static inline BOOL isIPad() {
    BOOL iPad = NO;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        iPad = YES;
    }
    return iPad;
}
// 获取系统版本
#define DeviceSystemVersion [[UIDevice currentDevice].systemVersion floatValue]
#define sh_scale(_float) (kMainDevicesWidth/375.0*(_float))   ///< 屏幕缩放参数，以`iPhone 6`为基准
#define ipad_scale(_float) (isIPad() ? _float : sh_scale(_float))  ///< 屏幕缩放参数，以`iPhone 6`为基准

#define sh_height_scale(_float) ((kMainDevicesHeight)/667.*(_float))   ///< 屏幕缩放参数，以`iPhone 6`为基准

#pragma mark - 数组&字典安全操作

// 数组获取对象
#define ArraySafeObjectAtIndex(array, obj, index); \
@try {\
obj = [array objectAtIndex:index];\
} @catch(NSException * exception) {\
NSLog(@"Array object exception:%@",exception);\
} @finally {\
}

// 数组添加对象
#define ArraySafeAddObject(array, obj); \
@try { \
[array addObject:obj]; \
} @catch(NSException * exception) { \
NSLog(@"Array addObject exception:%@",exception); \
} @finally { \
}

// 数组插入对象
#define ArraySafeInsertObject(array, obj, index); \
@try { \
[array insertObject:obj atIndex:index]; \
} @catch(NSException * exception) { \
NSLog(@"Array insertObject exception:%@",exception); \
} @finally { \
}

// 数组移除对象
#define ArraySafeRemoveObjectAtIndex(array, index); \
@try {\
[array removeObjectAtIndex:index];\
} @catch(NSException * exception) {\
NSLog(@"Array remove exception:%@",exception);\
} @finally {\
}

// 数组替换对象
#define ArraySafeReplaceObjectAtIndex(array, obj, index); \
@try {\
[array replaceObjectAtIndex:index withObject:obj];\
} @catch(NSException * exception) {\
NSLog(@"Array replace exception:%@",exception);\
} @finally{\
}

// 字典设置value
#define DictSafeSetValue(dict, key, value); \
@try { \
[dict setValue:value forKey:key]; \
} @catch(NSException * exception) { \
NSLog(@"Dict setValue exception:%@",exception); \
} @finally { \
}

// 字典设置对象
#define DictSafeSetObject(dict, key, obj); \
@try { \
[dict setObject:obj forKey:key]; \
} @catch(NSException * exception) { \
NSLog(@"Dict setObject exception:%@",exception); \
} @finally { \
}

// 字典移除对象
#define DictSafeRemoveObject(dict, key); \
@try { \
[dict removeObjectForKey:key]; \
} @catch(NSException * exception) { \
NSLog(@"Dict removeObject exception:%@",exception); \
} @finally { \
}

#endif /* CHUtilsMacro_h */
