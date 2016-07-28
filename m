From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH 12/18] ARM: mvebu: a39x: add missing nodes describing USB2.0 and USB3.0
Date: Thu, 28 Jul 2016 12:34:49 +0200
Message-ID: <877fc6kq46.fsf@free-electrons.com>
References: <1469105055-25181-1-git-send-email-jaz@semihalf.com>
	<1469105055-25181-14-git-send-email-jaz@semihalf.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1469105055-25181-14-git-send-email-jaz@semihalf.com> (Grzegorz
	Jaszczyk's message of "Thu, 21 Jul 2016 14:44:09 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Grzegorz Jaszczyk <jaz@semihalf.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, jason@lakedaemon.net, andrew@lunn.ch, sebastian.hesselbarth@gmail.com, linux@armlinux.org.uk, thomas.petazzoni@free-electrons.com, mw@semihalf.com, alior@marvell.com
List-Id: devicetree@vger.kernel.org

Hi Grzegorz,
 
 On jeu., juil. 21 2016, Grzegorz Jaszczyk <jaz@semihalf.com> wrote:

> The whole Armada 39x SoC family of processors has one USB2.0 and one
> USB3.0 which all can be supported with existing drivers.
>
Change the prefix to "ARM: dts: mvebu: armada-39x:"

Acked-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Thanks,

Gregory
> Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>
> ---
>  arch/arm/boot/dts/armada-39x.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/arm/boot/dts/armada-39x.dtsi b/arch/arm/boot/dts/armada-39x.dtsi
> index 0749878..1225cd8 100644
> --- a/arch/arm/boot/dts/armada-39x.dtsi
> +++ b/arch/arm/boot/dts/armada-39x.dtsi
> @@ -381,6 +381,14 @@
>  				reg = <0x22000 0x1000>;
>  			};
>  
> +			usb@58000 {
> +				compatible = "marvell,orion-ehci";
> +				reg = <0x58000 0x500>;
> +				interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&gateclk 18>;
> +				status = "disabled";
> +			};
> +
>  			xor@60800 {
>  				compatible = "marvell,armada-380-xor", "marvell,orion-xor";
>  				reg = <0x60800 0x100
> @@ -457,6 +465,14 @@
>  				reg = <0xe4078 0x4>, <0xe4074 0x4>;
>  				status = "okay";
>  			};
> +
> +			usb3@f8000 {
> +				compatible = "marvell,armada-380-xhci";
> +				reg = <0xf8000 0x4000>,<0xfc000 0x4000>;
> +				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&gateclk 10>;
> +				status = "disabled";
> +			};
>  		};
>  
>  		pcie-controller {
> -- 
> 1.8.3.1
>

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
