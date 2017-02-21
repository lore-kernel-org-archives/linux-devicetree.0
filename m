From: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 5/6] DT bindings documentation for Broadcom IPROC USB
 Device controller.
Date: Tue, 21 Feb 2017 12:22:52 -0800
Message-ID: <d51ea8d3-2355-e77b-3ad6-b5dc71436744@broadcom.com>
References: <1487677384-6115-1-git-send-email-raviteja.garimella@broadcom.com>
 <1487677384-6115-6-git-send-email-raviteja.garimella@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487677384-6115-6-git-send-email-raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Raviteja,

updates inline

On 17-02-21 03:43 AM, Raviteja Garimella wrote:
> The device node is used for UDCs integrated into Broadcom's
> iProc family of SoCs'. The UDC is based on Synopsys Designware
> Cores AHB Subsystem USB Device Controller IP.
>
> Signed-off-by: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/iproc-udc.txt | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/iproc-udc.txt
>
> diff --git a/Documentation/devicetree/bindings/usb/iproc-udc.txt b/Documentation/devicetree/bindings/usb/iproc-udc.txt
> new file mode 100644
> index 0000000..c2ce803
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/iproc-udc.txt
> @@ -0,0 +1,21 @@
> +Broadcom IPROC USB Device controller.
> +
> +The device node is used for UDCs integrated into Broadcom's
> +iProc family (Northstar2, Cygnus) of SoCs'. The UDC is based
> +on Synopsys Designware Cores AHB Subsystem Device Controller
> +IP.
> +
> +Required properties:
> + - compatible: Add the compatibility strings for supported platforms.
> +   For Broadcom NS2 platform, add "brcm,ns2-udc".
    For Broadcom NS2 platform, add "brcm,ns2-udc", "brcm,iproc-udc".
> +   For Broadcom Cygnus platform, add "brcm,cygnus-udc".
    For Broadcom Cygnus platform, add "brcm,cygnus-udc", "brcm,iproc-udc".
> + - reg: Offset and length of UDC register set
> + - interrupts: description of interrupt line
> + - phys: phandle to phy node.
> +
> +Example:
> +	udc_dwc: usb@664e0000 {
> +		compatible = "brcm,ns2-udc", "brcm,cygnus-udc";
		compatible = "brcm,ns2-udc", "brcm,iproc-udc";
> +		reg = <0x664e0000 0x2000>;
> +		interrupts = <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
> +		phys = <&usbdrd_phy>;
>
Regards,
  Scott
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
