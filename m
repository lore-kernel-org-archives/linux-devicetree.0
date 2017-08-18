From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [V7] dt-bindings: phy: Add bindings for ralink-usb PHY
Date: Fri, 18 Aug 2017 16:13:40 +0530
Message-ID: <48e661f0-f65f-e12b-d617-d076ddf0d49b@ti.com>
References: <1502966003-3776-1-git-send-email-harvey.hunt@imgtec.com>
 <1502966003-3776-2-git-send-email-harvey.hunt@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502966003-3776-2-git-send-email-harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Thursday 17 August 2017 04:03 PM, Harvey Hunt wrote:
> From: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
> 
> Add a binding for the USB phy on Mediatek/Ralink SoCs.
> 
> Signed-off-by: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
> Signed-off-by: Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org

merged the series, thanks!

-Kishon
> ---
> Changes in V7:
> * Add required ralink,sysctl property
> 
> Changes in V6:
> * Add MT7628 binding
> * Add optional reg property
> 
> Changes in V5:
> * None
> 
> Changes in V4:
> * None
> 
> Changes in V3:
> * Split out from first patch
> 
>  .../devicetree/bindings/phy/ralink-usb-phy.txt     | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/ralink-usb-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/ralink-usb-phy.txt b/Documentation/devicetree/bindings/phy/ralink-usb-phy.txt
> new file mode 100644
> index 0000000..9d2868a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/ralink-usb-phy.txt
> @@ -0,0 +1,23 @@
> +Mediatek/Ralink USB PHY
> +
> +Required properties:
> + - compatible: "ralink,rt3352-usbphy"
> +	       "mediatek,mt7620-usbphy"
> +	       "mediatek,mt7628-usbphy"
> + - reg: required for "mediatek,mt7628-usbphy", unused otherwise
> + - #phy-cells: should be 0
> + - ralink,sysctl: a phandle to a ralink syscon register region
> + - resets: the two reset controllers for host and device
> + - reset-names: the names of the 2 reset controllers
> +
> +Example:
> +
> +usbphy: phy {
> +	compatible = "mediatek,mt7628-usbphy";
> +	reg = <0x10120000 0x1000>;
> +	#phy-cells = <0>;
> +
> +	ralink,sysctl = <&sysc>;
> +	resets = <&rstctrl 22 &rstctrl 25>;
> +	reset-names = "host", "device";
> +};
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
