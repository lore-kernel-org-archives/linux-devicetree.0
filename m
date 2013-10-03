From: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: socfpga: dts: Add support for terasic SoCkit
Date: Thu, 3 Oct 2013 10:00:55 -0500
Message-ID: <1380812455.7464.8.camel@linux-builds1>
References: <1380699333-558-1-git-send-email-s.trumtrar@pengutronix.de>
	 <1380699333-558-3-git-send-email-s.trumtrar@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380699333-558-3-git-send-email-s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2013-10-02 at 09:35 +0200, Steffen Trumtrar wrote:
> This adds basic support for the terasic SoCkit board.
> The board includes an Altera Cyclone 5 SoC.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile                    |  1 +
>  arch/arm/boot/dts/socfpga_cyclone5_sockit.dts | 37 +++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
>  create mode 100644 arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index fcace86..7ce51f2 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -217,6 +217,7 @@ dtb-$(CONFIG_ARCH_SHMOBILE) += emev2-kzm9d.dtb \
>  	sh7372-mackerel.dtb
>  dtb-$(CONFIG_ARCH_SHMOBILE_MULTI) += emev2-kzm9d-reference.dtb
>  dtb-$(CONFIG_ARCH_SOCFPGA) += socfpga_cyclone5_socdk.dtb \
> +	socfpga_cyclone5_sockit.dtb \
>  	socfpga_vt.dtb
>  dtb-$(CONFIG_ARCH_SPEAR13XX) += spear1310-evb.dtb \
>  	spear1340-evb.dtb
> diff --git a/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts b/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
> new file mode 100644
> index 0000000..a194a4e
> --- /dev/null
> +++ b/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
> @@ -0,0 +1,37 @@
> +/*
> + *  Copyright (C) 2013 Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
> +	model = "Terasic SoCkit";
> +	compatible = "altr,socfpga-cyclone5", "altr,socfpga";
> +
> +	chosen {
> +		bootargs = "console=ttyS0,57600";
> +	};
> +
> +	memory {
> +		name = "memory";
> +		device_type = "memory";
> +		reg = <0x0 0x40000000>; /* 1GB */
> +	};
> +};
> +
> +&gmac1 {
> +	status = "okay";
> +};

Acked-by: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>

Thanks,
Dinh



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
