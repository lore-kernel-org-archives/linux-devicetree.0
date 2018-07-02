From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 0/8] gnss: add new GNSS subsystem
Date: Mon, 2 Jul 2018 21:01:23 +0200
Message-ID: <20180702190123.GA30798@amd>
References: <20180601082259.17563-1-johan@kernel.org>
 <20180628120103.GA28131@kroah.com>
 <20180629094607.GC31718@amd>
 <20180629182600.GA17562@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180629182600.GA17562@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, alan@linux.intel.com, Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, Marcel Holtmann <marcel@holtmann.org>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2018-06-29 14:26:00, Greg Kroah-Hartman wrote:
> On Fri, Jun 29, 2018 at 11:46:07AM +0200, Pavel Machek wrote:
> >=20
> > > > Finally, note that documentation (including kerneldoc) remains to be
> > > > written, but hopefully this will not hinder review given that the
> > > > current interfaces are fairly self-describing.
> > >=20
> > > This all looks great.  Thanks for doing this work and adding a new
> > > subsystem for something that has been asked for for many years.
> > >=20
> > > All now merged in my tree, nice job!
> >=20
> > I don't think discussion was finished on this one.
>=20
> It looked done to me as there was only a single set of patches, with no
> other working patches submitted from anyone else.

Is "noone submitted patches on top" sufficient reason to apply the patch?

> If this turns out to be a "bad" api, then we can deal with it then, but
> for now let's try this out.

Series uses /dev/gnss0 , without providing hardware abstraction,
blocking place for proper gnss layer. Suggested fix is to to make it
"/dev/gnssraw0". How do you propose to fix this after it is merged?

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAls6doMACgkQMOfwapXb+vJwaACeI+rqau9/0yFxcUNAqyXyIDPw
ZI8AoLvECl1hLw7rSIT2LPKjY3kT8o0s
=qXOS
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
