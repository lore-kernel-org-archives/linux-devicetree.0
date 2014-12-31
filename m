From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: ARM: dts: sun9i: Allwinner A80 dtsi - missing clock-frequency property
Date: Wed, 31 Dec 2014 11:18:56 +0800
Message-ID: <CAGb2v65TOm6WGNB0yVF4Ujnc7RDime7jVenWSTXtysXNuT0-=g@mail.gmail.com>
References: <1412773376-25212-1-git-send-email-wens@csie.org>
 <1412773376-25212-3-git-send-email-wens@csie.org> <54A34538.2020802@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54A34538.2020802-Mmb7MZpHnFY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, Meng Zhang <kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 31, 2014 at 8:37 AM, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org> wrote:
> When booting Linux 3.19-rc2 on a Merrii Optimusboard using
> arch/arm/boot/dts/sun9i-a80-optimus.dts adn arch/arm/boot/dts/sun9i-a80.dtsi
> I get errors
> [    0.061192] /cpus/cpu@0 missing clock-frequency property
> [    0.061209] /cpus/cpu@1 missing clock-frequency property
> [    0.061223] /cpus/cpu@2 missing clock-frequency property
> [    0.061237] /cpus/cpu@3 missing clock-frequency property
> [    0.061251] /cpus/cpu@100 missing clock-frequency property
> [    0.061266] /cpus/cpu@101 missing clock-frequency property
> [    0.061283] /cpus/cpu@102 missing clock-frequency property
> [    0.061300] /cpus/cpu@103 missing clock-frequency property

The clock-frequency property is in no way connected to clocks
or cpufreq on Linux. It is solely used to generate a topology
map for multi-cluster systems. Personally I prefer the
cpu-topology bindings on arm64, but this is what we have.

> The dtsi was provided by patch
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=4ab328f06e305bf3ea254f4e3c94bb4d820998c1
>
> According to file pack/chips/sun9iw1p1/optimus/sys_config.fex supplied in
> the OptimusBoard SDK the big cluster can run at up to 1800 MHz, and
> the LITTLE cluster can run at up to 1200 MHz,depending on the CPU voltage:
>
> big
> 1.08V (1608Mhz, 1800Mhz]
> 1.00V (1536Mhz, 1608Mhz]
> 0.96V (1440Mhz, 1536Mhz]
> 0.90V (1296Mhz, 1440Mhz]
> 0.84V (   0Mhz, 1296Mhz]
>
> LITTLE
> 1.02V (1128Mhz, 1200Mhz]
> 0.96V (1008Mhz, 1128Mhz]
> 0.90V ( 864Mhz, 1008Mhz]
> 0.84V (   0Mhz,  864Mhz]
>
> I guess the proper way to specify the data is the one described in
> Documentation/devicetree/bindings/cpufreq/arm_big_little_dt.txt

cpufreq requires a bit more than just specifying the operating
points. Moreover, SMP is not supported on sun9i yet. For DVFS
we also need support for the PMICs.

> Other boards might run at other frequencies. Hence we might want to put this
> information into the board file
> arch/arm/boot/dts/sun9i-a80-optimus.dts.

We can also give a default set of OPP in the dtsi, and any boards
having special voltage requirements can override them or use the
voltage-derivation property (not sure that's the name).

> Documentation/devicetree/bindings/cpufreq/arm_big_little_dt.txt,
> arch/arm/boot/dts/exynos5260.dtsi, and
> arch/arm/boot/dts/exynos5420.dtsi, all assume that
> cpu@0-cpu@3 are A15 (big) and cpu@101-cpu@103 are A7 (LITTLE).
>
> Shouldn't arch/arm/boot/dts/sun9i-a80.dtsi stick to this convention?

This is not some convention. The values match what the hardware
says in the MPIDR.


ChenYu

> The scripts to create the uImage and to reproduce the problem are in
> https://github.com/xypron/kernel-optimusboard/tree/35d06c020f6584b5023e0e4bef67cc5a625f65bb
>
> Best regards
>
> Heinrich Schuchardt
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
