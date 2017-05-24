From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: rockchip: Move cros-ec-sbs to
 rk3288-veyron-chromebook-sbs
Date: Wed, 24 May 2017 16:38:39 +0200
Message-ID: <1495636719.13570.1.camel@paulk.fr>
References: <20170430183054.24563-1-contact@paulk.fr>
         <CAD=FV=V_s0TE_2vUvDBYfmbt2VS0nk5gmSPLi+mh2sqGauj6dg@mail.gmail.com>
         <1494180042.13734.4.camel@paulk.fr> <4982356.1SMNiM4AyO@phil>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-I+C5yTFLU9VzKrisMTl/"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4982356.1SMNiM4AyO@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-I+C5yTFLU9VzKrisMTl/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 24 mai 2017 =C3=A0 12:55 +0200, Heiko Stuebner a =C3=A9crit :
> Am Sonntag, 7. Mai 2017, 20:00:42 CEST schrieb Paul Kocialkowski:
> > Hi,
> >=20
> > Le lundi 01 mai 2017 =C3=A0 08:49 -0700, Doug Anderson a =C3=A9crit :
> > > On Mon, May 1, 2017 at 7:07 AM, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wrot=
e:
> > > > Am Sonntag, 30. April 2017, 22:56:52 CEST schrieb Paul Kocialkowski=
:
> > > > > Le dimanche 30 avril 2017 =C3=A0 22:37 +0200, Heiko Stuebner a =
=C3=A9crit :
> > > > > > Hi Paul,
> > > > > >=20
> > > > > > Am Sonntag, 30. April 2017, 20:30:52 CEST schrieb Paul Kocialko=
wski:
> > > > > > > This moves the cros-ec-sbs dtsi to a new rk3288-veyron-chrome=
book-
> > > > > > > sbs
> > > > > > > dtsi since it only concerns rk3288 veyron Chromebooks.
> > > > > > >=20
> > > > > > > Other Chromebooks (such as the tegra124 nyans) also have sbs
> > > > > > > batteries
> > > > > > > and don't use this dtsi, that only makes sense when used with
> > > > > > > rk3288-veyron-chromebook anyway.
> > > > > >=20
> > > > > > That isn't true. The gru series (rk3399-based) also uses the
> > > > > > sbs-battery [0]. And while it is currently limited to Rockchip-=
based
> > > > > > Chromebooks it is nevertheless used on more than one platform, =
so
> > > > > > the probability is high that it will be used in future series a=
s
> > > > > > well.
> > > > >=20
> > > > > That's good to know, but as pointed out, other cros devices are u=
sing
> > > > > a
> > > > > sbs
> > > > > battery without this header, so such a generic name isn't really =
a
> > > > > good
> > > > > fit.
> > >=20
> > > It would be interesting to know if the "retry-count" ought to be the
> > > same across all Chromebooks.  I guess you could argue that maybe
> > > someone found it needed to be 10 in all "nyan" variants and needed to
> > > be 1 in all "veyron" variants, but it seems more likely that the
> > > difference is arbitrary, or that one of the two values would work for
> > > everyone.  It sure looks like we've just been copying values from
> > > device to device.  Given that all the "veyron" devices have vastly
> > > different batteries (and probably all the nyan ones too), it seems
> > > likely there ought to be one value.
> >=20
> > Well, the retry-count is a maximum number of retries to detect a status
> > change
> > on external power connection/disconnection. From my experience, it seem=
s
> > that
> > nyans do indeed more retries to detect the change than veyrons, on aver=
age.
> >=20
> > I don't think setting this value to 1 is very reasonable (in the end, t=
hat's
> > a
> > number of seconds), because power supply status changes tend to take a =
few
> > seconds to reflect on the battery status.
> >=20
> > I think setting a high value (like 10) would always work and either way=
, the
> > status detection mechanism stops itself as soon as a change is detected=
 (it
> > turns out this is not a good idea for bq27xxx batteries, because they g=
o
> > from
> > charging to full in the first seconds after AC connection instead of
> > directly
> > reporting full, when full), but let's assume this is okay for sbs (and =
maybe
> > change it later).
> >=20
> > > In terms of setting the "charger", that also could potentially be
> > > something that could be for all Chromebooks, or at least older ones
> > > that don't have their charger implemented by the type C driver.  ...o=
r
> > > nyan devices could simply have a line in their dts like:
> > >=20
> > > &battery {
> > >   power-supplies =3D <&charger>;
> > > };
> >=20
> > That's true, but I think it makes as much sense to keep the whole bindi=
ng.
> >=20
> > In my opinion, the only reason to have a separate dtsi for this binding=
 is
