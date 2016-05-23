From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: imx6q: add support for the Utilite Pro
Date: Mon, 23 May 2016 22:56:02 +0200 (CEST)
Message-ID: <190621859.107797.9eb91969-99a2-4cb3-babf-7e80dfe80a5e.open-xchange@email.1und1.de>
References: <1463957258-4893-1-git-send-email-christopher.spinrath@rwth-aachen.de>
 <c4ab0387041f42ada68296141befe332@rwthex-s1-b.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c4ab0387041f42ada68296141befe332-gtPewvpZjL8umhiu9RXYRl5UTUQ924AY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Christopher,

> christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org hat am 23. Mai 2016 um 00:47 geschrieben:
> 
> 
> From: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
> 
> The CompuLab Utilite Pro is a miniature fanless desktop pc based on
> the i.MX6 Quad powered cm-fx6 module. It features two serial ports,
> USB OTG, 4x USB, analog audio and S/PDIF, 2x Gb Ethernet, HDMI and
> DVI ports, an on-board 32GB SSD, a mmc slot, and on-board wifi/bt.
> 
> Add initial support for it including USB, Ethernet (both ports), sata
> and HDMI support.
> 
> Signed-off-by: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile              |   1 +
>  arch/arm/boot/dts/imx6q-utilite-pro.dts | 128
> ++++++++++++++++++++++++++++++++
>  2 files changed, 129 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx6q-utilite-pro.dts
> 
> ...
> diff --git a/arch/arm/boot/dts/imx6q-utilite-pro.dts
> b/arch/arm/boot/dts/imx6q-utilite-pro.dts
> new file mode 100644
> index 0000000..bcd8e0d
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6q-utilite-pro.dts
> @@ -0,0 +1,128 @@
> +/*
> + * Copyright 2016 Christopher Spinrath
> + * Copyright 2013 CompuLab Ltd.
> + *
> + * Based on the GPLv2 licensed devicetree distributed with the vendor
> + * kernel for the Utilite Pro:
> + *	Copyright 2013 CompuLab Ltd.
> + *	Author: Valentin Raevsky <valentin-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
> + *
> + * The code contained herein is licensed under the GNU General Public
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 or later at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */
> +
> ...
> +
> +		pinctrl_uart2: uart2grp {
> +			fsl,pins = <
> +				MX6QDL_PAD_GPIO_7__UART2_TX_DATA 0x1b0b1
> +				MX6QDL_PAD_GPIO_8__UART2_RX_DATA 0x1b0b1
> +				MX6QDL_PAD_SD4_DAT5__UART2_RTS_B 0x1b0b1
> +				MX6QDL_PAD_SD4_DAT6__UART2_CTS_B 0x1b0b1
> +			>;
> +		};
> +	};
> +};
> +
> +&pcie {
> +	pcie@0,0 {
> +		reg = <0x000000 0 0 0 0>;
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +
> +		/* non-removable i211 ethernet card */
> +		eth1: intel,i211@pcie0,0 {
> +			reg = <0x010000 0 0 0 0>;
> +		};
> +	};
> +};
> +
> +&uart2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart2>;
> +	fsl,uart-has-rtscts;

this property is deprecated so please use the generic one:

https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id=1006ed7e1b258dac3e85c9fafe9d38b6020c917f

Stefan

> +	dma-names = "rx", "tx";
> +	dmas = <&sdma 27 4 0>, <&sdma 28 4 0>;
> +	status = "okay";
> +};
> -- 
> 2.8.2
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
