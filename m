From: Chen Yu <chenyu56@huawei.com>
Subject: Re: [PATCH v3 10/12] hikey960: Support usb functionality of Hikey960
Date: Mon, 4 Mar 2019 09:27:11 +0800
Message-ID: <7069e483-8dbb-d0ed-dfe6-50e427574b9c@huawei.com>
References: <20190302090505.65542-1-chenyu56@huawei.com>
 <20190302090505.65542-11-chenyu56@huawei.com>
 <CALAqxLVSiWB-HRJWd-aBWNZ-u3JpK4WVR84DSEKRNV1Kzom8pg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CALAqxLVSiWB-HRJWd-aBWNZ-u3JpK4WVR84DSEKRNV1Kzom8pg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: liuyu712@hisilicon.com, Linux USB List <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Zhuangluan Su <suzhuangluan@hisilicon.com>, Kongfei <kongfei@hisilicon.com>, wanghu17@hisilicon.com, butao@hisilicon.com, chenyao11@huawei.com, fangshengzhou@hisilicon.com, Li Pengcheng <lipengcheng8@huawei.com>, songxiaowei@hisilicon.com, YiPing Xu <xuyiping@hisilicon.com>, xuyoujun4@huawei.com, yudongbin@hisilicon.com, Zang Leigang <zangleigang@hisilicon.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>Binghui Wang <wan>
List-Id: devicetree@vger.kernel.org



On 2019/3/4 4:17, John Stultz wrote:
> On Sat, Mar 2, 2019 at 4:05 AM Yu Chen <chenyu56@huawei.com> wrote:
>> +static int hisi_hikey_usb_probe(struct platform_device *pdev)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       struct device_node *root = dev->of_node;
> 
> Minor nit: root is unused and generates build warnings.
> 
OK. Thanks!

> thanks
> -john
> 
> .
> 

Thanks
Yu Chen
