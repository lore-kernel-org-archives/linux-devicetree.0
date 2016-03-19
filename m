From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 05/11] dt-bindings: Add bindings for phy-da8xx-usb
Date: Sat, 19 Mar 2016 18:56:45 -0500
Message-ID: <20160319235645.GA14265@rob-hp-laptop>
References: <1458181615-27782-1-git-send-email-david@lechnology.com>
 <1458181615-27782-6-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1458181615-27782-6-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Cc: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 16, 2016 at 09:26:38PM -0500, David Lechner wrote:
> Device tree binding for new phy-da8xx-usb driver.
> 
> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
> ---
> 
> v2 changes: This is new patch in v2.
> 
> 
>  .../devicetree/bindings/phy/phy-da8xx-usb.txt      | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt b/Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt
> new file mode 100644
> index 0000000..ed6b710
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt
> @@ -0,0 +1,34 @@
> +TI DaVinci DA8XX USB PHY
> +
> +Required properties:
> + - compatible: must be "ti,da830-usbphy".
> + - #phy-cells: must be 1.
> + - reg : Address and length of the CFGCHIP2 register.
> +
> +This device controls the PHY for both the USB 1.1 OHCI and USB 2.0 OTG
> +controllers on DA8XX SoCs. Consumers of this device should use index 1 for

DA8xx

> +the USB 1.1 phy device and index 2 for the USB 2.0 phy device.
> +
> +Example:
> +
> +	usbphy: usbphy@1c14184 {

TI has been doing the unit addresses wrong I've recently found. It 
should match the reg property, not be the full physical address. Please 
fix all these in the example.

> +		compatible = "ti,da830-usbphy";
> +		#phy-cells = <1>;
> +		reg = <0x14184 4>;
> +	};
> +
> +	usb11: usb11@1e25000 {

usb@...

> +		compatible = "ti,da830-ohci";
> +		reg = <0x225000 0x1000>;
> +		interrupts = <59>;
> +		phys = <&usbphy 1>;
> +		phy-names = "usbphy";
> +	};
> +
> +	usb20: usb@1e00000 {
> +		compatible = "ti,da830-musb";
> +		reg = <0x200000 0x1000>;
> +		interrupts = <58>;
> +		phys = <&usbphy 2>;
> +		phy-names = "usbphy";
> +	};
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
