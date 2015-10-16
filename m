From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/3] doc: dt: add documentation for Mediatek spi-nor
 controller
Date: Thu, 15 Oct 2015 18:19:47 -0700
Message-ID: <20151016011947.GA28158@localhost>
References: <1444729160-26433-1-git-send-email-bayi.cheng@mediatek.com>
 <1444729160-26433-2-git-send-email-bayi.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1444729160-26433-2-git-send-email-bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bayi Cheng <bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Bayi,

On Tue, Oct 13, 2015 at 05:39:18PM +0800, Bayi Cheng wrote:
> Add device tree binding documentation for serial flash with
> Mediatek serial flash controller
> 
> Signed-off-by: Bayi Cheng <bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/mtd/mtk-quadspi.txt        | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> new file mode 100644
> index 0000000..8fff0ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> @@ -0,0 +1,30 @@
> +* MTD SPI nor driver for MTK MT81xx (and similar) serial flash controller
> +
> +Required properties:
> +- compatible: 	  should be "mediatek,mt8173-nor";
> +- reg: 		  physical base address and length of the controller's register
> +- clocks: 	  the phandle of the clock needed by the nor controller
> +- clock-names: 	  the name of the clocks
> +		  the clocks needed "spi" and "sf". "spi" is used for spi bus,
> +		  and "sf" is used for controller, these are the clocks witch
> +		  hardware needs to enabling nor flash and nor flash controller.
> +		  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> +- #address-cells: should be <1>
> +- #size-cells:	  should be <0>
> +
> +Example:
> +
> +nor_flash: spi@1100d000 {
> +	compatible = "mediatek,mt8173-nor";
> +	reg = <0 0x1100d000 0 0xe0>;
> +	clocks = <&pericfg CLK_PERI_SPI>,
> +		 <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
> +	clock-names = "spi", "sf";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	flash@0 {

I see you've added the 'flash' node as I requested, but you didn't
document it above, and your driver doesn't use it.

Brian

> +		....
> +	};
> +};
> +
> -- 
> 1.8.1.1.dirty
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
