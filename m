From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RESEND 3/5] ARM: berlin: add the pinctrl dependency for
 the Marvell Berlin SoCs
Date: Thu, 17 Apr 2014 15:24:12 +0200
Message-ID: <534FD5FC.6060703@gmail.com>
References: <1397135274-10764-1-git-send-email-antoine.tenart@free-electrons.com> <1397135274-10764-4-git-send-email-antoine.tenart@free-electrons.com> <5347B065.8060001@gmail.com> <20140417131357.GA31034@kwain>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140417131357.GA31034@kwain>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Antoine_T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/17/2014 03:13 PM, Antoine T=E9nart wrote:
> On Fri, Apr 11, 2014 at 11:05:41AM +0200, Sebastian Hesselbarth wrote=
:
>> On 04/10/2014 03:07 PM, Antoine T=E9nart wrote:
>>> Signed-off-by: Antoine T=E9nart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>> ---
>>>   arch/arm/mach-berlin/Kconfig | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/arm/mach-berlin/Kconfig b/arch/arm/mach-berlin/Kc=
onfig
>>> index d3c5f14dc142..291f1cac6c3d 100644
>>> --- a/arch/arm/mach-berlin/Kconfig
>>> +++ b/arch/arm/mach-berlin/Kconfig
>>> @@ -4,6 +4,8 @@ config ARCH_BERLIN
>>>   	select GENERIC_IRQ_CHIP
>>>   	select DW_APB_ICTL
>>>   	select DW_APB_TIMER_OF
>>> +	select PINCTRL
>>> +	select PINCTRL_BERLIN
>>
>> As said in the review of the previous patch, drop PINCTRL here
>> and select it in the PINCTRL_BERLIN Kconfig. Also, you'll need
>> PINCTRL_BERLIN_BG2 and PINCTRL_BERLIN_BG2Q as we don't want to
>> bloat each Berlin kernel with both drivers.
>
> Regarding PINCTRL, I can't drop it, pin-controller drivers depend on =
it.
> drivers/pinctrl/Kconfig begins with:
> 	if PINCTRL

Ah, ok. Then select PINCTRL here and the corresponding
PINCTRL_BERLIN_foo in the individual SoC Kconfig entries.

Sebastian

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
