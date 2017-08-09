From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH  1/2] ARM: dts: iwg20d-q7: Add RTC support
Date: Wed, 9 Aug 2017 11:02:30 +0200
Message-ID: <20170809090230.GM2705@verge.net.au>
References: <1502197465-61546-1-git-send-email-biju.das@bp.renesas.com>
 <1502197465-61546-2-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1502197465-61546-2-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Chris Paterson <chris.paterson2@renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 08, 2017 at 02:04:24PM +0100, Biju Das wrote:
> Define the iWave RainboW-G20D-Qseven board dependent part of the
> RTC device node.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  arch/arm/boot/dts/r8a7743-iwg20d-q7.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

This has a compile-time dependency on
"[PATCH  2/2] ARM: dts: r8a7743: Add I2C DT support"
for the i2c2 node, right?

> 
> diff --git a/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts b/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
> index 081af01..b3a1efa 100644
> --- a/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
> +++ b/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
> @@ -31,6 +31,11 @@
>  		groups = "avb_mdio", "avb_gmii";
>  		function = "avb";
>  	};
> +
> +	i2c2_pins: i2c2 {
> +		groups = "i2c2";
> +		function = "i2c2";
> +	};
>  };
>  
>  &scif0 {
> @@ -54,3 +59,16 @@
>  		micrel,led-mode = <1>;
>  	};
>  };
> +
> +&i2c2 {
> +	pinctrl-0 = <&i2c2_pins>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +	clock-frequency = <400000>;
> +
> +	rtc@68 {
> +		compatible = "bq32000";
> +		reg = <0x68>;
> +	};
> +};
> -- 
> 1.9.1
> 
