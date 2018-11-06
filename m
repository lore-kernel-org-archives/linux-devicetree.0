From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [bindings][PATCH] bindings/net: DPAA Backplane Device Bindings
Date: Tue, 6 Nov 2018 14:29:08 +0100
Message-ID: <20181106132908.GA30774@lunn.ch>
References: <1541504900-30091-1-git-send-email-florinel.iordache@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1541504900-30091-1-git-send-email-florinel.iordache@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florinel Iordache <florinel.iordache@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "broonie@kernel.org" <broonie@kernel.org>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 06, 2018 at 11:48:30AM +0000, Florinel Iordache wrote:
> Device Tree Bindings for DPAA backplane available on Layerscape
>  communications processors.
> 
> Signed-off-by: Florinel Iordache <florinel.iordache@nxp.com>
> ---
>  .../devicetree/bindings/net/dpaa-backplane.txt     | 105 +++++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/dpaa-backplane.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/dpaa-backplane.txt b/Documentation/devicetree/bindings/net/dpaa-backplane.txt
> new file mode 100644
> index 0000000..f147c84
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/dpaa-backplane.txt
> @@ -0,0 +1,105 @@
> +=============================================================================
> +DPAA Backplane Device Bindings
> +
> +CONTENTS
> +  - SerDes Node
> +  - PCS Phy Node
> +
> +=============================================================================
> +SerDes Node
> +
> +DESCRIPTION
> +
> +SerDes (Serializer/Deserializer) HW peripheral
> +

Hi Florinel

It is normal to indicate which properties are required, and which are
optional using the section headers. There is a defacto standard for
the format of a device tree binding, and this text does not follow it.

> +PROPERTIES
> +
> +- compatible
> +		Usage: required
> +		Value type: <stringlist>
> +		Definition: Specifies the type of SerDes.
> +		Must include the prefix "fsl,serdes"
> +		SerDes can be of different types:
> +		- 10G SerDes must be specified as: "fsl,serdes-10g"
> +		- 28G SerDes must be specified as: "fsl,serdes-28g"

Does a different driver get loaded depending on the compatible? I'm
just wondering if there should be one compatible string, and a speed
property.

> +
> +- reg
> +		Usage: required
> +		Value type: <prop-encoded-array>
> +		Definition: Specifies the offset of the SerDes configuration registers
> +
> +- little-endian
> +		Usage: optional
> +		Value type: <Boolean>
> +		Definition: Specifies endianness access to SerDes registers.
> +		If omitted, big-endian will be used
> +		See common-properties.txt for complete definition
> +
> +EXAMPLE
> +
> +Example of 10G SerDes node:
> +
> +serdes1: serdes@1ea0000 {
> +		compatible = "fsl,serdes-10g";
> +		reg = <0x0 0x1ea0000 0 0x00002000>;
> +		little-endian;
> +};
> +
> +=============================================================================
> +PCS Phy Node
> +
> +DESCRIPTION
> +
> +PCS Phy (Physical Coding Sublayer / Physical layer) node
> +
> +PROPERTIES
> +
> +- compatible
> +		Usage: required

This is normally optional, and defaults to c22 if not present.

> +		Value type: <stringlist>
> +		Definition: A standard property. Specifies the IEEE 802.3 Clause
> +		Different IEEE 802.3 Clauses can be specified:
> +		- Clause 22 must be specified as: "ethernet-phy-ieee802.3-c22"
> +		- Clause 45 must be specified as: "ethernet-phy-ieee802.3-c45"
> +		For complete definition see:
> +		Documentation/devicetree/bindings/net/phy.txt
> +
> +- reg
> +		Usage: required
> +		Value type: <prop-encoded-array>
> +		Definition: A standard property.
> +		Specifies the offset of the PCS Phy configuration registers
> +		For complete definition see:
> +		Documentation/devicetree/bindings/net/phy.txt

Rather than state what is already in phy.txt, just say that the
following additional properties can be used:

> +
> +- backplane-mode
> +		Usage: required

So your PHYs can only be used in backplane-mode? Base-T is never
supported?

> +		Value type: <stringlist>
> +		Definition: Specifies the speed and type of the protocol used
> +		Different speeds and backplane protocol types can be used:
> +		- 10GBase-KR must be specified as: "10gbase-kr"
> +		- 40GBase-KR must be specified as: "40gbase-kr"

I don't see why this is needed. The PHY driver should know what speeds
the PHY supports. You might want to make use of the standard max-speed
property to prevent it doing a high speed, because of layout issues,
etc.

> +
> +- fsl,lane-handle
> +		Usage: required
> +		Value type: <phandle>
> +		Definition: Specifies the reference to a node representing the SerDes
> +		device
> +
> +- fsl,lane-reg
> +		Usage: required
> +		Value type: <prop-encoded-array>
> +		Definition: Specifies the offsets of the SerDes lanes configuration
> +		registers

No other PHY driver we have needs such properties. Why are these
needed?

It is also a bit ununsed to post a binding without the code. Maybe the
code for these two drivers will help me understand.

     Thanks
	Andrew
