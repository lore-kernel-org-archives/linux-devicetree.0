From: zhangfei <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/6] reset: hisilicon: add reset core
Date: Tue, 22 Nov 2016 17:22:42 +0800
Message-ID: <0084ef53-c0e6-51e8-afa5-07264dfce529@linaro.org>
References: <1479800961-6249-1-git-send-email-zhangfei.gao@linaro.org>
 <1479800961-6249-2-git-send-email-zhangfei.gao@linaro.org>
 <3993565.nedzUBZcVS@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3993565.nedzUBZcVS@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Xinliang Liu <xinliang.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Xia Qing <saberlily.xia-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, Arnd

On 2016年11月22日 16:45, Arnd Bergmann wrote:
> On Tuesday, November 22, 2016 3:49:16 PM CET Zhangfei Gao wrote:
>> @@ -1,8 +1,8 @@
>>   obj-y += core.o
>> -obj-y += hisilicon/
>>   obj-$(CONFIG_ARCH_STI) += sti/
>>   obj-$(CONFIG_RESET_ATH79) += reset-ath79.o
>>   obj-$(CONFIG_RESET_BERLIN) += reset-berlin.o
>> +obj-$(CONFIG_ARCH_HISI) += hisilicon/
>>   obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
>>   obj-$(CONFIG_RESET_MESON) += reset-meson.o
>>   obj-$(CONFIG_RESET_OXNAS) += reset-oxnas.o
> Please leave the obj-y line, otherwise the COMPILE_TEST variant won't work.

COMPILE_TEST is added in drivers/reset/hisilicon/Kconfig
like
config COMMON_RESET_HI3660
         tristate "Hi3660 Reset Driver"
         depends on ARCH_HISI || COMPILE_TEST

The reason not using "obj-y" here is that reset.c will be compiled unconditionally.

drivers/reset/hisilicon/Makefile
obj-y   += reset.o

Thanks

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
