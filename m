From: xuejiancheng <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [RESEND PATCH v8 1/6] clk: hisilicon: add CRG driver for hi3519
 soc
Date: Wed, 17 Feb 2016 11:08:19 +0800
Message-ID: <56C3E423.5080801@huawei.com>
References: <1454639472-17373-1-git-send-email-xuejiancheng@huawei.com>
 <1454639472-17373-2-git-send-email-xuejiancheng@huawei.com>
 <20160217004648.2278.64006@quark.deferred.io>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160217004648.2278.64006-/Ffx6e7uQFNsG52AEeRyZ2GXanvQGlWp@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanghongwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, raojun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, ml.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, gaofei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhangzhenxing-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, lidongpo-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Mike,
   Thank you very much for your comments.

On 2016/2/17 8:46, Michael Turquette wrote:
> Hello Jiancheng Xue,
> 
> Quoting Jiancheng Xue (2016-02-04 18:31:07)
>> diff --git a/drivers/clk/hisilicon/Makefile b/drivers/clk/hisilicon/Makefile
>> index 74dba31..3f57b09 100644
>> --- a/drivers/clk/hisilicon/Makefile
>> +++ b/drivers/clk/hisilicon/Makefile
>> @@ -4,8 +4,10 @@
>>  
>>  obj-y  += clk.o clkgate-separated.o clkdivider-hi6220.o
>>  
>> +obj-$(CONFIG_RESET_CONTROLLER) += reset.o
> 
> Do you really want to build reset.o for all hisi SoCs?
> 

This reset controller driver will be just used in some of hisilicon SOCs.
I'll add a specific config item for it like CONFIG_RESET_HISI. The config
item will be selected by default in SOCs needing this driver.

I'll also fix other issues in next version. Thank you!

Regards,
Jiancheng.



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
