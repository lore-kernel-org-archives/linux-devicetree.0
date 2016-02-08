From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH 2/6] Documentation: bindings: document the Alpine MSIX
 driver
Date: Mon, 8 Feb 2016 16:05:01 +0100
Message-ID: <20160208150501.GA19758@kwain>
References: <1454922971-17405-1-git-send-email-antoine.tenart@free-electrons.com>
 <1454922971-17405-3-git-send-email-antoine.tenart@free-electrons.com>
 <56B8AC7D.8060102@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56B8AC7D.8060102@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>, tglx@linutronix.de, jason@lakedaemon.net, tsahee@annapurnalabs.com, rshitrit@annapurnalabs.com, thomas.petazzoni@free-electrons.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 08, 2016 at 02:55:57PM +0000, Marc Zyngier wrote:
> On 08/02/16 09:16, Antoine Tenart wrote:
> > +
> > +Example:
> > +
> > +msix: msix {
> > +	compatible =3D "al,alpine-msix";
> > +	reg =3D <0x0 0xfbe00000 0x0 0x100000>;
> > +	interrupt-controller;
> > +	msi-controller;
> > +	al,msi-base-spi =3D <160>;
> > +	al,msi-num-spis =3D <160>;
> > +};
> >=20
>=20
> This example seems to rely on an implicit interrupt-parent. You probably
> want to update the example to clarify it.

Right. I'll add the interrupt-parent property in the required properties
and in the example msix node.

Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWuK6cAAoJEFxNi8it27zYyJEP/AkzqvKDMWi+hjLsrbN9Rwap
HwfM4nBucwvc9928yUX+DUBUqbcUxIxw2Ton+8envsIo3kqqE9QE2dlgq9ElSWwi
g8JzAo4DFJCU128+zQOpVrSIP8F3GGKRDj0WRQNQvvByQQHz5hFf9cIhsZ46MV1N
Vh6TpMd66thtupQFOuHv59knWccN+lxW6IvooDCPHNkhhKUB0QtDReOuFzghJeHC
nNV6tb35MoCYjLLKKL1yLN4U4UATyZz7EH1PcUxGcC9C1I1lyOfSrTgrJe76h2PZ
mUx7XKJxKr0qS3sfnE3cCOZOmNm/GpW4fNR2r/oFLUFAqJOh62T78E3LrJPIrRfx
cHqJKM8yKcywmFfnrtlMDL0lryKOOnjtiQzevVvqXAywVawkYTwG48K8FncQtZhO
hmcFC9IEGVFG7oXcK+3wesEcIIqariFcJi5GqhiNa1+yVFiyoecOHejtbVM/t1AZ
hXu7g05ear0jDhKfvVDGpePu+6zhlLea7/C0oZsS/t6oihANDlGV5mGQFDMOmdul
ZFwL9dbm8Dv0StoSEUQK4owjYBvoFoogtOi3vcls6/Qhgxhs2iCHmd7tm623Iiss
mlq8t9CEUWcYnnWJeKU4T2YPOetgTeKJUSCu+XFTx7WSk4RaonhTjZ78vzWzKsj0
blF08auT2EPmJ0zi6Duo
=nKnM
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
