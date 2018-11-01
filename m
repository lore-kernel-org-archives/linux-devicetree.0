From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH v2 0/7] BL035-RGB-002 3.5" LCD sunxi DRM support
Date: Thu, 01 Nov 2018 21:33:26 +0100
Message-ID: <1e9757dd782ffb187efd26582881db019609493c.camel@paulk.fr>
References: <20181101200045.6078-1-contact@paulk.fr>
Reply-To: contact-W9ppeneeCTY@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-nescmB2mFvrj1/wsvbDg"
Return-path: <linux-sunxi+bncBC75HK6WUAEBB3GF5XPAKGQERQWRAHI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181101200045.6078-1-contact-W9ppeneeCTY@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--=-nescmB2mFvrj1/wsvbDg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 01 novembre 2018 =C3=A0 21:00 +0100, Paul Kocialkowski a =C3=A9cri=
t :
> The series adds support for the BL035-RGB-002 LCD panel and the required
> device-tree bindings for using it on the BananaPi M1.
>=20
> Only the changes related to the DRM driver and the panel are submitted
> for merge, which does not include the two final commits.
>=20
> Changes since v1:
> * Used the full name of the panel for dt bindings;
> * Removed helper to match flags in order to only retrieve the connector
>   once, as it was already done.
> * Made the bus flags checking possible without a panel;

I forgot to mention that the last patch (not for merge) was untested.

> Paul Kocialkowski (7):
>   drm/sun4i: tcon: Pass encoder instead of using panel for RGB setup
>   drm/sun4i: tcon: Support an active-low DE signal with RGB interface
>   dt-bindings: Add vendor prefix for LeMaker
>   dt-bindings: Add bindings for the LeMaker BL035-RGB-002 LCD panel
>   drm/panel: simple: Add support for the LeMaker BL035-RGB-002 3.5" LCD
>   ARM: dts: sun7i: Add pinmux configuration for LCD0 RGB888 pins
>   ARM: dts: sun7i-a20-bananapi: Add bindings for the LeMaker 3.5" LCD
>=20
>  .../display/panel/lemaker,bl035-rgb-002.txt   |  7 ++
>  .../devicetree/bindings/vendor-prefixes.txt   |  1 +
>  arch/arm/boot/dts/sun7i-a20-bananapi.dts      | 89 +++++++++++++++++++
>  arch/arm/boot/dts/sun7i-a20.dtsi              | 11 +++
>  drivers/gpu/drm/panel/panel-simple.c          | 27 ++++++
>  drivers/gpu/drm/sun4i/sun4i_tcon.c            | 29 +++---
>  drivers/gpu/drm/sun4i/sun4i_tcon.h            |  1 +
>  7 files changed, 151 insertions(+), 14 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/lemak=
er,bl035-rgb-002.txt
>=20
--=20
Developer of free digital technology and hardware support.

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--=-nescmB2mFvrj1/wsvbDg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAlvbYxYACgkQhP3B6o/u
lQztqA/9F3LAbSiY2mt2B0sZ9nERrkFSTvDYy604wlkGQioMm+eYgAs86MEeJtMf
ur4zV7X6CmNYcyTsYqwFboC7dTOt6XkeHVDuaX24J9vQjwcciucB9Ig//N38CZFD
Wi8P+WMXJPBr6u7TKd4BTnUN/j0010AEycfRbjfLH8fFlc/mDrsMqAQ36FiG/DqW
VYdGA9ppQZc1Ygijv9EO1JOiIB4j79urxpJrQxDeKMsqKR8FNARy0jySXqk+ykjJ
5iTPoMSciAj4Ad3w13RAm0kiOYfEh4wz71y3GTkAtT8sVtnh+B8Hs4h/YezC+1R9
FANZqYd4tUw3G6z1J8OpPdGlGPs2YqmGbptIvUplBgk2CNa4UkOKwAfDiXLtDju8
OAuOfuaPcSxj2q7N8vPSb3pC+Xncgz+a/couVBUZhwaJOxHBedqmd6QZlqymbUnn
qNIuk8gpzF/+v7m5NK58DmTbOLp9FeqXKf/slEtCKf/XA7DdJu9131+wiSn6/o8r
Swy/eZ/fAaWLBRSv2ox6SW+iVVTXSR1qs0UY18cvM/FN69u98SFvpXavm06foZmw
f9EWsC2rpcY4VXQqVTpjuMowT26Y8dI2bJjZdJtvT6Wm7jIKpgBl9sGZaUCueTnu
2Tupg2l383anF7XVLTbTm+CTJEazBQA3DzmSV2TSjsImUWajfww=
=jHHy
-----END PGP SIGNATURE-----

--=-nescmB2mFvrj1/wsvbDg--
