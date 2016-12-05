From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] Add DT bindings documentation for Synopsys UDC driver
Date: Mon, 5 Dec 2016 17:04:20 -0600
Message-ID: <20161205230420.ubo2cskoohfnwlfs@rob-hp-laptop>
References: <1480485910-7797-1-git-send-email-raviteja.garimella@broadcom.com>
 <1480485910-7797-2-git-send-email-raviteja.garimella@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1480485910-7797-2-git-send-email-raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 30, 2016 at 11:35:09AM +0530, Raviteja Garimella wrote:
> This patch adds documentation for Synopsis Designware Cores AHB
> Subsystem Device Controller (UDC).
> 
> Signed-off-by: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/usb/snps,dw-ahb-udc.txt    | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/snps,dw-ahb-udc.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/snps,dw-ahb-udc.txt b/Documentation/devicetree/bindings/usb/snps,dw-ahb-udc.txt
> new file mode 100644
> index 0000000..64e1fbf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/snps,dw-ahb-udc.txt
> @@ -0,0 +1,29 @@
> +Synopsys USB Device controller.
> +
> +The device node is used for Synopsys Designware Cores AHB
> +Subsystem Device Controller (UDC).
> +
> +Required properties:
> + - compatible: should be "snps,dw-ahbudc"

Needs an SoC specific compatible string.

> + - reg: Offset and length of UDC register set
> + - interrupts: description of interrupt line
> + - phys: phandle to phy node.
> + - phy-names: name of phy node. Must be usb2drd.

A name is pointless when there's only 1 phy. Is this a device or dual 
role device(DRD)?

> + - extcon: phandle to the extcon device

I don't think extcon should be required. If this is UDC only, I'm not 
sure why you'd need it.

> +
> +Example:
> +
> +	usbdrd_phy: phy@6501c000 {
> +		#phy-cells = <0>;
> +		compatible = "brcm,ns2-drd-phy";
> +		reg = <0x66000000 0x1000>,
> +	}
> +
> +	udc_dwc: usb@664e0000 {
> +		compatible = "snps,dw-ahb-udc";

Doesn't match above.

> +		reg = <0x664e0000 0x2000>;
> +		interrupts = <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
> +		phys = <&usbdrd_phy>;
> +		phy-names = "usb2drd";
> +		extcon = <&usbdrd_phy>";

You are already describing the phy connection, you shouldn't need both.

> +	};
> -- 
> 2.1.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
