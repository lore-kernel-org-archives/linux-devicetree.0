From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/6] dt-bindings: ap806: add the cluster clock node in
 the syscon file
Date: Fri, 26 Apr 2019 09:30:27 -0500
Message-ID: <20190426143027.GA17777@bogus>
References: <20190423095107.21091-1-gregory.clement@bootlin.com>
 <20190423095107.21091-2-gregory.clement@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190423095107.21091-2-gregory.clement@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, =?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 23, 2019 at 11:51:02AM +0200, Gregory CLEMENT wrote:
> Document the device tree binding for the cluster clock controllers found
> in the Armada 7K/8K SoCs.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  .../arm/marvell/ap806-system-controller.txt   | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt b/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
> index 7b8b8eb0191f..a65d3e9ff915 100644
> --- a/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
> +++ b/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
> @@ -143,3 +143,29 @@ ap_syscon1: system-controller@6f8000 {
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
> +- reg: register range associated the cluster clocks, offset must be 0
> +  and the size have to be the whole size of the system-controller
> +
> +
> +ap_syscon1: system-controller@6f8000 {
> +	compatible = "syscon", "simple-mfd";

This should have a specific compatible.

> +	reg = <0x6f8000 0x1000>;
> +
> +	cpu_clk: clock-cpu@0 {
> +		compatible = "marvell,ap806-cpu-clock";
> +		clocks = <&ap_clk 0>, <&ap_clk 1>;
> +		#clock-cells = <1>;
> +		reg = <0x0 0x1000>;

This takes the entire address range of the parent, then why the child 
node? You can't add any other child nodes without creating an overlap.

Your example also won't compile.

Rob
