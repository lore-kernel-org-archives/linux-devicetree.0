From: Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [PATCH 1/3] ARM: dts: rockchip: Move cros-ec-sbs to
 rk3288-veyron-chromebook-sbs
Date: Sun, 07 May 2017 20:00:42 +0200
Message-ID: <1494180042.13734.4.camel@paulk.fr>
References: <20170430183054.24563-1-contact@paulk.fr>
 <2369975.a4dWayqU5d@phil> <1493585812.6493.4.camel@paulk.fr>
 <2337202.q9Cdx8Nyxy@phil>
 <CAD=FV=V_s0TE_2vUvDBYfmbt2VS0nk5gmSPLi+mh2sqGauj6dg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7450367966115346280=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAD=FV=V_s0TE_2vUvDBYfmbt2VS0nk5gmSPLi+mh2sqGauj6dg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Doug Anderson <dianders@chromium.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Brian Norris <briannorris@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============7450367966115346280==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Cve6L6VZRSNqUV9dfccG"


--=-Cve6L6VZRSNqUV9dfccG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 01 mai 2017 =C3=A0 08:49 -0700, Doug Anderson a =C3=A9crit=C2=A0:
> On Mon, May 1, 2017 at 7:07 AM, Heiko Stuebner <heiko@sntech.de> wrote:
> > Am Sonntag, 30. April 2017, 22:56:52 CEST schrieb Paul Kocialkowski:
> > > Le dimanche 30 avril 2017 =C3=A0 22:37 +0200, Heiko Stuebner a =C3=A9=
crit :
> > > > Hi Paul,
> > > >=20
> > > > Am Sonntag, 30. April 2017, 20:30:52 CEST schrieb Paul Kocialkowski=
:
> > > > > This moves the cros-ec-sbs dtsi to a new rk3288-veyron-chromebook=
-sbs
> > > > > dtsi since it only concerns rk3288 veyron Chromebooks.
> > > > >=20
> > > > > Other Chromebooks (such as the tegra124 nyans) also have sbs batt=
eries
> > > > > and don't use this dtsi, that only makes sense when used with
> > > > > rk3288-veyron-chromebook anyway.
> > > >=20
> > > > That isn't true. The gru series (rk3399-based) also uses the
> > > > sbs-battery [0]. And while it is currently limited to Rockchip-base=
d
> > > > Chromebooks it is nevertheless used on more than one platform, so
> > > > the probability is high that it will be used in future series as we=
ll.
> > >=20
> > > That's good to know, but as pointed out, other cros devices are using=
 a
> > > sbs
> > > battery without this header, so such a generic name isn't really a go=
od
> > > fit.
>=20
> It would be interesting to know if the "retry-count" ought to be the
> same across all Chromebooks.=C2=A0=C2=A0I guess you could argue that mayb=
e
> someone found it needed to be 10 in all "nyan" variants and needed to
> be 1 in all "veyron" variants, but it seems more likely that the
> difference is arbitrary, or that one of the two values would work for
> everyone.=C2=A0=C2=A0It sure looks like we've just been copying values fr=
om
> device to device.=C2=A0=C2=A0Given that all the "veyron" devices have vas=
tly
> different batteries (and probably all the nyan ones too), it seems
> likely there ought to be one value.

Well, the retry-count is a maximum number of retries to detect a status cha=
nge
on external power connection/disconnection. From my experience, it seems th=
at
nyans do indeed more retries to detect the change than veyrons, on average.

I don't think setting this value to 1 is very reasonable (in the end, that'=
s a
number of seconds), because power supply status changes tend to take a few
seconds to reflect on the battery status.

I think setting a high value (like 10) would always work and either way, th=
e
status detection mechanism stops itself as soon as a change is detected (it
turns out this is not a good idea for bq27xxx batteries, because they go fr=
om
charging to full in the first seconds after AC connection instead of direct=
ly
reporting full, when full), but let's assume this is okay for sbs (and mayb=
e
change it later).

> In terms of setting the "charger", that also could potentially be
> something that could be for all Chromebooks, or at least older ones
> that don't have their charger implemented by the type C driver.=C2=A0=C2=
=A0...or
> nyan devices could simply have a line in their dts like:
>=20
> &battery {
> =C2=A0 power-supplies =3D <&charger>;
> };

That's true, but I think it makes as much sense to keep the whole binding.

In my opinion, the only reason to have a separate dtsi for this binding is =
that
veyrons have another dtsi for chromebooks where this binding should be. How=
ever,
it cannot be there because of minnie using another battery IC.

So my approach here would be to make it common for devices where other majo=
r
parts are also common, so we can avoid duplication when most of the device-=
tree
is already common. In cases where most of the device-tree is specific to a
device, I think the binding should be duplicated. This is done already for =
lots
of other components that could be made (somewhat) common anyway.

