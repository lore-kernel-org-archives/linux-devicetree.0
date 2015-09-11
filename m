From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] doc: dt: add documentation for Mediatek spi-nor
 controller
Date: Fri, 11 Sep 2015 14:47:04 -0700
Message-ID: <20150911214704.GD11487@google.com>
References: <1441705796-11365-1-git-send-email-bayi.cheng@mediatek.com>
 <1441705796-11365-2-git-send-email-bayi.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1441705796-11365-2-git-send-email-bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bayi Cheng <bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 08, 2015 at 05:49:54PM +0800, Bayi Cheng wrote:
> Add device tree binding documentation for serial flash with
> Mediatek serial flash controller
> 
> Signed-off-by: Bayi Cheng <bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mtd/mtk_nor.txt | 25 +++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/mtk_nor.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtk_nor.txt b/Documentation/devicetree/bindings/mtd/mtk_nor.txt
> new file mode 100644
> index 0000000..0eca0cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/mtk_nor.txt
> @@ -0,0 +1,25 @@
> +* MTD SPI nor driver for MTK MT81xx (and similar) serial flash controller
> +
> +MTK MT81xx serial flash controller is designed for serial Flash device.
> +It supports one Flash device with signal mode, dual mode and quad mode.
> +
> +Required properties:
> +- compatible: should be "mediatek,mt8173-nor";
> +- reg: physical base address and length of the controller's register
> +- clocks: spi nor source clock
> +- clock-names: "spi_clk", "axi_clk", "mux_clk", "sf_clk"
> +
> +See Documentation/devicetree/bindings/clock/clock-bindings.txt
> +and Documentation/mtd/spi-nor.txt for details.
> +
> +Example:
> +nor_flash: nor@1100d000 {
> +	compatible = "mediatek,mt8173-nor";
> +	reg = <0 0x1100d000 0 0xe0>;
> +	clocks = <&pericfg CLK_PERI_SPI>,
> +		 <&topckgen CLK_TOP_AXI_SEL>,
> +		 <&topckgen CLK_TOP_UNIVPLL2_D8>,
> +		 <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
> +	clock-names = "spi_clk", "axi_clk", "mux_clk", "sf_clk";
> +};

I understand that for now, you only support a single flash, and you
don't need any extra flash-specific DT properties, but in the interest
of being more generic and more in-line with other drivers, can you
include:

  * #addres-cells (= <1>) and #size-cells (= <0>) properties
  * sub-node(s) representing the flash; reference [1], and there's a
    good example in a recent submission [2]

So I'd expect something like:

	nor_flash: nor@1100d000 {
		compatible = "mediatek,mt8173-nor";
		...
		#address-cells = <1>;
		#size-cells = <0>;

		flash@0 {
			compatible = "jedec,spi-nor";
			reg = <0>;
			...
		};
	};

This patch is also relevant [3] (hopefully I'll get to merge that one
soon); you'll want to use the sub-node (not the main node) when
initializing the flash device.

I think maybe we'll want to codify some of this in a "SPI NOR
controller" document, so we can make sure more developers follow this
when designing their binding.

Brian

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
[2] http://lists.infradead.org/pipermail/linux-mtd/2015-August/061439.html
[3] http://lists.infradead.org/pipermail/linux-mtd/2015-September/061637.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
