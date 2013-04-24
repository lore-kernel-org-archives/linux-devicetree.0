From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH -next] gpu: host1x: gr2d drivers/gpu/host1x/drm/gr2d.c:
 fix error return code in gr2d_submit()
Date: Wed, 24 Apr 2013 08:38:33 +0200
Message-ID: <20130424063833.GA1429@avionic-0098.mockup.avionic-design.de>
References: <CAPgLHd8Nj-K4X8gX4_bMFcYjCBU=XzFnGidhvfF0ZtoCXCv0qg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAPgLHd8Nj-K4X8gX4_bMFcYjCBU=XzFnGidhvfF0ZtoCXCv0qg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: grant.likely@linaro.org, rob.herring@calxeda.com, tbergstrom@nvidia.com, amerilainen@nvidia.com, yongjun_wei@trendmicro.com.cn, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2013 at 10:19:27AM +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>=20
> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
>=20
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> ---
>  drivers/gpu/host1x/drm/gr2d.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/host1x/drm/gr2d.c b/drivers/gpu/host1x/drm/gr2d.c
> index 6a45ae0..146cd64 100644
> --- a/drivers/gpu/host1x/drm/gr2d.c
> +++ b/drivers/gpu/host1x/drm/gr2d.c
> @@ -135,8 +135,10 @@ static int gr2d_submit(struct host1x_drm_context *co=
ntext,
>  			goto fail;
> =20
>  		bo =3D host1x_bo_lookup(drm, file, cmdbuf.handle);
> -		if (!bo)
> +		if (!bo) {
> +			err =3D -EINVAL;

I think in this case a better error code would be -ENOENT. Other than
that this patch looks good.

Thierry

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRd33pAAoJEN0jrNd/PrOhFuQQAJO5t6gzYDocjQ/WNMBreLG3
Z5y6sxJFjlZa98wACZzjZPVU06agtOiBuKFRWBK2uuDuQb1gIGfzdLXQh7OEdCu9
RiRB23p5Mn8J8mxQN8H6T0yG7MeUAiA0zaP9zVagIhcKuFewcW4NhdwiTPXk27Dm
QRFleQrTQF08ET7l3DDV6DEy53kcUxOmQyfeH2/FajmbFYq27HSInRhYRJyTw3h/
8mfLnTvMmxJs4ANfcVKYpz6diIPVvEvcWrUMOYqxEau3VsQ65qzRhyLdMjYAafgh
Qf2FwbxzGHl+lCI/NbT2Xqyei3g4Z8MQF1FzC3w/lKAGA94iNftiuCS4ZAyOh8h7
2cRPOg4z5D/lq07YqnUB5p77O1bIslF6mPMb3IbmXp6hDUPVSieB2hDve/H0HhpL
DTVuafrAeAZgDv41xiDeFKz55FjR85MZOSlnaXW1DagLeGOIsIwjjoQQeHRrOqmX
Txsv49qm1lh5ZBdIVsLU04n6eGZaktqHiAKBkHq2tBug+V0EjXI0S4PdbJwcPNCz
0Fuo7e65gXrUC4DqUDoNeLoVYx4DQ4oTOglUJdHSIQ2SCGulKeAo+3F1/nLwVt7v
0sYhUa2fE3+E4bFl0XcvPfd8QNmusUEYTMxklFD1sWRcEHGiTRuda7trp/XUI+KJ
4laWrJNS19C4Z8MHa4Ai
=wTJx
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
