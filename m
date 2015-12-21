From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 4/5] pinctrl: mediatek: Add Pinctrl/GPIO/EINT driver
 for mt2701
Date: Mon, 21 Dec 2015 10:37:09 +0800
Message-ID: <CAGS+omCTxV4jbW_AaAhDDf5OGBKeQT-XiCN=QNp8wKvs+Dd59w@mail.gmail.com>
References: <1449824872-18314-1-git-send-email-biao.huang@mediatek.com>
 <1449824872-18314-5-git-send-email-biao.huang@mediatek.com> <1450451637.19539.11.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450451637.19539.11.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Biao Huang <biao.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Biao and Joe,

On Fri, Dec 18, 2015 at 11:13 PM, Yingjoe Chen
<yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> On Fri, 2015-12-11 at 17:07 +0800, Biao Huang wrote:
>> Add mt2701 support using mediatek common pinctrl driver.
>> MT2701 have some special pins need an extra setting register
>> than other ICs, so adding this support to common code.
>>
>> Signed-off-by: Biao Huang <biao.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>> ---
>>  drivers/pinctrl/mediatek/Kconfig              |    6 +
>>  drivers/pinctrl/mediatek/Makefile             |    1 +
>>  drivers/pinctrl/mediatek/pinctrl-mt2701.c     |  590 +++++++
>>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c |   14 +
>>  drivers/pinctrl/mediatek/pinctrl-mtk-common.h |   12 +-
>>  drivers/pinctrl/mediatek/pinctrl-mtk-mt2701.h | 2323 +++++++++++++++++++++++++
>>  6 files changed, 2945 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt2701.c
>>  create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt2701.h
>
> This patch looks good to me.
> Thanks
>
> Acked-by: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

>
> Joe.C
>
>>
>> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
>> index 02f6f92..13e9939 100644
>> --- a/drivers/pinctrl/mediatek/Kconfig
>> +++ b/drivers/pinctrl/mediatek/Kconfig
>> @@ -9,6 +9,12 @@ config PINCTRL_MTK_COMMON
>>       select OF_GPIO
>>
>>  # For ARMv7 SoCs
>> +config PINCTRL_MT2701
>> +     bool "Mediatek MT2701 pin control" if COMPILE_TEST && !MACH_MT2701

This is 'bool', so can never be built as a module...

[snip...]

>> +module_init(mtk_pinctrl_init);

Yingjoe - you just ack'ed this change for the other MTK pinctrl.
So, let's apply it here too:

-module_init(mtk_pinctrl_init);
+arch_initcall(mtk_pinctrl_init);

>> +
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_DESCRIPTION("MediaTek MT2701 Pinctrl Driver");
>> +MODULE_AUTHOR("Biao Huang <biao.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>");

And remove these lines since this isn't a module.

-Dan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
