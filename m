From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] dt-bindings: display/panel: Add missing unit names
Date: Wed, 3 Apr 2019 18:15:17 +0200
Message-ID: <20190403161517.GM5238@ulmo>
References: <901e836ea06889a9d91a799102b2a6b836d93dcd.1553529797.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DXTueXWT3Da08pik"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <901e836ea06889a9d91a799102b2a6b836d93dcd.1553529797.git.agx@sigxcpu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
List-Id: devicetree@vger.kernel.org


--DXTueXWT3Da08pik
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2019 at 05:08:10PM +0100, Guido G=C3=BCnther wrote:
> Some examples were missing the unit names triggering
>=20
>  Warning (unit_address_vs_reg): .../panel: node has a reg or ranges prope=
rty, but no unit name
>=20
> warnings when used verbatim in DTs and running dtc with W=3D1.
>=20
> Signed-off-by: Guido G=C3=BCnther <agx@sigxcpu.org>
> ---
>  .../devicetree/bindings/display/panel/innolux,p079zca.txt       | 2 +-
>  .../devicetree/bindings/display/panel/innolux,p097pfg.txt       | 2 +-
>  .../devicetree/bindings/display/panel/kingdisplay,kd097d04.txt  | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thierry

--DXTueXWT3Da08pik
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyk3BUACgkQ3SOs138+
s6EUSBAAg+iye7nrVWW3qKP9BoY9lnhQAewxgvMoVktvxT+7+GOMKSOeGyjJGhxw
GluTb2Nqv3wGBq6EPv7qm6Fw+3Dlt4x7fkXw6AgEYn/9Aee+VmaXEq6TtqBy36r1
zNWa7LSyHjNT2mMfwE8qltlOPaESocjActvzziGRHlLLS6X0kZB9irDlOBbCSlP+
NXqAipfD7wnHRt0Kl5qnhn27vtsVBEpSiAW8gmqkvJANDlLeW2p4r6aK31Z1B+jR
Lc1+6V5Jb9nQgEhDbW+JD5cJdvesvXv3K5c0Hk2e+4XkR5+2HfLdNvQIF2Kijfcp
mAv7x8JblSIn5c4scD3RBVZaSfI6nJl3BmtdFkCAIU8QT6Jdr3mKPkudh8Ip9WsO
I3xPtLbnJ78bwnLvVx5ZFaM9LJkrocHBc1GioVk6VmfsvEz75HtdUPKc9Hsnq9tD
3WxHrEZzBoKxrBq7JO1BqvJdz0RhTs9WYBHUazDO5wdGqCN6Utr2k8JJL8R+VvZz
+DsBD44EJFkEfKBcL/SBbwlzJCo11qw2midN9jXJYxZoExY+7J2RWxLtPpEMZLH4
rFmDUTlU9wNwPqtWsLdBsANyRTnWwvF4NMvMpwWAfO5MD6IUXvs98F/lnqeTVM7i
Pp/wnFKMPxU36SUXI5KA0CBpks3dBoVGUjqy3MkG0Xy0DHZupYM=
=SpyK
-----END PGP SIGNATURE-----

--DXTueXWT3Da08pik--
