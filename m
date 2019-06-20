From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH 3/4] dt-bindings: display: Convert panel-lvds to DT
 schema
Date: Thu, 20 Jun 2019 11:06:09 +0200
Message-ID: <20190620090609.GD26689@ulmo>
References: <20190619215156.27795-1-robh@kernel.org>
 <20190619215156.27795-3-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0266225881=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190619215156.27795-3-robh@kernel.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>
List-Id: devicetree@vger.kernel.org


--===============0266225881==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Hf61M2y+wYpnELGG"
Content-Disposition: inline


--Hf61M2y+wYpnELGG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2019 at 03:51:55PM -0600, Rob Herring wrote:
> Convert the panel-lvds binding to use DT schema. The panel-lvds schema
> inherits from the panel-common.yaml schema and specific LVDS panel
> bindings should inherit from this schema.
>=20
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/display/panel/panel-lvds.txt     | 121 ------------------
>  .../bindings/display/panel/panel-lvds.yaml    | 107 ++++++++++++++++
>  2 files changed, 107 insertions(+), 121 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/panel=
-lvds.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel=
-lvds.yaml

Similar to my comments on panel-common.yaml, perhaps make this just
lvds.yaml? Otherwise:

Acked-by: Thierry Reding <treding@nvidia.com>

--Hf61M2y+wYpnELGG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0LTIEACgkQ3SOs138+
s6FLsw/+NC/6Khpjg6ysa3WInhNhqMUsQWEt+rIBtVK3wuiFuV3Fmhbj5eTi7pip
azMl6odp9t4TnQbzpAbqOwA73Xsp1KWdjGawLxeZTXcdckPrMMzTbiCbbLkw3nuA
26f+cj53Kp5vmuJlxOllFWS8YB3tPy0rV6+7DDBKqONdIne14CUu118dFgJMOcxq
ATqXCBQGd9SJE0XRkVwY5uixnKjeuy2SMr1JU+Ear6UQqF2hVc9Lrkxs4Dd4YbMc
GqcdrUuaSvUifujZ2dr1aZt6WleALu0yHfUnd/cuo3JOjBhsSJbrCg6EPMFdlsdh
QjiWZCVsAnaO6NMLsLrxzTkDOsZnBW8T38bh+jIPEXgCGsKTNIOKaXtXPrKqPkPK
5hy95N1u5UgvPNUw4BPVUVzjcuHgTuevyHrfnvR7cYa1BspbdVMhvwjifPTCR5Qa
pSAezwB/wVTLpLEeq3wySXAHj3VACaGtAfuunZ1i7V2x0hMe4W2wYj3SGWMEAUo6
srlTiiDZYxrZk5+ot2pRzlFIH4rC+iTTOKtnhnQzyeQA1kgqeouvHuHjJlBP2ZQD
mul4nf2BMRhopoccrOLOw2ElpoyVQebipi3xkkapvrBY+0Y+c2N3zt5v4QLmuBvN
4n9yVm1sJd8FTC3iRG9UnBCN8hxc3MnRlZd3nr1xDze2ujRNFUQ=
=Cr2T
-----END PGP SIGNATURE-----

--Hf61M2y+wYpnELGG--

--===============0266225881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0266225881==--
