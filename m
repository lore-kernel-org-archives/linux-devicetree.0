From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH net-next v3 07/11] dt-bindings: phy: add DT binding for
 Microsemi Ocelot SerDes muxing
Date: Wed, 26 Sep 2018 16:35:09 -0500
Message-ID: <20180926213509.GA7454@bogus>
References: <cover.ff40d591b548a6da31716e6e600f11a303e0e643.1536912834.git-series.quentin.schulz@bootlin.com>
 <f392dafca9165800439fc09cd7d16e6a9506d457.1536912834.git-series.quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f392dafca9165800439fc09cd7d16e6a9506d457.1536912834.git-series.quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, mark.rutland@arm.com, davem@davemloft.net, kishon@ti.com, andrew@lunn.ch, f.fainelli@gmail.com, allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org

On Fri, Sep 14, 2018 at 10:16:05AM +0200, Quentin Schulz wrote:
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
> ---
>  Documentation/devicetree/bindings/phy/phy-ocelot-serdes.txt | 40 +++++++-
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-ocelot-serdes.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-ocelot-serdes.txt b/Documentation/devicetree/bindings/phy/phy-ocelot-serdes.txt
> new file mode 100644
> index 0000000..2a88cc3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/phy-ocelot-serdes.txt
> @@ -0,0 +1,40 @@
> +Microsemi Ocelot SerDes muxing driver
> +-------------------------------------
> +
> +On Microsemi Ocelot, there is a handful of registers in HSIO address
> +space for setting up the SerDes to switch port muxing.
> +
> +A SerDes X can be "muxed" to work with switch port Y or Z for example.
> +One specific SerDes can also be used as a PCIe interface.
> +
> +Hence, a SerDes represents an interface, be it an Ethernet or a PCIe one.
> +
> +There are two kinds of SerDes: SERDES1G supports 10/100Mbps in
> +half/full-duplex and 1000Mbps in full-duplex mode while SERDES6G supports
> +10/100Mbps in half/full-duplex and 1000/2500Mbps in full-duplex mode.
> +
> +Also, SERDES6G number (aka "macro") 0 is the only interface supporting
> +QSGMII.
> +
> +Required properties:
> +
> +- compatible: should be "mscc,vsc7514-serdes"
> +- #phy-cells : from the generic phy bindings, must be 2.
> +	       The first number defines the input port to use for a given
> +	       SerDes macro. The second defines the macro to use. They are
> +	       defined in dt-bindings/phy/phy-ocelot-serdes.h

You need to define what this is a child of.

> +
> +Example:
> +
> +	serdes: serdes {
> +		compatible = "mscc,vsc7514-serdes";
> +		#phy-cells = <2>;

However, if there are no other resources associated with this, then you 
don't even need this child node. The parent can be a phy provider and 
provider of other functions too.

> +	};
> +
> +	ethernet {
> +		port1 {
> +			phy-handle = <&phy_foo>;
> +			/* Link SERDES1G_5 to port1 */
> +			phys = <&serdes 1 SERDES1G_5>;
> +		};
> +	};
> -- 
> git-series 0.9.1
