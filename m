From: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] ARM: hip04: set ARCH_NR_GPIO to 128
Date: Sat, 29 Nov 2014 15:22:04 +0800
Message-ID: <5479741C.6090301@gmail.com>
References: <1417156188-500-1-git-send-email-wangzhou.bry@gmail.com> <1417156188-500-2-git-send-email-wangzhou.bry@gmail.com> <3094004.3WUKgY6xNz@wuerfel> <CACRpkdbahD314DL-ONQNkOzu9yHc_av4mxkqrYi8dS0PP43n8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdbahD314DL-ONQNkOzu9yHc_av4mxkqrYi8dS0PP43n8Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Xu Wei <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2014=E5=B9=B411=E6=9C=8828=E6=97=A5 23:54, Linus Walleij wrote:
> On Fri, Nov 28, 2014 at 10:33 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote=
:
>> On Friday 28 November 2014 14:29:47 Zhou Wang wrote:
>
>>> Set ARCH_NR_GPIO for Hisilicon Soc Hip04, which has 4 GPIO
>>> controllers with 32 GPIOs each.
>>>
>>> Signed-off-by: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>>   arch/arm/Kconfig                |    1 +
>>>   arch/arm/configs/hisi_defconfig |    3 +++
>>>   2 files changed, 4 insertions(+)
>>>
>>> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
>>> index 89c4b5c..26aae1e 100644
>>> --- a/arch/arm/Kconfig
>>> +++ b/arch/arm/Kconfig
>>> @@ -1509,6 +1509,7 @@ config ARCH_NR_GPIO
>>>          default 352 if ARCH_VT8500
>>>          default 288 if ARCH_ROCKCHIP
>>>          default 264 if MACH_H4700
>>> +       default 128 if ARCH_HIP04
>>>          default 0
>>>          help
>>>            Maximum number of GPIOs in the system.
>>>
>>
>> If I remember correctly, you don't actually need to set this if all =
gpio
>> clients are using the new gpio descriptor interfaces instead of gpio
>> numbers.
>
> Unfortunately you still have to. We are working on removing the
> dependency on ARCH_NR_GPIO, old habits die hard. But I just
> merged this patch:
> http://marc.info/?l=3Dlinux-gpio&m=3D141638350328535&w=3D2
>
> Which makes the situation better.
>
> There is however some other use of this define, so there is
> some work required still to get rid of it.
>
> And that patch may blow up in testing too...
>
>> Linus, one question for you: Does the ARCH_NR_GPIO actually work as =
designed?
>> I see that e.g. OMAP4 defines 192 GPIO lines but does not have an AR=
CH_NR_GPIO
>> setting. In an OMAP4-only kernel you would get the default value (51=
2)
>> from include/asm-generic/gpio.h, and in a multiplatform kernel you g=
et at
>> least 512 if any of the (ARCH_EXYNOS || ARCH_KEYSTONE || SOC_OMAP5 |=
| \
>> SOC_DRA7XX || ARCH_S3C24XX || ARCH_S3C64XX || ARCH_S5PV210 || ARCH_S=
HMOBILE
>> || ARCH_TEGRA) are set, so that is still good.
>
> Yeah that is how it kind of works...
>
>> However if one builds a kernel that just enables OMAP4 and HIP04, I =
suspect
>> it can't work on OMAP4 for any gpio line above 128, which seems to b=
e
>> a fundamental multiplatform problem.
>
> Yes I guess you are right :(

Hi Linus,

If so, what is your opinion about this patch about Hip04 GPIO?
If we use default ARCH_NR_GPIO, it will be strange to user:
for GPIO 0~127, their GPIO numbers are 384~511 :(

Best Regards,
Zhou Wang

>
> It's probably just so that so many platforms converge on 512.
>
>> Do we neet to increase the default to 512 for all ARCH_MULTIPLATFORM
>> configurations and just leave ARCH_SHMOBILE, ARCH_TEGRA and MACH_H47=
00
>> here as special cases?
>
> That'd be good while we are working to kill off
> ARCH_NR_GPIO for good.
>
> I guess there could be arch-specific problems with trying
> to get rid of ARCH_NR_GPIO for good, do you have some
> input on this? (Arch maintainer hat on...)
>
> Yours,
> Linus Walleij
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
