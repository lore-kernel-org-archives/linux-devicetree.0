From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/2] uio: add an of_genirq driver
Date: Sun, 14 Jun 2009 19:14:06 +0200
Message-ID: <20090614171406.GA1010@pengutronix.de>
References: <1244765062-14144-1-git-send-email-w.sang@pengutronix.de>
	<1244765062-14144-3-git-send-email-w.sang@pengutronix.de>
	<20090614122136.GD3639@local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1346883384=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090614122136.GD3639@local>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: "Hans J. Koch" <hjk-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============1346883384==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Hans,

> > +	uioinfo->irq =3D irq_of_parse_and_map(op->node, 0);
> > +	if (!uioinfo->irq)
> > +		uioinfo->irq =3D UIO_IRQ_NONE;
>=20
> Please don't do this. It's inconsistent if all other UIO drivers require
> people to use UIO_IRQ_NONE and you also allow zero. UIO_IRQ_NONE was
> introduced because 0 may be a legal interrupt number on some platforms.

Yes, well, the '0' vs. 'NO_IRQ' thing is still not fully sorted out AFAIK. =
But
you are possibly right here, as long as irq_of_parse_and_map does return
NO_IRQ, I should explicitly check for it, like this:

	if (uioinfo->irq =3D=3D NO_IRQ)
		uioinfo->irq =3D UIO_IRQ_NONE;

> > +/* Match table for of_platform binding */
> > +static const struct of_device_id __devinitconst uio_of_genirq_match[] =
=3D {
>=20
> checkpatch.pl complains about that. Please check.

Did that, it is a false positive. See here:

http://lkml.indiana.edu/hypermail/linux/kernel/0906.1/02780.html

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAko1L94ACgkQD27XaX1/VRsKRwCgkV+etCy/P9oVMZy21qFkhDpW
rlYAoLiY/tAj0womxa/gTg4pkEdXWp/t
=/oK2
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--

--===============1346883384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
https://ozlabs.org/mailman/listinfo/devicetree-discuss

--===============1346883384==--
