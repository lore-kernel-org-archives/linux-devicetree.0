From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH 1/2] of/unittest: Show broken behaviour in the platform
 bus
Date: Mon, 15 Jun 2015 18:45:50 +0200
Message-ID: <20150615164550.GB1583@katana>
References: <1433686811-12303-1-git-send-email-grant.likely@linaro.org>
 <1433686811-12303-2-git-send-email-grant.likely@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1433686811-12303-2-git-send-email-grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 07, 2015 at 03:20:10PM +0100, Grant Likely wrote:
> Add a single resource to the test bus device to exercise the platform
> bus code a little more. This isn't strictly a devicetree test, but it is
> a corner case that the devicetree runs into. Until we've got platform
> device unittests, it can live here. It doesn't need to be an explicit
> text because the kernel will oops when it is wrong.
>=20
> Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> Cc: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Thanks for doing this!

Tested-by: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>


--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVfwE+AAoJEBQN5MwUoCm2fDgP/ReQjAcLdu0t1EEBn9srem+J
CcHwGISzfY7yhSbkN86aFkCxdpfWx8md6pFKlzEyXUPcoHShluXql+CapgNEbcK2
neLCfjKgEoag7TKJsmlF2+ghvIdZ8wzhog9qxBZP5BZDvqkfU/Qg+JVk0UY733Fk
aO0EbfUeslfoc01c1SXXOjh5pR3m9DOT5Cf3hfN/F4/0vRMnLoAu4R/cnJ6NDpKc
Rn4phZdcXBzHeM9Y1palwuan1z44PWl6xTSVxuNPM6xspX62y7ZMgHEceaYdKlLh
395rS0MOBAAS7dcxCjtulEb0QqhHdv+WQrc04+PgMTbV+taT6s2NSgNiQoG7HQng
hTlRiD1DVTPC2E0uVItbc0n9uhU83HpT4DweMvdgkIouKRlgI+gvTycln0rXA7X/
8yx1jBMMeFqRmD49/xgY47ypfsDRSeJ3ZVuF9c+GbQhSF5XISyRku7+N8IUzjXKA
ETL/MNbvCQ6kYoY92ZYbE6QhRYNQT+SzmW6gngAdoU1zjPQtJk4E6PTHQlXmZ/8f
n0x5tswclC6Zmp+hmtCFKckAS8Da23z7sfFoGn1F6NKfAKEwYV3T+LMHoM7kEWxk
y79JRRuL+9f2hN+0y49NyqmlgNcBovlnhphRE5UvZywXrAnBI4UgRTFYwIfSp7/Z
LU+Ye38d6Iz1Rjtbnill
=dPZY
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
