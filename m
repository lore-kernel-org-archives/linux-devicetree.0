From: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v3 10/12] hikey960: Support usb functionality of Hikey960
Date: Sun, 3 Mar 2019 15:17:29 -0500
Message-ID: <CALAqxLVSiWB-HRJWd-aBWNZ-u3JpK4WVR84DSEKRNV1Kzom8pg@mail.gmail.com>
References: <20190302090505.65542-1-chenyu56@huawei.com> <20190302090505.65542-11-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190302090505.65542-11-chenyu56@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yu Chen <chenyu56@huawei.com>
Cc: Linux USB List <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Zhuangluan Su <suzhuangluan@hisilicon.com>, Kongfei <kongfei@hisilicon.com>, "Liuyu (R)" <liuyu712@hisilicon.com>, wanghu17@hisilicon.com, butao@hisilicon.com, chenyao11@huawei.com, fangshengzhou@hisilicon.com, Li Pengcheng <lipengcheng8@huawei.com>, songxiaowei@hisilicon.com, YiPing Xu <xuyiping@hisilicon.com>, xuyoujun4@huawei.com, yudongbin@hisilicon.com, Zang Leigang <zangleigang@hisilicon.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Binghui Wang <wangbinghui>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 2, 2019 at 4:05 AM Yu Chen <chenyu56@huawei.com> wrote:
> +static int hisi_hikey_usb_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct device_node *root = dev->of_node;

Minor nit: root is unused and generates build warnings.

thanks
-john
