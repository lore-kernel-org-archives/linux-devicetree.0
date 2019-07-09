From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 1/6] dt-bindings: ap806: add the cluster clock node in
 the syscon file
Date: Tue, 9 Jul 2019 14:10:49 -0600
Message-ID: <20190709201049.GA8692@bogus>
References: <20190619141539.16884-1-gregory.clement@bootlin.com>
 <20190619141539.16884-2-gregory.clement@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190619141539.16884-2-gregory.clement@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, =?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 19, 2019 at 04:15:34PM +0200, Gregory CLEMENT wrote:
> Document the device tree binding for the cluster clock controllers found
> in the Armada 7K/8K SoCs.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  .../arm/marvell/ap806-system-controller.txt   | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt b/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
> index 7b8b8eb0191f..4a3bb9c12312 100644
> --- a/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
> +++ b/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
> @@ -143,3 +143,28 @@ ap_syscon1: system-controller@6f8000 {
>  		#thermal-sensor-cells = <1>;
>  	};
>  };
> +
> +Cluster clocks:
> +---------------
> +
> +Device Tree Clock bindings for cluster clock of AP806 Marvell. Each
> +cluster contain up to 2 CPUs running at the same frequency.
> +
> +Required properties:
> +- compatible: must be  "marvell,ap806-cpu-clock";
> +- #clock-cells : should be set to 1.
> +- clocks : shall be the input parents clock phandle for the clock.

How many clocks?

> +- reg: register range associated with the cluster clocks
> +
> +
> +ap_syscon1: system-controller@6f8000 {
> +	compatible = "marvell,armada-ap806-syscon1", "syscon", "simple-mfd";
> +	reg = <0x6f8000 0x1000>;
> +
> +	cpu_clk: clock-cpu@0 {

Should be '...@274'

> +		compatible = "marvell,ap806-cpu-clock";
> +		clocks = <&ap_clk 0>, <&ap_clk 1>;
> +		#clock-cells = <1>;
> +		reg = <0x274 0xa30>;
> +	};
> +};
> -- 
> 2.20.1
> 
