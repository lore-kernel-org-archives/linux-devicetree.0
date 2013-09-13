From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] mtd: atmel_nand: remove unneeded ifdef CONFIG_OF
Date: Fri, 13 Sep 2013 11:21:44 -0700
Message-ID: <20130913182144.GF4550@ld-irv-0074.broadcom.com>
References: <1378200028-15415-1-git-send-email-josh.wu@atmel.com>
 <20130911230207.GE4550@ld-irv-0074.broadcom.com>
 <5232DAAD.4020700@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5232DAAD.4020700-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

+ devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Fri, Sep 13, 2013 at 05:28:13PM +0800, Josh Wu wrote:
> On 9/12/2013 7:02 AM, Brian Norris wrote:
> >On Tue, Sep 03, 2013 at 05:20:27PM +0800, Josh Wu wrote:
> >>Since following commit
> >>   f3b391425d21e6138e57b2432d91134e0bc2b975

=2E..

> >>   (of_mtd: Add no-op stubs to support CONFIG_OF=3Dn)
> >>
> >>implements the stub for CONFIG_OF=3Dn. Now we can safely remove all
> >>CONFIG_OF in atmel_nand. (Thanks to Ezequiel Garcia's for this prot=
ype)
> >I'm not quite so sure about this patch, as I was about the pxa3xx pa=
tch.
> >With pxa3xx, the compiler can easily tell that pxa3xx_nand_probe_dt(=
)
> >will return 0 without doing anything in the !CONFIG_OF case (and so =
will
> >likely remove the dead code), so it's no benefit to have the #ifdef.=
 But
> >in this driver, the atmel_of_init_port() function can't be trivially
> >determined to do nothing (and in fact, it does something in either
> >CONFIG_OF=3Dy or =3Dn case). It's only protected by the 'if
> >(pdev->dev.of_node)' check, which the compiler can't predict.
>=20
> I understand your concern here.
>=20
> >
> >So, I don't know if we should remove the #ifdef at the expense of li=
kely
> >significantly larger code. I won't protest, but I won't merge it yet
> >either. Perhaps others have better ideas, or perhaps you can find a =
good
> >way to work around this -- e.g., check the of_* helpers for -ENOSYS =
early
> >in atmel_of_init_port()?
>=20
> So what about to add one more check=EF=BC=9A "IS_ENABLE(CONFIG_OF)" i=
n
> atmel_nand_probe().
> And which is compiler predictable.
>=20
> if (IS_ENABLED(CONFIG_OF) && pdev->dev.of_node) {
> /* of_node can be parsed only when CONFIG_OF is enable */
> res =3D atmel_of_init_port(host, pdev->dev.of_node);
> if (res)
> goto err_nand_ioremap;
> } else {
> ... ...
> }

That looks good to me. And it has precedent, a nearly identical patch
here:

  commit e305062e94719ef543ae936dd56501b5a36406c6
  Author: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
  Date:   Tue Jun 18 12:29:49 2013 +0200

      gpio-rcar: Remove #ifdef CONFIG_OF around OF-specific sections

      All functions and data types used by OF-specific code paths are d=
eclared
      in <linux/of.h> regardless of CONFIG_OF. Replace the #ifdef CONFI=
G_OF
      guard with a if(IS_ENABLED(CONFIG_OF)) and let the compiler optim=
ize
      the unused code away.

      Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideason=
board.com>
      Signed-off-by: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>

Brian

(leaving context intact)

>=20
> >
> >>Signed-off-by: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> >>---
> >>  drivers/mtd/nand/atmel_nand.c |   14 +-------------
> >>  1 file changed, 1 insertion(+), 13 deletions(-)
> >>
> >>diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel=
_nand.c
> >>index 060feea..1ca0724 100644
> >>--- a/drivers/mtd/nand/atmel_nand.c
> >>+++ b/drivers/mtd/nand/atmel_nand.c
> >>@@ -1449,7 +1449,6 @@ static void atmel_nand_hwctl(struct mtd_info =
*mtd, int mode)
> >>  		ecc_writel(host->ecc, CR, ATMEL_ECC_RST);
> >>  }
> >>-#if defined(CONFIG_OF)
> >>  static int atmel_of_init_port(struct atmel_nand_host *host,
> >>  			      struct device_node *np)
> >>  {
> >>@@ -1457,7 +1456,7 @@ static int atmel_of_init_port(struct atmel_na=
nd_host *host,
> >>  	u32 offset[2];
> >>  	int ecc_mode;
> >>  	struct atmel_nand_data *board =3D &host->board;
> >>-	enum of_gpio_flags flags;
> >>+	enum of_gpio_flags flags =3D 0;
> >>  	if (of_property_read_u32(np, "atmel,nand-addr-offset", &val) =3D=
=3D 0) {
> >>  		if (val >=3D 32) {
> >>@@ -1540,13 +1539,6 @@ static int atmel_of_init_port(struct atmel_n=
and_host *host,
> >>  	return 0;
> >>  }
> >>-#else
> >>-static int atmel_of_init_port(struct atmel_nand_host *host,
> >>-			      struct device_node *np)
> >>-{
> >>-	return -EINVAL;
> >>-}
> >>-#endif
> >>  static int __init atmel_hw_nand_init_params(struct platform_devic=
e *pdev,
> >>  					 struct atmel_nand_host *host)
> >>@@ -2207,14 +2199,12 @@ static int __exit atmel_nand_remove(struct =
platform_device *pdev)
> >>  	return 0;
> >>  }
> >>-#if defined(CONFIG_OF)
> >>  static const struct of_device_id atmel_nand_dt_ids[] =3D {
> >>  	{ .compatible =3D "atmel,at91rm9200-nand" },
> >>  	{ /* sentinel */ }
> >>  };
> >>  MODULE_DEVICE_TABLE(of, atmel_nand_dt_ids);
> >>-#endif
> >>  static int atmel_nand_nfc_probe(struct platform_device *pdev)
> >>  {
> >>@@ -2253,12 +2243,10 @@ static int atmel_nand_nfc_probe(struct plat=
form_device *pdev)
> >>  	return 0;
> >>  }
> >>-#if defined(CONFIG_OF)
> >>  static struct of_device_id atmel_nand_nfc_match[] =3D {
> >>  	{ .compatible =3D "atmel,sama5d3-nfc" },
> >>  	{ /* sentinel */ }
> >>  };
> >>-#endif
> >>  static struct platform_driver atmel_nand_nfc_driver =3D {
> >>  	.driver =3D {
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
