From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCHv4][ 2/6] dma: ipu: Add devicetree support.
Date: Tue, 5 Nov 2013 07:09:29 +0100
Message-ID: <20131105060929.GX24559@pengutronix.de>
References: <1383581724-14817-1-git-send-email-denis@eukrea.com>
 <1383581724-14817-2-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1383581724-14817-2-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Eric =?iso-8859-15?Q?B=E9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 04, 2013 at 05:15:20PM +0100, Denis Carikli wrote:
> diff --git a/Documentation/devicetree/bindings/dma/fsl-imx-ipu.txt b/Documentation/devicetree/bindings/dma/fsl-imx-ipu.txt
> new file mode 100644
> index 0000000..2f3c976
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/fsl-imx-ipu.txt
> @@ -0,0 +1,20 @@
> +* Freescale Image Processing Unit (IPU) support for i.MX3x.
> +
> +This driver supports the imx31 and imx35 devices.
> +
> +Required properties:
> +- compatible : Should be "fsl,imx31-ipu".
> +- reg : Should contain IPU registers location and length.
> +- interrupts : First item should be IPU interrupt, second one is optional and
> +    should contain IPU Error interrupt.
> +
> +Example:
> +
> +	ipu: ipu@53fc0000 {
> +		compatible = "fsl,imx31-ipu";
> +		reg = <	0x53fc0000 0x5f
> +			0x53fc0088 0x2b >;
> +		interrupts = <42 41>;
> +		clocks = <&clks 55>;
> +		clock-names = "";
> +	};

As said before: I don't think that splitting the IPU in several nodes
like above just to satisfy the current Linux driver setup is
appropriate.

The IPU should rather look like:

ipu: ipu@53fc0000 {
	compatible = "fsl,imx31-ipu";
	reg = <0x53fc0000 0x4000>;
	interrupts = <42 31>;
	clocks = <&clks 55 ...>;
	clock-names = "...";
};

Note that the above covers the whole address space of the IPU. This is
more close to the IPUv3 binding. With separating the IDMAC and DI nodes
you force us to keep the current driver separation between dma and fb
driver. The IPU should never have used the Linux DMA driver framework
though.

When you cover the whole address space you could then in the
corresponding driver register platform devices which match to the
current dma/fb driver combination.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
