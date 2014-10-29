From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH RFC V3 2/3] mxs: add driver for ocotp in i.MX23 and i.MX28
Date: Wed, 29 Oct 2014 08:14:24 +0100
Message-ID: <545093D0.50806@i2se.com>
References: <1413628372-2809-1-git-send-email-stefan.wahren@i2se.com> <1413628372-2809-3-git-send-email-stefan.wahren@i2se.com> <3434817.dk7dLDFrcN@wuerfel> <544FCFB3.10100@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <544FCFB3.10100-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Ezequiel,

Am 28.10.2014 um 18:17 schrieb Ezequiel Garcia:
> On 10/20/2014 11:44 AM, Arnd Bergmann wrote:
>> On Saturday 18 October 2014 10:32:51 Stefan Wahren wrote:
>>> This patch brings readonly support for the On Chip OTP cells in the i.MX23
>>> and i.MX28 processor. The driver uses files (one for each cell) in sysfs
>>> as interface.
>>>
>>> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
>>> ---
>>>  drivers/misc/Kconfig     |   13 ++
>>>  drivers/misc/Makefile    |    1 +
>>>  drivers/misc/fsl_ocotp.c |  332 ++++++++++++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 346 insertions(+)
>>>  create mode 100644 drivers/misc/fsl_ocotp.c
>>>
>>> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
>>> index b841180..7455efa 100644
>>> --- a/drivers/misc/Kconfig
>>> +++ b/drivers/misc/Kconfig
>>> @@ -515,6 +515,19 @@ config VEXPRESS_SYSCFG
>>>           bus. System Configuration interface is one of the possible means
>>>           of generating transactions on this bus.
>>>  
>>> +config FSL_OCOTP
>>> +        tristate "Freescale MXS On-Chip OTP Memory Support"
>>> +        depends on ARCH_MXS && SYSFS
>>> +        help
>>> +          If you say Y here, you will get support for a readonly
>>> +         SysFS interface for the One Time Programmable memory pages that
>>> +         are stored on the Freescale i.MX23/i.MX28 processor.
>>> +
>>> +          To compile this driver as a module, choose M here: the module
>>> +          will be called fsl_ocotp.
>>> +
>>> +          If unsure, it is safe to say N.
>>>
>> I think this needs to be an MTD driver, not a "misc" driver, and it
>> should use the proper MTD interfaces instead of introducing an
>> incompatible set of interfaces.
>>
> Are you sure MTD is the right place? Recently an eFuse driver was merged
> in drivers/soc/tegra/fuse:
>
> http://lxr.free-electrons.com/source/drivers/soc/tegra/fuse/fuse-tegra.c
>
> Isn't this a similar device?

the i.MX28 Reference manual speak also of eFuses and this driver looks
more familiar to me.

>From my point of view it's important to keep the structure of 40 OTP
register a 32 bits. It doesn't make sense to merge them all together in
a blob of 1280 bits and a userspace tool needs to separate it again.

Thanks for the hint.

BR Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
