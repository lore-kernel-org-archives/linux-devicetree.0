From: Guochun Mao <guochun.mao@mediatek.com>
Subject: Re: [PATCH v1 2/3] mtd: spi-nor: mtk-quadspi: add SNOR_HWCAPS_READ
 for capcity setting
Date: Tue, 15 Jan 2019 15:44:57 +0800
Message-ID: <1547538297.10234.4.camel@mhfsdcap03>
References: <67e650ca4fcaaddbbc98bf4e1cbe04647c990dc3.1547442452.git.ryder.lee@mediatek.com>
 <54bb8a9d517e2ee35018d78457c6aa6a4970e644.1547442452.git.ryder.lee@mediatek.com>
 <8afdb25c-894b-0a89-b7a8-b754fb4ba905@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <8afdb25c-894b-0a89-b7a8-b754fb4ba905@microchip.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Tudor.Ambarus@microchip.com
Cc: devicetree@vger.kernel.org, ryder.lee@mediatek.com, boris.brezillon@bootlin.com, weijie.gao@mediatek.com, linux-kernel@vger.kernel.org, marek.vasut@gmail.com, robh+dt@kernel.org, linux-mtd@lists.infradead.org, linux-mediatek@lists.infradead.org, computersforpeace@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 2019-01-15 at 06:59 +0000, Tudor.Ambarus@microchip.com wrote:
> Hi, Ryder,
> 
> On 01/14/2019 07:12 AM, Ryder Lee wrote:
> > From: Guochun Mao <guochun.mao@mediatek.com>
> > 
> > SNOR_HWCAPS_READ is a basic read mode for both flash and controller,
> > it should be supported, so add the capcity for mtk-quadspi.
> 
> Since I couldn't find a datasheet for mt8173, I tend to share your assumption -
> SNOR_HWCAPS_READ should be supported by this controller. However, it's always
> better to test it and not rely on assumptions. You can test it by forcing the
> mask to have just SNOR_HWCAPS_READ | SNOR_HWCAPS_PP set. Or you already tested it?

Our IPs all support SNOR_HWCAPS_READ, Ryedr and I have test it.

> 
> You have a typo in capcity. Maybe substitute it with capability or "add this
> flag to spi_nor_hwcaps mask"

Ok, we'll correct it next version.

Thanks.
Guochun
> 
> > 
> > Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
> 
> You should add your SoB tag, because you are sending a patch that is not yours.
> 
> Cheers,
> ta
> 
> > ---
> > Changes since v1: none. 
> > ---
> >  drivers/mtd/spi-nor/mtk-quadspi.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/mtk-quadspi.c b/drivers/mtd/spi-nor/mtk-quadspi.c
> > index 5442993..d9eed68 100644
> > --- a/drivers/mtd/spi-nor/mtk-quadspi.c
> > +++ b/drivers/mtd/spi-nor/mtk-quadspi.c
> > @@ -431,7 +431,8 @@ static int mtk_nor_init(struct mtk_nor *mtk_nor,
> >  			struct device_node *flash_node)
> >  {
> >  	const struct spi_nor_hwcaps hwcaps = {
> > -		.mask = SNOR_HWCAPS_READ_FAST |
> > +		.mask = SNOR_HWCAPS_READ |
> > +			SNOR_HWCAPS_READ_FAST |
> >  			SNOR_HWCAPS_READ_1_1_2 |
> >  			SNOR_HWCAPS_PP,
> >  	};
> > 



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
