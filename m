From: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: socfpga: dts: Move common nodes to cyclone5
 dtsi
Date: Thu, 3 Oct 2013 09:58:41 -0500
Message-ID: <1380812321.7464.7.camel@linux-builds1>
References: <1380699333-558-1-git-send-email-s.trumtrar@pengutronix.de>
	 <1380699333-558-2-git-send-email-s.trumtrar@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380699333-558-2-git-send-email-s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Steffen,

On Wed, 2013-10-02 at 09:35 +0200, Steffen Trumtrar wrote:
> The current socfpga_cyclone5.dts describes the Altera Cyclone5 SoC Development
> Kit. The Cyclone5 includes a SoCFPGA, which itself can be included in other
> SoC+FPGA combinations.
> 
> Instead of having to describe all Cyclone5 common nodes in every board specific
> dts, move socfpga_cyclone5.dts to a dtsi and include this in a new dts for the
> Development Kit.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile                         |  2 +-
>  ...{socfpga_cyclone5.dts => socfpga_cyclone5.dtsi} | 20 -----------
>  arch/arm/boot/dts/socfpga_cyclone5_socdk.dts       | 40 ++++++++++++++++++++++
>  3 files changed, 41 insertions(+), 21 deletions(-)
>  rename arch/arm/boot/dts/{socfpga_cyclone5.dts => socfpga_cyclone5.dtsi} (78%)
>  create mode 100644 arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index cf75889..fcace86 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -216,7 +216,7 @@ dtb-$(CONFIG_ARCH_SHMOBILE) += emev2-kzm9d.dtb \
>  	r8a73a4-ape6evm-reference.dtb \
>  	sh7372-mackerel.dtb
>  dtb-$(CONFIG_ARCH_SHMOBILE_MULTI) += emev2-kzm9d-reference.dtb
> -dtb-$(CONFIG_ARCH_SOCFPGA) += socfpga_cyclone5.dtb \
> +dtb-$(CONFIG_ARCH_SOCFPGA) += socfpga_cyclone5_socdk.dtb \
>  	socfpga_vt.dtb
>  dtb-$(CONFIG_ARCH_SPEAR13XX) += spear1310-evb.dtb \
>  	spear1340-evb.dtb
> diff --git a/arch/arm/boot/dts/socfpga_cyclone5.dts b/arch/arm/boot/dts/socfpga_cyclone5.dtsi
> similarity index 78%
> rename from arch/arm/boot/dts/socfpga_cyclone5.dts
> rename to arch/arm/boot/dts/socfpga_cyclone5.dtsi
> index 973999d..a8716f6 100644
> --- a/arch/arm/boot/dts/socfpga_cyclone5.dts
> +++ b/arch/arm/boot/dts/socfpga_cyclone5.dtsi
> @@ -19,26 +19,6 @@
>  /include/ "socfpga.dtsi"
>  
>  / {
> -	model = "Altera SOCFPGA Cyclone V";
> -	compatible = "altr,socfpga-cyclone5", "altr,socfpga";
> -
> -	chosen {
> -		bootargs = "console=ttyS0,57600";
> -	};
> -
> -	memory {
> -		name = "memory";
> -		device_type = "memory";
> -		reg = <0x0 0x40000000>; /* 1GB */
> -	};
> -
> -	aliases {
> -		/* this allow the ethaddr uboot environmnet variable contents
> -		 * to be added to the gmac1 device tree blob.
> -		 */
> -		ethernet0 = &gmac1;
> -	};
> -
>  	soc {
>  		clkmgr@ffd04000 {
>  			clocks {
> diff --git a/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts b/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
> new file mode 100644
> index 0000000..0ea6399
> --- /dev/null
> +++ b/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
> @@ -0,0 +1,40 @@
> +/*
> + *  Copyright (C) 2012 Altera Corporation <www.altera.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +/include/ "socfpga_cyclone5.dtsi"
> +
> +/ {
> +	model = "Altera SOCFPGA Cyclone V SoC Development Kit";
> +	compatible = "altr,socfpga-cyclone5", "altr,socfpga";
> +
> +	chosen {
> +		bootargs = "console=ttyS0,57600";

Thanks for doing this. It looks good. While you're at it can you make
this 115200? 57600 was early in the bring-up stage.

> +	};
> +
> +	memory {
> +		name = "memory";
> +		device_type = "memory";
> +		reg = <0x0 0x40000000>; /* 1GB */
> +	};
> +
> +	aliases {
> +		/* this allow the ethaddr uboot environmnet variable contents
> +		 * to be added to the gmac1 device tree blob.
> +		 */
> +		ethernet0 = &gmac1;
> +	};
> +};

With the change to 115200,

Acked-by: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>

I guess I need to get an Ack from the DTS maintainer(s) and I'll apply
it to my next-dt tree.

Dinh


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
