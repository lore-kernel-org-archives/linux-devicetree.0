From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: rockchip: Move cros-ec-sbs to
 rk3288-veyron-chromebook-sbs
Date: Sun, 30 Apr 2017 22:56:52 +0200
Message-ID: <1493585812.6493.4.camel@paulk.fr>
References: <20170430183054.24563-1-contact@paulk.fr>
         <2369975.a4dWayqU5d@phil>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-MC6i8wxNKqaTait/1NSV"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2369975.a4dWayqU5d@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-MC6i8wxNKqaTait/1NSV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dimanche 30 avril 2017 =C3=A0 22:37 +0200, Heiko Stuebner a =C3=A9crit=
=C2=A0:
> Hi Paul,
>=20
> Am Sonntag, 30. April 2017, 20:30:52 CEST schrieb Paul Kocialkowski:
> > This moves the cros-ec-sbs dtsi to a new rk3288-veyron-chromebook-sbs
> > dtsi since it only concerns rk3288 veyron Chromebooks.
> >=20
> > Other Chromebooks (such as the tegra124 nyans) also have sbs batteries
> > and don't use this dtsi, that only makes sense when used with
> > rk3288-veyron-chromebook anyway.
>=20
> That isn't true. The gru series (rk3399-based) also uses the
> sbs-battery [0]. And while it is currently limited to Rockchip-based
> Chromebooks it is nevertheless used on more than one platform, so
> the probability is high that it will be used in future series as well.

That's good to know, but as pointed out, other cros devices are using a sbs
battery without this header, so such a generic name isn't really a good fit=
.

Note that &charger has to be defined (after my subsequent patches), which i=
t is
for devices that also include rk3288-veyron-chromebook, but not necessarily
others.

Overall, I think having one -sbs dtsi file makes sense here because there i=
s
already a rk3288-veyron-chromebook dtsi that veyron chromebooks use. That f=
ile
cannot contain the battery bindings because minnie has a different one and =
it
would be a bit silly to copy it over all devices. That definitely makes sen=
se.

As for other devices, I don't see why we should have a separate include fil=
e for
the battery instead of having it in the device's dts.=C2=A0I think this sho=
uld be the
case on gru/kevin.

Also maybe not *all* gru-based devices will turn out to use a SBS battery, =
so it
seems early to include this header in the gru dtsi. One last point, gru/kev=
in
currently don't define a charger, which will break my subsequent patch (tha=
t is
however needed for the veyrons that use this file).

To me, it seems that there's little advantage and major drawbacks in keepin=
g
this file the way it is.

> Also, it might be nice to also include some Chromeos people (there should
> be some in the git logs, like Brian who submitted the Gru patches), as th=
ey
> might be able to provide more detailed input.

That's a good point, thanks for including them.

