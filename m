From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM64: dts: meson-gxm: Add Vega S96 board
Date: Tue, 19 Sep 2017 19:51:26 +0200
Message-ID: <CAFBinCCVKFbU-kk9EFzbTbfKCGbOpmm+46spsVry=0E_JCTJgQ@mail.gmail.com>
References: <1505822748-23431-1-git-send-email-narmstrong@baylibre.com> <1505822748-23431-2-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1505822748-23431-2-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbes-150-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org, support-QbXJUBtoW2jby3iVrkZq2A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Neil,

On Tue, Sep 19, 2017 at 2:05 PM, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
> The Tronsmart Vega S96 is a TV box derived from Amlogic q200 reference design.
>
> Cc: support-QbXJUBtoW2jby3iVrkZq2A@public.gmane.org
> Signed-off-by: Oleg <balbes-150-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org>
> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm64/boot/dts/amlogic/Makefile               |  1 +
>  arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts | 39 ++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts
>
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 7a9f48c..a6c4a06 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -19,6 +19,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-nexbox-a1.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-q200.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-q201.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-rbox-pro.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxm-vega-s96.dtb
>
>  always         := $(dtb-y)
>  subdir-y       := $(dts-dirs)
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts
> new file mode 100644
> index 0000000..ba74240
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts
> @@ -0,0 +1,39 @@
> +/*
> + * Copyright (c) 2017 BayLibre, SAS.
> + * Author: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> + * Copyright (c) 2017 Oleg <balbes-150-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org>
> + *
> + * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-gxm.dtsi"
> +#include "meson-gx-p23x-q20x.dtsi"
> +
> +/ {
> +       compatible = "tronsmart,vega-s96", "amlogic,s912", "amlogic,meson-gxm";
> +       model = "Tronsmart Vega S96";
> +
> +};
> +
> +&ethmac {
> +       pinctrl-0 = <&eth_pins>;
> +       pinctrl-names = "default";
> +
> +       /* Select external PHY by default */
> +       phy-handle = <&external_phy>;
> +
> +       amlogic,tx-delay-ns = <2>;
> +
> +       /* External PHY is in RGMII */
> +       phy-mode = "rgmii";
> +};
> +
> +&external_mdio {
> +       external_phy: ethernet-phy@0 {
> +               compatible = "ethernet-phy-id001c.c916", "ethernet-phy-ieee802.3-c22";
some time ago I thought it was smart to add a compatible string with the PHY ID.
this was until I figured out that it should only be done if the PHY
reports an invalid ID: [0]
that's why most .dts files that I've touched skip the "compatible"
property and use a comment like "/* Realtek RTL8211F (0x001cc916) */"
instead

> +               reg = <0>;
> +               max-speed = <1000>;
> +       };
> +};
> --
> 1.9.1
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic


Regards,
Martin


[0] https://github.com/torvalds/linux/commit/7630ea4bda18df2ee1c64dfdca1724a9cc32f920
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
