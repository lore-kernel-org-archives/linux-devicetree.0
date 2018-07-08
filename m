From: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH v2] display: panel: Add KOE tx14d24vm1bpa display
 support (320x240)
Date: Sun, 8 Jul 2018 10:43:12 +0200
Message-ID: <20180708104312.2e4d7586@jawa>
References: <20180412143715.6828-1-lukma@denx.de>
        <20180529150528.22136-1-lukma@denx.de>
        <20180622105605.3018453c@jawa>
        <20180629190529.0f59db98@jawa>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Pd96HfQpOJh9uaaFTej=n_N"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180629190529.0f59db98@jawa>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--Sig_/Pd96HfQpOJh9uaaFTej=n_N
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Thierry,

> Hi Thierry,
>=20
> > Hi Thierry,
> >  =20
> > > This commit adds support for KOE's 5.7" display.
> > >=20
> > > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > ---
> > > Changes for v2:
> > > - Add Reviewed-by tag   =20
> >=20
> > Could you apply this patch to your tree? =20
>=20
> If I may gentle ping on this patch..... It is quite mature now... :-)

If I may gentle ping on this patch...

Thanks in advance,
=C5=81ukasz Majewski

>=20
> Best regards,
> =C5=81ukasz
>=20
> >=20
> > Thanks in advance,
> > =C5=81ukasz
> >  =20
> > >=20
> > > ---
> > >  .../bindings/display/panel/koe,tx14d24vm1bpa.txt   | 42
> > > ++++++++++++++++++++++
> > > drivers/gpu/drm/panel/panel-simple.c               | 26
> > > ++++++++++++++ 2 files changed, 68 insertions(+) create mode
> > > 100644
> > > Documentation/devicetree/bindings/display/panel/koe,tx14d24vm1bpa.txt
> > >=20
> > > diff --git
> > > a/Documentation/devicetree/bindings/display/panel/koe,tx14d24vm1bpa.t=
xt
> > > b/Documentation/devicetree/bindings/display/panel/koe,tx14d24vm1bpa.t=
xt
> > > new file mode 100644 index 000000000000..be7ac666807b
> > > --- /dev/null +++
> > > b/Documentation/devicetree/bindings/display/panel/koe,tx14d24vm1bpa.t=
xt
> > > @@ -0,0 +1,42 @@ +Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x
> > > 240) TFT LCD panel +
> > > +Required properties:
> > > +- compatible: should be "koe,tx14d24vm1bpa"
> > > +- backlight: phandle of the backlight device attached to the
> > > panel +- power-supply: single regulator to provide the supply
> > > voltage +
> > > +Required nodes:
> > > +- port: Parallel port mapping to connect this display
> > > +
> > > +This panel needs single power supply voltage. Its backlight is
> > > conntrolled +via PWM signal.
> > > +
> > > +Example:
> > > +--------
> > > +
> > > +Example device-tree definition when connected to iMX53 based
> > > board +
> > > +	lcd_panel: lcd-panel {
> > > +		compatible =3D "koe,tx14d24vm1bpa";
> > > +		backlight =3D <&backlight_lcd>;
> > > +		power-supply =3D <&reg_3v3>;
> > > +
> > > +		port {
> > > +			lcd_panel_in: endpoint {
> > > +				remote-endpoint =3D
> > > <&lcd_display_out>;
> > > +			};
> > > +		};
> > > +	};
> > > +
> > > +Then one needs to extend the dispX node:
> > > +
> > > +	lcd_display: disp1 {
> > > +
> > > +		port@1 {
> > > +			reg =3D <1>;
> > > +
> > > +			lcd_display_out: endpoint {
> > > +				remote-endpoint =3D
> > > <&lcd_panel_in>;
> > > +			};
> > > +		};
> > > +	};
> > > diff --git a/drivers/gpu/drm/panel/panel-simple.c
> > > b/drivers/gpu/drm/panel/panel-simple.c index
> > > d9984bdb5bb5..103b43ce7dee 100644 ---
> > > a/drivers/gpu/drm/panel/panel-simple.c +++
> > > b/drivers/gpu/drm/panel/panel-simple.c @@ -1268,6 +1268,29 @@
> > > static const struct panel_desc innolux_zj070na_01p =3D { },
> > >  };
> > > =20
> > > +static const struct display_timing koe_tx14d24vm1bpa_timing =3D {
> > > +	.pixelclock =3D { 5580000, 5850000, 6200000 },
> > > +	.hactive =3D { 320, 320, 320 },
> > > +	.hfront_porch =3D { 30, 30, 30 },
> > > +	.hback_porch =3D { 30, 30, 30 },
> > > +	.hsync_len =3D { 1, 5, 17 },
> > > +	.vactive =3D { 240, 240, 240 },
> > > +	.vfront_porch =3D { 6, 6, 6 },
> > > +	.vback_porch =3D { 5, 5, 5 },
> > > +	.vsync_len =3D { 1, 2, 11 },
> > > +	.flags =3D DISPLAY_FLAGS_DE_HIGH,
> > > +};
> > > +
> > > +static const struct panel_desc koe_tx14d24vm1bpa =3D {
> > > +	.timings =3D &koe_tx14d24vm1bpa_timing,
> > > +	.num_timings =3D 1,
> > > +	.bpc =3D 6,
> > > +	.size =3D {
> > > +		.width =3D 115,
> > > +		.height =3D 86,
> > > +	},
> > > +};
> > > +
> > >  static const struct display_timing koe_tx31d200vm0baa_timing =3D {
> > >  	.pixelclock =3D { 39600000, 43200000, 48000000 },
> > >  	.hactive =3D { 1280, 1280, 1280 },
> > > @@ -2204,6 +2227,9 @@ static const struct of_device_id
> > > platform_of_match[] =3D { .compatible =3D "innolux,zj070na-01p",
> > >  		.data =3D &innolux_zj070na_01p,
> > >  	}, {
> > > +		.compatible =3D "koe,tx14d24vm1bpa",
> > > +		.data =3D &koe_tx14d24vm1bpa,
> > > +	}, {
> > >  		.compatible =3D "koe,tx31d200vm0baa",
> > >  		.data =3D &koe_tx31d200vm0baa,
> > >  	}, {   =20
> >=20
> >=20
> >=20
> >=20
> > Best regards,
> >=20
> > Lukasz Majewski
> >=20
> > --
> >=20
> > DENX Software Engineering GmbH,      Managing Director: Wolfgang
> > Denk HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell,
> > Germany Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email:
> > wd@denx.de =20
>=20
>=20
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

--Sig_/Pd96HfQpOJh9uaaFTej=n_N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAltBzqAACgkQAR8vZIA0
zr1aQQgAkRJhSLKDmF6fpZxqm8vLD8M2/HzIEDize+EHOOGZhvQzUXzLVlvUfhha
JWVYXCwlilA6uv5NbaJCLoXf2/GbVaNIW61oEUH+vqnhq8fFjHP8eCKiUumQlGyd
DPyVO12MFkAtrRBVhXlEcs4EImh1pEKdd1uaRZraj9WOkRM0GuUMkuGILzSXrZjG
v0Wq9NjnJtIfqxyPU6M3hIcvb4CcvdTNb2JFrZoGQAQXplvPqX6Cu6J6BVwhwC0L
GqunldqmXAk9q89sHBhsH0OWyS0MXjrLZ8kd3qX/DkZstmF5G8Yerp22qld4FESV
DQgUGwW4OYzR7K7q0ZjK2jYI3MLOeQ==
=AC4z
-----END PGP SIGNATURE-----

--Sig_/Pd96HfQpOJh9uaaFTej=n_N--
