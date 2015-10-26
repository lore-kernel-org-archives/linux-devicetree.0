From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] arm: Test for CONFIG_USE_OF to handle the USE_OF=n/OF=y case
Date: Mon, 26 Oct 2015 18:26:06 +0100
Message-ID: <CAMuHMdVjM7na7za==QZ+8EObxsNqL0n+PXSedwjQVzw2D1Y1zw@mail.gmail.com>
References: <1445786759-22005-1-git-send-email-geert@linux-m68k.org>
	<CAL_JsqKHozy_fKHuTokQobKHjF6Vay_mzYvP1TCU_sBjTrewBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKHozy_fKHuTokQobKHjF6Vay_mzYvP1TCU_sBjTrewBA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Mon, Oct 26, 2015 at 1:45 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Sun, Oct 25, 2015 at 10:25 AM, Geert Uytterhoeven
> <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
>> Until commit 0166dc11be911213 ("of: make CONFIG_OF user selectable"),
>> CONFIG_OF=y implied CONFIG_USE_OF=y on ARM, as the former could solely
>> be enabled by being selected by the latter.
>
> Arnd sent a similar fix[1] which I prefer.

Fine for me.

>> However, if the user now manually enables CONFIG_OF=y while
>> CONFIG_USE_OF=n:
>>
>>     arch/arm/kernel/devtree.c: In function 'setup_machine_fdt':
>>     arch/arm/kernel/devtree.c:215:2: error: implicit declaration of function 'early_init_dt_verify' [-Werror=implicit-function-declaration]
>>       if (!dt_phys || !early_init_dt_verify(phys_to_virt(dt_phys)))
>>       ^
>>     arch/arm/kernel/devtree.c:218:2: error: implicit declaration of function 'of_flat_dt_match_machine' [-Werror=implicit-function-declaration]
>>       mdesc = of_flat_dt_match_machine(mdesc_best, arch_get_next_mach);
>>       ^
>>     arch/arm/kernel/devtree.c:218:8: warning: assignment makes pointer from integer without a cast
>>       mdesc = of_flat_dt_match_machine(mdesc_best, arch_get_next_mach);
>>             ^
>>     arch/arm/kernel/devtree.c:228:3: error: implicit declaration of function 'of_get_flat_dt_root' [-Werror=implicit-function-declaration]
>>        dt_root = of_get_flat_dt_root();
>>        ^
>>     arch/arm/kernel/devtree.c:229:3: error: implicit declaration of function 'of_get_flat_dt_prop' [-Werror=implicit-function-declaration]
>>        prop = of_get_flat_dt_prop(dt_root, "compatible", &size);
>>        ^
>>     arch/arm/kernel/devtree.c:229:8: warning: assignment makes pointer from integer without a cast
>>        prop = of_get_flat_dt_prop(dt_root, "compatible", &size);
>>             ^
>>     arch/arm/kernel/devtree.c:244:2: error: implicit declaration of function 'early_init_dt_scan_nodes' [-Werror=implicit-function-declaration]
>>       early_init_dt_scan_nodes();
>>       ^
>>
>> and
>>
>>     arch/arm/kernel/built-in.o: In function `setup_arch':
>>     arch/arm/kernel/setup.c:940: undefined reference to `setup_machine_fdt'
>>     arch/arm/kernel/setup.c:979: undefined reference to `arm_dt_init_cpu_maps'
>>
>> Replace tests for CONFIG_OF by tests for CONFIG_USE_OF where appropriate
>> to fix this.
>>
>> Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
>> ---
>> Cfr. http://kisskb.ellerman.id.au/kisskb/buildresult/12531538/
>>
>> I only fixed the particular issue with the randconfig from the build
>> above.  Are there more tests for CONFIG_OF that should be converted to
>> CONFIG_USE_OF?
>
> I'd rather move toward removing USE_OF and having arches select if
> they use EARLY_FLATTREE.
>
> Rob
>
> [1] http://lists.infradead.org/pipermail/linux-arm-kernel/2015-October/376484.html

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
