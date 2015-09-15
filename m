From: bayi.cheng <bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/3] doc: dt: add documentation for Mediatek spi-nor
 controller
Date: Tue, 15 Sep 2015 14:49:35 +0800
Message-ID: <1442299775.27250.8.camel@mhfsdcap03>
References: <1441705796-11365-1-git-send-email-bayi.cheng@mediatek.com>
 <1441705796-11365-2-git-send-email-bayi.cheng@mediatek.com>
 <CAD6G_RR5W8_4d_gcTD=h9EBhwWUzsEmyNK+pYGq82GEHDV4=ig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAD6G_RR5W8_4d_gcTD=h9EBhwWUzsEmyNK+pYGq82GEHDV4=ig-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2015-09-08 at 17:04 +0530, Jagan Teki wrote:
> On 8 September 2015 at 15:19, Bayi Cheng <bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> > Add device tree binding documentation for serial flash with
> > Mediatek serial flash controller
> >
> > Signed-off-by: Bayi Cheng <bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/mtd/mtk_nor.txt | 25 +++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/mtk_nor.txt
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/mtk_nor.txt b/Documentation/devicetree/bindings/mtd/mtk_nor.txt
> > new file mode 100644
> > index 0000000..0eca0cd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/mtk_nor.txt
> 
> IMHO - looks like the name of the driver file not resembles controller
> driver, usually spi-nor framework has a name include 'nor' and related
> controller drivers uses simple notion with vendor/soc_name-quadspi or
> something similar.
> 
> cadence-quadspi.c
> fsl-quadspi.c
> 
> Simple suggestion - mtk-quadspi.c (since it supports quad)

Ok, Thanks for your instruct! I will change the name of the driver file
from mtk_nor.c to mtk-quadspi.c . at the same time, change the
mtk_nor.txt to mtk-quadspi.txt .
> 
> > @@ -0,0 +1,25 @@
> > +* MTD SPI nor driver for MTK MT81xx (and similar) serial flash controller
> > +
> > +MTK MT81xx serial flash controller is designed for serial Flash device.
> > +It supports one Flash device with signal mode, dual mode and quad mode.
> > +
> > +Required properties:
> > +- compatible: should be "mediatek,mt8173-nor";
> > +- reg: physical base address and length of the controller's register
> > +- clocks: spi nor source clock
> > +- clock-names: "spi_clk", "axi_clk", "mux_clk", "sf_clk"
> > +
> > +See Documentation/devicetree/bindings/clock/clock-bindings.txt
> 
> As this related to clock-names, just add this line in-continuous with
> clock-name property description.
> 
OK, I will change it.
> > +and Documentation/mtd/spi-nor.txt for details.
> 
> This explicit mentioning about spi-nor documentation is may not
> required as this .txt will describe how spi-nor works and not related
> to bindings.
> 
yes, you are right, and I will drop this line
> > +
> > +Example:
> > +nor_flash: nor@1100d000 {
> > +       compatible = "mediatek,mt8173-nor";
> > +       reg = <0 0x1100d000 0 0xe0>;
> > +       clocks = <&pericfg CLK_PERI_SPI>,
> > +                <&topckgen CLK_TOP_AXI_SEL>,
> > +                <&topckgen CLK_TOP_UNIVPLL2_D8>,
> > +                <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
> > +       clock-names = "spi_clk", "axi_clk", "mux_clk", "sf_clk";
> > +};
> > +
> > --
> > 1.8.1.1.dirty
> >
> 
> thanks!