>=20
> > > Note that &charger has to be defined (after my subsequent patches), w=
hich
> > > it is
> > > for devices that also include rk3288-veyron-chromebook, but not
> > > necessarily
> > > others.
> > >=20
> > > Overall, I think having one -sbs dtsi file makes sense here because t=
here
> > > is
> > > already a rk3288-veyron-chromebook dtsi that veyron chromebooks use. =
That
> > > file
> > > cannot contain the battery bindings because minnie has a different on=
e and
> > > it
> > > would be a bit silly to copy it over all devices. That definitely mak=
es
> > > sense.
> > >=20
> > > As for other devices, I don't see why we should have a separate inclu=
de
> > > file for
> > > the battery instead of having it in the device's dts. I think this sh=
ould
> > > be the
> > > case on gru/kevin.
> > >=20
> > > Also maybe not *all* gru-based devices will turn out to use a SBS bat=
tery,
> > > so it
> > > seems early to include this header in the gru dtsi.
>=20
> For gru devices, we've moved to a "virtual sbs battery" provided by
> the EC.=C2=A0=C2=A0I'm not 100% positive that everything will just magica=
lly
> work and be converted in the EC if we put a non-sbs battery on a board
> with this EC feature, but I would hope we'd convert everything
> properly.

Interesting and good to know!

> > > One last point, gru/kevin
> > > currently don't define a charger, which will break my subsequent patc=
h
> > > (that is
> > > however needed for the veyrons that use this file).
>=20
> Arguably this should be fixed.=C2=A0=C2=A0On veyron-chromebook we just us=
e
> "gpio-charger".=C2=A0=C2=A0We didn't add a special charger driver w/ a pr=
operty
> like "ti,external-control" since the only piece of information that
> Linux really needed from the charger was whether or not AC was
> connected.

Thanks for taking that choice, it indeed makes things easier on the kernel =
side
whith no drawbacks.

>=20
> > > To me, it seems that there's little advantage and major drawbacks in
> > > keeping
> > > this file the way it is.
> >=20
> > I don't have any set opinion right now but after looking through the
> > other uses of the sbs-battery the cros-ec-sbs.dtsi snippet really seems
> > somewhat veyron/gru-specific - especially wrt. the retry-count values.
> >=20
> > What I'm not sure about is whether it is actually better to keep the in=
clude
> > around under a new name or just move the (rather tiny) sbs-battery node
> > into the relevant devicetrees directly, when there aren't that many use=
rs
> > anyway.
>=20
> I'm fine with whatever you guys choose to do here.=C2=A0=C2=A0It's nice n=
ot to
> have copied "code", but with device tree sometimes copies are cleaner
> than trying to share something.

I definitely agree. I think copies are a good fit here because overall, we =
have
enough disparity in the possible configurations among different SoC platfor=
ms to
justify having one per device. So I believe it would make sense to make tha=
t
binding common *among the same SoC family*.

Cheers,

--=20
Paul Kocialkowski, developer of free digital technology and hardware suppor=
t

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-Cve6L6VZRSNqUV9dfccG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAlkPYMoACgkQhP3B6o/u
lQyovw/+N57+IxxDSdhIjGVW8MJjj/RN701JgYjPk5KqmmrWQADqwtMU/qwJIPiU
CFOtJcrZ7vTm/SluWzG20qWV3o8z8tvr5bOyQjTUI8HAWXmfo9WbYlrUjE1L9NzY
6NTTvFAvYkbKdKrGkTNHcMC9BWmhlRmAbIXHtFFREmjENqE2603W0AW3HjVMbffs
83YXXucC9ynWBg5jo2hwPCv7dYardgBnPsQy6rRFvr8dOb+089/61B3u1eanzxFR
YDCDTjKUksIfRT5p6xUU/qtaH9AnaGeaU+l61AUKvX3lkxz28sg5a9kLMEo0VQ/4
hheUi35WglPwe41Q9CqkNntRXtJ8ZYiG3MSVMO62Y0Vm9bUF5FEW+fHG9MigvRs6
DwQWVusnOlUf9H2PmWSSsfCGanTduzZVva/6XMSH6/vNDLHkfO55RnE5IYGbUMpo
7TiIqHKeuUy1169KfixoU/c/lP3cycAsFt1zthT4/Fo7Lr75b8SCdGskEJJkHTRN
ek2DCWTY0kybBWQbFlBFB0kQ8GDdoKFPPbAeeUx1Cac5aZVHxQ0tVp2jZIXKU+2x
t7jBvzGAMm140t4gOhr2aPpf4XVgdhijWdjT736/tvZYXmmPSlQwvU8NrBYdtD1B
Yh2o3cjgwrcL4UdzGPf9Bz0CN72tlf1D/ST8PBF/tH+X3B+cu0g=
=/E/r
-----END PGP SIGNATURE-----

--=-Cve6L6VZRSNqUV9dfccG--



--===============7450367966115346280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7450367966115346280==--
