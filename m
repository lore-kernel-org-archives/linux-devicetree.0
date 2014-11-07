From: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [PATCH RFC V3 2/3] mxs: add driver for ocotp in i.MX23 and i.MX28
Date: Fri, 07 Nov 2014 16:14:21 -0300
Message-ID: <545D1A0D.9050307@vanguardiasur.com.ar>
References: <1413628372-2809-1-git-send-email-stefan.wahren@i2se.com> <3434817.dk7dLDFrcN@wuerfel> <544FCFB3.10100@vanguardiasur.com.ar> <2223659.OW08fe0cS1@wuerfel> <1003885907.22061.1415301932743.JavaMail.open-xchange@oxbsltgw00.schlund.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1003885907.22061.1415301932743.JavaMail.open-xchange-0SF9iQWekqLZ78VGacPtK8gmgJlYmuWJ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 11/06/2014 04:25 PM, Stefan Wahren wrote:
> Hi,
> 
>> Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> hat am 28. Oktober 2014 um 20:13 geschrieben:
>> [...]
>>
>> I came up with MTD just because a grep for OTP showed most hits in there.
>> I have to admit that I didn't check whether those are actually for
>> the same kind of device or for something else that goes by the same
>> name. Having it in MTD doesn't sound too obscure though.
>>
>> There are a few other references to efuse or otp in the kernel, which means
>> that at some point we probably want to have a common subsystem and user
>> interface for this, either in MTD or standalone.
>>
>> Between drivers/misc/fsl_ocotp.c, drivers/soc/tegra/fuse and
>> drivers/mfd/ab3100-otp.c, is there any commonality that we could
>> base an abstract API on?
> 
> i don't have a answer to this question, but how about changing fsl_ocotp driver
> to driver/soc/mxs/fuse with a similiar binary interface like the tegra ones.
> 
> Does it make sense to you?
> 

While you are here, maybe you can check if your API and driver will also
be useful to support i.MX6 OCOTP?

I understand that I might be asking too much, and that perhaps i.MX23/28
eFuses are completely different from other another i.MX.
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
