From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [linux-sunxi] [PATCH 14/15] ARM: dts: sun8i: h3: Enable HDMI
 output on H3 boards
Date: Tue, 27 Feb 2018 08:07:35 +0100
Message-ID: <20180227070735.ml3mc4nr4vpge57u@flea>
References: <20180224214545.3740-1-jernej.skrabec@siol.net>
 <2676311.2IEVhXnSIE@jernej-laptop>
 <4AA78C45-E139-417E-BE89-FE0BFBC409B0@aosc.io>
 <2342395.9m6rrqTry7@jernej-laptop>
 <CAGRGNgU8-uJuns7mAzS-gc81qvVAkS9JS2Tm13p2Qp7dMDCNkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1890922532=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAGRGNgU8-uJuns7mAzS-gc81qvVAkS9JS2Tm13p2Qp7dMDCNkg@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Julian Calaby <julian.calaby@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, jernej.skrabec@siol.net, David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>, linux-sunxi <linux-sunxi@googlegroups.com>, dri-devel <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, sboyd@kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "Mailing List,
 Arm" <linux-arm-kernel@lists.infradead.org>, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org


--===============1890922532==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hvvzilz5wqazdv4s"
Content-Disposition: inline


--hvvzilz5wqazdv4s
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2018 at 01:29:27PM +1100, Julian Calaby wrote:
> Hi Jernej,
>=20
> On Tue, Feb 27, 2018 at 3:27 AM, Jernej =C5=A0krabec <jernej.skrabec@siol=
=2Enet> wrote:
> > Hi,
> >
> > Dne ponedeljek, 26. februar 2018 ob 17:21:05 CET je Icenowy Zheng napis=
al(a):
> >> =E4=BA=8E 2018=E5=B9=B42=E6=9C=8827=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=
=8812:16:44, "Jernej =C5=A0krabec"
> > <jernej.skrabec@siol.net> =E5=86=99=E5=88=B0:
> >> >Hi Julian,
> >> >
> >> >Dne nedelja, 25. februar 2018 ob 09:11:34 CET je Julian Calaby
> >> >
> >> >napisal(a):
> >> >> Hi Jernej,
> >> >>
> >> >> On Sun, Feb 25, 2018 at 8:45 AM, Jernej Skrabec
> >> >
> >> ><jernej.skrabec@siol.net>
> >> >
> >> >wrote:
> >> >> > Enable HDMI output on all boards which have HDMI connector.
> >> >> >
> >> >> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> >> >> > ---
> >> >> >
> >> >> >  arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts    | 25
> >> >> >  ++++++++++++++++++++++ arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
> >> >> >
> >> >> >   | 25 ++++++++++++++++++++++
> >> >> >
> >> >> >  arch/arm/boot/dts/sun8i-h3-libretech-all-h3-cc.dts | 25
> >> >> >  ++++++++++++++++++++++ arch/arm/boot/dts/sun8i-h3-nanopi-m1.dts
> >> >> >
> >> >> >   | 25 ++++++++++++++++++++++
> >> >
> >> >arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
> >> >
> >> >> >         | 25 ++++++++++++++++++++++
> >> >> >
> >> >> >  arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts       | 25
> >> >> >  ++++++++++++++++++++++ arch/arm/boot/dts/sun8i-h3-orangepi-one.d=
ts
> >> >> >
> >> >> >   | 24 +++++++++++++++++++++
> >> >
> >> >arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
> >> >
> >> >> >        | 25 ++++++++++++++++++++++ 8 files changed, 199
> >> >
> >> >insertions(+)
> >> >
> >> >> As I understand it, the H2+ is just a slightly trimmed down H3. In
> >> >> terms of HDMI support, the difference is that the H2+ can't output
> >> >
> >> >4k.
> >> >
> >> >> If this code is compatible with the H2+, could you please add the
> >> >> necessary bits and pieces to the h2-plus DTSs too?
> >> >
> >> >There are only 3 H2+ boards in kernel and none of them has HDMI
> >> >connector, so
> >>
> >> BPi M2 Zero has miniHDMI connector.
> >
> > Ah, sorry, I missed that one. Since I don't have it (or any other board=
 with
> > H2+) I'm not really comfortable including such patch. If anyone will te=
st it,
> > I can include it in next revision.
>=20
> I have one of those (this is why I'm interested in this patchset) so
> I'm willing to test, however I can't guarantee I'll get to it quickly.

Then I guess the best way forward will be to keep the current patch as
is, and you'll send a patch whenever you have the time to test it.

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--hvvzilz5wqazdv4s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqVA6gACgkQ0rTAlCFN
r3Q6vg/9Fm4ScE+f0ZUY+8HUDprDlD6ldpEISEpdTAjAJWM79FS1uGjliUeykw3r
+W2ILskyTqcyI4vWoV7IfGfdj5AdHYgu4Kl11jgk692Xsli8Tcmj1j1HSeFVGShq
Zi5uRUDRbWegypGTCqFKp7xpZaMpv+9h3cQ02hdqOzxieu/On9hWWK+2siI7L9Uo
Og0DPCvyNTnEMFvi+7UHHlKSHVmIrNdx5D8Ey2rk8hC2Y4R4cA4FPFRzGp4sYzor
GEtKGM/cbB1xFgtCNaUjs4I+pEi8ZGowc7UZ0mVdKHsH7IhkEj1kC+LJRP2r5mMf
nfLESFP/0ovvg6wTPrwZkLWGnYoEEIH1YgodzwO//2IOZHxrFh+ZL1bGrfQg9mUV
tqiOP5aRaWCMYZy9NN5MQZ8jajPmQrxBsrrEoB8/B5DDaWRb7vnbNjqhNUVgmTh6
2C/pHxFZbgMLSXR1Hkj0Ph50AZaQeqO381JsrI6SM5xXnGUrg4K4C7i/xtxyhdWU
XZXw/rm4kLSCbBHQvNicrILn0PZh0fAKvsmClmFmxv6bMeXPAlRimM+uQjzaR7o/
vCq253+Ne61sOPSRjgyJl2tqjEof2CIUTYwS8+U+57DYcgg678e2Qv8Br2cdYENX
kJVUbQ8vbEYm4VMGApRBsWAsakQwgnK0QVuCJ53nhNp4Nu5c5wM=
=8IBn
-----END PGP SIGNATURE-----

--hvvzilz5wqazdv4s--

--===============1890922532==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1890922532==--
