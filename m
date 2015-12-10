From: xuejiancheng <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 4/9] ARM: dts: add dts files for hi3519-demb board
Date: Thu, 10 Dec 2015 16:59:14 +0800
Message-ID: <56693EE2.20501@huawei.com>
References: <1449110668-23647-1-git-send-email-xuejiancheng@huawei.com>
 <5533669.m0KDLq8XOc@wuerfel> <56691C65.6090808@huawei.com>
 <2721289.3GUub5trUg@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2721289.3GUub5trUg@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, gaofei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, ml.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanghongwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 2015/12/10 16:04, Arnd Bergmann wrote:
> On Thursday 10 December 2015 14:32:05 xuejiancheng wrote:
>>>
>>> This is not what I meant. You have to use "syscon" as the most generic
>>> "compatible" value here, but should add a machine specific string
>>> as a more specific one. "hisilicon,sysctrl" is not appropriate because
>>> it does not identify the IP block uniquely, you can only use that
>>> in combination with another more specific string.
>>
>> OK. I will use "hisilicon,hi3519-syscon" and "syscon" as the compatible value
>> for the sysctrl node in hi3519.dtsi.
>>
> 
> Why hisilicon,hi3519-syscon instead of hisilicon,hi3519-sysctrl?

> Is this not called a sysctrl at all in the datasheet then?

It is OK to use hisilicon,hi3519-sysctrl.

I thought syscon was more commonly used as abbr. of system-controller in the kernel code.

> 	Arnd
> 
> .
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
