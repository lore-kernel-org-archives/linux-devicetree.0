From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: r8a7795: Increase the size of GIC-400 mapped registers
Date: Tue, 10 May 2016 15:33:43 +0200
Message-ID: <CAMuHMdV6XOSiSv-mwovnCAMEPsgOc_vEhPPu0aYCgz74EF242g@mail.gmail.com>
References: <1461047395-6532-1-git-send-email-dirk.behme@de.bosch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461047395-6532-1-git-send-email-dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, julien.grall-5wv7dgnIgG8@public.gmane.org, Pooya Keshavarzi <Pooya.Keshavarzi-V5te9oGctAVWk0Htik3J/w@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

CC Marc, lakml

On Tue, Apr 19, 2016 at 8:29 AM, Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org> wrote:
> From: Pooya Keshavarzi <Pooya.Keshavarzi-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
>
> There are some requirements about the GIC-400 memory layout and its
> mapping if using 64k aligned base addresses like on r8a7795.
>
> See e.g.
>
> http://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=21550029f709072aacf3b9
>
> Map the whole memory range instead of only 0x2000. This will fix
> the issue that some hypervisors, e.g. Xen, fail to handle the
> interrupts correctly.
>
> Signed-off-by: Pooya Keshavarzi <Pooya.Keshavarzi-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>

Based on my understanding below
Acked-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

> ---
> Note: This patch is against renesas-drivers-2016-04-12-v4.6-rc3
>
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> index 8be9424..d880fd4 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -160,9 +160,9 @@
>                         #address-cells = <0>;
>                         interrupt-controller;
>                         reg = <0x0 0xf1010000 0 0x1000>,
> -                             <0x0 0xf1020000 0 0x2000>,
> +                             <0x0 0xf1020000 0 0x20000>,
>                               <0x0 0xf1040000 0 0x20000>,
> -                             <0x0 0xf1060000 0 0x2000>;
> +                             <0x0 0xf1060000 0 0x20000>;
>                         interrupts = <GIC_PPI 9
>                                         (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
>                 };

Region 0:
    4 KiB-pages 0xf1011000-0xf101ffff are aliased to 0xf1010000-0xf1010fff,
    but we need the first 4 KiB only.

Region 1:
    4 KiB-pages 0xf1021000-0xf102ffff are aliased to 0xf1020000-0xf1020fff,
    4 KiB-pages 0xf1030000-0xf103ffff are all zeroes, probably due to
    non-secure mode?

Region 2:
    4 KiB-pages 0xf1041000-0xf104ffff are aliased to 0xf1040000-0xf1040fff,
    4 KiB-pages 0xf1050000-0xf105ffff are all zeroes, probably due to
    non-secure mode?

Region 3:
    4 KiB-pages 0xf1061000-0xf106ffff are aliased to 0xf1060000-0xf1060fff,
    4 KiB-pages 0xf1070000-0xf107ffff are all zeroes, probably due to
    non-secure mode?

Region 2 already had a 128 KiB size before, which allowed to use 8 KiB at
0xf104f000.

An 8 KiB size for regions 1 and 3 indeed didn't make much sense, as this
covered two identical (aliased) 4 KiB pages, instead of two different pages
at offset 0xf000.

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