>=20
> Heiko
>=20
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/t=
ree/a
> rch/arm64/boot/dts/rockchip/rk3399-gru.dtsi#n886
>=20
> >=20
> > Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> > ---
> > =C2=A0.../boot/dts/{cros-ec-sbs.dtsi =3D> rk3288-veyron-chromebook-sbs.=
dtsi}=C2=A0=C2=A0=C2=A0=C2=A0| 0
> > =C2=A0arch/arm/boot/dts/rk3288-veyron-jaq.dts=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0| 2
> > +-
> > =C2=A0arch/arm/boot/dts/rk3288-veyron-jerry.dts=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0| 2
> > +-
> > =C2=A0arch/arm/boot/dts/rk3288-veyron-pinky.dts=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0| 2
> > +-
> > =C2=A0arch/arm/boot/dts/rk3288-veyron-speedy.dts=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| 2
> > +-
> > =C2=A05 files changed, 4 insertions(+), 4 deletions(-)
> > =C2=A0rename arch/arm/boot/dts/{cros-ec-sbs.dtsi =3D> rk3288-veyron-chr=
omebook-
> > sbs.dtsi} (100%)
> >=20
> > diff --git a/arch/arm/boot/dts/cros-ec-sbs.dtsi b/arch/arm/boot/dts/rk3=
288-
> > veyron-chromebook-sbs.dtsi
> > similarity index 100%
> > rename from arch/arm/boot/dts/cros-ec-sbs.dtsi
> > rename to arch/arm/boot/dts/rk3288-veyron-chromebook-sbs.dtsi
> > diff --git a/arch/arm/boot/dts/rk3288-veyron-jaq.dts
> > b/arch/arm/boot/dts/rk3288-veyron-jaq.dts
> > index d33f5763c39c..f217a978e47a 100644
> > --- a/arch/arm/boot/dts/rk3288-veyron-jaq.dts
> > +++ b/arch/arm/boot/dts/rk3288-veyron-jaq.dts
> > @@ -45,7 +45,7 @@
> > =C2=A0/dts-v1/;
> > =C2=A0
> > =C2=A0#include "rk3288-veyron-chromebook.dtsi"
> > -#include "cros-ec-sbs.dtsi"
> > +#include "rk3288-veyron-chromebook-sbs.dtsi"
> > =C2=A0
> > =C2=A0/ {
> > =C2=A0	model =3D "Google Jaq";
> > diff --git a/arch/arm/boot/dts/rk3288-veyron-jerry.dts
> > b/arch/arm/boot/dts/rk3288-veyron-jerry.dts
> > index cdea751f2a8c..bec607574165 100644
> > --- a/arch/arm/boot/dts/rk3288-veyron-jerry.dts
> > +++ b/arch/arm/boot/dts/rk3288-veyron-jerry.dts
> > @@ -44,7 +44,7 @@
> > =C2=A0
> > =C2=A0/dts-v1/;
> > =C2=A0#include "rk3288-veyron-chromebook.dtsi"
> > -#include "cros-ec-sbs.dtsi"
> > +#include "rk3288-veyron-chromebook-sbs.dtsi"
> > =C2=A0
> > =C2=A0/ {
> > =C2=A0	model =3D "Google Jerry";
> > diff --git a/arch/arm/boot/dts/rk3288-veyron-pinky.dts
> > b/arch/arm/boot/dts/rk3288-veyron-pinky.dts
> > index 995cff42fa43..c81ad5bf1121 100644
> > --- a/arch/arm/boot/dts/rk3288-veyron-pinky.dts
> > +++ b/arch/arm/boot/dts/rk3288-veyron-pinky.dts
> > @@ -44,7 +44,7 @@
> > =C2=A0
> > =C2=A0/dts-v1/;
> > =C2=A0#include "rk3288-veyron-chromebook.dtsi"
> > -#include "cros-ec-sbs.dtsi"
> > +#include "rk3288-veyron-chromebook-sbs.dtsi"
> > =C2=A0
> > =C2=A0/ {
> > =C2=A0	model =3D "Google Pinky";
> > diff --git a/arch/arm/boot/dts/rk3288-veyron-speedy.dts
> > b/arch/arm/boot/dts/rk3288-veyron-speedy.dts
> > index cc0b78cefe34..8aea9c3ff6e2 100644
> > --- a/arch/arm/boot/dts/rk3288-veyron-speedy.dts
> > +++ b/arch/arm/boot/dts/rk3288-veyron-speedy.dts
> > @@ -44,7 +44,7 @@
> > =C2=A0
> > =C2=A0/dts-v1/;
> > =C2=A0#include "rk3288-veyron-chromebook.dtsi"
> > -#include "cros-ec-sbs.dtsi"
> > +#include "rk3288-veyron-chromebook-sbs.dtsi"
> > =C2=A0
> > =C2=A0/ {
> > =C2=A0	model =3D "Google Speedy";
> >=20
>=20
>=20
--=20
Paul Kocialkowski, developer of free digital technology and hardware suppor=
t

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-MC6i8wxNKqaTait/1NSV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAlkGT5QACgkQhP3B6o/u
lQxtag/+PVCvhvfR3ldpBT/HeoJOwsMTHi8UnqZMhYpqMh6orXiG8MEjs6QKkJP1
uNglULfGH4PJqoXctz9oxqLfm574B9CXSc76gELzv5k2jBg2050A1g4YkfK/2raB
BhjPniT4/NyINs8XxhruSfWWhf6y2jViljrZJFNb11B2MOyvf06XfDUjJTLIps6E
Lmc+QoPaTvrPoPBlyxArQwpXRz6erk05uuAJ9lAJpKzgsXylomZ4FPqn91+uSVmz
dWig53X+bjiGegHXKMMRF0/kR9c74duA4VGkiszL4H3wAIyRf5B3LfdxsmtXgZ5z
P5/LscExaKC+IHrM0PSxdX/3jVXzfe1PFAMYiBKprvUrOn9CYPSrzqnzdeIAOn5Q
8bAzd3JgH6CDz9oHP6nB4c7v+NiqmdfPsYtQTCh0IIIwcUxhvAb14ZFklTnMOyxQ
aZoXCNtShOVv+xExeUIGzRbsq2jay93HBIT7xzx3ktXgywjF3QquleM46EcsdBGn
yXmv+KCZrpyUtHDF4w49GR7eyaC9BTnaNCRpASVOT2ae8CtO7FvHH3uOFbXliydY
no5+6XlVKqNAFBMZ1iirCzn2JsClAXscjeZr9gwNykP5oMvdsvaz2zy2Opupnkg4
2z46scc2ddkjTlugv0yQAS7H7te7mKOXvmdfZJ/+5cPnS+8ZK0w=
=4+Ez
-----END PGP SIGNATURE-----

--=-MC6i8wxNKqaTait/1NSV--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
