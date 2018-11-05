From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 bus+gpio 2/4] dt-bindings: bus: Document moxtet bus
 binding
Date: Mon, 5 Nov 2018 16:13:26 -0600
Message-ID: <20181105221326.GA27340@bogus>
References: <20181102103539.6077-1-marek.behun@nic.cz>
 <20181102103539.6077-2-marek.behun@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181102103539.6077-2-marek.behun@nic.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc: Linus Walleij <linus.walleij@linaro.org>, Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 02, 2018 at 11:35:37AM +0100, Marek Behún wrote:
> This adds device tree binding documentation for the Moxtet bus, a bus
> via which the different modules connected to the Turris Mox router can
> be configured.
> 
> Signed-off-by: Marek Behún <marek.behun@nic.cz>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../devicetree/bindings/bus/moxtet.txt        | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/moxtet.txt
> 
> diff --git a/Documentation/devicetree/bindings/bus/moxtet.txt b/Documentation/devicetree/bindings/bus/moxtet.txt
> new file mode 100644
> index 000000000000..19a1bab61e8a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/moxtet.txt
> @@ -0,0 +1,34 @@
> +Turris Mox module configuration bus (over SPI)
> +
> +Required properties:
> + - compatible		: Should be "cznic,moxtet".
> + - #address-cells	: Has to be 1
> + - #size-cells		: Has to be 0
> +For other required and optional properties of SPI slave nodes please refer to
> +../spi/spi-bus.txt.

You need to list what's required. spi-cpol and spi-cpha are typically 
required or not.

> +
> +Required properties of subnodes:
> + - reg			: Should be position on the Moxtet bus
> +
> +The driver finds the devices connected to the bus by itself, but it may be
> +needed to reference some of them from other parts of the device tree. In that
> +case the devices can be defined as subnodes of the moxtet node.
> +
> +Example:
> +
> +	moxtet@1 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "cznic,moxtet";
> +		reg = <1>;
> +		spi-max-frequency = <10000000>;
> +		spi-cpol;
> +		spi-cpha;
> +
> +		moxtet_sfp: moxtet-sfp@0 {

gpio@0

> +			compatible = "cznic,moxtet-sfp";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			reg = <0>;
> +		}
> +	};
> -- 
> 2.18.1
> 
