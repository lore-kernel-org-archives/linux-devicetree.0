From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH 09/18] ARM: mvebu: a39x: enable the thermal sensor in Armada-39x SoCs
Date: Thu, 28 Jul 2016 11:52:50 +0200
Message-ID: <87k2g6ks25.fsf@free-electrons.com>
References: <1469105055-25181-1-git-send-email-jaz@semihalf.com>
	<1469105055-25181-11-git-send-email-jaz@semihalf.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1469105055-25181-11-git-send-email-jaz@semihalf.com> (Grzegorz
	Jaszczyk's message of "Thu, 21 Jul 2016 14:44:06 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Grzegorz Jaszczyk <jaz@semihalf.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, jason@lakedaemon.net, andrew@lunn.ch, sebastian.hesselbarth@gmail.com, linux@armlinux.org.uk, thomas.petazzoni@free-electrons.com, mw@semihalf.com, alior@marvell.com
List-Id: devicetree@vger.kernel.org

Hi Grzegorz,
 
 On jeu., juil. 21 2016, Grzegorz Jaszczyk <jaz@semihalf.com> wrote:

Add a commit log here and change the prefix to "ARM: dts: mvebu:
armada-39x:"

Acked-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Thanks,

Gregory


> Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>
> ---
>  arch/arm/boot/dts/armada-39x.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/armada-39x.dtsi b/arch/arm/boot/dts/armada-39x.dtsi
> index 8a22c02..03dc0ec 100644
> --- a/arch/arm/boot/dts/armada-39x.dtsi
> +++ b/arch/arm/boot/dts/armada-39x.dtsi
> @@ -413,6 +413,12 @@
>  				clocks = <&mainpll>;
>  				clock-output-names = "nand";
>  			};
> +
> +			thermal@e8078 {
> +				compatible = "marvell,armada380-thermal";
> +				reg = <0xe4078 0x4>, <0xe4074 0x4>;
> +				status = "okay";
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
