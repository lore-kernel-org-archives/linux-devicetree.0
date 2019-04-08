From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 1/7] dt-bindings: Add panel-timing subnode to
 simple-panel
Date: Mon, 8 Apr 2019 12:32:40 +0200
Message-ID: <20190408103240.GF6644@ulmo>
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190401171724.215780-2-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6v9BRtpmy+umdQlo"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190401171724.215780-2-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Sean Paul <seanpaul@chromium.org>, linux-rockchip@lists.infradead.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, Boris Brezillon <boris.brezillon@collabora.com>, Ezequiel Garcia <ezequiel@collabora.com>, Enric =?utf-8?B?QmFsbGV0YsOy?= <enric.balletbo@collabora.com>, Rob Herring <robh+dt@kernel.org>, mka@chromium.org, Eric Anholt <eric@anholt.net>, Jeffy Chen <jeffy.chen@rock-chips.com>, =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, Daniel Vetter <daniel@ffwll.ch>
List-Id: devicetree@vger.kernel.org


--6v9BRtpmy+umdQlo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 01, 2019 at 10:17:18AM -0700, Douglas Anderson wrote:
> From: Sean Paul <seanpaul@chromium.org>
>=20
> This patch adds a new subnode to simple-panel allowing us to override
> the typical timing expressed in the panel's display_timing.
>=20
> Changes in v2:
>  - Split out the binding into a new patch (Rob)
>  - display-timings is a new section (Rob)
>  - Use the full display-timings subnode instead of picking the timing
>    out (Rob/Thierry)
> Changes in v3:
>  - Go back to using the timing subnode directly, but rename to
>    panel-timing (Rob)
> Changes in v4:
>  - Simplify desc. for when override should be used (Thierry/Laurent)
>  - Removed Rob H review since it's been a year and wording changed
> Changes in v5:
>  - Removed bit about OS may ignore (Rob/Ezequiel)
>=20
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Jeffy Chen <jeffy.chen@rock-chips.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: St=C3=A9phane Marchesin <marcheu@chromium.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-rockchip@lists.infradead.org
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>=20
>  .../bindings/display/panel/simple-panel.txt   | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/simple-panel=
=2Etxt b/Documentation/devicetree/bindings/display/panel/simple-panel.txt
> index b2b872c710f2..93882268c0b9 100644
> --- a/Documentation/devicetree/bindings/display/panel/simple-panel.txt
> +++ b/Documentation/devicetree/bindings/display/panel/simple-panel.txt
> @@ -15,6 +15,16 @@ Optional properties:
>    (hot plug detect) signal, but the signal isn't hooked up so we should
>    hardcode the max delay from the panel spec when powering up the panel.
> =20
> +panel-timing subnode

Is there any reason why we need the panel- prefix? This is already part
of a panel definition, so it's completely redundant. Why not just name
the subnode "timing"?

Thierry

--6v9BRtpmy+umdQlo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyrI0cACgkQ3SOs138+
s6EmNw/6Av1wNN5Roa8hoku4c8OavdcswUnRwEzieyEcc6eYFZLYSNb26xrVN1Ln
rbyIjZVK6CSnIxrjaEN8kYzUcyUMnr0ovP9enJ9TCCyZoTBid+E5czhmpUHjsv/R
V3yRVqTzfwrZ3lRwk+ZOnD7VrxithhIiiLiV62TsNGytGWMn02V1aTSp0+2tSrQE
aUhKgWtc5DU1wXfR6ZHp3hhuUSJKqcOECuNyJ1tRqmuTtaKiEbrRPWxX32TZhKsv
JFClYZ8CS+Lq2ybtl0tT+33dofVFSLvEsxEAxaxFixWrgcbXW0uwQxmE795WfaoC
o15jXzQJa5qbZ+hLcvPY5nVdLeMH0I1/V0vTQf3Zd1vVRKG3kT3GRMNAi2HUK5mU
ITPJdnxpGVoAEO0hGtlZGBTocb+nnWhdV9H5z1iN5bUkV2H41JoqyRT7HX+V1tjp
+c9l2kk4+K9tyZsLj0Igw9v2YvD1Hmtlvb7S2ptDD/IPHKzfgk2LetcXzcCi4leG
CtrFBFKvNWrwr1YAtDgqiSa4XRNnWyUkkA5PSdfZvtgLNsb3AEKK82mhsohMWnZB
ARHTqUYo5PFtrd1vtHB6hsEbZxZbJ913UOFFztph7OgMwPTOobUdxzP+/EJwxlD7
UvxmywqatQoLvv2RSQFrO6PzPYgfSOtf8F2sQJV0nK7DKb6pfCA=
=B+cu
-----END PGP SIGNATURE-----

--6v9BRtpmy+umdQlo--
