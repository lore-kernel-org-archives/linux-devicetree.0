From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH v2 08/12] ARM: allow MULTIPLATFORM with !MMU
Date: Tue, 30 Dec 2014 23:02:31 +0100
Message-ID: <8ec6bcf0fe2ec13898cf6c259d9da559@agner.ch>
References: <1419895935-22966-1-git-send-email-stefan@agner.ch>
 <1419895935-22966-9-git-send-email-stefan@agner.ch>
 <CAL_JsqK94Pk2xPF1MMX0GU0CQEiwiDD2qv9v3k4WLg2znDVjgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqK94Pk2xPF1MMX0GU0CQEiwiDD2qv9v3k4WLg2znDVjgA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2014-12-30 22:42, Rob Herring wrote:
> On Mon, Dec 29, 2014 at 5:32 PM, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org> wrote:
>> In order to support SoC with heterogenous CPU architectures (such
>> as Freescale Vybrid/i.MXSX) it is preferable to use the same
>> architecture (ARCH_MXC in this case) for the MMU enabled and !MMU
>> CPU. Hence allow to select MULTIPLATFORM even without MMU.
> 
> This has been submitted before[1], but you obviously have a better
> reason now. I also need this for my Versatile series to fix
> allnoconfig. However, there are some issues with your implementation.
> 
>> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
>> ---
>>  arch/arm/Kconfig | 21 ++++++++++-----------
>>  1 file changed, 10 insertions(+), 11 deletions(-)
>>
>> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
>> index 97d07ed..95007b9 100644
>> --- a/arch/arm/Kconfig
>> +++ b/arch/arm/Kconfig
>> @@ -228,7 +228,7 @@ config VECTORS_BASE
>>           in size.
>>
>>  config ARM_PATCH_PHYS_VIRT
>> -       bool "Patch physical to virtual translations at runtime" if EMBEDDED
>> +       bool "Patch physical to virtual translations at runtime" if EMBEDDED || (ARCH_MULTIPLATFORM && MMU)
>>         default y
>>         depends on !XIP_KERNEL && MMU
>>         depends on !ARCH_REALVIEW || !SPARSEMEM
>> @@ -303,15 +303,12 @@ config MMU
>>  #
>>  choice
>>         prompt "ARM system type"
>> -       default ARCH_VERSATILE if !MMU
>> -       default ARCH_MULTIPLATFORM if MMU
>> +       default ARCH_MULTIPLATFORM
>>
>>  config ARCH_MULTIPLATFORM
>>         bool "Allow multiple platforms to be selected"
>> -       depends on MMU
>>         select ARCH_WANT_OPTIONAL_GPIOLIB
>>         select ARM_HAS_SG_CHAIN
>> -       select ARM_PATCH_PHYS_VIRT
>>         select AUTO_ZRELADDR
>>         select CLKSRC_OF
>>         select COMMON_CLK
>> @@ -783,13 +780,13 @@ comment "CPU Core family selection"
>>
>>  config ARCH_MULTI_V4
>>         bool "ARMv4 based platforms (FA526)"
>> -       depends on !ARCH_MULTI_V6_V7
>> +       depends on !ARCH_MULTI_V6_V7 && MMU
> 
> This is not right. !MMU does not mean the ARM arch does not have an
> MMU, but rather the MMU is already setup with identity mapping (or
> some other static mapping).

Yes, I'm aware of that. However, there are several configuration
depending on "!MMU". Allowing !MMU on ARCH_MULTI_V4...V7 would open up
new combination of configurations... This patch avoids this as much as
possible, by making !MMU only available for ARCH_MULTI_V7M.

I'm not sure what tests/verification would be expected before allowing
those new configurations... Personally, I also don't see much value in
allowing these configurations.

--
Stefan

> 
> Rob
> 
> [1] http://patchwork.ozlabs.org/patch/278996/

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
