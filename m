From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/3] clk: meson: meson8b: add compatibles for Meson8 and
 Meson8m2
Date: Sun, 04 Jun 2017 21:58:45 +0200
Message-ID: <1496606325.3552.16.camel@baylibre.com>
References: <20170604183341.21417-1-martin.blumenstingl@googlemail.com>
         <20170604183341.21417-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170604183341.21417-2-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 2017-06-04 at 20:33 +0200, Martin Blumenstingl wrote:
> The clock controller on Meson8, Meson8b and Meson8m2 is very similar
> based on the code from the Amlogic GPL kernel sources. Add separate
> compatibles for each SoC to make sure that we can easily implement
> all the small differences for each SoC later on.
> 
> In general the Meson8 and Meson8m2 seem to be almost identical as they
> even share the same mach-meson8 directory in Amlogic's GPL kernel
> sources.
> The main clocks on Meson8, Meson8b and Meson8m2 are very similar,
> because they are all using the same PLL values, 90% of the clock gates
> are the same (the actual diffstat of the mach-meson8/clock.c and
> mach-meson8b/clock.c files is around 30 to 40 lines, when excluding
> all commented out code).
> The difference between the Meson8 and Meson8b clock gates seem to be:
> - Meson8 has AIU_PCLK, HDMI_RX, VCLK2_ENCT, VCLK2_ENCL, UART3,
>   CSI_DIG_CLKIN gates which don't seem to be available on Meson8b
> - the gate on Meson8 for bit 7 seems to be named "_1200XXX" instead
>   of "PERIPHS_TOP" (on Meson8b)
> - Meson8b has a SANA gate which doesn't seem to exist on Meson8 (or
>   on Meson8 the same bit is used by the UART3 gate in Amlogic's GPL
>   kernel sources)
> None of these gates is added for now, since it's unclear whether these
> definitions are actually correct (the VCLK2_ENCT gate for example is
> defined, but only used in some commented block).
> 
> The main difference between all three SoCs seem to be the video (VPU)
> clocks. Apart from different supported clock rates (according to vpu.c
> in mach-meson8 and mach-meson8b from Amlogic's GPL kernel sources) the
> most notable difference is that Meson8m2 has a GP_PLL clock and a mux
> (probably the same as on the Meson GX SoCs) to support glitch-free
> (clock rate) switching.
> None of these VPU clocks are not supported by our mainline meson8b
> clock driver yet though.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> ---
>  .../devicetree/bindings/clock/amlogic,meson8b-clkc.txt        | 11 +++++++---

I think you should split the binding documentation and clk changes into separate
patches.

> -
>  drivers/clk/meson/Kconfig                                     |  6 +++---
>  drivers/clk/meson/meson8b.c                                   |  5 ++++-

The change being more platform than clock related, I'd prefer if Kevin or Carlo
ack it before we apply it.

Apart from this, the change looks good to me. Nice to see people taking interest
 in these SoCs. Would you mind telling us a bit more about the board you have
used for this task and the tests you have done ? It would maybe allow other
people to help you.

Cheers
Jerome

>  3 files changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
> b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
> index 2b7b3fa588d7..606da38c0959 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
> +++ b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
> @@ -1,11 +1,14 @@
> -* Amlogic Meson8b Clock and Reset Unit
> +* Amlogic Meson8, Meson8b and Meson8m2 Clock and Reset Unit
>  
> -The Amlogic Meson8b clock controller generates and supplies clock to various
> -controllers within the SoC.
> +The Amlogic Meson8 / Meson8b / Meson8m2 clock controller generates and
> +supplies clock to various controllers within the SoC.
>  
>  Required Properties:
>  
> -- compatible: should be "amlogic,meson8b-clkc"
> +- compatible: must be one of:
> +	- "amlogic,meson8-clkc" for Meson8 (S802) SoCs
> +	- "amlogic,meson8b-clkc" for Meson8 (S805) SoCs
> +	- "amlogic,meson8m2-clkc" for Meson8m2 (S812) SoCs
>  - reg: it must be composed by two tuples:
>  	0) physical base address of the xtal register and length of memory
>  	   mapped region.
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index 19480bcc7046..4a806203b73c 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -7,9 +7,9 @@ config COMMON_CLK_MESON8B
>  	bool
>  	depends on COMMON_CLK_AMLOGIC
>  	help
> -	  Support for the clock controller on AmLogic S805 devices, aka
> -	  meson8b. Say Y if you want peripherals and CPU frequency scaling to
> -	  work.
> +	  Support for the clock controller on AmLogic S802 (Meson8),
> +	  S805 (Meson8b) and S812 (Meson8m2) devices. Say Y if you
> +	  want peripherals and CPU frequency scaling to work.
>  
>  config COMMON_CLK_GXBB
>  	bool
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index bfd1690724de..94c55e79cdde 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -1,5 +1,6 @@
>  /*
> - * AmLogic S805 / Meson8b Clock Controller Driver
> + * AmLogic S802 (Meson8) / S805 (Meson8b) / S812 (Meson8m2) Clock Controller
> + * Driver
>   *
>   * Copyright (c) 2015 Endless Mobile, Inc.
>   * Author: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
> @@ -777,7 +778,9 @@ static int meson8b_clkc_probe(struct platform_device
> *pdev)
>  }
>  
>  static const struct of_device_id meson8b_clkc_match_table[] = {
> +	{ .compatible = "amlogic,meson8-clkc" },
>  	{ .compatible = "amlogic,meson8b-clkc" },
> +	{ .compatible = "amlogic,meson8m2-clkc" },
>  	{ }
>  };
>  

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
