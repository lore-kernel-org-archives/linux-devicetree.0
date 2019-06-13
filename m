From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC 3/3] dt-bindings: net: dsa: document additional Microchip
 KSZ8863 family switches
Date: Thu, 13 Jun 2019 14:09:35 -0600
Message-ID: <20190613200935.GA16851@bogus>
References: <20190508211330.19328-1-m.grzeschik@pengutronix.de>
 <20190508211330.19328-4-m.grzeschik@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190508211330.19328-4-m.grzeschik@pengutronix.de>
Sender: netdev-owner@vger.kernel.org
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: Tristram.Ha@microchip.com, kernel@pengutronix.de, UNGLinuxDriver@microchip.com, netdev@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, May 08, 2019 at 11:13:30PM +0200, Michael Grzeschik wrote:
> Document additional Microchip KSZ8863 family switches.
> 
> Show how KSZ8863 switch should be configured as the host port is port 3.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  .../devicetree/bindings/net/dsa/ksz.txt       | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/ksz.txt b/Documentation/devicetree/bindings/net/dsa/ksz.txt
> index e7db7268fd0fd..4ac576e1cc34e 100644
> --- a/Documentation/devicetree/bindings/net/dsa/ksz.txt
> +++ b/Documentation/devicetree/bindings/net/dsa/ksz.txt
> @@ -5,6 +5,8 @@ Required properties:
>  
>  - compatible: For external switch chips, compatible string must be exactly one
>    of the following:
> +  - "microchip,ksz8863"
> +  - "microchip,ksz8873"
>    - "microchip,ksz9477"
>    - "microchip,ksz9897"
>    - "microchip,ksz9896"
> @@ -31,6 +33,48 @@ Ethernet switch connected via SPI to the host, CPU port wired to eth0:
>  		};
>  	};
>  
> +	mdio0: mdio-gpio {

Does this example show something new? Examples don't need to instantiate 
every possible option.

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_mdio_1>;
> +		compatible = "virtual,mdio-gpio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		gpios = <&gpio1 31 0 &gpio1 22 0>;
> +
> +		ksz8863@3 {
> +			compatible = "microchip,ksz8863";
> +			interrupt-parrent = <&gpio3>;
> +			interrupt = <30 IRQ_TYPE_LEVEL_HIGH>;
> +			reg = <0>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				ports@0 {
> +					reg = <0>;
> +					label = "lan1";
> +				};
> +
> +				ports@1 {
> +					reg = <1>;
> +					label = "lan2";
> +				};
> +
> +				ports@2 {
> +					reg = <2>;
> +					label = "cpu";
> +					ethernet = <&eth0>;
> +
> +					fixed-link {
> +						speed = <100>;
> +						full-duplex;
> +					};
> +				};
> +			};
> +		};
> +	};
> +
>  	spi1: spi@f8008000 {
>  		pinctrl-0 = <&pinctrl_spi_ksz>;
>  		cs-gpios = <&pioC 25 0>;
> -- 
> 2.20.1
> 
