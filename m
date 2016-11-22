From: zhangfei <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/6] reset: hisilicon: Use new driver reset-hi6222
Date: Tue, 22 Nov 2016 17:46:22 +0800
Message-ID: <0dcef3c7-7406-0728-5a18-c277bb8915ad@linaro.org>
References: <1479800961-6249-1-git-send-email-zhangfei.gao@linaro.org>
 <1479800961-6249-6-git-send-email-zhangfei.gao@linaro.org>
 <3837594.jmpXXfpk9Q@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3837594.jmpXXfpk9Q@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Xinliang Liu <xinliang.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Xia Qing <saberlily.xia-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 2016年11月22日 16:49, Arnd Bergmann wrote:
> On Tuesday, November 22, 2016 3:49:20 PM CET Zhangfei Gao wrote:
>> -#define PERIPH_RSTDIS0_MMC0             0x000
>> -#define PERIPH_RSTDIS0_MMC1             0x001
>> -#define PERIPH_RSTDIS0_MMC2             0x002
>> -#define PERIPH_RSTDIS0_NANDC            0x003
>> -#define PERIPH_RSTDIS0_USBOTG_BUS       0x004
>> -#define PERIPH_RSTDIS0_POR_PICOPHY      0x005
>> -#define PERIPH_RSTDIS0_USBOTG           0x006
>> -#define PERIPH_RSTDIS0_USBOTG_32K       0x007
>> -#define PERIPH_RSTDIS1_HIFI             0x100
>> -#define PERIPH_RSTDIS1_DIGACODEC        0x105
>> +/* reset in sysctrl */
>> +#define PERIPH_RSTDIS0_MMC0             0
>> +#define PERIPH_RSTDIS0_MMC1             1
>> +#define PERIPH_RSTDIS0_MMC2             2
>> +#define PERIPH_RSTDIS0_NANDC            3
>> +#define PERIPH_RSTDIS0_USBOTG_BUS       4
>> +#define PERIPH_RSTDIS0_POR_PICOPHY      5
>> +#define PERIPH_RSTDIS0_USBOTG           6
>> +#define PERIPH_RSTDIS0_USBOTG_32K       7
>> +#define PERIPH_RSTDIS1_HIFI             8
> You can't redefined the binding here, this is part of the ABI.
> You can however add new numbers as long as the old ones keep
> working.
The methods are different.
The original define is offset | bit_shift, and driver has to parse 
offset and bit shift.
The new define is just index of array, which is defined in the reset-xxx.c

Thanks

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
