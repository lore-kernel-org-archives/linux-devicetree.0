From: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v2] display: panel: Add Tianma tm070rvhg71 display
 support (800x480)
Date: Fri, 17 Nov 2017 13:14:20 +0100
Message-ID: <20171117131420.7cd8b6b2@jawa>
References: <CAL_JsqJz67k_fTMkx5dHb5qFwXif9y+Cv=+PTq7OLH7woNoU=g@mail.gmail.com>
        <20171107153058.5554-1-lukma@denx.de>
        <20171117113616.GA1062@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/rcTs_nPc5UxVJGCv/RnndGb"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171117113616.GA1062@ulmo>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Sig_/rcTs_nPc5UxVJGCv/RnndGb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Thierry,

> On Tue, Nov 07, 2017 at 04:30:58PM +0100, Lukasz Majewski wrote:
> > Signed-off-by: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
> >=20
> > ---
> > Changes for v2:
> > - Provide more
> > detailed ./Documentation/devicetree/bindings/display/panel entry to
> > describe this panel device. ---
> >  .../bindings/display/panel/tianma,tm070rvhg71.txt  | 29
> > ++++++++++++++++++++++
> > drivers/gpu/drm/panel/panel-simple.c               | 27
> > ++++++++++++++++++++ 2 files changed, 56 insertions(+) create mode
> > 100644
> > Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt =
=20
>=20
> I've applied this, though I had to make a few modifications.=20

Thanks :-)

> First, I
> added a commit message. Commits should always have one.
>=20
> Also, please send DT bindings and driver changes as separate patches
> in the future.
>=20
> Device tree bindings should have a subject prefixed with any of these:
>=20
> 	dt-bindings:
> 	dt-bindings: display:
> 	dt-bindings: display: panel:
>=20
> Though the latter two are fairly long by themselves, so you don't
> have a lot of room for the important bits.
>=20
> Please also prefix the subject of panel driver patches with a:
>=20
> 	drm/panel:
>=20
> Which makes it easier to identify relevant patches among loads and
> loads of other email.

Ok. I see. Thanks for explanation.

>=20
> >=20
> > diff --git
> > a/Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt
> > b/Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt
> > new file mode 100644 index 000000000000..02562867444d --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt
> > @@ -0,0 +1,29 @@ +Tianma Micro-electronics TM070RVHG71 7.0" WXGA
> > TFT LCD panel +
> > +Required properties:
> > +- compatible: should be "tianma,tm070rvhg71 =20
>=20
> Added a missing " at the end here.

Ok.

>=20
> > +- power-supply: single regulator to provide the supply voltage
> > +- backlight: phandle of the backlight device attached to the panel
> > +
> > +Required nodes:
> > +- port: LVDS port mapping to connect this display
> > +
> > +This panel needs single power supply voltage. Its backlight is
> > conntrolled +via PWM signal.
> > +
> > +Example:
> > +--------
> > +
> > +Example device-tree definition when connected to iMX6Q based board
> > +
> > +	panel: panel-lvds0 {
> > +		compatible =3D "tianma,tm070rvhg71";
> > +		backlight =3D <&backlight_lvds>;
> > +		power-supply =3D <&reg_lvds>;
> > +
> > +		port {
> > +			panel_in_lvds0: endpoint {
> > +				remote-endpoint =3D <&lvds0_out>;
> > +			};
> > +		};
> > +	};
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c
> > b/drivers/gpu/drm/panel/panel-simple.c index
> > 3d2cb8bc4d94..07188dc084df 100644 ---
> > a/drivers/gpu/drm/panel/panel-simple.c +++
> > b/drivers/gpu/drm/panel/panel-simple.c @@ -1831,6 +1831,30 @@
> > static const struct panel_desc tianma_tm070jdhg30 =3D { .bus_format =3D
> > MEDIA_BUS_FMT_RGB666_1X7X3_SPWG, };
> > =20
> > +static const struct display_timing tianma_tm070rvhg71_timing =3D {
> > +	.pixelclock =3D { 27700000, 29200000, 39600000 },
> > +	.hactive =3D { 800, 800, 800 },
> > +	.hfront_porch =3D { 12, 40, 212 },
> > +	.hback_porch =3D { 88, 88, 88 },
> > +	.hsync_len =3D { 1, 1, 40 },
> > +	.vactive =3D { 480, 480, 480 },
> > +	.vfront_porch =3D { 1, 13, 88 },
> > +	.vback_porch =3D { 32, 32, 32 },
> > +	.vsync_len =3D { 1, 1, 3 },
> > +	.flags =3D DISPLAY_FLAGS_DE_HIGH,
> > +};
> > +
> > +static const struct panel_desc tianma_tm070rvhg71 =3D {
> > +	.timings =3D &tianma_tm070rvhg71_timing,
> > +	.num_timings =3D 1,
> > +	.bpc =3D 8,
> > +	.size =3D {
> > +		.width =3D 154,
> > +		.height =3D 86,
> > +	},
> > +	.bus_format =3D MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> > +};
> > +
> >  static const struct drm_display_mode tpk_f07a_0102_mode =3D {
> >  	.clock =3D 33260,
> >  	.hdisplay =3D 800,
> > @@ -2113,6 +2137,9 @@ static const struct of_device_id
> > platform_of_match[] =3D { .compatible =3D "tianma,tm070jdhg30",
> >  		.data =3D &tianma_tm070jdhg30,
> >  	}, {
> > +		.compatible =3D "tianma,tm070rvhg71",
> > +		.data =3D &tianma_tm070rvhg71,
> > +	}, {
> >  		.compatible =3D "tpk,f07a-0102",
> >  		.data =3D &tpk_f07a_0102,
> >  	}, { =20
>=20
> Looks like these are actually sorted correctly in your patch. However,
> when applying these got added after the Toshiba panel that was
> recently added, so I resorted again.

Thanks one more time.

>=20
> Thierry



Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd-ynQEQJNshbs@public.gmane.org

--Sig_/rcTs_nPc5UxVJGCv/RnndGb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAloO0p0ACgkQAR8vZIA0
zr37SAf/Vcla0GqFEoWWXohiatMHZ+4NVxAGQW5HwMuxB2ryShDVCRcZKYVXqzmE
V9b+9UYfmYqFxIWFQHPHgT/gA4ltYf3mHewT/DKUuyl82baObavxfu+/fAEbvEft
Urvq+la+QkHxDk+Qjp2zQ1qsgUd8e/maMc2Urhljl0D8Vjd89RBCteRiqA/9GQ2g
AeLVB5F4/vsBPYu+CZYiEVdyE37OZfFcZuhtAsMjjbOa5G67PRckZeE4lvUP3YA9
3RakKsW9uNCIPH8OJ72FvDysGfS1/J/4BcIGIUiUVTd935hVExKKb3uwFGBkwCE4
EVyxY2PFdCTMtRNL2BKsJMTGkObOcQ==
=cVlX
-----END PGP SIGNATURE-----

--Sig_/rcTs_nPc5UxVJGCv/RnndGb--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
