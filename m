From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: dsa: add mt7530 binding
Date: Mon, 20 Mar 2017 17:01:28 -0500
Message-ID: <20170320220128.cg4zkbzzkddvsrfx@rob-hp-laptop>
References: <1489420008-30795-1-git-send-email-sean.wang@mediatek.com>
 <1489420008-30795-2-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1489420008-30795-2-git-send-email-sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: keyhaede-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 13, 2017 at 11:46:45PM +0800, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> Add device-tree binding for Mediatek MT7530 switch.
> 
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/net/dsa/mt7530.txt         | 94 ++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/dsa/mt7530.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mt7530.txt b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
> new file mode 100644
> index 0000000..0e50dbf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
> @@ -0,0 +1,94 @@
> +Mediatek MT7530 Ethernet switch
> +================================
> +
> +Required properties:
> +
> +- compatible: Must be compatible = "mediatek,mt7530";
> +- #address-cells: Must be 1
> +- #size-cells: Must be 0
> +- mediatek,ethsys: Phandle to the syscon node that handles the reset.

Use the reset binding?

> +- mediatek,ethernet: Phandle to the syscon node that Mediatek ethernet driver
> +	provides that handles the TRGMII setup used by the switch.
> +	See
> +	Documentation/devicetree/bindings/net/mediatek-net.txt for the detailed
> +	setup on mediatek ethernet.
> +- mediatek,mcm: String, should be "enabled" or "disabled" to indicate that

boolean instead.

> +	either MT7530 is the part on multi-chip module belong to MT7623A has
> +	or the remotely standalone chip as the function MT7623N reference board
> +	provided for.
> +- core-supply: Phandle to the regulator node necessary for the core power.
> +- io-supply: Phandle to the regulator node necessary for the I/O power
> +	See Documentation/devicetree/bindings/regulator/mt6323-regulator.txt
> +	for details for the regulator setup on these boards.
> +- mediatek,reset-pin: Phandle to the pinctrl node used for the reset. Which

What's wrong with the normal pinctrl binding?

> +	must be required if the property mediatek,mcm of specified as
> +	"disabled". See
> +	Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt for
> +	the mediatek pintcrl setting for the details.
> +
> +Each port children node within ports container must have the following

s/children/child/

> +mandatory properties:
> +- reg			: Port address described must be 6 for CPU port
> +			and from 0 to 5 for user ports.
> +
> +See Documentation/devicetree/bindings/dsa/dsa.txt for a list of additional
> +required, optional properties and how the integrated switch subnodes must
> +be specified.
> +
> +Example:
> +
> +	&mdio0 {
> +		switch@0 {
> +			compatible = "mediatek,mt7530";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0>;
> +
> +			mediatek,ethsys = <&ethsys>;
> +			mediatek,ethernet = <&eth>;
> +			mediatek,mcm = "enabled";
> +			core-supply = <&mt6323_vpa_reg>;
> +			io-supply = <&mt6323_vemc3v3_reg>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				reg = <0>;
> +				port@0 {
> +					reg = <0>;
> +					label = "lan0";
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					label = "lan1";
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +					label = "lan2";
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +					label = "lan3";
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +					label = "wan";
> +				};
> +
> +				port@6 {
> +					reg = <6>;
> +					label = "cpu";
> +					ethernet = <&eth>;
> +					phy-mode = "trgmii";
> +					fixed-link {
> +						speed = <1000>;
> +						full-duplex;
> +					};
> +				};
> +			};
> +		};
> +	};
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
