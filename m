From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/8] usb: bdc: Add Device Tree binding document for
 Broadcom BDC driver
Date: Thu, 6 Jul 2017 09:18:40 -0500
Message-ID: <20170706141840.lanfxjdrkaqvv3vz@rob-hp-laptop>
References: <1498587806-24781-1-git-send-email-alcooperx@gmail.com>
 <1498587806-24781-3-git-send-email-alcooperx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1498587806-24781-3-git-send-email-alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, yuan linyu <Linyu.Yuan-cfy2TCaE7SHLM0G2K2Xlo2/U75nxZMCp@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:USB SUBSYSTEM" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 27, 2017 at 02:23:20PM -0400, Al Cooper wrote:
> Add Device Tree binding document for Broadcom USB Device
> Controller (BDC).
> 
> Signed-off-by: Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/usb/brcm,bdc-udc.txt       | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/brcm,bdc-udc.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/brcm,bdc-udc.txt b/Documentation/devicetree/bindings/usb/brcm,bdc-udc.txt
> new file mode 100644
> index 0000000..4eeaddb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/brcm,bdc-udc.txt
> @@ -0,0 +1,28 @@
> +Broadcom USB Device Controller (BDC)
> +====================================
> +
> +Required properties:
> +
> +- compatible: must be one of:
> +                "brcm,bdc-udc-v0.16"
> +                "brcm,bdc-udc"

Isn't "bdc-udc" redundant?

Where does the version number come from?

> +- reg: the base register address and length
> +- interrupts: ther interrupt line for this controller

s/ther/the/

> +
> +Optional properties:
> +
> +On Broadcom STB platforms, these properties are required:
> +
> +- phys: phandle to the USB PHY blocks

How many?

> +- clocks: phandle to the functional clock of this block
> +
> +Example:
> +
> +        udc@f0b02000 {
> +                status = "disabled";

Don't show status in examples.

> +                compatible = "brcm,bdc-udc-v0.16";
> +                reg = <0xf0b02000 0xfc4>;
> +                interrupts = <0x0 0x60 0x0>;
> +                phys = <&usbphy_0 0x0>;
> +                clocks = <&sw_usbd>;
> +        };
> -- 
> 1.9.0.138.g2de3478
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