> > that
> > veyrons have another dtsi for chromebooks where this binding should be.
> > However,
> > it cannot be there because of minnie using another battery IC.
> >=20
> > So my approach here would be to make it common for devices where other =
major
> > parts are also common, so we can avoid duplication when most of the dev=
ice-
> > tree
> > is already common. In cases where most of the device-tree is specific t=
o a
> > device, I think the binding should be duplicated. This is done already =
for
> > lots
> > of other components that could be made (somewhat) common anyway.
> >=20
> > >=20
> > > > > Note that &charger has to be defined (after my subsequent patches=
),
> > > > > which
> > > > > it is
> > > > > for devices that also include rk3288-veyron-chromebook, but not
> > > > > necessarily
> > > > > others.
> > > > >=20
> > > > > Overall, I think having one -sbs dtsi file makes sense here becau=
se
> > > > > there
> > > > > is
> > > > > already a rk3288-veyron-chromebook dtsi that veyron chromebooks u=
se.
> > > > > That
> > > > > file
> > > > > cannot contain the battery bindings because minnie has a differen=
t one
> > > > > and
> > > > > it
> > > > > would be a bit silly to copy it over all devices. That definitely
> > > > > makes
> > > > > sense.
> > > > >=20
> > > > > As for other devices, I don't see why we should have a separate
> > > > > include
> > > > > file for
> > > > > the battery instead of having it in the device's dts. I think thi=
s
> > > > > should
> > > > > be the
> > > > > case on gru/kevin.
> > > > >=20
> > > > > Also maybe not *all* gru-based devices will turn out to use a SBS
> > > > > battery,
> > > > > so it
> > > > > seems early to include this header in the gru dtsi.
> > >=20
> > > For gru devices, we've moved to a "virtual sbs battery" provided by
> > > the EC.  I'm not 100% positive that everything will just magically
> > > work and be converted in the EC if we put a non-sbs battery on a boar=
d
> > > with this EC feature, but I would hope we'd convert everything
> > > properly.
> >=20
> > Interesting and good to know!
> >=20
> > > > > One last point, gru/kevin
> > > > > currently don't define a charger, which will break my subsequent =
patch
> > > > > (that is
> > > > > however needed for the veyrons that use this file).
> > >=20
> > > Arguably this should be fixed.  On veyron-chromebook we just use
> > > "gpio-charger".  We didn't add a special charger driver w/ a property
> > > like "ti,external-control" since the only piece of information that
> > > Linux really needed from the charger was whether or not AC was
> > > connected.
> >=20
> > Thanks for taking that choice, it indeed makes things easier on the ker=
nel
> > side
> > whith no drawbacks.
> >=20
> > >=20
> > > > > To me, it seems that there's little advantage and major drawbacks=
 in
> > > > > keeping
> > > > > this file the way it is.
> > > >=20
> > > > I don't have any set opinion right now but after looking through th=
e
> > > > other uses of the sbs-battery the cros-ec-sbs.dtsi snippet really s=
eems
> > > > somewhat veyron/gru-specific - especially wrt. the retry-count valu=
es.
> > > >=20
> > > > What I'm not sure about is whether it is actually better to keep th=
e
> > > > include
> > > > around under a new name or just move the (rather tiny) sbs-battery =
node
> > > > into the relevant devicetrees directly, when there aren't that many
> > > > users
> > > > anyway.
> > >=20
> > > I'm fine with whatever you guys choose to do here.  It's nice not to
> > > have copied "code", but with device tree sometimes copies are cleaner
> > > than trying to share something.
> >=20
> > I definitely agree. I think copies are a good fit here because overall,=
 we
> > have
> > enough disparity in the possible configurations among different SoC
> > platforms to
> > justify having one per device. So I believe it would make sense to make=
 that
> > binding common *among the same SoC family*.
>=20
> ok, so if I'm not mistaken it really looks like moving away from
> cros-sbs-battery might be the easiest solution and with seeing the
> different usages of the sbs-battery I tend to agree now :-) .
>=20
> On the include vs. copy question it looks like we're tied as well with
> mickey, minnie (and fievel + tiger from 2017) not using the sbs-battery
> having local copies of the sbs-node in the affected devices really looks
> like the best option.
>=20
> So I guess we should get gru + the sbs veyron-devices their own sbs-batte=
ry
> and then just drop te cros-ec-sbs.dtsi so that nobody else gets the idea
> of using it.

How about keeping the nodes for veyron chromebooks (except minnie, which is=
 a
convertible anyway) in rk3288-veyron-chromebook-sbs as this patch initially
suggested, in addition to changes to gru dts?

Cheers!

--=20
Paul Kocialkowski, developer of free digital technology and hardware suppor=
t

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-I+C5yTFLU9VzKrisMTl/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAlklmvAACgkQhP3B6o/u
lQy+Ag/+JmBNjPYnax8SgbKmg/O4gb0TpIolka4o1pzSzzCVFQDBTKhb6fl/1J2j
YGKi+iF6pO3KIsOdbJ0M0HbgrCVo7wNLxdpFtqW92QW8V7MiSwTgNL7Z5xJZpulz
VyyzCot6Gddy7pRs185WIDf+MlK+tP+di0hx9Lcm8IUR7EnXtZEg93N6AGhmPbpz
oPmDf29yqTr9x1mykNNHWXc2AfunkGPE8P+Wt2RElb63YUKC0NWtmkepfiYcaF/3
vrLa4nzFhJ/TJNoJ5an7o4duVmqnfho3K3PDYnTYjQ3DgLp3VREIAk89kaFx0wSr
kNEOsI1QiXkKsrKxGHSkRRh7YkzRQb/foEbLJVg9U+Orcg/0ATcmx/9kaEpS02No
D19fH3RtlTyudw6I82e00CGsYDtCBgr0SDxsqOvJHiKVnrd23ZOJBc7EZw3kJeGV
n8Pn4NWf7DzaKcynz6QLAOaDyXvKz+9RAOAMRHWdHwStmN5DanL/5Ah/JFJ+APam
fcdNutBJJKlq3s3a1arTvFqp2Hziy0KUH18lmCIxTadOJd3Xg+8o7qQcx6dnUeTz
CqfS+/rrbrI3mk2y232J/F3jkAjvjwcv6wP5jsQ0qziXKWQHdst6zkaCKnmPLqP9
+7q7AFUR65MoJuXC8dF1SS52WbwnaGTt4nfYzWzVEW5l2d90nug=
=kD9Q
-----END PGP SIGNATURE-----

--=-I+C5yTFLU9VzKrisMTl/--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
