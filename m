From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/panel: simple: Add support for Seiko 43WVF1G
Date: Thu, 2 Feb 2017 21:18:32 +0100
Message-ID: <20170202201832.GB9941@ulmo.ba.sec>
References: <1486065840-13575-1-git-send-email-breno.lima@nxp.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1638420744=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1486065840-13575-1-git-send-email-breno.lima@nxp.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Breno Lima <breno.lima@nxp.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, fabio.estevam@nxp.com, shawnguo@kernel.org, brenomatheus@gmail.com
List-Id: devicetree@vger.kernel.org


--===============1638420744==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Content-Disposition: inline


--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2017 at 06:04:00PM -0200, Breno Lima wrote:
> Add support for Seiko Instruments Inc. 4.3" WVGA (800 x RGB x 480)
> TFT with Touch-Panel, which can be supported by the simple panel driver.
>=20
> Data-sheet available at:
> http://www.glyn.de/data/glyn/media/doc/43wvf1g-0.pdf
>=20
> Signed-off-by: Breno Lima <breno.lima@nxp.com>
> ---
>  .../bindings/display/panel/sii,43wvf1g.txt         |  7 ++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 28 ++++++++++++++++=
++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sii,4=
3wvf1g.txt
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/sii,43wvf1g.=
txt b/Documentation/devicetree/bindings/display/panel/sii,43wvf1g.txt
> new file mode 100644
> index 0000000..bbbc49f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/sii,43wvf1g.txt
> @@ -0,0 +1,7 @@
> +Seiko Instruments Inc. 4.3" WVGA (800 x RGB x 480) TFT with Touch-Panel
> +
> +Required properties:
> +- compatible: should be "sii,43wvf1g"
> +
> +This binding is compatible with the simple-panel binding, which is speci=
fied
> +in simple-panel.txt in this directory.
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel=
/panel-simple.c
> index 06aaf79..0e08c56 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -863,6 +863,31 @@ static const struct panel_desc hannstar_hsd070pww1 =
=3D {
>  	.bus_format =3D MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
>  };
> =20
> +static const struct display_timing sii_43wvf1g_timing =3D {
> +	.pixelclock =3D { 33500000, 33500000, 33500000 },
> +	.hactive =3D { 800, 800, 800 },
> +	.hfront_porch =3D {  164, 164, 164 },
> +	.hback_porch =3D { 89, 89, 89 },
> +	.hsync_len =3D { 10, 10, 10 },
> +	.vactive =3D { 480, 480, 480 },
> +	.vfront_porch =3D { 10, 10, 10 },
> +	.vback_porch =3D { 23, 23, 23 },
> +	.vsync_len =3D { 10, 10, 10 },
> +	.flags =3D DISPLAY_FLAGS_DE_LOW,
> +};

I was going to say that you should list minimum and maximum values, and
that the default implementation will give you the typical values, but it
seems like the datasheet doesn't have minimum and maximum values, so
this looks fine.

Shawn, Fabio, anyone want to give this a Tested-by? I take it that this,
in combination with Fabio's patch to fix the displacement would make the
SabreSD display work properly?

Thierry

--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliTlBUACgkQ3SOs138+
s6FDAw/7BZWr1TgKpAzE/GNqVtWbPQOFHLBjS5f2V+S6RlOU32soTJs3kDOKdIwC
jfieCcn44VRmG8cri1/cbC/wh1quQb1E2A/WRt4E8evJ+YSJA8SG8KfxvtADES6M
v8ouPaz4DvPiljMNo9TUDGKyuHIpIXeGNkN87Ie2Ct5fkmp+RuAUdQTx+WD55DmO
ctYy4m9DAxs2bC1tPsRli32o4Z5Dww2EtvdXZxx1o44POQjCPyWlcxsYKmmtzJT4
2FQzSemwCSRS7yWT8I6RoXL3sDuGBv/xUCRUzexSTJfBYEy2DA28qJraVgZvxmq+
01TBx324UE91HZCs1e197qBUF/p2MWlHIA7YMGcY15ax2jySvI16gHtoWsotIrCN
UdTKs6puXoYXMiTKtcKW/4UVbU7V31f1NVSjMc5Bn0hfafpkJdn+SMd+56tJpOwr
nr1LOPNQk5INNtScS7rslwV6/xjj7qe0a2lguQDExVK7kkODES9NtQjG6WNh9z54
D3qc5fdUG/T9xkg1eFA/oDEM7cgvzCBgBkd9KNBPu4WaLQ51BnfbioEYBuNEt/On
S5H72NuH0Hb11gonLZl3y+ff8lUmjvS6KNxSs+3HJngfz+a9RS20K98ieg10/IMj
YYbgK4RNwmorttOiIfmshRPOAkdkttyL93kPCTquwyahqQ5zksI=
=DdSg
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--

--===============1638420744==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1638420744==--
