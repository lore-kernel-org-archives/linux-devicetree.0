From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v3] clk: sunxi: Fix sun8i-a23-apb0-clk divider flags
Date: Tue, 16 Feb 2016 09:47:52 +0100
Message-ID: <20160216084752.GG4344@lukather>
References: <1455529219-30204-1-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z9ECzHErBrwFF8sy"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1455529219-30204-1-git-send-email-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, devicetree@vger.kernel.org, Vishnu Patekar <vishnupatekar0510@gmail.com>
List-Id: devicetree@vger.kernel.org


--z9ECzHErBrwFF8sy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 15, 2016 at 05:40:19PM +0800, Chen-Yu Tsai wrote:
> The APB0 clock on A23 is a zero-based divider, not a power-of-two based
> divider.
>=20
> Note that this patch does not apply cleanly to kernels before 4.5-rc1,
> which added CLK_OF_DECLARE support to this driver.
>=20
> Fixes: 57a1fbf28424 ("clk: sunxi: Add A23 APB0 divider clock support")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--z9ECzHErBrwFF8sy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWwuI4AAoJEBx+YmzsjxAg9tEQAMG41ZS+iYFOBm6uqSI+mdBm
RZK7PVyH8ptzTEOXAs8fVR6wyjAxvOHA8gBU957Onu1VEf0lUWBXbi/8wjBN9gp+
Ait0JCZ27naBSQfx9AxQ8yEyPv3PWMkbECRrH5/fIP2UTIpskVA2XzR0LBrwUYAJ
yCSd7o8wd6t2FbY472WRcKLZ1ummDtpGjTAymIEI0rqAxpFggIlmRaP5ydbQY6Yt
HaJwcsouoNH5w5ghnDsrrx507oxd7qJwkQ3zHV/+98jGRRGDZoSCfP0u0C6tSQ+Q
qV4RewM0UOZMzz+irpmOot4ymcskAy/a4g3zqRqdTYzoO6uMp1BEA9fQgygjII7X
hcBU0nmJy12VDyCqP932XsPP3QGw2uAg4724T6kk3rZcmynkuXx1zogjezoDFIBG
wMYvtcTcaWXI3l5w+1kz25ooDigo9lq54MQifVlCzhSTTf7WDDs8oI3TTPnzhgvf
TpqxBVoAnxmBjQ46gUJDo1ymU6jyx0FH7ZomL0JpXzhv+GBtjoWh0OCNZYSS57Bj
d/uQIfpwxh8AYqDhoT8WTL86atXMlHWoMPGwRvDfNR1xMBQCFOTj1+HMqu7fF3Pv
xM/tK6wqlT8ThNQDT8MnxQQlWdDSrL0CuzQCuuoqyDVy00qafS90HModonR1WdlO
gchZWIs2u3mqIMqx18zQ
=3lFo
-----END PGP SIGNATURE-----

--z9ECzHErBrwFF8sy--
