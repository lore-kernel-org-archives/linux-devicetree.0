From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH net-next 01/10] MIPS: mscc: ocelot: make HSIO registers
 address range a syscon
Date: Tue, 31 Jul 2018 09:51:59 +0200
Message-ID: <20180731075159.GN28585@piout.net>
References: <cover.aa759035f6eefdd0bb2a5ae335dab5bd5399bd46.1532954208.git-series.quentin.schulz@bootlin.com>
 <c250b2591a70bd8b31eef56d82cf5f5ccb47cc22.1532954208.git-series.quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c250b2591a70bd8b31eef56d82cf5f5ccb47cc22.1532954208.git-series.quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, kishon@ti.com, andrew@lunn.ch, f.fainelli@gmail.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, allan.nielsen@microsemi.com, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org

On 30/07/2018 14:43:46+0200, Quentin Schulz wrote:
> HSIO contains registers for PLL5 configuration, SerDes/switch port
> muxing and a thermal sensor, hence we can't keep it in the switch DT
> node.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  arch/mips/boot/dts/mscc/ocelot.dtsi | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/mips/boot/dts/mscc/ocelot.dtsi b/arch/mips/boot/dts/mscc/ocelot.dtsi
> index afe8fc9..c51663a 100644
> --- a/arch/mips/boot/dts/mscc/ocelot.dtsi
> +++ b/arch/mips/boot/dts/mscc/ocelot.dtsi
> @@ -96,7 +96,6 @@
>  			reg = <0x1010000 0x10000>,
>  			      <0x1030000 0x10000>,
>  			      <0x1080000 0x100>,
> -			      <0x10d0000 0x10000>,
>  			      <0x11e0000 0x100>,
>  			      <0x11f0000 0x100>,
>  			      <0x1200000 0x100>,
> @@ -110,10 +109,10 @@
>  			      <0x1280000 0x100>,
>  			      <0x1800000 0x80000>,
>  			      <0x1880000 0x10000>;
> -			reg-names = "sys", "rew", "qs", "hsio", "port0",
> -				    "port1", "port2", "port3", "port4", "port5",
> -				    "port6", "port7", "port8", "port9", "port10",
> -				    "qsys", "ana";
> +			reg-names = "sys", "rew", "qs", "port0", "port1",
> +				    "port2", "port3", "port4", "port5", "port6",
> +				    "port7", "port8", "port9", "port10", "qsys",
> +				    "ana";
>  			interrupts = <21 22>;
>  			interrupt-names = "xtr", "inj";
>  
> @@ -220,5 +219,10 @@
>  			pinctrl-0 = <&miim1>;
>  			status = "disabled";
>  		};
> +
> +		hsio: syscon@10d0000 {
> +			compatible = "mscc,ocelot-hsio", "syscon", "simple-mfd";
> +			reg = <0x10d0000 0x10000>;
> +		};
>  	};
>  };
> -- 
> git-series 0.9.1

-- 
Alexandre Belloni, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
