From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: fdtdump: properly handle multi-string properties
Date: Sat, 5 Jan 2013 10:38:41 +1100
Message-ID: <20130104233841.GA4674@truffula.fritz.box>
References: <1357326766-12691-1-git-send-email-panto@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1357326766-12691-1-git-send-email-panto@antoniou-consulting.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: Jon Loeliger <jdl@jdl.com>, Matt Porter <mporter@ti.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Russ Dill <Russ.Dill@ti.com>
List-Id: devicetree@vger.kernel.org


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 04, 2013 at 09:12:46PM +0200, Pantelis Antoniou wrote:
> Device tree can store multiple strings in a single property.
> We didn't handle that case properly.
>=20
> Signed-off-by: Pantelis Antoniou <panto@antoniou-consulting.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlDnaAEACgkQaILKxv3ab8ac3ACdGbLdu6uBCrxtKhqWzfKCIFih
T4AAoIrAOP5ZSz5Vxl3xL349Mq5XY2nU
=uwxD
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--
