From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/2] regulator: fixed: use devm_* for gpio request
Date: Mon, 2 Jul 2012 18:29:17 +0100
Message-ID: <20120702172916.GL25093@opensource.wolfsonmicro.com>
References: <1341223645-7817-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w2xx78T4DcG3O+DJ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1341223645-7817-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: lrg@ti.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, rob@landley.net, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--w2xx78T4DcG3O+DJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 02, 2012 at 03:37:24PM +0530, Laxman Dewangan wrote:
> Use devm_* version of gpio APIs gpio_request_one() for
> requesting gpios.
> This avoid extra code for freeing gpios.

This can't be applied yet since the export for the devm version hasn't
been applied so it won't build and also conflicts with the factoring out
of the GPIO code to the core.

--w2xx78T4DcG3O+DJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJP8dpmAAoJEBus8iNuMP3dbqEP/RcptpLmtXTqR1RpqKShBjXK
HvW8ikorXxY13oT1OLAnpICcGq4qS8dMUyiizAsCJrjm9Y0zO8TP+oGFcR/FDeB/
UkDRiI6wj1V/VFJ6ZwJu3wPX7I6huSeyCWhrNs6z4w1wFFevaqo2GBzcsznaIVJF
cN61kQStVPMAL+BC5cQp0pAJcGHV8jcuDyQo/Cakc8xbLgDnWZXYtblD+ZsRZAbc
TTJWz50Cmu9QrMBS9OKwsshHd9fKUHX25jS9KWWJph7Jhx3HqXYrgszIkUI/Byd/
eOADNU6y82oTv+EacH6dwJPjUgjPS0auh0E4fHOmdLfE/cfpNbeEkiqzdBgs0isH
PyK+KezswYwWO4UBa7mUICswGYvNlwK35w7rLMMeMtUth0xMivZSOq53GXbMRwRq
2+3D/cPTj+2oo9DQgP1KrHjbqsKPnWOmbGlcTV7JGM7FyVpqnqwwfRqnW6Z2ArGa
o0c/926JA+bUpLJRFck/fL+CKm+KOHHLHOO0SFDP4lbRtl0Sdckz9OT2rpJ0xu44
t0kougfNl/5bO6vCTzhzYchwMog9yxt6TlExPejql+IIPm2DFnVXYVzcEBdUF2Ii
M95mgJKwf1wzbfrEnlKIzP/SQbviEuAQJi8xAusAxT9YUwW1vkkhoUtePJQa0FpO
KJ4nOYaOqZ5xSa9YyAbK
=GAOe
-----END PGP SIGNATURE-----

--w2xx78T4DcG3O+DJ--
