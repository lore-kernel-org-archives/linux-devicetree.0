From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH resend 5/6] ARM: dts: sun7i: Add DRAM gates
Date: Mon, 7 Dec 2015 10:21:37 +0100
Message-ID: <20151207092137.GC27957@lukather>
References: <1449321407-4531-1-git-send-email-wens@csie.org>
 <1449321407-4531-6-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0lnxQi9hkpPO77W3"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1449321407-4531-6-git-send-email-wens@csie.org>
Sender: linux-clk-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Emilio Lopez <emilio@elopez.com.ar>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--0lnxQi9hkpPO77W3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 05, 2015 at 09:16:46PM +0800, Chen-Yu Tsai wrote:
> The DRAM gates controls direct memory access for some peripherals.
> These peripherals include the display pipeline, so add the required
> gates to the simplefb nodes as well.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--0lnxQi9hkpPO77W3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWZU+hAAoJEBx+YmzsjxAgp+gQAJnjd6i4xVIgO0L9L5S64U97
RXPxAPy00IPnu73DqggTs8Drkmf+Xqwck8LTVLJoEj6P+rd4AJYgoIMM4/7KmzBl
4aMIJwNIQ+dpAi9h/otVUwW3s/4nHQ6LJvOSzVVYMid74R33PSz9UFuTGrKCtRH7
HgIIJcGBW8OAMjf4TqV9JClHIFL90oWC8PJtIP/R80/l3Sq1k2qOLSk9SxC3d73C
cfBWgkP7eeQcu0U/6L3MV9pXpztorTz9jYth0wKV1br6gEtwg6ttaOR4FLPrJDxP
IJdf4SkqxFTHtYh8zmyszu96LyJmS0dYXs49GpnPs9qewvqBqFDQKYv9qPzR+oVg
EltC/mJvK4BRAFrx0Qd4UEHEbYwFOsxjOGPhWOLyO5zGRG8E9zvsuvpIK4uBoGM9
X3SMJsco7Don2Ru+c38Q92V3jBQPpadXjoXqHbRnLPQfC+f7wtbOIVaipH8g21X6
cU2pddt0uK1mJKunOu9t7zGuD1WHGPTgrS39oNMYrNkgNXbk6JLEuNKq+y3CPTzu
DAHoVgSQMEFkqG6Iq078Xf8597EdUZK8vj7RX6YZpyXspDLqGE/ol5nRCvrONiuo
kVm0X08ziNtvcYLeuUXKSI79i8fTDQveAFbvaCsjS/iK0ekxugmAd/kGIyIB66CN
QhodfYZnXP3n+2d+7qeQ
=awQh
-----END PGP SIGNATURE-----

--0lnxQi9hkpPO77W3--
