From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/8] dt-bindings: Add Cavium Octeon Common Ethernet
 Interface.
Date: Wed, 15 Nov 2017 13:18:57 -0600
Message-ID: <20171115191857.podohd56knfd4hyh@rob-hp-laptop>
References: <20171109192915.11912-1-david.daney@cavium.com>
 <20171109192915.11912-2-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171109192915.11912-2-david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, James Hogan <james.hogan-8NJIiSa5LzA@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Steven J. Hill" <steven.hill-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Carlos Munoz <cmunoz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 09, 2017 at 11:29:08AM -0800, David Daney wrote:
> From: Carlos Munoz <cmunoz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> 
> Add bindings for Common Ethernet Interface (BGX) block.
> 
> Signed-off-by: Carlos Munoz <cmunoz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Steven J. Hill <Steven.Hill-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> Signed-off-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/net/cavium-bgx.txt         | 61 ++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/cavium-bgx.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/cavium-bgx.txt b/Documentation/devicetree/bindings/net/cavium-bgx.txt
> new file mode 100644
> index 000000000000..6b1f8b994c20
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/cavium-bgx.txt
> @@ -0,0 +1,61 @@
> +* Common Ethernet Interface (BGX) block
> +
> +Properties:
> +
> +- compatible: "cavium,octeon-7890-bgx": Compatibility with all cn7xxx SOCs.
> +
> +- reg: The base address of the BGX block.
> +
> +- #address-cells: Must be <1>.
> +
> +- #size-cells: Must be <0>.  BGX addresses have no size component.
> +
> +A BGX block has several children, each representing an Ethernet
> +interface.
> +
> +
> +* Ethernet Interface (BGX port) connects to PKI/PKO
> +
> +Properties:
> +
> +- compatible: "cavium,octeon-7890-bgx-port": Compatibility with all
> +	      cn7xxx SOCs.
> +
> +	      "cavium,octeon-7360-xcv": Compatibility with cn73xx SOCs
> +	      for RGMII.
> +
> +- reg: The index of the interface within the BGX block.

There's no memory mapped region associated with the sub-blocks?

> +
> +Optional properties:
> +
> +- local-mac-address: Mac address for the interface.
> +
> +- phy-handle: phandle to the phy node connected to the interface.
> +
> +- phy-mode: described in ethernet.txt.
> +
> +- fixed-link: described in fixed-link.txt.
> +
> +Example:
> +
> +	ethernet-mac-nexus@11800e0000000 {
> +		compatible = "cavium,octeon-7890-bgx";
> +		reg = <0x00011800 0xe0000000 0x00000000 0x01000000>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethernet-mac@0 {

ethernet@0

> +			compatible = "cavium,octeon-7360-xcv";
> +			reg = <0>;
> +			local-mac-address = [ 00 01 23 45 67 89 ];
> +			phy-handle = <&phy3>;
> +			phy-mode = "rgmii-rxid"
> +		};
> +		ethernet-mac@1 {

ditto.

Otherwise,

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> +			compatible = "cavium,octeon-7890-bgx-port";
> +			reg = <1>;
> +			local-mac-address = [ 00 01 23 45 67 8a ];
> +			phy-handle = <&phy4>;
> +			phy-mode = "sgmii"
> +		};
> +	};
> -- 
> 2.13.6
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
