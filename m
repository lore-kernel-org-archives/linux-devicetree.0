From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: phy: Add documentation for NS2 USB3
 PHY
Date: Thu, 3 Aug 2017 14:03:51 -0500
Message-ID: <20170803190351.x7ed626agwpcakte@rob-hp-laptop>
References: <1501109787-15489-1-git-send-email-jon.mason@broadcom.com>
 <1501109787-15489-2-git-send-email-jon.mason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1501109787-15489-2-git-send-email-jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 26, 2017 at 06:56:22PM -0400, Jon Mason wrote:
> From: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> 
> Add documentation for USB3 PHY available in NS2 SoC
> 
> Signed-off-by: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/phy/brcm,ns2-usb3-phy.txt  | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/brcm,ns2-usb3-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/brcm,ns2-usb3-phy.txt b/Documentation/devicetree/bindings/phy/brcm,ns2-usb3-phy.txt
> new file mode 100644
> index 000000000000..b1c058c37d54
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/brcm,ns2-usb3-phy.txt
> @@ -0,0 +1,48 @@
> +Broadcom USB3 dual port phy for Northstar2 SoC
> +This is a child bus node of "brcm,mdio-mux-iproc" node.
> +
> +Required mdio bus properties:
> +- reg: MDIO Bus number for the MDIO interface
> +- #address-cells: must be 1
> +- #size-cells: must be 0
> +
> +Required PHY properties:
> +- compatible: should be "brcm,ns2-usb3-phy"
> +- reg: MDIO Phy ID for the MDIO interface
> +- #phy-cells: must be 0
> +- #address-cells: must be 1
> +- #size-cells: must be 0
> +
> +Sub-nodes:
> +  Each port's PHY should be represented as a sub-node.
> +
> +Sub-nodes required properties:
> + - reg: the PHY number
> + - phy-cells: from the generic PHY bindings, must be 0
> +
> +Example:
> +
> +mdio@1 {
> +	reg = <0x1>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	usb3_phy: usb3_phy@0 {

usb3-phy@0

> +		compatible = "brcm,ns2-usb3-phy";
> +		reg = <0x0>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		usb3_phy0: usb3_phy@0 {
> +			reg = <0>;
> +			#phy-cells = <0>;
> +			status = "disabled";

Don't show status in examples.

With those nits fixed,

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>


> +		};
> +
> +		usb3_phy1: usb_phy@1 {
> +			reg = <1>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +	};
> +};
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
