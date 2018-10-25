From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 0/3] drm: tinydrm driver for adafruit PiTFT 3.5"
 touchscreen
Date: Thu, 25 Oct 2018 09:29:35 -0700
Message-ID: <87h8harnv4.fsf@anholt.net>
References: <20181024184313.2967-1-eric@anholt.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1151064724=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181024184313.2967-1-eric@anholt.net>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org

--===============1151064724==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Eric Anholt <eric@anholt.net> writes:

> I was going to start working on making the vc4 driver work with
> tinydrm panels, but it turned out tinydrm didn't have the panel I had
> previously bought.  So, last night I ported the fbtft staging
> driver over to DRM.
>
> It seems to work (with DT at
> https://github.com/anholt/linux/commits/drm-misc-next-hx8357d) --
> fbdev works great including rotated, and so does modetest.  However,
> when X11 comes up at 16bpp, I get:
>
> https://photos.app.goo.gl/8tuhzPFFoDGamEfk8
>
> If I have tinydrm set a preferred bpp of 24, X looks great.  Noralf,
> any ideas?

Also, with these patches and the format modifier patch I just sent, mesa
with vc4 is now working with this driver on this branch:

https://gitlab.freedesktop.org/anholt/mesa/commits/kmsro

Now I wonder how we can improve performance of the SPI updates.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlvR73AACgkQtdYpNtH8
nugoeg/9EehIBTfvLB/4Vnb0J//I6yhUw9Sh0Ltb6fVIl+zuFgycl5RH/jWlA3YZ
aGL0xeAsN5HcW5f+QSlOfqZEvAzo+cwFj8ahs1hqgraLRPOxyf6EyZq6+6zN/d7P
HNR3HIY7MS1/efyEmOZQDUsObgFUV6SOVGIKvcCq/cRkUk/Hh5bh9lGkW2LibUuc
2RiQUMtON33CjgYkDbgOCV6pizxjpx9QvmcAsY7rYwwcCdbnzCfscaM5nIQ7fyAd
b1RIko6zdxGC9IlCbzA/3JwQynW66quNbnZ/2fYTLFtoGBvngWg+KGwlQRv+j/Jz
Ujdta8cTT2jRHsYYnNguFWaKkJZcDSkckPBv4fsWXzxO/zl2ddBfhxo9pZ92FGQI
j295TrNkhUZepb76EYzLF3YzMA6HTmRyKZ43IwCjcDcR93L+yBB/DLgbF0+XdZ84
2jgNoFx4/EX2Jkdq+/ihsI/AWYM0bP3fnhH1DEslEniBKNfWEEadn1B/wfxnmWux
Z0fZOaRorIot5u/A/JsxH4K48p0M0/aC572KlQCSj3IIr5MRsWQGDMwhEXzcGK7P
8d4GYsOxlM102p7CJPwZkdxtSoV6gvYAxQ02gX3p9xXtcUUMM7xI71Bl3QndpUw8
TN9akHZ9x+h0m3ZbkG6H1e+ZlRJ+wGmwQw6YQ53v9bG3cGQueZg=
=apgK
-----END PGP SIGNATURE-----
--=-=-=--

--===============1151064724==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1151064724==--
