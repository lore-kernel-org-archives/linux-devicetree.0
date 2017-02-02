From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: gpu: Add Mali Utgard bindings
Date: Thu, 2 Feb 2017 11:52:06 +0100
Message-ID: <20170202105206.d27tqosreklivp2x@lukather>
References: <b098c4fa9fce88361cca20417978734d0e1b5cca.1485939041.git-series.maxime.ripard@free-electrons.com>
 <20170201174816.oozcuq7b2y5d6fss@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="aa25p7l45mmsmetm"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170201174816.oozcuq7b2y5d6fss@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--aa25p7l45mmsmetm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 01, 2017 at 11:48:16AM -0600, Rob Herring wrote:
> On Wed, Feb 01, 2017 at 09:53:22AM +0100, Maxime Ripard wrote:
> > The ARM Mali Utgard GPU family is embedded into a number of SoCs from
> > Allwinner, Amlogic, Mediatek or Rockchip.
> >=20
> > Add a binding for the GPU of that family.
> >=20
> > Reviewed-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >=20
> > ---
> > Changes from v2:
> >   - Drop 0 in the unit-address
> >   - Add missing st compatible
> >   - Add Amlogic compatibles
> >=20
> > Changes from v1:
> >   - Dropped the arm,mali-utgard compatible
> >   - Made the clocks mandatory
> >   - Added Linus Walleij Reviewed-by, and the ST compatible for the Mali
> > ---
> >  Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt | 82 +++++++=
+-
> >  1 file changed, 82 insertions(+), 0 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-utga=
rd.txt
>=20
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Applied both, with the acked-by. Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--aa25p7l45mmsmetm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYkw9SAAoJEBx+YmzsjxAgfcAP/0gSjJaKV4EhJrPac7pASn2b
j2291oZ93cUlrkrBjBwEj6uoOwtOhe4IYRU9ZjFifIH1oZd06g6RLL6hmfYRdyjD
4YDubf9p1CPFSPrtQ2bTxM+Av27/RwgMhmwPCjQUxhSkq2wU+1eU7M12hPYUzoZY
+v88U5l5II6e8R9GDLVvH270qJQlB8UcNQ/C4klCzc911NSObOzv68+4n6lwmUHm
Y/6xbYFs8ScgbGKmiGca1RtM/7xxpIax/lDT/if7HuOPCaLvsrnrC8Ggk4RORMW8
7dPf1l+E2NIgCPsaDWYMJch1pbHcG3kE3VMhz7aofgfbgyvuTi+6h+oczcYtiWnq
x7BTAddYjMjxifgQolrHkYKodQCb8vMov9D/05hsZNMVPqG+yawfntXqOw6yMKew
pqK/n26QIQLyXCDMkAPgXDuWVkGFDBCo0zlf8faxBpDiSylOHkN7huSVV2qcNu90
X06/axkgKhocQP565csAc+t/Wg8Q6wD9wA8tthitSY1O51BdZIspHldA5Xe15BQ5
TMJKgfsmYa1BfTLt8AgdNpb5ff9rJ3hZAzz0ncLea1UHQqzBjEfmcHOVP0fGlPe4
b6VHX1M8vksRrzPDkMSn2oPtAZfGhv716yvAmWFkqEPSiT4SC5SzrpelzL/PV3pK
PXRq+oTj6vWNkexThUQz
=Fb/m
-----END PGP SIGNATURE-----

--aa25p7l45mmsmetm--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
