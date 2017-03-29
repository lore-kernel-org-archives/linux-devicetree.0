From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 2/2] ARM: dts: sun5i: Add interrupt for display backend
Date: Wed, 29 Mar 2017 09:13:03 +0200
Message-ID: <20170329071303.ft7oukmhczihy2xb@lukather>
References: <20170327143847.16259-1-wens@csie.org>
 <20170327143847.16259-3-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2145527804=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170327143847.16259-3-wens@csie.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============2145527804==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tfow4cjww2byxhs2"
Content-Disposition: inline


--tfow4cjww2byxhs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 27, 2017 at 10:38:47PM +0800, Chen-Yu Tsai wrote:
> The display backend on sun5i shares the same interrupt line as the
> display frontend. Add it.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

And ideally, patches prefix shouldn't have dts here too. I've dropped
it and applied, thanks!

> This won't directly apply to old releases. We may want to backport
> them though?

Yep, probably. Do you want to send it to stable?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--tfow4cjww2byxhs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY215+AAoJEBx+YmzsjxAgL2QQAILuKxtMhjrbugGYpzU9lTP/
TqT9vtwoZxlfGThLSrz4mbXWOMno+RSGaakdVuRMJJuEC5semHLfASsi0/cgYuf1
ABg/PVItgnoNdmI+zVZy1G9tq4biXSkNdRArb4mRB7OTxKOoPpP54WJJSDWkg0H0
8WHj7fKpPtegMK0XKmnIqlltM8R3zRDxxXgKZ++uFEDThJ9DcWqF1J/a5RCovU4q
YFLR3+JYfXBHwz4xuX+y0ATrIhGpTVsRH7Bn7WCUJ3yOsMbbSmYwATdhfmB4/cAX
wdfXTFn0VOnHlwopZvV0Aq66IZT6M4afDdxSAwDXiopEBCf5WTVf3YPEHl4w+OVf
D6K3KVahQiDZsKco5laDZY415C+doHfbsR4pdX7FhaR2k90k5v/mrdV2qVLLDPlT
aCpMx2ozvOdY88xmlHjUFCBfw0VZGKBmOPwc34ojLqwwFXXnINr04vGD+w+Iu/cH
mL+8RFxTBCUU+I5Sg5uov8Mi35EqW2Kw6l8WW5o87w3hyGXecLluI24dOlmdHCRV
xYIKNQO3To9OZ8b4hiBlghWlggyaa3g2YyotK94QqwjMouGcBan8ex9vyoB6Qcqg
XEYbQ3Cqc9yHTdHCqqyUUEN2iuYTVUg77M0/iZm9j4k49A3AbU+nL5kIoFTcGY+D
tq+nuVD8Hg0QAk0lIaSu
=TSG2
-----END PGP SIGNATURE-----

--tfow4cjww2byxhs2--

--===============2145527804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2145527804==--
