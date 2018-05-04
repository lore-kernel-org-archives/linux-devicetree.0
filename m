From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 5/6] drm/vc4: Support the case where the DSI device is
 disabled
Date: Fri, 4 May 2018 12:28:33 +0200
Message-ID: <20180504102833.GJ13459@ulmo>
References: <20180503164009.14395-1-boris.brezillon@bootlin.com>
 <20180503164009.14395-6-boris.brezillon@bootlin.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2103088903=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180503164009.14395-6-boris.brezillon@bootlin.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org


--===============2103088903==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/qIPZgKzMPM+y5U5"
Content-Disposition: inline


--/qIPZgKzMPM+y5U5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 03, 2018 at 06:40:08PM +0200, Boris Brezillon wrote:
> Having a device with a status property !=3D "okay" in the DT is a valid
> use case, and we should not prevent the registration of the DRM device
> when the DSI device connected to the DSI controller is disabled.
>=20
> Consider the ENODEV return code as a valid result and do not expose the
> DSI encoder/connector when it happens.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/gpu/drm/vc4/vc4_dsi.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> index 8aa897835118..db2f137f8b7b 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -1606,8 +1606,18 @@ static int vc4_dsi_bind(struct device *dev, struct=
 device *master, void *data)
> =20
>  	ret =3D drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
>  					  &panel, &dsi->bridge);
> -	if (ret)
> +	if (ret) {
> +		/* If the bridge or panel pointed by dev->of_node is not
> +		 * enabled, just return 0 here so that we don't prevent the DRM
> +		 * dev from being registered. Of course that means the DSI
> +		 * encoder won't be exposed, but that's not a problem since
> +		 * nothing is connected to it.
> +		 */
> +		if (ret =3D=3D -ENODEV)
> +			return 0;
> +
>  		return ret;
> +	}
> =20
>  	if (panel) {
>  		dsi->bridge =3D devm_drm_panel_bridge_add(dev, panel,
> @@ -1652,7 +1662,8 @@ static void vc4_dsi_unbind(struct device *dev, stru=
ct device *master,
>  	struct vc4_dev *vc4 =3D to_vc4_dev(drm);
>  	struct vc4_dsi *dsi =3D dev_get_drvdata(dev);
> =20
> -	pm_runtime_disable(dev);
> +	if (dsi->bridge)
> +		pm_runtime_disable(dev);

Is this safe? This uses component/master, so dsi->bridge is going to
remain valid until the driver's ->remove() is called. So technically you
could have a situation where drm_of_find_panel_or_bridge() returned some
error code that remains stored in dsi->bridge and cause the above
condition to be incorrectly true.

Thierry

--/qIPZgKzMPM+y5U5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlrsNdEACgkQ3SOs138+
s6EPOw/+KvgblyGmN/snF9JP9maRW0sl0adcauBQzuxwAyiooU38R0OpbTImxtpS
N03O1iS15VIOM9Xk8RUK6rNDlVmtAYIUrrYVYYXExJDdz16Ztf+PxBF7qQniF3UR
2HZo3tQCdsPKDv3A0tUWwDQf58erSun8YGNVa+9Q29bn36YldOdCco+mSVRMdnkB
X2HncPzSl/LHDgXDdK+Q7Ms2nV+vrqT88cQrKgWfwp2AkRAHLPijKIr5+Hs+aLdy
KvQnvQIF1Wz2WAzZAg3IKyFKzN3s3A0YQPCgBONMo7fAHdmbYRVVdn9Y0OmCiIAO
StJtF2nad7Ev4VKqAziQWh3WRM6HvevVEIqXQEb16L3EqhL7kFgXin5bFgE8FHqK
godR76K5qnfkHdV9BTGq8HuY5ndgVJ+LfdRM0ZNs9Pld4IAflExZqF1hHgtcwd/b
0yW1T3a4zS7U0v36/sOC1yQ1LLKWRODJj3nulxDJe/rFWsMD39omxAhN1TCE5Mer
KtdEIHmuvakvpiDsCm/sMzg+FBBl3aKvRN+miDtxFyQidvrGEs9er0CjjcNvQDL/
DrDd7VeNGVDzSxMIJdJsaV/gtGU3ppQBSTcx9vyrHbiFJv/GI9pHsyC2/xm5hYH0
tZ5cJaiRdORCdJDXc8Twk3V4kbHObDaSZtpeZN3KPbLeojTlZBo=
=4YUj
-----END PGP SIGNATURE-----

--/qIPZgKzMPM+y5U5--

--===============2103088903==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2103088903==--
