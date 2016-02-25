From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] mtd: atmel_nand: move the hsmc_clk from nfc node to
 nand node
Date: Thu, 25 Feb 2016 10:31:39 -0800
Message-ID: <20160225183139.GL21465@google.com>
References: <1456207220-7757-1-git-send-email-wenyou.yang@atmel.com>
 <56CC393B.6090801@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56CC393B.6090801-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

+ devicetree, Boris

Convenient you left devicetree off, since I expect you'd get a hearty N=
AK
from them...

On Tue, Feb 23, 2016 at 11:49:31AM +0100, Nicolas Ferre wrote:
> Le 23/02/2016 07:00, Wenyou Yang a =E9crit :
> > From: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> >=20
> > For SAMA5D3, SAMA5D4 SoC family, PMECC becomes a part of HSMC, they
> > need the HSMC clock enabled to work.
> > The NFC is a sub feature for current nand driver, it can be disable=
d.
> > But if HSMC clock is controlled by NFC, so disable NFC will also di=
sable
> > the HSMC clock. then, it will make the PMECC fail to work.
> >=20
> > So the solution is move the HSMC clock out of NFC to nand node. Whe=
n
> > nand driver probed, it will check whether the chip has HSMC, if yes=
 then
> > it will require a HSMC clock.
> >=20
> > Add a new "atmel,sama5d3-nand" compatiable string for SAMA5D3's nan=
d.
> >=20
> > Signed-off-by: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> > Signed-off-by: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> > ---
> >=20
> > Changes in v3:
> >  - add "atmel,sama5d3-nand" compatiable string for SAMA5D3's nand.
> >  - revert the mail address of Josh's Signed-off to the original.
>=20
> It seems okay now:
> Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>=20
> Brian, can we take this patch (if you acknowledged it) with us (throu=
gh
> the arm-soc tree) to keep the synchronization with the DT part of thi=
s work?
> I will also consider squashing the DT part in this one as well as the=
y
> cannot be separated.

Doesn't that mean you have an illegal breakage of the device tree?

Also, if you're going to refactor the binding (and possibly even break
it like this), why don't you address the comments Boris made back on th=
e
first version about a year ago?

http://patchwork.ozlabs.org/patch/438211/

Particularly, I agree that you seem to have the sub-node relationship
all backward. Why is the controller a sub-node of the flash node? And
you have no provision for multiple NAND chips?

Brian

