From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: usb: Add documentation for NS2 CDRU
 USB3
Date: Thu, 3 Aug 2017 14:05:48 -0500
Message-ID: <20170803190548.k4mccsmpzaql45p3@rob-hp-laptop>
References: <1501109787-15489-1-git-send-email-jon.mason@broadcom.com>
 <1501109787-15489-3-git-send-email-jon.mason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1501109787-15489-3-git-send-email-jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 26, 2017 at 06:56:23PM -0400, Jon Mason wrote:
> Add documentation for CDRU USB3 registers available in NS2 SoC
> 
> Signed-off-by: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/usb/brcm,cdru-usb3-ctrl.txt        | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/brcm,cdru-usb3-ctrl.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/brcm,cdru-usb3-ctrl.txt b/Documentation/devicetree/bindings/usb/brcm,cdru-usb3-ctrl.txt
> new file mode 100644
> index 000000000000..30c03bef58fd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/brcm,cdru-usb3-ctrl.txt
> @@ -0,0 +1,14 @@
> +Broadcom Chip Device Resource Unit USB3 register
> +
> +Required properties:
> +- compatible: "brcm,cdru-usb3-ctrl"
> +- reg: Base address and length of the USB registers
> +
> +
> +Example:
> +
> +cdru_usb3_ctrl: cdru_usb3_ctrl@6501d144 {

s/_/-/

With that,

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> +        compatible = "brcm,cdru-usb3-ctrl";
> +        reg = <0x6501d144 0x4>;
> +};
> +
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
