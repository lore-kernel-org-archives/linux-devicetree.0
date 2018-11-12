Return-Path: <robherring2@gmail.com>
From: Rob Herring <robh@kernel.org>
Subject: Re: [bindings][PATCH] bindings/net: DPAA Backplane Device Bindings
Message-ID: <20181112181054.GA11173@bogus>
References: <1541504900-30091-1-git-send-email-florinel.iordache@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1541504900-30091-1-git-send-email-florinel.iordache@nxp.com>
Date: Mon, 12 Nov 2018 12:10:59 -0600
To: Florinel Iordache <florinel.iordache@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "broonie@kernel.org" <broonie@kernel.org>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

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

These should be SoC specific.

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

This should be separate file.

> +
> +DESCRIPTION
> +
> +PCS Phy (Physical Coding Sublayer / Physical layer) node
> +
> +PROPERTIES
> +
> +- compatible
> +		Usage: required
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
> +
> +- backplane-mode
> +		Usage: required
> +		Value type: <stringlist>
> +		Definition: Specifies the speed and type of the protocol used
> +		Different speeds and backplane protocol types can be used:
> +		- 10GBase-KR must be specified as: "10gbase-kr"
> +		- 40GBase-KR must be specified as: "40gbase-kr"

Is this a standard property? If so just reference the common definition. 
If not, should it be? Otherwise, it needs a vendor prefix.

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

Seems like you should use the phy binding (generic, not net phy) here 
instead of these 2 custom properties.

Rob
