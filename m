From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v11 4/7] dt-bindings: sun6i-dsi: Add VCC-DSI supply
 property
Date: Thu, 3 Oct 2019 15:30:31 +0200
Message-ID: <20191003133031.gowixvfbdaif4sdf@gilmour>
References: <20191003064527.15128-1-jagan@amarulasolutions.com>
 <20191003064527.15128-5-jagan@amarulasolutions.com>
 <20191003114733.56mlar666l76uoyb@gilmour>
 <0086CD40-F161-4B33-8D76-8DCA20E7DB07@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1685277540=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <0086CD40-F161-4B33-8D76-8DCA20E7DB07@aosc.io>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: devicetree@vger.kernel.org, michael@amarulasolutions.com, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi <linux-sunxi@googlegroups.com>, Jagan Teki <jagan@amarulasolutions.com>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1685277540==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xl6ox63chtxqzxbp"
Content-Disposition: inline


--xl6ox63chtxqzxbp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 03, 2019 at 09:04:03PM +0800, Icenowy Zheng wrote:
> =E4=BA=8E 2019=E5=B9=B410=E6=9C=883=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
7:47:33, Maxime Ripard <mripard@kernel.org> =E5=86=99=E5=88=B0:
> >On Thu, Oct 03, 2019 at 12:15:24PM +0530, Jagan Teki wrote:
> >> Allwinner MIPI DSI controllers are supplied with SoC DSI
> >> power rails via VCC-DSI pin.
> >>
> >> Some board still work without supplying this but give more
> >> faith on datasheet and hardware schematics and document this
> >> supply property in required property list.
> >>
> >> Reviewed-by: Rob Herring <robh@kernel.org>
> >> Tested-by: Merlijn Wajer <merlijn@wizzup.org>
> >> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >> ---
> >>  .../bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml         | 3
> >+++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git
> >a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi=
=2Eyaml
> >b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi=
=2Eyaml
> >> index 47950fced28d..9d4c25b104f6 100644
> >> ---
> >a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi=
=2Eyaml
> >> +++
> >b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi=
=2Eyaml
> >> @@ -36,6 +36,9 @@ properties:
> >>    resets:
> >>      maxItems: 1
> >>
> >> +  vcc-dsi-supply:
> >> +    description: VCC-DSI power supply of the DSI encoder
> >> +
> >
> >The driver treats it as mandatory, so I've added it to the binding, as
> >suggested by the commit log.
>
> No. The regulator_get function will return dummy regulator, rather than
> fail, if the regulator is not specified.

Yes. And this deals nicely with the backward compatibility case. The
regulator is there on all the SoCs, so there's no reason to leave it
out.

Maxime

--xl6ox63chtxqzxbp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZX39wAKCRDj7w1vZxhR
xfdtAP9iY02ClBdX7PytSYTVv7u9rk5qFxNbRhfligYsza6diwEA+bXtRpDjiCDy
YsfwN2Wm3Vvp2K/WtdvzfKezGk0WpAo=
=iYP9
-----END PGP SIGNATURE-----

--xl6ox63chtxqzxbp--

--===============1685277540==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1685277540==--
