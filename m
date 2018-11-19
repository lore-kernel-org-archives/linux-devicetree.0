From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 5/6] ARM: dts: sunxi: Add all CPUs in cooling maps
Date: Mon, 19 Nov 2018 15:39:46 +0100
Message-ID: <20181119143946.qqipcb2c34imc2td@flea>
References: <cover.1542362000.git.viresh.kumar@linaro.org>
 <b2524a2db87c97c038990af405bd1cca25e579f8.1542362000.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="e65cvqpkt4byjzbm"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b2524a2db87c97c038990af405bd1cca25e579f8.1542362000.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--e65cvqpkt4byjzbm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 16, 2018 at 03:31:14PM +0530, Viresh Kumar wrote:
> Each CPU can (and does) participate in cooling down the system but the
> DT only captures a handful of them, normally CPU0, in the cooling maps.
> Things work by chance currently as under normal circumstances its the
> first CPU of each cluster which is used by the operating systems to
> probe the cooling devices. But as soon as this CPU ordering changes and
> any other CPU is used to bring up the cooling device, we will start
> seeing failures.
>=20
> Also the DT is rather incomplete when we list only one CPU in the
> cooling maps, as the hardware doesn't have any such limitations.
>=20
> Update cooling maps to include all devices affected by individual trip
> points.
>=20
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--e65cvqpkt4byjzbm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCW/LLMgAKCRDj7w1vZxhR
xRtJAQDOkaLC6alOxQ7wIVemizO2wVY5u3Qkz+GeMF/6ZrXtRgEA27cm5xkG74Oy
3/4ibMTbAN4sUM/j6HQjOraKu7e+ogE=
=p7xv
-----END PGP SIGNATURE-----

--e65cvqpkt4byjzbm--
