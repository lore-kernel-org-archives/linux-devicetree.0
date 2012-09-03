From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/6 v2] ARM: integrator: initial device tree support
Date: Mon, 3 Sep 2012 23:43:37 +0200
Message-ID: <CACRpkdZhJyqeeXV_Zcfi7S01oH1Kw95qvAmOqrMKwhSLb-mX=Q@mail.gmail.com>
References: <1346471760-23993-1-git-send-email-linus.walleij@linaro.org>
 <1346471760-23993-3-git-send-email-linus.walleij@linaro.org>
 <1346471760-23993-4-git-send-email-linus.walleij@linaro.org>
 <201209011841.58977.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201209011841.58977.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Sep 1, 2012 at 8:41 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:

> On Saturday 01 September 2012, Linus Walleij wrote:
>> diff --git a/arch/arm/boot/dts/integratorcp.dts b/arch/arm/boot/dts/integratorcp.dts
>> +/ {
>> +     model = "ARM Integrator/CP";
>> +     compatible = "arm,integrator-cp";
>> +     ranges;
>> +
>> +     aliases {
>> +             arm,integrator-clocksource = &timer2;
>> +             arm,integrator-clockevent = &timer1;
>> +     };
>
> It looks like this file is almost a direct superset of the integratorap.dts
> file. How about including the other file from here and just adding the
> extra nodes and overriding the few bits that are actually different?

Isn't it more apropriate to create an integrator.dtsi for the common
stuff and include that into integratorap.dts and integratorcp.dts?

>> +#ifdef CONFIG_OF
>> +
> ...
>> +DT_MACHINE_START(INTEGRATOR_AP_DT, "ARM Integrator/AP (Device Tree)")
>> +     .reserve        = integrator_reserve,
>> +     .map_io         = ap_map_io,
>> +     .nr_irqs        = NR_IRQS_INTEGRATOR_AP,
>> +     .init_early     = ap_init_early,
>> +     .init_irq       = ap_init_irq_of,
>> +     .handle_irq     = fpga_handle_irq,
>> +     .timer          = &ap_of_timer,
>> +     .init_machine   = ap_init,
>> +     .restart        = integrator_restart,
>> +     .dt_compat      = ap_dt_board_compat,
>> +MACHINE_END
>> +
>> +#else
>> +
> ...
>>  MACHINE_START(INTEGRATOR, "ARM-Integrator")
>>       /* Maintainer: ARM Ltd/Deep Blue Solutions Ltd */
>>       .atag_offset    = 0x100,
>> @@ -486,3 +571,5 @@ MACHINE_START(INTEGRATOR, "ARM-Integrator")
>>       .init_machine   = ap_init,
>>       .restart        = integrator_restart,
>>  MACHINE_END
>> +
>> +#endif
>
> I think we discussed this before. It would be nice to replace the #if/#else
> with
>
> #ifdef CONFIG_OF
> ...
> #endif
> #ifdef CONFIG_ATAG
> ...
> #endif

Sure, have you applied Nico's patch adding CONFIG_ATAG to and
ARM SoC branch so I can base my patches on it?

I was under the impression that his patch would go through Russell's
tree and I would thus not be able to rely on it until it has landed there
and you have pulled Russell's stuff into your tree.

Currently I would make it impossible to use ATAGs if I do this since
the symbol does not exist, so I really need to base such an
approach in a tree which has CONFIG_ATAG in the first place.

Yours,
Linus Walleij
