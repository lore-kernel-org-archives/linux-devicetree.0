From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 0/8] gnss: add new GNSS subsystem
Date: Fri, 29 Jun 2018 11:46:07 +0200
Message-ID: <20180629094607.GC31718@amd>
References: <20180601082259.17563-1-johan@kernel.org>
 <20180628120103.GA28131@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="xo44VMWPx7vlQ2+2"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180628120103.GA28131@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, alan@linux.intel.com
Cc: Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, Marcel Holtmann <marcel@holtmann.org>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--xo44VMWPx7vlQ2+2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Finally, note that documentation (including kerneldoc) remains to be
> > written, but hopefully this will not hinder review given that the
> > current interfaces are fairly self-describing.
>=20
> This all looks great.  Thanks for doing this work and adding a new
> subsystem for something that has been asked for for many years.
>=20
> All now merged in my tree, nice job!

I don't think discussion was finished on this one.

In particular, we agreed that /dev/gnssrawX would be better device
name, so that we still have place where to put proper abstraction
layer in future.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--xo44VMWPx7vlQ2+2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAls1/98ACgkQMOfwapXb+vLUQACgqpWMsI37vi4u0C6kmqx7hkVo
XRIAnjq3CzVtwfkll7xX/8TtjV9FUild
=Q4uJ
-----END PGP SIGNATURE-----

--xo44VMWPx7vlQ2+2--
