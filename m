From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH 08/18] ARM: mvebu: a39x: Enable PMU, CA9 MPcore SoC Controller and Coherency fabric
Date: Thu, 28 Jul 2016 11:51:11 +0200
Message-ID: <87oa5iks4w.fsf@free-electrons.com>
References: <1469105055-25181-1-git-send-email-jaz@semihalf.com>
	<1469105055-25181-10-git-send-email-jaz@semihalf.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1469105055-25181-10-git-send-email-jaz@semihalf.com> (Grzegorz
	Jaszczyk's message of "Thu, 21 Jul 2016 14:44:05 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Grzegorz Jaszczyk <jaz@semihalf.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, jason@lakedaemon.net, andrew@lunn.ch, sebastian.hesselbarth@gmail.com, linux@armlinux.org.uk, thomas.petazzoni@free-electrons.com, mw@semihalf.com, alior@marvell.com
List-Id: devicetree@vger.kernel.org

Hi Grzegorz,
 
 On jeu., juil. 21 2016, Grzegorz Jaszczyk <jaz@semihalf.com> wrote:

> This commit enables:
> - CA9's Performance Monitor Unit
> - CA9 MPcore SoC Controller
> - Coherency fabric
> on Armada 39x, basing on the Armada 38x (which has the same CA9 CPU).
>
> Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>
> Reviewed-by: Lior Amsalem <alior@marvell.com>

It looks like exactly the same patch that the previous one. Did I miss
something?

Thanks,

Gregory

> ---
>  arch/arm/boot/dts/armada-39x.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/arch/arm/boot/dts/armada-39x.dtsi b/arch/arm/boot/dts/armada-39x.dtsi
> index cb66f20..8a22c02 100644
> --- a/arch/arm/boot/dts/armada-39x.dtsi
> +++ b/arch/arm/boot/dts/armada-39x.dtsi
> @@ -78,6 +78,11 @@
>  		};
>  	};
>  
> +	pmu {
> +		compatible = "arm,cortex-a9-pmu";
> +		interrupts-extended = <&mpic 3>;
> +	};
> +
>  	soc {
>  		compatible = "marvell,armada390-mbus", "marvell,armadaxp-mbus",
>  			     "simple-bus";
> @@ -322,6 +327,16 @@
>  				reg = <0x20800 0x10>;
>  			};
>  
> +			mpcore-soc-ctrl@20d20 {
> +				compatible = "marvell,armada-380-mpcore-soc-ctrl";
> +				reg = <0x20d20 0x6c>;
> +			};
> +
> +			coherency-fabric@21010 {
> +				compatible = "marvell,armada-380-coherency-fabric";
> +				reg = <0x21010 0x1c>;
> +			};
> +
>  			pmsu@22000 {
>  				compatible = "marvell,armada-390-pmsu",
>  					     "marvell,armada-380-pmsu";
> -- 
> 1.8.3.1
>

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
