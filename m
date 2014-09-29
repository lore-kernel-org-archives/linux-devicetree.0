From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] regulator: add mxs regulator driver
Date: Mon, 29 Sep 2014 18:13:14 +0100
Message-ID: <20140929171314.GW16977@sirena.org.uk>
References: <1411779588-22031-1-git-send-email-stefan.wahren@i2se.com>
 <1411779588-22031-3-git-send-email-stefan.wahren@i2se.com>
 <20140928101650.GL27755@sirena.org.uk>
 <5428FE7B.8060700@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nqu5fpgjE+BQlEdo"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5428FE7B.8060700-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--nqu5fpgjE+BQlEdo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 29, 2014 at 08:38:51AM +0200, Stefan Wahren wrote:

> I'm searching for a good regulator implementation example.

> Does it apply to ti-abb-regulator.c and twl-regulator.c?

Possibly.  But bear in mind that it's important to understand the
hardware you're trying to support.

> > This really needs a comment to explain what on earth is going on here -
> > the whole thing with writing the same thing twice with two delays is
> > more than a little odd.  It looks like the driver is trying to busy wait
> > in cases where the change happens quickly but the comments about "fast"
> > and "normal" mode make this unclear.

> The regulator driver polls for the DC_OK bit in the power status register.

> Quote for reference manual (p. 935): "High when switching DC-DC
> converter control loop has stabilized after a voltage target change."

> The two loops comes from the different regulator modes
> (REGULATOR_MODE_FAST, REGULATOR_MODE_NORMAL).

> In REGULATOR_MODE_FAST the voltage steping is disabled and changing
> voltage should be fast. In REGULATOR_MODE_NORMAL voltage steping is
> enabled and it's take a while for reaching the target voltage.

I don't think you've fully understood what the different modes mean
here, that's not normally how a buck convertor works.  The different
modes would typically control the ability of the regulator to respond
quickly to changes in load without drifting off regulation, fast mode
makes the regulator less efficient but more responsive to load changes
(probably marginally with modern regulators).  It should have relatively
little to do with the ability to ramp the voltage and certainly not on
the scale there.

> Do you see more a problem with the two different loops or the redundant
> register write?

Both.  The code right now just looks really obscure.

> if (readl(sreg->base_addr) & sreg->mode_mask)
>     return REGULATOR_MODE_FAST;

> return REGULATOR_MODE_NORMAL;

> Better?

Yes.

> > Why is this not looked up from the data structure like the rest of the
> > data?

> I was a little bit confused why there wasn't a mode_mask in the struct
> regulator_desc. I will do it like the ti-abb-regulator in the matching
> table.

There's no helpers for setting modes.

> >> +	regulator_unregister(rdev);
> >> +	iounmap(power_addr);
> >> +	iounmap(base_addr);

> > Use devm_ versions of functions.

> As a result the remove function for the drivers becomes unnecessary. Am
> i right?

Yes.

--nqu5fpgjE+BQlEdo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUKZMpAAoJECTWi3JdVIfQ8gYH/1LE4xs4mGetcUR5/f9aJDNp
ofg2K/fNOyqi5d79gY+l5lM8otlBijWAeNtVrWQs33u+2HqPWpCsxkYnCKsSCqIl
mLSxC36/WK4jZw2DxOi6U7JAdZIbkib2b/KIXQp9IkbOnhjktuGK14GluFA/j+f4
SAJ/dbDrjihWD5/XtQ2gFv0czOeEFB2U+jqu0Uk+IrJ2duTp2KPqeJP0DlTGO4sq
094CQAdjcKliNbFy9fDr5Iq5znvxx3CbPaYSpgUg7MWzvM0gI18WixrMUVVByfum
oy2cjoMaKeIM3A0StH76a0QFTr73c0C/BAgOwycPgD+9mzEwDyJUmTHnniWdf8w=
=JYcR
-----END PGP SIGNATURE-----

--nqu5fpgjE+BQlEdo--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
