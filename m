From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/4] regulator: core: Parse coupled regulators
 properties
Date: Thu, 21 Dec 2017 12:02:31 +0000
Message-ID: <20171221120231.GI1827@finisterre>
References: <1512639975-22241-1-git-send-email-m.purski@samsung.com>
 <CGME20171207094753eucas1p27b835787f92a1da8c46b9a2692376288@eucas1p2.samsung.com>
 <1512639975-22241-4-git-send-email-m.purski@samsung.com>
 <20171212113511.GF16323@sirena.org.uk>
 <4866dd1c-e9bb-24e4-9b4a-294d01edde78@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CD/aTaZybdUisKIc"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4866dd1c-e9bb-24e4-9b4a-294d01edde78-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--CD/aTaZybdUisKIc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 21, 2017 at 11:08:19AM +0100, Maciej Purski wrote:
> On 12/12/2017 12:35 PM, Mark Brown wrote:
> > On Thu, Dec 07, 2017 at 10:46:14AM +0100, Maciej Purski wrote:

> > > +	mutex_lock(&regulator_list_mutex);
> > > +	regulator_resolve_coupling(rdev);
> > > +	mutex_unlock(&regulator_list_mutex);

> > I'd really expect us to be failing to probe if we run into an error.
> > Otherwise we could end up doing bad things to the hardware at runtime
> > later on, or confusing ourselves and crashing with partially set up
> > datastructures.

> We cannot fail to probe if some of the regulators are not registered
> successfully, as depending on the probing sequence, there will be some
> regulators, which won't be available when registering others. We can fail
> when resolving coupling if we encounter other errors such as max_spread not
> provided or disability to set voltage. Maybe that is what you meant.

Yes, exactly - not having all the regulators yet isn't the only possible
error and this will just ignore all errors.

> > It's also not 100% clear to me how we handle the case
> > where only some of the coupled regulators have probed.

> I have two ideas how to handle it. We can prohibit setting the voltage and
> always fail on attempt to set voltage of a coupled regulator. Or we can just
> ignore it and set voltage of the regulator without checking the unregistered
> ones.

At least one of those needs to be implemented (not setting the voltage
seems safer).

--CD/aTaZybdUisKIc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlo7otYACgkQJNaLcl1U
h9DRsQf+Ilp5/CgXPq3rR8YI3H+szPWro/BLa9MF1WwHStA6ChAaMIA7kHNUyLgj
ml/P4HxM0lR7BWVi9H22+PXB1J8vRlzchsiAgWsgfXqOSDCkyfoRng/GJwhaXPMP
0WADMTLyHGUb7eeyDn0bLDrTiZeCkV67xs+Eil758j/x6PZhz30kMTmeTR1JxMyj
jPFgcyptPTg34pJh5lCU1rOKA5kSvyp7YN70gPWYxuA+KNHFj76vMJNIbTaB/Cqp
Ln/VfpyWAEtYIennG+wwIvTtqiDf81yCh7rfjasy7DNbs6U15NEAXvqEGQJWMnPz
HTfuye0oOoWtdHcQowTGLThLItyagQ==
=6qQu
-----END PGP SIGNATURE-----

--CD/aTaZybdUisKIc--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
