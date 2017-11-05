From: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH] display: panel: Add Tianma tm070rvhg71 display support
 (800x480)
Date: Sun, 5 Nov 2017 23:19:55 +0100
Message-ID: <20171105231955.46d20be1@jawa>
References: <1508537403-878-1-git-send-email-lukma@denx.de>
        <20171027031336.psu7hn27w2xajyux@rob-hp-laptop>
        <20171027101800.5dbfb161@jawa>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/oxaH4Ti7GXT2X5Jbxyhl+RO"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171027101800.5dbfb161@jawa>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--Sig_/oxaH4Ti7GXT2X5Jbxyhl+RO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rob,

> Hi Rob,
>=20
> > On Sat, Oct 21, 2017 at 12:10:03AM +0200, Lukasz Majewski wrote: =20
> > > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > > ---
> > >  .../bindings/display/panel/tianma,tm070rvhg71.txt  |  7 ++++++
> > >  drivers/gpu/drm/panel/panel-simple.c               | 27
> > > ++++++++++++++++++++++ 2 files changed, 34 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt
> > >=20
> > > diff --git
> > > a/Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.=
txt
> > > b/Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.=
txt
> > > new file mode 100644 index 0000000..b84217f --- /dev/null
> > > +++
> > > b/Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.=
txt
> > > @@ -0,0 +1,7 @@ +Tianma Micro-electronics TM070RVHG71 7.0" WXGA
> > > TFT LCD panel +
> > > +Required properties:
> > > +- compatible: should be "tianma,tm070rvhg71
> > > +
> > > +This binding is compatible with the simple-panel binding, which
> > > is specified +in simple-panel.txt in this directory. =20
> >=20
> > No supplies? Still need to list power-supply here if so, so it is
> > clear that this display has a single supply (or you need to list
> > multiple ones if not). =20
>=20
> I took the same approach as several other simple panels having
> description in Documentation/devicetree/bindings/display/panel/*
> directory (e.g. innolux,g121i1-l01.txt) .
>=20
> In the description it is stated that this binding is compatible with
> one documented in the simple-panel.txt, which defines following
> properties:
>=20
> Required properties:
> - power-supply: regulator to provide the supply voltage
>=20
> Optional properties:
> - ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
> - enable-gpios: GPIO pin to enable or disable the panel
> - backlight: phandle of the backlight device attached to the panel
>=20
>=20
> Do I need to do something more?

Gentle ping...

>=20
> >=20
> > Rob =20
>=20
>=20
> Best regards,
>=20
> Lukasz Majewski
>=20
> --
>=20
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de

--Sig_/oxaH4Ti7GXT2X5Jbxyhl+RO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAln/josACgkQAR8vZIA0
zr0gEwf/Ye+5ouJ9PvF2MMVEbmZ+5YFQAl8GHcGYBr/CoxWPR4P9NVOSi7dvVpxl
ZfvxtfkPjvcB66jzgc6lWTS0oW99n1JWBPlosFAgAOD6lZKv0rueONa/3mr4lthK
ZzZ2SCdLLAGVYy+FZZwK7MJJsWriYANWMDpXUiLeM9hwELD9diVp0tPi0GadwOxU
ua+U828Xv6hDX7KV9E6/nFLZXaeV20FhXCukFmt8MiUmaWYP7Bxa6kOMwHatXi9g
SLYg+SO25a6VobFIjU0trpn044UwkrW2qoOgftbhAlRErWajIiZyuWt/Nfu11F5I
d1VEQTr/up6v89tMu9VKMdzvY8dxAA==
=Now8
-----END PGP SIGNATURE-----

--Sig_/oxaH4Ti7GXT2X5Jbxyhl+RO--
