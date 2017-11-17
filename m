From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] display: panel: Add Tianma tm070rvhg71 display
 support (800x480)
Date: Fri, 17 Nov 2017 12:36:16 +0100
Message-ID: <20171117113616.GA1062@ulmo>
References: <CAL_JsqJz67k_fTMkx5dHb5qFwXif9y+Cv=+PTq7OLH7woNoU=g@mail.gmail.com>
 <20171107153058.5554-1-lukma@denx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1932370280=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20171107153058.5554-1-lukma@denx.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Lukasz Majewski <lukma@denx.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org


--===============1932370280==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 07, 2017 at 04:30:58PM +0100, Lukasz Majewski wrote:
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
>=20
> ---
> Changes for v2:
> - Provide more detailed ./Documentation/devicetree/bindings/display/panel
>   entry to describe this panel device.
> ---
>  .../bindings/display/panel/tianma,tm070rvhg71.txt  | 29 ++++++++++++++++=
++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 27 ++++++++++++++++=
++++
>  2 files changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/tianm=
a,tm070rvhg71.txt

I've applied this, though I had to make a few modifications. First, I
added a commit message. Commits should always have one.

Also, please send DT bindings and driver changes as separate patches in
the future.

Device tree bindings should have a subject prefixed with any of these:

	dt-bindings:
	dt-bindings: display:
	dt-bindings: display: panel:

Though the latter two are fairly long by themselves, so you don't have a
lot of room for the important bits.

Please also prefix the subject of panel driver patches with a:

	drm/panel:

Which makes it easier to identify relevant patches among loads and loads
of other email.

>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/tianma,tm070=
rvhg71.txt b/Documentation/devicetree/bindings/display/panel/tianma,tm070rv=
hg71.txt
> new file mode 100644
> index 000000000000..02562867444d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.=
txt
> @@ -0,0 +1,29 @@
> +Tianma Micro-electronics TM070RVHG71 7.0" WXGA TFT LCD panel
> +
> +Required properties:
> +- compatible: should be "tianma,tm070rvhg71

Added a missing " at the end here.

> +- power-supply: single regulator to provide the supply voltage
> +- backlight: phandle of the backlight device attached to the panel
> +
> +Required nodes:
> +- port: LVDS port mapping to connect this display
> +
> +This panel needs single power supply voltage. Its backlight is conntroll=
ed
> +via PWM signal.
> +
> +Example:
> +--------
> +
> +Example device-tree definition when connected to iMX6Q based board
> +
> +	panel: panel-lvds0 {
> +		compatible =3D "tianma,tm070rvhg71";
> +		backlight =3D <&backlight_lvds>;
> +		power-supply =3D <&reg_lvds>;
> +
> +		port {
> +			panel_in_lvds0: endpoint {
> +				remote-endpoint =3D <&lvds0_out>;
> +			};
> +		};
> +	};
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel=
/panel-simple.c
> index 3d2cb8bc4d94..07188dc084df 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1831,6 +1831,30 @@ static const struct panel_desc tianma_tm070jdhg30 =
=3D {
>  	.bus_format =3D MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
>  };
> =20
> +static const struct display_timing tianma_tm070rvhg71_timing =3D {
> +	.pixelclock =3D { 27700000, 29200000, 39600000 },
> +	.hactive =3D { 800, 800, 800 },
> +	.hfront_porch =3D { 12, 40, 212 },
> +	.hback_porch =3D { 88, 88, 88 },
> +	.hsync_len =3D { 1, 1, 40 },
> +	.vactive =3D { 480, 480, 480 },
> +	.vfront_porch =3D { 1, 13, 88 },
> +	.vback_porch =3D { 32, 32, 32 },
> +	.vsync_len =3D { 1, 1, 3 },
> +	.flags =3D DISPLAY_FLAGS_DE_HIGH,
> +};
> +
> +static const struct panel_desc tianma_tm070rvhg71 =3D {
> +	.timings =3D &tianma_tm070rvhg71_timing,
> +	.num_timings =3D 1,
> +	.bpc =3D 8,
> +	.size =3D {
> +		.width =3D 154,
> +		.height =3D 86,
> +	},
> +	.bus_format =3D MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +};
> +
>  static const struct drm_display_mode tpk_f07a_0102_mode =3D {
>  	.clock =3D 33260,
>  	.hdisplay =3D 800,
> @@ -2113,6 +2137,9 @@ static const struct of_device_id platform_of_match[=
] =3D {
>  		.compatible =3D "tianma,tm070jdhg30",
>  		.data =3D &tianma_tm070jdhg30,
>  	}, {
> +		.compatible =3D "tianma,tm070rvhg71",
> +		.data =3D &tianma_tm070rvhg71,
> +	}, {
>  		.compatible =3D "tpk,f07a-0102",
>  		.data =3D &tpk_f07a_0102,
>  	}, {

Looks like these are actually sorted correctly in your patch. However,
when applying these got added after the Toshiba panel that was recently
added, so I resorted again.

Thierry

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAloOyawACgkQ3SOs138+
s6HIlg//Qhd2qzUCy1Mwu/lOqyYhsHXP/uf7jpBLPyRXzlP7x1tbN2TIGDcbsHpr
UiOCZfheOQ3I8nstBrorNdKHgwG06FKC7lA1J4Unz8j7uqWoKgvwNKU2iWps6k9W
FSDGUnyy9v5AbhUqQTGXAxUlRy5u6Ykb68G8xJiSkXVFevkRecg04T0GSX3ZTnxy
BecBcqE6SAhe01InTb3VMopT6gNtQJ7v6UetMII6XbDaOnVlXjnvKwXZpuK2bQP0
I1oHzDjZH+/1VuIt6URL7R9NV7S6Z5yjoA9brQTJvEslv4RYBI1cpZ1SeuPC6Pik
Eu45tG6npYbb3WmnJ0xN8Jxrx3wumkUqQpC2QMQe5foXjZQZonYIpSOiPqTxr9Wc
rlfuMbqZlvZTA+sPpR1iE3P2u6oFpMg6peNlMhoCvprDE4HJ52ZpF/JR0DzB8b5c
YW3qf2+QrGW03EFzDB91wlrkv1UmdIB2numJm9GX0BUmhJNBwJVu8Wc9ztjrBq4R
fVem4UyJu2aAPaej6NGfZPLDillkwY+hDKzTuUSCRK04XhvqIgGyMI0vP3RxIYE/
cUa9qnNHWR80naqzUhJOPM0wV6Khkl+mFnn73Ez+2aGX/cByCoJBt535BWcsjJmr
jNr9Q1lBRu4NQJeffYzkvQepITOIdirWSGy0DT7Lf6KwCTngWZQ=
=DOv2
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--

--===============1932370280==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1932370280==--
