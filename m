From: Tan Xiaojun <tanxiaojun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v1 0/2] Add Hisilicon Djtag driver
Date: Mon, 25 Jul 2016 10:00:21 +0800
Message-ID: <579572B5.5080108@huawei.com>
References: <1469177332-72156-1-git-send-email-tanxiaojun@huawei.com>
 <20160722105648.GD17584@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160722105648.GD17584@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, amitdanielk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, alex.aring-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, qiang.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016/7/22 18:56, Mark Rutland wrote:
> Hi,
> 
> I understand that some SoC/socket level PMU is accessed via these
> registers. It doesn't make sense to review either in isolation. Please
> put together a unified series, with both the djtag accessors and the
> PMU code.
> 
> On it's own, it's *very* difficult to understand how this fits into the
> SoC, and how it is to be used.
> 
> Thanks,
> Mark.
> 

OK. Thank you for your suggestion. I need to think about it again.

Thanks,
Xiaojun.

> On Fri, Jul 22, 2016 at 04:48:50PM +0800, Tan Xiaojun wrote:
>>
>> Tan Xiaojun (2):
>>   Documentation: arm64: Add Hisilicon HiP05/06/07 Sysctrl and Djtag dts
>>     bindings
>>   drivers: soc: Add support for Hisilicon Djtag driver
>>
>>  .../bindings/arm/hisilicon/hisilicon.txt           |   98 +++++
>>  drivers/soc/Kconfig                                |    1 +
>>  drivers/soc/Makefile                               |    1 +
>>  drivers/soc/hisilicon/Kconfig                      |   12 +
>>  drivers/soc/hisilicon/Makefile                     |    1 +
>>  drivers/soc/hisilicon/djtag.c                      |  373 ++++++++++++++++++++
>>  include/linux/soc/hisilicon/djtag.h                |   18 +
>>  7 files changed, 504 insertions(+)
>>  create mode 100644 drivers/soc/hisilicon/Kconfig
>>  create mode 100644 drivers/soc/hisilicon/Makefile
>>  create mode 100644 drivers/soc/hisilicon/djtag.c
>>  create mode 100644 include/linux/soc/hisilicon/djtag.h
>>
>> -- 
>> 1.7.9.5
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> 
> .
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
