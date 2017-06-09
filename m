From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 04/11] drm: sun4i: add support for H3's TCON0/1
Date: Fri, 9 Jun 2017 16:48:25 +0200
Message-ID: <20170609144825.jdalt2xakhcenhk5@flea.home>
References: <20170604160149.30230-1-icenowy@aosc.io>
 <20170604160149.30230-5-icenowy@aosc.io>
 <3642057.oKT9kIlu8M@jernej-laptop>
 <493AC6F2-3CB3-48F5-9568-A34AA927238F@aosc.io>
 <20170607094343.qqiwnu2mhmoi6jn7@flea.lan>
 <52F9F9C7-9A9C-435D-A0AF-FDD4317DAD69@aosc.io>
 <20170607141957.akonr7hmuwpt7hlt@flea.lan>
 <4CD8A3BB-965C-4C74-884C-ACE8AAF9989B@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1667399333=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <4CD8A3BB-965C-4C74-884C-ACE8AAF9989B@aosc.io>
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
Cc: devicetree@vger.kernel.org, Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Icenowy Zheng <icenowy@aosc.xyz>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1667399333==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zgw3qpblkivtsmek"
Content-Disposition: inline


--zgw3qpblkivtsmek
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 07, 2017 at 10:21:02PM +0800, Icenowy Zheng wrote:
>=20
>=20
> =E4=BA=8E 2017=E5=B9=B46=E6=9C=887=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=881=
0:19:57, Maxime Ripard <maxime.ripard@free-electrons.com> =E5=86=99=E5=88=
=B0:
> >On Wed, Jun 07, 2017 at 05:44:56PM +0800, Icenowy Zheng wrote:
> >> =E4=BA=8E 2017=E5=B9=B46=E6=9C=887=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=
=885:43:43, Maxime Ripard
> ><maxime.ripard@free-electrons.com> =E5=86=99=E5=88=B0:
> >> >On Mon, Jun 05, 2017 at 03:03:47AM +0800, Icenowy Zheng wrote:
> >> >> >You should also expand function sun4i_drv_node_is_tcon() at
> >> >sun4i_drv.c
> >> >> >with=20
> >> >> >new entries, but I'm not sure if this fits in this patch.
> >> >>=20
> >> >> Instead I think it should be renamed to something like
> >> >> "sun4i_drv_node_is_tcon_with_ch0".
> >> >
> >> >I'm not sure, or at least, it shouldn't make any difference, since
> >> >TCON without a channel 0 will not have an endpoint 0, so this will
> >be
> >> >dealt with already.
> >>=20
> >> But that will prevent new coders from add CH1-less TCON
> >> compatibles to this function.
> >
> >Why? We already have such TCONs (like the A33's, or V3S') in that
> >function.
>=20
> Sorry, CH0-less.

That's not really an issue I think, since the endpoint 0 will not be
there on those TCONs, the code will bail out.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--zgw3qpblkivtsmek
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZOrU5AAoJEBx+YmzsjxAg39cQALEd+/Hwu2uw7R025Kjt2MxO
RqedJCkG4kwcAfig4DatB9k/7f9b3XRN3oY35UHKPeCw41dwAx2z2feiLNHqkIEz
yBzW647C6UXaxWb7S+4oAPG5th+vtw9cWShN7eiSPMyMCC0IyvMiKuUARAgiIulK
UgMvCRYkp/YJ4NDMmWeUF1bGEgatblKCYhtIbLUekyZoMw9VYSlTw3FMyTg4NZiF
TnrBc29ZRrK7KAK/FpQRacvS3C6Np1vYSPInFi4fHYJfrMxwEJgC9ytlw0gwy20R
debt8hOch4+iAYhvbA7pKpkfddq6jTa0AoeCKnTmSmYLsE/in1ntwj1xDPlpvWhL
nacweUSn55+1O5vUUYfqXbK1EHl1NJ1a6aBJbK0/h3iJJ13Ani0VTHouq3yNdVLN
DZecANHbRKmCe2mz60wdnm9O1X9baipIXn7ulnrf3rUx844EA+IrXhr5V1S4UoQ/
RTyN3u/gIH4H0HZ7j0LlN2J1Wu6CvHcAGMGygyRy7YT/GMAw5XuZk5sSWYyovzsc
GDEZ8Snmt5LvM34YKjdsqu1/6iSqw9VXjuiQ4RLVPexQa6TVehT1a4qSttLrel/5
HwDQy6zGeK5OzqI/mpIj8+ocC9nPt0M7oNnAVnHfy3zRaHZ10kuSfipzxJKKyvhb
qqrWbHlL9TsPBmjhTPW/
=sfxH
-----END PGP SIGNATURE-----

--zgw3qpblkivtsmek--

--===============1667399333==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1667399333==--
