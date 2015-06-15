From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH 2/2] drivercore: Fix unregistration path of platform
 devices
Date: Mon, 15 Jun 2015 18:46:30 +0200
Message-ID: <20150615164630.GC1583@katana>
References: <1433686811-12303-1-git-send-email-grant.likely@linaro.org>
 <1433686811-12303-3-git-send-email-grant.likely@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yLVHuoLXiP9kZBkt"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1433686811-12303-3-git-send-email-grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--yLVHuoLXiP9kZBkt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 07, 2015 at 03:20:11PM +0100, Grant Likely wrote:
> The unregister path of platform_device is broken. On registration, it
> will register all resources with either a parent already set, or
> type=3D=3DIORESOURCE_{IO,MEM}. However, on unregister it will release
> everything with type=3D=3DIORESOURCE_{IO,MEM}, but ignore the others. The=
re
> are also cases where resources don't get registered in the first place,
> like with devices created by of_platform_populate()*.
>=20
> Fix the unregister path to be symmetrical with the register path by
> checking the parent pointer instead of the type field to decide which
> resources to unregister. This is safe because the upshot of the
> registration path algorithm is that registered resources have a parent
> pointer, and non-registered resources do not.
>=20
> * It can be argued that of_platform_populate() should be registering
>   it's resources, and they argument has some merit. However, there are
>   quite a few platforms that end up broken if we try to do that due to
>   overlapping resources in the device tree. Until that is fixed, we need
>   to solve the immediate problem.
>=20
> Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> Cc: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Tested-by: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>


--yLVHuoLXiP9kZBkt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVfwFmAAoJEBQN5MwUoCm2y68QAKkOK5gfYQ5U37ZhRUDDxgoq
Moys+xgcbU4zuJcEzWJha7bSGPnEVSpCu6tbZQZaAlOn/Z/KCcTr28Y/k6eMWkkR
BOLVcAodtVRltQrTdO14/VpoEu5/Ualcwtv4L35cKC4wESC0vBDfU/qh/+CudtlK
MOJpshv0o6CNpt4BnXuM4uapJK7fmhdgPBf7gPWUX1hfCtu6g9HifBFWGnnajHf7
GaFEkUQdBtAiS8OdNnY65AOQSAnz16sNTsnxFHqIfJA4IvPnfUwqFnW6A5j82y1o
pBCXIzZ1m/PbeelnwAmE2Y6+HVpxzm85YG/wwqppTM1PDejmYVI2sf0m2YEVPDNm
Qa5h9CpsdPFrNmc/G6dbJZkgO7WAxKvvWVcnthOqzo7JEN/SUBiCy5/zO2DnIl8Q
jCPJSisIBrg5k/fCn5+Uvm/b2KxvoYdko2UPdu5r7pf4DHdME5ca64Ixg6HaWXjc
iGbAOaJ9vpEjHuuivqe52Mg9AC4ka2utkyIALUZDSdhaGvgGARDAzjgCYPbq+VLN
w2SBbvglqswpRmX7vAs+bI6AMjK+SdbEYp8a4Pk+p/brgWCc7EInWDLM2gAbK8KH
2KKWoFX95uBR9IOhsoq5dDYxkXnh4s5XXTRY70OOZNOjwLeb1apappPbBQsvXUA5
rGxWmViuTj/P0zaealvu
=fZ78
-----END PGP SIGNATURE-----

--yLVHuoLXiP9kZBkt--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
