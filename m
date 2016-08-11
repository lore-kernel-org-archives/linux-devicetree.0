From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] regulator: Add LTC3676 support
Date: Thu, 11 Aug 2016 10:45:09 +0100
Message-ID: <20160811094509.GP9347@sirena.org.uk>
References: <1470785767-4426-1-git-send-email-tharvey@gateworks.com>
 <20160810114140.GJ9347@sirena.org.uk>
 <CAJ+vNU3s=qxJr8x=ScnyEV0UKkD_gTOnMyY8oGuzVs14hTW0Ng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aC33ObtQAkNdOZ6b"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAJ+vNU3s=qxJr8x=ScnyEV0UKkD_gTOnMyY8oGuzVs14hTW0Ng-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jaffer Kapasi <jkapasi-td5IlybW20HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--aC33ObtQAkNdOZ6b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 10, 2016 at 05:44:55PM -0700, Tim Harvey wrote:
> On Wed, Aug 10, 2016 at 4:41 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> >> +/* LDO1 always on fixed 0.8V-3.3V via scalar via R1/R2 feeback res */
> >> +static struct regulator_ops ltc3676_fixed_standby_regulator_ops = {
> >> +};

> > Remove this, it's pointless.

> as I'm using macro's to define the ops, removing this ends up breaking
> compilation:

> do you know of some macro foo to best handle this? Part of me wants to
> ditch the macro's and just simply declare the array of regulators
> directly as its much easier to read/follow.

Just don't use the macro for that regulator?

> >> +     if (!rdesc->r1 || !rdesc->r2)
> >> +             return;

> > This is a bug if we ever get here, we should be complaining loudly.

> This is now refactored due to using the core code for of parsing, but
> is it ok/standard to allow unused regulators to be not-defined in the
> dt and if so how do I handle that? Currently my test board uses 7 of
> the 8 regulators but the unused one is still registered with linux.

Substitute in versions of the ops that don't have any of the voltage
operations since without the dividers you can't support them, or make
the voltage operations return -EINVAL.

--aC33ObtQAkNdOZ6b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXrEkkAAoJECTWi3JdVIfQCB4H/R/5mBB2Ti+WQNWZYTXb93OU
hUvheHgalEn03t/Pyu6LsK88v3xWfokdb2/zoXRjAHrJDXRDIqoM/VQ/NLm7R/Cd
Bs3APY8+ChitCemt0071tQLq5tbipv8/ntCp+8s9kdkG+2m18qJ2nbD8OY3X+stD
lH3+dd0FwnVbdG6yF6vGhGl/l9QtB8+ay+0I56/4VgsHE5ZDmo/a5vqjyXjPsn8K
Eu5QMZ8P59UE3HBW9+EfHk3drPy51x4Afq+oJcmOil2lh57pxGlZ11zKj4yziapu
L9Anq2Bz6uD01/OD+Rzbzl5Ah4TEHlOndhchzkcpldyRHZujprrQPH+qCO3NyZI=
=3Twg
-----END PGP SIGNATURE-----

--aC33ObtQAkNdOZ6b--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
