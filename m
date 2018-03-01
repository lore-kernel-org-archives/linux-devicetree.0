From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 00/16] Implement H3/H5 HDMI driver
Date: Thu, 1 Mar 2018 09:23:47 +0100
Message-ID: <20180301082347.go4l7332kjoq5dmm@flea>
References: <20180227222701.9716-1-jernej.skrabec@siol.net>
 <2235934.0TF68fluGz@jernej-laptop>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0840773309=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <2235934.0TF68fluGz@jernej-laptop>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie, mturquette@baylibre.com, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, sboyd@kernel.org, wens@csie.org, robh+dt@kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0840773309==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bms6j7mrz2uzijua"
Content-Disposition: inline


--bms6j7mrz2uzijua
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Feb 28, 2018 at 10:23:35PM +0100, Jernej =C5=A0krabec wrote:
> Dne torek, 27. februar 2018 ob 23:26:45 CET je Jernej Skrabec napisal(a):
> > This series implements H3/H5 HDMI driver. It was tested on OrangePi 2 (=
H3),
> > OrangePi Plus2e (H3) and OrangePi PC2 (H5) with many resolutions and it
> > works well. Bug, which prevented correct operation for some resolutions,
> > is also fixed.
> >=20
> > Code is based on linux-next, next-20180226 tag.
>=20
> Today I tried on this series on  next-20180228, but resolution switching=
=20
> doesn't really work. The reason for this is use of clk_set_rate_exclusive=
() in=20
> sun4i_tcon1_mode_set(). If I revert it to ordinary clk_set_rate() it work=
s ok.=20
> I investigated a bit and it seems that clocks stays at first set even if =
tcon=20
> (the owner of exclusive lock) request the new one. Example:
>=20
> [   69.325732] TCON clk wanted: 148500000
> [   69.325740] TCON real clk: 69272728
> [   69.325770] HDMI clk wanted: 148500000
> [   69.325773] HDMI real clk: 138545455
> [   69.325815] HDMI PHY clk wanted: 148500000
> [   69.325819] HDMI PHY real clk: 138545454
>=20
> Is there anything I can do to help debug this?

I don't recall if disable hook is called during a mode set, but if it
is, you can add a call to clk_rate_exclusive_put.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--bms6j7mrz2uzijua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqXuJIACgkQ0rTAlCFN
r3RkBRAAmbT74UhBx1jf6GnGS1Bu4/2UWpgjR2yq49jHCAeIOvqS53Y9H5NwiJcX
gxpNhfatCOVOohJudP0tVu0onlGJySfz3LkexmruDgu8dL/2bTPgerBPDLybg03f
jWpJSSmnwUFPPQb8uhEMExiE71O/PL4bYlaxjc/aXK/mq3YhD2txTah8qM0mPLZq
CWICp0mfjVyKAwFhNgdGLaXNeCPeAE+r5FRKCRAwX7fHw6G2iyzbQi3ZqQO5poOl
0DZCcsf6IQZC/Ym7lZ0CLwv2xDWEUhXtvora/mRMo42iYzS3a0ldUZg2/xbHy0gv
6q/GHx2sthrcxTyjdsGarIS/oi0fgOZN6D5dl/JOJUrNn8ZYVIBY/B0cOAESZisf
IeP2SXa0nWlQzTGX+gNrdeudcdhJz1wUzv1qmUuhAirpNxbxrAk+U7pECU8nLRNZ
Qo9GeruHmOIGIc16XHbWz6rdhm1Yu4Y8YR3jweMJlo2wvW71B4gStKXU32OSW6Av
L/6kBCawsOdctuBG6hmf/Rfod9D7iE2F/9BBdPeFUSsMsinub1cUxsEDaobP2VXX
VgK8tHoaq4vfx5l6NbUj7f99j2z8s37hjFH3yhkLvBRnF9VSSZPzXuC6pSTO+WDn
c0WFYqoUKSHrkblavABDSGTVntUquc2yuKKGXLW985owcTDq5u4=
=4IPA
-----END PGP SIGNATURE-----

--bms6j7mrz2uzijua--

--===============0840773309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0840773309==--
