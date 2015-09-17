From: bayi.cheng <bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/3] doc: dt: add documentation for Mediatek spi-nor
 controller
Date: Thu, 17 Sep 2015 17:02:53 +0800
Message-ID: <1442480573.27250.28.camel@mhfsdcap03>
References: <1442478994-12467-1-git-send-email-bayi.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1442478994-12467-1-git-send-email-bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Sorry, Please ignore this mail, and I will publish new one.




On Thu, 2015-09-17 at 16:36 +0800, Bayi Cheng wrote:
> Add device tree binding documentation for serial flash with
> Mediatek serial flash controller
> 
> Change-Id: Iaecd0bb7ba1b224f1e27bd7063f0b8d7ea30175a
> Signed-off-by: Bayi Cheng <bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mtd/mtk_quadspi.txt | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/mtk_quadspi.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtk_quadspi.txt b/Documentation/devicetree/bindings/mtd/mtk_quadspi.txt
> new file mode 100644
> index 0000000..6153227
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/mtk_quadspi.txt
> @@ -0,0 +1,18 @@
> +* MTD SPI nor driver for MTK MT81xx (and similar) serial flash controller
> +
> +Required properties:
> +- compatible: Should be "mediatek,mt8173-nor";
> +- reg: Physical base address and length of the controller's register
> +- clocks: spi source clock amd serial flash controller's clock
> +- clock-names: "spi", "sf"
> +  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> +
> +Example:
> +nor_flash: nor@1100d000 {
> +	compatible = "mediatek,mt8173-nor";
> +	reg = <0 0x1100D000 0 0xE0>;
> +	clocks = <&pericfg CLK_PERI_SPI>,
> +			 <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
> +	clock-names = "spi", "sf";
> +};
> +
