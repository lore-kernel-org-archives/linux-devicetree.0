From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv2 1/2] i.MX6-SabreAuto: DTS: use gpio-hog to enable
 WEIM-NOR at boot
Date: Mon, 27 Apr 2015 15:49:44 +0800
Message-ID: <20150427074929.GA9231@dragon>
References: <20150423063127.GJ6325@pengutronix.de>
 <1429862420-15434-1-git-send-email-alison_chaiken@mentor.com>
 <1429862420-15434-2-git-send-email-alison_chaiken@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1429862420-15434-2-git-send-email-alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alison-hh6fLRYtCEIS+FvcfC7Uqw@public.gmane.org
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 24, 2015 at 01:00:20AM -0700, alison-hh6fLRYtCEIS+FvcfC7Uqw@public.gmane.org wrote:
> From: Alison Chaiken <alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> 
> Create an imx6qdl-sabreauto-weim-nor.dtsi file whose inclusion in
> a DTS file sets GPIO5 to the level at boot that the WEIM-NOR
> device requires.  The GPIO is set via the gpio-hogging mechanism.
> Devices whose pinmux needs conflict with those of NOR are disabled.
> 
> Signed-off-by: Alison Chaiken <alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>

- The patch numbering is confusing.  It says this 1/2, but I never saw
  patch 2/2.

- The patch is prefixed in a way different than what we usually do -
  'ARM: dts: ...'

- The commit log is vague.  GPIO5 is not a GPIO pin but a GPIO port.

- The patch is incomplete if I understand WEIM NOR on SabreAuto
  correctly. Not only EIM_D18 but also EIM_D30 needs to be steered,
  right?  And how are the steering pins EIMD18_I2C3_STEER and
  EIMD30_BTUART3_STEER being configured as GPIO in pinctrl?

Shawn

> ---
>  arch/arm/boot/dts/imx6qdl-sabreauto-weim-nor.dtsi | 43 +++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx6qdl-sabreauto-weim-nor.dtsi
> 
> diff --git a/arch/arm/boot/dts/imx6qdl-sabreauto-weim-nor.dtsi b/arch/arm/boot/dts/imx6qdl-sabreauto-weim-nor.dtsi
> new file mode 100644
> index 0000000..a126335
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6qdl-sabreauto-weim-nor.dtsi
> @@ -0,0 +1,43 @@
> +/*
> + * Copyright 2012 Freescale Semiconductor, Inc.
> + * Copyright 2011 Linaro Ltd.
> + * Copyright (c) 2015 Mentor Graphics Inc.
> + *
> + * The code contained herein is licensed under the GNU General Public
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 or later at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */
> +
> +&gpio5 {
> +	weim_nor {
> +		gpio-hog;
> +		gpios = <4 0>;
> +		output-low;
> +		line-name = "weim-nor-gpio";
> +	};
> +};
> +
> +&weim {
> +	status = "okay";
> +};
> +
> +/* Disable devices that have pinmux conflicts with WEIM */
> +
> +&i2c3 {
> +	status = "disabled";
> +};
> +
> +&uart3 {
> +	status = "disabled";
> +};
> +
> +&ecspi1 {
> +	status = "disabled";
> +};
> +
> +&usdhc3 {
> +	status = "disabled";
> +};
> -- 
> 2.1.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
