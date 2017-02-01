From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/6] DT bindings documentation for Broadcom IPROC USB
 Device controller.
Date: Wed, 1 Feb 2017 10:13:41 -0600
Message-ID: <20170201161341.rapdtibeyw7vblmz@rob-hp-laptop>
References: <1485762973-14586-1-git-send-email-raviteja.garimella@broadcom.com>
 <1485762973-14586-6-git-send-email-raviteja.garimella@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1485762973-14586-6-git-send-email-raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 30, 2017 at 01:26:12PM +0530, Raviteja Garimella wrote:
> The device node is used for UDCs integrated into Broadcom's
> iProc family of SoCs'. The UDC is based on Synopsys Designware
> Cores AHB Subsystem USB Device Controller IP.
> 
> Signed-off-by: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> ---
>  .../bindings/usb/brcm,iproc-snps-udc.txt           | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/brcm,iproc-snps-udc.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/brcm,iproc-snps-udc.txt b/Documentation/devicetree/bindings/usb/brcm,iproc-snps-udc.txt
> new file mode 100644
> index 0000000..537dd4d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/brcm,iproc-snps-udc.txt
> @@ -0,0 +1,24 @@
> +Broadcom IPROC USB Device controller.
> +
> +The device node is used for UDCs integrated into Broadcom's
> +iProc family of SoCs'. The UDC is based on Synopsys Designware
> +Cores AHB Subsystem Device Controller.
> +
> +Required properties:
> + - compatible: should be "brcm,iproc-snps-udc"

Adding "snps" in here adds nothing really. Again, please use per SoC 
compatible strings.

> + - reg: Offset and length of UDC register set
> + - interrupts: description of interrupt line
> + - phys: phandle to phy node.
> + - extcon: phandle to the extcon device. This is optional and
> +   not required for those that don't require extcon support.
> +   Extcon support will be required if the UDC is connected to
> +   a Dual Role Device Phy that supports both Host and Device
> +   mode based on the external cable.

Drop this property.

> +
> +Example:
> +	udc_dwc: usb@664e0000 {
> +		compatible = "brcm,iproc-snps-udc";
> +		reg = <0x664e0000 0x2000>;
> +		interrupts = <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
> +		phys = <&usbdrd_phy>;
> +		extcon = <&usbdrd_phy>";
> -- 
> 2.1.0
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
