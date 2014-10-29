From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: socfpga: Add driver for the L3 interconnect
Date: Wed, 29 Oct 2014 22:12:28 +0100
Message-ID: <20141029211228.GS8316@pengutronix.de>
References: <1414582436-12772-1-git-send-email-s.trumtrar@pengutronix.de>
 <alpine.DEB.2.02.1410291521290.29374@atx-linux-37>
 <20141029205103.GF10262@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141029205103.GF10262-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Steffen,

On Wed, Oct 29, 2014 at 09:51:03PM +0100, Steffen Trumtrar wrote:
> > > +
> > > +int socfpga_l3nic_regmap_by_phandle(struct device_node *np,
> > > +				    struct regmap **regmap,
> > > +				    const char *name)
> > > +{
> >=20
> > This could return the regmap or ERR_PTR(-ENODEV) and just
> > have the np and name parameter, similar to=20
> > syscon_regmap_lookup_by_phandle.
> >
>=20
> I wanted to do that, but I also want to propagate the return
> value of socfpga_gpv_device_by_phandle and this doesn't
> seem to work than. Open for suggestions, though.
Doesn't the following work:

	struct regmap *socfpga_l3nic_regmap_by_phandle(struct device_node *np,
						       const char *name)
	{
		struct socfpga_l3nic *l3nic;
		struct platform_device *pdev;

		pdev =3D socfpga_gpv_device_by_phandle(np, name);
		if (!pdev)
			/* it's wrong to apply ERR_PTR to NULL */
			return ERR_PTR(-ENODEV);

		l3nic =3D dev_get_drvdata(&pdev->dev);
		if (!l3nic)
			return ERR_PTR(-EINVAL);

		/* do you need to check l3nic->regmap for being !=3D NULL? */
		return l3nic->regmap;
	}

?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
