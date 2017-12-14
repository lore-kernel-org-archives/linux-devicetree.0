From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH net-next v6 1/2] dt-bindings: net: add DT bindings for
 Socionext UniPhier AVE
Date: Thu, 14 Dec 2017 15:24:17 -0800
Message-ID: <7749e13a-56ef-0d43-1a41-dbd457227575@gmail.com>
References: <1513245910-15961-1-git-send-email-hayashi.kunihiko@socionext.com>
 <1513245910-15961-2-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513245910-15961-2-git-send-email-hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Masami Hiramatsu <masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 12/14/2017 02:05 AM, Kunihiko Hayashi wrote:
> DT bindings for the AVE ethernet controller found on Socionext's
> UniPhier platforms.
> 
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> Signed-off-by: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  .../bindings/net/socionext,uniphier-ave4.txt       | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/socionext,uniphier-ave4.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.txt b/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.txt
> new file mode 100644
> index 0000000..4700377
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.txt
> @@ -0,0 +1,48 @@
> +* Socionext AVE ethernet controller
> +
> +This describes the devicetree bindings for AVE ethernet controller
> +implemented on Socionext UniPhier SoCs.
> +
> +Required properties:
> + - compatible: Should be
> +	- "socionext,uniphier-pro4-ave4" : for Pro4 SoC
> +	- "socionext,uniphier-pxs2-ave4" : for PXs2 SoC
> +	- "socionext,uniphier-ld11-ave4" : for LD11 SoC
> +	- "socionext,uniphier-ld20-ave4" : for LD20 SoC
> + - reg: Address where registers are mapped and size of region.
> + - interrupts: Should contain the MAC interrupt.
> + - phy-mode: See ethernet.txt in the same directory. Allow to choose
> +	"rgmii", "rmii", or "mii" according to the PHY.
> + - phy-handle: Should point to the external phy device.
> +	See ethernet.txt file in the same directory.
> + - clocks: A phandle to the clock for the MAC.
> +
> +Optional properties:
> + - resets: A phandle to the reset control for the MAC
> + - local-mac-address: See ethernet.txt in the same directory.
> +
> +Required subnode:
> + - mdio: Device tree subnode with the following required properties:
> +	- #address-cells: Must be <1>.
> +	- #size-cells: Must be <0>.
> +	- reg: phy ID number, usually a small integer.

Almost, the "reg" property applies to the MDIO child nodes: the Ethernet
PHYs/MDIO devices. For the MDIO controller itself, the "reg" property,
if specified, would be relative to the Ethernet controller's base
register address.

Please drop this property's description here.

> +
> +Example:
> +
> +	ether: ethernet@65000000 {
> +		compatible = "socionext,uniphier-ld20-ave4";
> +		reg = <0x65000000 0x8500>;
> +		interrupts = <0 66 4>;
> +		phy-mode = "rgmii";
> +		phy-handle = <&ethphy>;
> +		clocks = <&sys_clk 6>;
> +		resets = <&sys_rst 6>;
> +		local-mac-address = [00 00 00 00 00 00];
> +		mdio {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			ethphy: ethphy@1 {
> +				reg = <1>;
> +			};
> +		};
> +	};
> 

-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
