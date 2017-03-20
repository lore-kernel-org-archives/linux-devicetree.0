From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v6 5/8] dt-bindings: input: touchscreen: Add max11801-ts
 binding
Date: Mon, 20 Mar 2017 10:36:25 +0800
Message-ID: <20170320023622.GA3443@dragon>
References: <1489647939-4966-1-git-send-email-jagan@openedev.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1489647939-4966-1-git-send-email-jagan@openedev.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@openedev.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>, Michael Trimarchi <michael@amarulasolutions.com>, Jagan Teki <jagan@amarulasolutions.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 16, 2017 at 12:35:38PM +0530, Jagan Teki wrote:
> From: Jagan Teki <jagan@amarulasolutions.com>
> 
> Add missing documentation of max11801-ts dt-binding details.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v6:
> - Replace the lable and name of the node
>    ts: max11801 => max11801: touchscreen@48
> Changes for v5:
> - Newly added patch
> 
>  .../bindings/input/touchscreen/max11801-ts.txt         | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/max11801-ts.txt
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/max11801-ts.txt b/Documentation/devicetree/bindings/input/touchscreen/max11801-ts.txt
> new file mode 100644
> index 0000000..4afccbe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/max11801-ts.txt
> @@ -0,0 +1,18 @@
> +* MAXI MAX11801 Resistive touch screen controller with i2c interface
> +
> +Required properties:
> +- compatible: must be "max11801"

Shouldn't it have a vendor prefix?

Also I will need Rob's ACK to get this go via IMX tree.

Shawn

> +- reg: i2c slave address
> +- interrupt-parent: the phandle for the interrupt controller
> +- interrupts: touch controller interrupt
> +
> +Example:
> +
> +&i2c1 {
> +	max11801: touchscreen@48 {
> +		compatible = "max11801";
> +		reg = <0x48>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <31 2>;
> +	};
> +};
> -- 
> 1.9.1
> 
