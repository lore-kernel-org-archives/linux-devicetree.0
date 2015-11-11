From: bayi cheng <bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v6 2/3] mtd: mtk-nor: mtk serial flash controller driver
Date: Wed, 11 Nov 2015 21:51:32 +0800
Message-ID: <1447249892.19991.5.camel@mhfsdcap03>
References: <1446824889-16144-1-git-send-email-bayi.cheng@mediatek.com>
	 <1446824889-16144-3-git-send-email-bayi.cheng@mediatek.com>
	 <20151110030115.GM12143@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151110030115.GM12143-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2015-11-09 at 19:01 -0800, Brian Norris wrote:
> Hi Bayi,
> 
> A few small comments.
> 
> On Fri, Nov 06, 2015 at 11:48:08PM +0800, Bayi Cheng wrote:
> > add spi nor flash driver for mediatek controller
> > 
> > Signed-off-by: Bayi Cheng <bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  drivers/mtd/spi-nor/Kconfig       |   7 +
> >  drivers/mtd/spi-nor/Makefile      |   1 +
> >  drivers/mtd/spi-nor/mtk-quadspi.c | 475 ++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 483 insertions(+)
> >  create mode 100644 drivers/mtd/spi-nor/mtk-quadspi.c
> 
> 
> > diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> > index e53333e..0bf3a7f8 100644
> > --- a/drivers/mtd/spi-nor/Makefile
> > +++ b/drivers/mtd/spi-nor/Makefile
> > @@ -1,3 +1,4 @@
> >  obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
> >  obj-$(CONFIG_SPI_FSL_QUADSPI)	+= fsl-quadspi.o
> > +obj-$(CONFIG_MTD_MT81xx_NOR)    += mtk-quadspi.o
> >  obj-$(CONFIG_SPI_NXP_SPIFI)	+= nxp-spifi.o
> > diff --git a/drivers/mtd/spi-nor/mtk-quadspi.c b/drivers/mtd/spi-nor/mtk-quadspi.c
> > new file mode 100644
> > index 0000000..6582811
> > --- /dev/null
> > +++ b/drivers/mtd/spi-nor/mtk-quadspi.c
> > @@ -0,0 +1,475 @@
> 
> ...
> 
> > +/* Can shift up to 48 bits (6 bytes) of TX/RX */
> > +#define MTK_NOR_MAX_SHIFT		6
> 
> ...
> 
> > +static int mt8173_nor_do_tx_rx(struct mt8173_nor *mt8173_nor, u8 op,
> > +			       u8 *tx, int txlen, u8 *rx, int rxlen)
> > +{
> > +	int len = 1 + txlen + rxlen;
> > +	int i, ret, idx;
> > +
> > +	if (len > MTK_NOR_MAX_SHIFT + 1)
> > +		return -EINVAL;
> 
> So I see you adjusted these bounds to add 1, which inspired one of my
> questions on the cover letter.
> 
> Why do you allow len=7, which means you'd program 7*8 to the COUNT
> register, when the SoC manual says it has a max of 48? Is the manual
> wrong?
> 
Hi Brian, you are right, the manual is wrong here, Actually, it has a
max of 56. when we want to read 6 IDs, we need transfer 1 byte command
and 6 bytes null address to nor flash, then we can read the six IDs from
SHREGx register.

> I notice you added the '+ 1' to your driver, so it allows:
> 
> 	do_tx_rx( txlen = 0 , rxlen = 6) /* e.g., for READ ID */
> 
> but that means your driver also allows:
> 
> 	do_tx_rx( txlen = 6, rxlen = 0) /* ERROR: this will allow out of
> 					   bounds write on PRGDATA
> 					   register -1 */
> 
> If I understand correctly, the following constraints are more correct:
> 
> 	/* Can only transmit 1 opcode and 5 other bytes */
> 	if (1 + txlen > MTK_NOR_MAX_SHIFT)
> 		return -EINVAL;
> 
> 	/* Can only receive 6 bytes after the opcode */
> 	if (rxlen > MTK_NOR_MAX_SHIFT)
> 		return -EINVAL;
> 
> 	/* Can only handle XXX bytes total */
> 	/* How many bytes is the max for register MTK_NOR_CNT_REG ? */
> 	if (len > XXX)
> 		return -EINVAL;
> 
yes, your constraints seems more correct, and I will adapt these lines
to next patch.
> > +
> > +	writeb(len * 8, mt8173_nor->base + MTK_NOR_CNT_REG);
> > +
> > +	/* start at PRGDATA5, go down to PRGDATA0 */
> > +	idx = MTK_NOR_MAX_SHIFT - 1;
> > +
> > +	/* opcode */
> > +	writeb(op, mt8173_nor->base + MTK_NOR_PRG_REG(idx));
> > +	idx--;
> > +
> > +	/* program TX data */
> > +	for (i = 0; i < txlen; i++, idx--)
> > +		writeb(tx[i], mt8173_nor->base + MTK_NOR_PRG_REG(idx));
> > +
> > +	/* clear out rest of TX registers */
> > +	while (idx >= 0) {
> > +		writeb(0, mt8173_nor->base + MTK_NOR_PRG_REG(idx));
> > +		idx--;
> > +	}
> > +
> > +	ret = mt8173_nor_execute_cmd(mt8173_nor, MTK_NOR_PRG_CMD);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* restart at first RX byte */
> > +	idx = rxlen - 1;
> > +
> > +	/* read out RX data */
> > +	for (i = 0; i < rxlen; i++, idx--)
> > +		rx[i] = readb(mt8173_nor->base + MTK_NOR_SHREG(idx));
> > +
> > +	return 0;
> > +}
> > +
> 
> ...
> 
> > +static int __init mtk_nor_init(struct mt8173_nor *mt8173_nor,
> > +			       struct device_node *flash_node)
> > +{
> > +	struct mtd_part_parser_data ppdata = {
> > +		.of_node = flash_node,
> > +	};
> > +	int ret;
> > +	struct spi_nor *nor;
> 
> Normally we'd have a blank line here.
> 
Ok, I will fix it, and thanks for your advice.

> > +	/* initialize controller to accept commands */
> > +	writel(MTK_NOR_ENABLE_SF_CMD, mt8173_nor->base + MTK_NOR_WRPROT_REG);
> > +
> > +	nor = &mt8173_nor->nor;
> > +	nor->dev = mt8173_nor->dev;
> > +	nor->priv = mt8173_nor;
> > +	nor->flash_node = flash_node;
> > +
> > +	/* fill the hooks to spi nor */
> > +	nor->read = mt8173_nor_read;
> > +	nor->read_reg = mt8173_nor_read_reg;
> > +	nor->write = mt8173_nor_write;
> > +	nor->write_reg = mt8173_nor_write_reg;
> > +	nor->mtd.owner = THIS_MODULE;
> > +	nor->mtd.name = "mtk_nor";
> > +	/* initialized with NULL */
> > +	ret = spi_nor_scan(nor, NULL, SPI_NOR_DUAL);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return mtd_device_parse_register(&nor->mtd, NULL, &ppdata, NULL, 0);
> > +}
> 
> ...
> 
> Brian
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
