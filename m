From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 11/12] of: mtd: drop support for NAND_ECC_SOFT_BCH as
 "soft_bch" mapping
Date: Sat, 16 Apr 2016 10:01:25 +0200
Message-ID: <20160416100125.272f6347@bbrezillon>
References: <1460750052-16285-1-git-send-email-zajec5@gmail.com>
	<1460750052-16285-12-git-send-email-zajec5@gmail.com>
	<20160416100043.4b89e2a9@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160416100043.4b89e2a9@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, 16 Apr 2016 10:00:43 +0200
Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> On Fri, 15 Apr 2016 21:54:11 +0200
> Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>=20
> > There isn't any difference between handling NAND_ECC_SOFT and
> > NAND_ECC_SOFT_BCH now. What matters is the new field called "algo".
> > Please note we're keeping backward DT compatibility. We are still
> > treating "soft_bch" value as the one setting Hamming algorithm, it'=
s
> > just handled in of_get_nand_ecc_algo now.
> >=20
> > Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  drivers/of/of_mtd.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/of/of_mtd.c b/drivers/of/of_mtd.c
>=20
> This series is getting rid of of_mtd{.c,.h}, so I'll move those chang=
es
> directly into nand_base.c when applying.

Oops, here is the link:
http://lkml.iu.edu/hypermail/linux/kernel/1604.0/00298.html

>=20
> > index 15d056e..a70a38c 100644
> > --- a/drivers/of/of_mtd.c
> > +++ b/drivers/of/of_mtd.c
> > @@ -22,7 +22,6 @@ static const char *nand_ecc_modes[] =3D {
> >  	[NAND_ECC_HW]		=3D "hw",
> >  	[NAND_ECC_HW_SYNDROME]	=3D "hw_syndrome",
> >  	[NAND_ECC_HW_OOB_FIRST]	=3D "hw_oob_first",
> > -	[NAND_ECC_SOFT_BCH]	=3D "soft_bch",
> >  };
> > =20
> >  /**
> > @@ -45,6 +44,14 @@ int of_get_nand_ecc_mode(struct device_node *np)
> >  		if (!strcasecmp(pm, nand_ecc_modes[i]))
> >  			return i;
> > =20
> > +	/*
> > +	 * For backward compatibility we support few obsoleted values tha=
t don't
> > +	 * have their mappings into nand_ecc_modes_t anymore (they were m=
erged
> > +	 * with other enums).
> > +	 */
> > +	if (!strcasecmp(pm, "soft_bch"))
> > +		return NAND_ECC_SOFT;
> > +
> >  	return -ENODEV;
> >  }
> >  EXPORT_SYMBOL_GPL(of_get_nand_ecc_mode);
>=20
>=20
>=20



--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
