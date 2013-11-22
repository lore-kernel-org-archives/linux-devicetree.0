From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 1/5] mfd: max14577: Add max14577 MFD driver core
Date: Fri, 22 Nov 2013 10:36:06 +0000
Message-ID: <20131122103606.GJ14725@sirena.org.uk>
References: <1385109972-28059-1-git-send-email-k.kozlowski@samsung.com>
 <1385109972-28059-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/D3X8sky0X3AmG5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1385109972-28059-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Anton Vorontsov <anton@enomsg.org>, David Woodhouse <dwmw2@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: devicetree@vger.kernel.org


--W/D3X8sky0X3AmG5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2013 at 09:46:08AM +0100, Krzysztof Kozlowski wrote:
> From: Chanwoo Choi <cw00.choi@samsung.com>
>=20
> This patch adds max14577 core/irq driver to support MUIC(Micro USB IC)
> device and charger device and support irq domain method to control
> internal interrupt of max14577 device. Also, this patch supports DT
> binding with max14577_i2c_parse_dt().

Reviwed-by: Mark Brown <broonie@linaro.org>

--W/D3X8sky0X3AmG5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSjzOTAAoJELSic+t+oim9t8kP/3w4aZ7uutfYgq97EyyYLZRO
M83Fs4fLvytkSY8Z++RbyoAF8ijIyecopkhEsRTCMpnPlUoEvIjv/mNXQ512hY8S
cvhsVLV1+uWP4ki1+Y1fVvCf5I1716K1H1JONI9qEHHe266iHnvOW0bz2MRUQjS0
AaMPfeG2bBKV0wF9Q3KayP2MwTsA2Dq4bUc4SAqt/6gTWRUbaFyCqhPU71lAf3Hf
WmdmP1wI29pHOkUYXTmMF4YiSbf8Y8Dqf+rVv04zhnOdsoakwoPaOFID/BibQqBD
G1e8lJYrQ7JGcr1IdSy9hMnj8XOEVRD5cfadxFakGuVORTgQfGJwHWcX45wr1j0f
MKcV3fC3ahLLjdsKsbdWuOHJTZNSeLx+EctyP3joihbDHpQdGb13ZIjer56YNtVv
W6c2n3szU3WeSD/CGKB4tCFZ4q7iKAp35YbLZJsFaFGAAdJj9a6thw+LIJHXTU9q
hKA7pSjbFfx+ZhC/K0jsysErOs4sSUz6vA57Vy/ACSYhrjzRIhVbdrGvTOwkKASy
tDpQubIxYmlHeyzQ82dWNPTDqgmCUwUQrYzW980UXnFNEsmm1EPv2hEx04B+7lHG
NDVyJ4XAG7BwK2Xfwz4JDpapk3/5TVSLTg0w97j7OgQBX675WaTW4PlPBWVKdc8e
KhAkzilA4IxD92U13rOE
=xyDD
-----END PGP SIGNATURE-----

--W/D3X8sky0X3AmG5--
