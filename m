From: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v3] display: panel: Add Mitsubishi aa070mc01 display
 support (800x480)
Date: Sun, 5 Nov 2017 23:20:35 +0100
Message-ID: <20171105232035.4ffe29b2@jawa>
References: <1508537169-402-1-git-send-email-lukma@denx.de>
        <1508537917-1723-1-git-send-email-lukma@denx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/G.Q28VznIqY_K=2ldu2FJyJ"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508537917-1723-1-git-send-email-lukma-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Sig_/G.Q28VznIqY_K=2ldu2FJyJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Dear All,

> This commit adds support for Mitsubishi aa070mc01 TFT panel working
> with 8 bit ISP mode (pin 19 "mode" HIGH for 20 pin TFT connector).

Gentle ping...

>=20
> Signed-off-by: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
> ---
> Changes for v2:
> - Place the code sorted alphabetically
> - Add missing ./Documentation/devicetree/binding/display properties
>   description
>=20
> Changes for v3:
> - Fix typo in display name (in property description)
>=20
> ---
>  .../display/panel/mitsubishi,aa070mc01.txt         |  7 +++++
>  drivers/gpu/drm/panel/panel-simple.c               | 35
> ++++++++++++++++++++++ 2 files changed, 42 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/display/panel/mitsubishi,aa070mc01.txt
>=20
> diff --git
> a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa070mc01.txt
> b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa070mc01.txt
> new file mode 100644 index 0000000..4f5094f --- /dev/null
> +++
> b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa070mc01.txt
> @@ -0,0 +1,7 @@ +Mitsubishi "AA070MC01 7.0" WVGA TFT LCD panel
> +
> +Required properties:
> +- compatible: should be "mitsubishi,aa070mc01-ca1"
> +
> +This binding is compatible with the simple-panel binding, which is
> specified +in simple-panel.txt in this directory.
> diff --git a/drivers/gpu/drm/panel/panel-simple.c
> b/drivers/gpu/drm/panel/panel-simple.c index 07188dc..72a20fc 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1350,6 +1350,38 @@ static const struct panel_desc lg_lp129qe =3D {
>  	},
>  };
> =20
> +static const struct drm_display_mode mitsubishi_aa070mc01_mode =3D {
> +	.clock =3D 30400,
> +	.hdisplay =3D 800,
> +	.hsync_start =3D 800 + 0,
> +	.hsync_end =3D 800 + 1,
> +	.htotal =3D 800 + 0 + 1 + 160,
> +	.vdisplay =3D 480,
> +	.vsync_start =3D 480 + 0,
> +	.vsync_end =3D 480 + 48 + 1,
> +	.vtotal =3D 480 + 48 + 1 + 0,
> +	.vrefresh =3D 60,
> +	.flags =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +};
> +
> +static const struct panel_desc mitsubishi_aa070mc01 =3D {
> +	.modes =3D &mitsubishi_aa070mc01_mode,
> +	.num_modes =3D 1,
> +	.bpc =3D 8,
> +	.size =3D {
> +		.width =3D 152,
> +		.height =3D 91,
> +	},
> +
> +	.delay =3D {
> +		.enable =3D 200,
> +		.unprepare =3D 200,
> +		.disable =3D 400,
> +	},
> +	.bus_format =3D MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.bus_flags =3D DRM_BUS_FLAG_DE_HIGH,
> +};
> +
>  static const struct display_timing nec_nl12880bc20_05_timing =3D {
>  	.pixelclock =3D { 67000000, 71000000, 75000000 },
>  	.hactive =3D { 1280, 1280, 1280 },
> @@ -2080,6 +2112,9 @@ static const struct of_device_id
> platform_of_match[] =3D { .compatible =3D "lg,lp129qe",
>  		.data =3D &lg_lp129qe,
>  	}, {
> +		.compatible =3D "mitsubishi,aa070mc01-ca1",
> +		.data =3D &mitsubishi_aa070mc01,
> +	}, {
>  		.compatible =3D "nec,nl12880bc20-05",
>  		.data =3D &nec_nl12880bc20_05,
>  	}, {



Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd-ynQEQJNshbs@public.gmane.org

--Sig_/G.Q28VznIqY_K=2ldu2FJyJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAln/jrMACgkQAR8vZIA0
zr3Clgf/SESeFtTuxloFFGPonSKdDrbkYn6/UUCi6+ZtY8gg0rMKk7DWMoCIiTUD
/F7r9+Pq7ohFBWrtJt3IBJnwNns0pw0Eb3LcVbOmdzcMdQz4o6jbTEgtzM9G2mun
eVycoWHpRHC5cf/WyK0HeyCQXtp/mPJJrRxi2xJK9rB9/Dt29ljlgQ4W9NJ+dWIS
KpyXim/V2//sDmOWk87fyxbkrPT2qyBZg4Eedyfv1nTvfuGp42x1tm+Pq+HbmCLg
k835ER1UBu14eAvD5MnfXKFio7sokOACP7qp+zKemN4cr6ZYbB3XNu5Wfmv7JWur
Yb5/ok27GzZFHnFxuEPmzn+lZP5E4A==
=lCZ2
-----END PGP SIGNATURE-----

--Sig_/G.Q28VznIqY_K=2ldu2FJyJ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
