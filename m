From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] ARM: dts: qcom-apq8064: Fix DSI PHY ref clk phandle
Date: Wed, 24 Apr 2019 11:16:15 +1000
Message-ID: <20190424111615.6fa69e0c@canb.auug.org.au>
References: <20190424001210.201672-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/+Hh9m.f/Xh.LOt20Y3ngziC"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190424001210.201672-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Linux Next Mailing List <linux-next@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>
List-Id: devicetree@vger.kernel.org

--Sig_/+Hh9m.f/Xh.LOt20Y3ngziC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Matthias,

On Tue, 23 Apr 2019 17:12:10 -0700 Matthias Kaehlcke <mka@chromium.org> wro=
te:
>
> Commit 3560af5a56b5 ("ARM: dts: qcom-apq8064: Set 'xo_board' as
> ref clock of the DSI PHY") specifies the non-existing phandle
> 'xo_board' as DSI PHY ref clk. Fix this by using the correct
> phandle is 'cxo_board'.
>=20
> Fixes: 3560af5a56b5 ("ARM: dts: qcom-apq8064: Set 'xo_board' as ref clock=
 of the DSI PHY")
>=20
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

You should keep the tags in one group (no blank lines between them).
Also, you might like to add a Reported-by tag when you get reports from
others (unless you discovered this yourself, of course).
--=20
Cheers,
Stephen Rothwell

--Sig_/+Hh9m.f/Xh.LOt20Y3ngziC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly/uN8ACgkQAVBC80lX
0Gy8vQf/UMgtKv/PcwntGHQ83KYFMtIul/9SCrcJUiJ7CIfE8/gfpKdN7U+2DUg7
H2pv0UI02tPJ/35mk6AgfkrNduW6dEslBVtp2Z04Mq308J10y1ulHXaEQ3Mk0fN9
Pq1696YSAp8FfsW4H5XR/3xWm47JT5wCc2EeSdhHvAJIJstMZpmh8Z8UU+BI4GuL
FLwE11g1D3hmiyC7CgVZz7xRa9d73+5TVLoLGlZPXLnpEJBNORNUDCn5LOsVVqOW
zWJk9uIfR2WzHv+Y5puES+JImPmtJ/CSBDVT8LfbUUQcHNb7kxl1vuCrSQjDvA6g
ZrXwqxnUe2eryHXy+zFbs1TorTGDZg==
=g8aX
-----END PGP SIGNATURE-----

--Sig_/+Hh9m.f/Xh.LOt20Y3ngziC--
