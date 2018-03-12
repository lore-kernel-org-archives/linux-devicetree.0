From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 4/7] drm/panel: simple: Add support for KEO
 TX31D200VM0BAA
Date: Mon, 12 Mar 2018 09:51:20 +0100
Message-ID: <20180312085120.GI23060@ulmo>
References: <1517766571-409-1-git-send-email-jagan@amarulasolutions.com>
 <1517766571-409-5-git-send-email-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1361642366=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1517766571-409-5-git-send-email-jagan@amarulasolutions.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jagan Teki <jagannadh.teki@gmail.com>
Cc: devicetree@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Michael Trimarchi <michael@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1361642366==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cVp8NMj01v+Em8Se"
Content-Disposition: inline


--cVp8NMj01v+Em8Se
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 04, 2018 at 11:19:28PM +0530, Jagan Teki wrote:
> This adds support for the Kaohsiung Opto-Electronics.,
> TX31D200VM0BAA 12.3" HSXGA LVDS panel, which can be
> supported by the simple panel driver.
>=20
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes for v3:
> - collect Rob reiew tag=20
> Changes for v2:
> - Updated binding info about optional properties, node and example
>=20
>  .../bindings/display/panel/koe,tx31d200vm0baa.txt  | 25 ++++++++++++++++=
++++
>  drivers/gpu/drm/panel/panel-simple.c               | 27 ++++++++++++++++=
++++++
>  2 files changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/koe,t=
x31d200vm0baa.txt

The koe vendor prefix is undocumented, please send a patch to add it to
Documentation/devicetree/bindings/vendor-prefixes.txt.

Thierry

--cVp8NMj01v+Em8Se
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqmP4gACgkQ3SOs138+
s6GLcBAAhNvdehaUZ21MnpGeyuwXRUkis+3CuWKTZG+yE5Ou7dng/5qQp23l32Fz
G5sMPkjhp8IHAwoR9Lx/VX7sBF82X4nobVL04nNjwbmPFYYrqgwMu20MrorgHcOs
cjOBBa4lw5ilTzxbcU3rq0hzLM0TQseQXirAsx6Gc7X7WmjGupD5eaiVbR7w+0aT
ZvNKgUkOFsP9wXIKlYd4CycRIlTmv3bD1f23FGM5KVHS7zH2mG1SfEcCt1hxPpIJ
5RUdcgfroiuE+Mceu8HWmwynDDiaDDn+sDZ0qqh1sNYuuD98mMU2RDf0WBNwOtdb
X5Dnz7DW4C8N5528xe08WJhgsQM6ez2j/qqCXsWF2MW/9+8srkikOXZygyFOatLc
fESPDZnHRyeUvjMxvAyu3jFeuxYCfTYquhV1ZGzLPnxbzrJ32VERJp7DZYhIhSfO
Gqm7zeo99YYe5IN1z/16DqK/F9vBcg2gNA7lHg+V7+IwfS6I1SVIqisGu4E+sLqU
ZI/RG/Bfoqm4QR597wF3Otb3rkJnc1zQKLdmZYqf8skXlyS/1Bn69LkqNheERWVw
wLbh1OcROWUSeDHdtOzPOuotPZNoS4Ku6WgSFvLL/J3dOJRRGuZPl6fGubX5c4br
yyAUScOV1FWuarKsz/uyC46zhP5QydKIYR7cAzm60KzWqdglIsc=
=kLks
-----END PGP SIGNATURE-----

--cVp8NMj01v+Em8Se--

--===============1361642366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1361642366==--