> Bye,
>=20
> > Changes in v2:
> >  - add missing .has_hsmc_clk assignment for sama5d2_caps.
> >=20
> >  .../devicetree/bindings/mtd/atmel-nand.txt         |    4 +-
> >  drivers/mtd/nand/atmel_nand.c                      |   51 ++++++++=
+++---------
> >  2 files changed, 30 insertions(+), 25 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b=
/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> > index d53aba9..29bee7c 100644
> > --- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> > +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> > @@ -15,6 +15,7 @@ Required properties:
> >  - atmel,nand-cmd-offset : offset for the command latch.
> >  - #address-cells, #size-cells : Must be present if the device has =
sub-nodes
> >    representing partitions.
> > +- clocks: phandle to the peripheral clock
> > =20
> >  - gpios : specifies the gpio pins to control the NAND device. dete=
ct is an
> >    optional gpio and may be set to 0 if not present.
> > @@ -43,7 +44,6 @@ Required properties:
> >  - reg : should specify the address and size used for NFC command r=
egisters,
> >          NFC registers and NFC SRAM. NFC SRAM address and size can =
be absent
> >          if don't want to use it.
> > -- clocks: phandle to the peripheral clock
> >  Optional properties:
> >  - atmel,write-by-sram: boolean to enable NFC write by SRAM.
> > =20
> > @@ -100,13 +100,13 @@ nand0: nand@40000000 {
> >  	compatible =3D "atmel,at91rm9200-nand";
> >  	#address-cells =3D <1>;
> >  	#size-cells =3D <1>;
> > +	clocks =3D <&hsmc_clk>
> >  	ranges;
> >          ...
> >          nfc@70000000 {
> >  		compatible =3D "atmel,sama5d3-nfc";
> >  		#address-cells =3D <1>;
> >  		#size-cells =3D <1>;
> > -		clocks =3D <&hsmc_clk>
> >  		reg =3D <
> >  			0x70000000 0x10000000	/* NFC Command Registers */
> >  			0xffffc000 0x00000070	/* NFC HSMC regs */
> > diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel=
_nand.c
> > index 20cbaab..482251c 100644
> > --- a/drivers/mtd/nand/atmel_nand.c
> > +++ b/drivers/mtd/nand/atmel_nand.c
> > @@ -66,6 +66,7 @@ module_param(on_flash_bbt, int, 0);
> >  struct atmel_nand_caps {
> >  	bool pmecc_correct_erase_page;
> >  	uint8_t pmecc_max_correction;
> > +	bool has_hsmc_clk;
> >  };
> > =20
> >  struct atmel_nand_nfc_caps {
> > @@ -106,8 +107,6 @@ struct atmel_nfc {
> >  	bool			use_nfc_sram;
> >  	bool			write_by_sram;
> > =20
> > -	struct clk		*clk;
> > -
> >  	bool			is_initialized;
> >  	struct completion	comp_ready;
> >  	struct completion	comp_cmd_done;
> > @@ -132,6 +131,7 @@ struct atmel_nand_host {
> >  	struct dma_chan		*dma_chan;
> > =20
> >  	struct atmel_nfc	*nfc;
> > +	struct clk		*clk;
> > =20
> >  	const struct atmel_nand_caps	*caps;
> >  	bool			has_pmecc;
> > @@ -2157,6 +2157,19 @@ static int atmel_nand_probe(struct platform_=
device *pdev)
> >  	nand_chip->IO_ADDR_R =3D host->io_base;
> >  	nand_chip->IO_ADDR_W =3D host->io_base;
> > =20
> > +	if (host->caps->has_hsmc_clk) {
> > +		host->clk =3D devm_clk_get(&pdev->dev, NULL);
> > +		if (IS_ERR(host->clk)) {
> > +			dev_err(&pdev->dev, "HSMC clock is missing, update your Device =
Tree");
> > +			res =3D PTR_ERR(host->clk);
> > +			goto err_nand_ioremap;
> > +		}
> > +
> > +		res =3D clk_prepare_enable(host->clk);
> > +		if (res)
> > +			goto err_nand_ioremap;
> > +	}
> > +
> >  	if (nand_nfc.is_initialized) {
> >  		/* NFC driver is probed and initialized */
> >  		host->nfc =3D &nand_nfc;
> > @@ -2321,6 +2334,9 @@ static int atmel_nand_remove(struct platform_=
device *pdev)
> >  	if (host->dma_chan)
> >  		dma_release_channel(host->dma_chan);
> > =20
> > +	if (!IS_ERR(host->clk))
> > +		clk_disable_unprepare(host->clk);
> > +
> >  	platform_driver_unregister(&atmel_nand_nfc_driver);
> > =20
> >  	return 0;
> > @@ -2334,11 +2350,19 @@ static int atmel_nand_remove(struct platfor=
m_device *pdev)
> >  static const struct atmel_nand_caps at91rm9200_caps =3D {
> >  	.pmecc_correct_erase_page =3D false,
> >  	.pmecc_max_correction =3D 24,
> > +	.has_hsmc_clk =3D false,
> > +};
> > +
> > +static struct atmel_nand_caps sama5d3_caps =3D {
> > +	.pmecc_correct_erase_page =3D false,
> > +	.pmecc_max_correction =3D 24,
> > +	.has_hsmc_clk =3D true,
> >  };
> > =20
> >  static const struct atmel_nand_caps sama5d4_caps =3D {
> >  	.pmecc_correct_erase_page =3D true,
> >  	.pmecc_max_correction =3D 24,
> > +	.has_hsmc_clk =3D true,
> >  };
> > =20
> >  /*
> > @@ -2348,11 +2372,13 @@ static const struct atmel_nand_caps sama5d4=
_caps =3D {
> >  static const struct atmel_nand_caps sama5d2_caps =3D {
> >  	.pmecc_correct_erase_page =3D true,
> >  	.pmecc_max_correction =3D 32,
> > +	.has_hsmc_clk =3D true,
> >  };
> > =20
> >  static const struct of_device_id atmel_nand_dt_ids[] =3D {
> >  	{ .compatible =3D "atmel,at91rm9200-nand", .data =3D &at91rm9200_=
caps },
> >  	{ .compatible =3D "atmel,sama5d4-nand", .data =3D &sama5d4_caps }=
,
> > +	{ .compatible =3D "atmel,sama5d3-nand", .data =3D &sama5d3_caps }=
,
> >  	{ .compatible =3D "atmel,sama5d2-nand", .data =3D &sama5d2_caps }=
,
> >  	{ /* sentinel */ }
> >  };
> > @@ -2363,7 +2389,6 @@ static int atmel_nand_nfc_probe(struct platfo=
rm_device *pdev)
> >  {
> >  	struct atmel_nfc *nfc =3D &nand_nfc;
> >  	struct resource *nfc_cmd_regs, *nfc_hsmc_regs, *nfc_sram;
> > -	int ret;
> > =20
> >  	nfc_cmd_regs =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >  	nfc->base_cmd_regs =3D devm_ioremap_resource(&pdev->dev, nfc_cmd_=
regs);
> > @@ -2401,31 +2426,12 @@ static int atmel_nand_nfc_probe(struct plat=
form_device *pdev)
> >  	nfc_writel(nfc->hsmc_regs, IDR, 0xffffffff);
> >  	nfc_readl(nfc->hsmc_regs, SR);	/* clear the NFC_SR */
> > =20
> > -	nfc->clk =3D devm_clk_get(&pdev->dev, NULL);
> > -	if (!IS_ERR(nfc->clk)) {
> > -		ret =3D clk_prepare_enable(nfc->clk);
> > -		if (ret)
> > -			return ret;
> > -	} else {
> > -		dev_warn(&pdev->dev, "NFC clock missing, update your Device Tree=
");
> > -	}
> > -
> >  	nfc->is_initialized =3D true;
> >  	dev_info(&pdev->dev, "NFC is probed.\n");
> > =20
> >  	return 0;
> >  }
> > =20
> > -static int atmel_nand_nfc_remove(struct platform_device *pdev)
> > -{
> > -	struct atmel_nfc *nfc =3D &nand_nfc;
> > -
> > -	if (!IS_ERR(nfc->clk))
> > -		clk_disable_unprepare(nfc->clk);
> > -
> > -	return 0;
> > -}
> > -
> >  static const struct atmel_nand_nfc_caps sama5d3_nfc_caps =3D {
> >  	.rb_mask =3D NFC_SR_RB_EDGE0,
> >  };
> > @@ -2447,7 +2453,6 @@ static struct platform_driver atmel_nand_nfc_=
driver =3D {
> >  		.of_match_table =3D of_match_ptr(atmel_nand_nfc_match),
> >  	},
> >  	.probe =3D atmel_nand_nfc_probe,
> > -	.remove =3D atmel_nand_nfc_remove,
> >  };
> > =20
> >  static struct platform_driver atmel_nand_driver =3D {
> >=20
>=20
>=20
> --=20
> Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
