From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/2] mtd: hisilicon: add a new NAND controller driver
 for hisilicon hip04 Soc
Date: Mon, 1 Dec 2014 10:14:49 -0800
Message-ID: <20141201181449.GG21347@ld-irv-0074>
References: <1415105221-7732-1-git-send-email-wangzhou.bry@gmail.com>
 <1415105221-7732-2-git-send-email-wangzhou.bry@gmail.com>
 <20141130093529.GH3608@norris-Latitude-E6410>
 <547C685A.3090804@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <547C685A.3090804-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, caizhiyong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 01, 2014 at 09:08:42PM +0800, Zhou Wang wrote:
> On 2014=E5=B9=B411=E6=9C=8830=E6=97=A5 17:35, Brian Norris wrote:
> >On Tue, Nov 04, 2014 at 08:47:00PM +0800, Zhou Wang wrote:
> >>Signed-off-by: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
[...]
> >>+static void hisi_nfc_dma_transfer(struct hinfc_host *host, int tod=
ev)
> >>+{
> >>+	struct mtd_info	*mtd =3D &host->mtd;
> >>+	struct nand_chip *chip =3D mtd->priv;
> >>+	unsigned long val;
> >>+	int ret;
> >>+
> >>+	hinfc_write(host, host->dma_buffer, HINFC504_DMA_ADDR_DATA);
> >>+	hinfc_write(host, host->dma_oob, HINFC504_DMA_ADDR_OOB);
> >>+
> >>+	if (chip->ecc.mode =3D=3D NAND_ECC_NONE) {
> >>+		hinfc_write(host, ((mtd->oobsize & HINFC504_DMA_LEN_OOB_MASK)
> >>+			<< HINFC504_DMA_LEN_OOB_SHIFT), HINFC504_DMA_LEN);
> >>+
> >>+		hinfc_write(host, HINFC504_DMA_PARA_DATA_RW_EN
> >>+			| HINFC504_DMA_PARA_OOB_RW_EN, HINFC504_DMA_PARA);
> >>+	} else {
> >>+		hinfc_write(host, HINFC504_DMA_PARA_DATA_RW_EN
> >>+		| HINFC504_DMA_PARA_OOB_RW_EN | HINFC504_DMA_PARA_DATA_EDC_EN
> >>+		| HINFC504_DMA_PARA_OOB_EDC_EN | HINFC504_DMA_PARA_DATA_ECC_EN
> >>+		| HINFC504_DMA_PARA_OOB_ECC_EN, HINFC504_DMA_PARA);
> >>+	}
> >>+
> >>+	val =3D (HINFC504_DMA_CTRL_DMA_START | HINFC504_DMA_CTRL_BURST4_E=
N
> >>+		| HINFC504_DMA_CTRL_BURST8_EN | HINFC504_DMA_CTRL_BURST16_EN
> >>+		| HINFC504_DMA_CTRL_DATA_AREA_EN | HINFC504_DMA_CTRL_OOB_AREA_EN
> >>+		| ((host->addr_cycle =3D=3D 4 ? 1 : 0)
> >>+			<< HINFC504_DMA_CTRL_ADDR_NUM_SHIFT)
> >>+		| ((host->chipselect & HINFC504_DMA_CTRL_CS_MASK)
> >>+			<< HINFC504_DMA_CTRL_CS_SHIFT));
> >>+
> >>+	if (todev)
> >>+		val |=3D HINFC504_DMA_CTRL_WE;
> >>+
> >>+	hinfc_write(host, val, HINFC504_DMA_CTRL);
> >>+
> >>+	init_completion(&host->cmd_complete);
> >
> >You need to run init_completion() *before* you kick off your I/O.
> >Otherwise, your interrupt handler is racing with this function.
> >
>=20
> Do you mean that it needs put init_completion() before hinfc_write()?
> If not so, interrupt handler maybe execute before init_completion()
> which will cause something wrong.

Yes.

	init_completion(&host->cmd_complete);

should come sometime before

	hinfc_write(host, val, HINFC504_DMA_CTRL);

> >>+	ret =3D wait_for_completion_timeout(&host->cmd_complete,
> >>+			HINFC504_NFC_DMA_TIMEOUT);

[...]

> >>+static void set_addr(struct mtd_info *mtd, int column, int page_ad=
dr)
> >>+{
> >>+	struct nand_chip *chip =3D mtd->priv;
> >>+	struct hinfc_host *host =3D chip->priv;
> >>+
> >>+	host->addr_cycle    =3D 0;
> >>+	host->addr_value[0] =3D 0;
> >>+	host->addr_value[1] =3D 0;
> >>+
> >>+	/* Serially input address */
> >>+	if (column !=3D -1) {
> >>+		/* Adjust columns for 16 bit buswidth */
> >>+		if (chip->options & NAND_BUSWIDTH_16)
> >>+			column >>=3D 1;
> >
> >It doesn't look like you're supporting ONFI parameter pages yet, but=
 you
> >might consider checking for !nand_opcode_8bits(opcode) before adjust=
ing the
> >address. We had to fix some other drivers for this recently.
> >
>=20
> sorry, could you give me more clue about this?  Do you mean that we
> should first make sure it is not 8 bits bus width?

Look for use of nand_opcode_8bits() in nand_base.c.

I'm suggesting that you don't necessarily want to "adjust the column"
for all commands; there are some opcodes that take their address only o=
n
the lower x8 bits, even if the flash has an x16 buswidth.

> >>+
> >>+		host->addr_value[0] =3D column & 0xffff;
> >>+		host->addr_cycle    =3D 2;
> >>+	}

[...]

> >>+	switch (mtd->writesize) {
> >>+	case 2048:
> >>+		flag |=3D (0x001 << HINFC504_CON_PAGEISZE_SHIFT);
> >>+	/* add more pagesize support
> >>+	 * default pagesize has been set in hisi_nfc_host_init
> >>+	 */
> >
> >Does this mean you can't handle any other page size? You might want =
to
> >put the words 'TODO' or 'FIXME' in the comment, and you might want t=
o
> >print an error and exit if you see some other value for mtd->writesi=
ze.
> >
>=20
> Yes, this NAND controller can handle not only 2048 page size. But
> the NAND controller on hip04-d01 board which I used to test this
> driver connects with a NAND flash chip which is just 2048 page size.
> So here I
> just listed 'case 2048', Maybe I need indicate this by 'TODO:...'?

Not just a TODO; make sure to also error out, so that users don't get
unexplained failures if they find themselves with a non-2KB page size
NAND.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
