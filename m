From: Chen Yu <chenyu56@huawei.com>
Subject: Re: [PATCH v3 10/12] hikey960: Support usb functionality of Hikey960
Date: Mon, 4 Mar 2019 10:35:13 +0800
Message-ID: <386ac0cf-cee7-bc1b-d22c-80dedff391cf@huawei.com>
References: <20190302090505.65542-1-chenyu56@huawei.com>
 <20190302090505.65542-11-chenyu56@huawei.com>
 <CAHp75VdaNn4OQAQt1cU8CZ+Cton90kxmwQSG5Du7KUzPR3hSCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VdaNn4OQAQt1cU8CZ+Cton90kxmwQSG5Du7KUzPR3hSCg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: liuyu712@hisilicon.com, USB <linux-usb@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, John Stultz <john.stultz@linaro.org>, Suzhuangluan <suzhuangluan@hisilicon.com>, Kongfei <kongfei@hisilicon.com>, wanghu17@hisilicon.com, butao@hisilicon.com, Yao Chen <chenyao11@huawei.com>, fangshengzhou@hisilicon.com, lipengcheng8@huawei.com, songxiaowei <songxiaowei@hisilicon.com>, xu yiping <xuyiping@hisilicon.com>, xuyoujun4@huawei.com, yudongbin@hisilicon.com, zangleigang@hisilicon.com, Chunfeng Yun <chunfeng.yun@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Binghui Wang <wangbinghui@hisilicon.com>, Heikki Krogerus <heikki.krogerus@linux.in>
List-Id: devicetree@vger.kernel.org

Hi Andy,

On 2019/3/3 0:01, Andy Shevchenko wrote:
> On Sat, Mar 2, 2019 at 11:05 AM Yu Chen <chenyu56@huawei.com> wrote:
>>
>> This driver handles usb hub power on and typeC port event of HiKey960 board:
>> 1)DP&DM switching between usb hub and typeC port base on typeC port
>> state
>> 2)Control power of usb hub on Hikey960
>> 3)Control vbus of typeC port
> 
>> +config HISI_HIKEY_USB
>> +       tristate "USB functionality of HiSilicon Hikey Platform"
>> +       depends on OF && GPIOLIB
>> +       help
>> +         If you say yes here you get support for usb functionality of HiSilicon Hikey Platform.
> 
>> +#include <linux/of.h>
> 
> It's hard to see why this have
> depends on OF followed by above header inclusion.
> 
This driver depends on devicetree, so I add "depends on OF".
But is seems that "#include <linux/of.h>" can be removed after "of_" API
have been removed. Thanks for your reminder!
>> +       hisi_hikey_usb->typec_vbus = devm_gpiod_get(dev, "typec-vbus",
>> +                       GPIOD_OUT_LOW);
> 
>> +       if (!hisi_hikey_usb->typec_vbus)
>> +               return -ENOENT;
> 
> Hmm... Is it possible to get NULL pointer from gpiod_get() at all?
> 
>> +       if (!hisi_hikey_usb->otg_switch)
>> +               return -ENOENT;
> 
> Ditto.
> 
I check the comments of devm_gpio_get API, it will not return NULL pointer.
But is it more safe to keep the NULL checking? What is your advice?
>> +       /* hub-vdd33-en is optional */
>> +       hisi_hikey_usb->hub_vbus = devm_gpiod_get(dev, "hub-vdd33-en",
>> +                       GPIOD_OUT_HIGH);
> 
> devm_gpio_get_optional() if it's indeed optional.
> 
OK.Thanks!
>> +       hisi_hikey_usb->role_sw = usb_role_switch_get(dev);
>> +       if (!hisi_hikey_usb->role_sw)
>> +               return -EPROBE_DEFER;
> 
>> +       else if (IS_ERR(hisi_hikey_usb->role_sw))
> 
> Redundant 'else'
> 
OK.
>> +               return PTR_ERR(hisi_hikey_usb->role_sw);
> 
>> +static const struct of_device_id id_table_hisi_hikey_usb[] = {
>> +       {.compatible = "hisilicon,gpio_hubv1"},
>> +       {.compatible = "hisilicon,hikey960_usb"},
>> +       {}
>> +};
> 
> MODULE_DEVICE_TABLE()?
> 
OK.

Thanks
Yu Chen
