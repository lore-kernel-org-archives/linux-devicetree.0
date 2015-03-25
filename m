From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v1 2/3] Phy: DT binding documentation for Broadcom Cygnus
 USB PHY driver
Date: Thu, 26 Mar 2015 03:46:58 +0530
Message-ID: <551333DA.6080700@ti.com>
References: <1426886727-537-1-git-send-email-arun.ramamurthy@broadcom.com> <1426886727-537-3-git-send-email-arun.ramamurthy@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426886727-537-3-git-send-email-arun.ramamurthy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arun Ramamurthy <arun.ramamurthy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazau <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Saturday 21 March 2015 02:55 AM, Arun Ramamurthy wrote:
> Broadcom's Cygnus chip has a USB 2.0 host controller connected to
> three separate phys. One of the phs (port 2) is also connectd to
> a usb 2.0 device controller
> 
> Reviewed-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Arun Ramamurthy <arun.ramamurthy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> 
> ---
>  .../bindings/phy/brcm,cygnus-usb-phy.txt           | 65 ++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/brcm,cygnus-usb-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/brcm,cygnus-usb-phy.txt b/Documentation/devicetree/bindings/phy/brcm,cygnus-usb-phy.txt
> new file mode 100644
> index 0000000..002bd59
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/brcm,cygnus-usb-phy.txt
> @@ -0,0 +1,65 @@
> +BROADCOM CYGNUS USB PHY
> +
> +Required Properties:
> +	- compatible:  brcm,cygnus-usb-phy
> +	- reg : usbphy_regs - Base address of phy registers
> +			usb2h_idm_regs - Base address of host idm registers
> +			usb2d_idm_regs - Base address of device idm registers

where is #phy-cells documented?
> +The node that uses the phy must provide one integers, 0 for device and 1 for host

> +
> +NOTE: port 0 and port 1 are host only and port 2 can be configured for host or device.
> +
> +Example of phy :
> +	usbphy0: usbphy@0x0301c000 {
> +		compatible = "brcm,cygnus-usb-phy";
> +		reg = <0x0301c000 0x2000>,
> +		      <0x18115000 0x1000>,
> +		      <0x18111000 0x1000>;
> +		status = "okay";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		usbphy0_0: usbphy0@0 {
> +			#phy-cells = <1>;
> +			reg = <0>;
> +			status = "okay";
> +			phy-supply = <&vbus_p0>;
> +		};
> +
> +		usbphy0_1: usbphy0@1 {
> +			#phy-cells = <1>;
> +			reg = <1>;
> +			status = "okay";
> +		};
> +
> +		usbphy0_2: usbphy0@2 {
> +			#phy-cells = <1>;
> +			reg = <2>;
> +			status = "okay";
> +			phy-supply = <&vbus_p2>;
> +		};
> +	};
> +
> +Example of node using the phy:
> +
> +	/* This nodes declares all three ports as host */
> +	
> +	ehci0: usb@0x18048000 {
> +		compatible = "generic-ehci";
> +		reg = <0x18048000 0x100>;
> +		interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> +		phys = <&usbphy0_0 1 &usbphy0_1 1 &usbphy0_2 1>;
> +		phy-names = "usb","usb","usb";

is it on purpose you use the same name for phy-names? it is wrong though.
> +		status = "okay";
> +	};
> +
> +	/* This node declares port 2 phy
> +	and configures it for device */

please use standard multi-line comment format.

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
