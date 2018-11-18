From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77965: Add CAN FD controller
 node
Date: Mon, 19 Nov 2018 00:10:53 +0100
Message-ID: <20181118231053.GC2553@kunai>
References: <20181118173327.4704-1-marek.vasut+renesas@gmail.com>
 <20181118173327.4704-2-marek.vasut+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2233623911609831582=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181118173327.4704-2-marek.vasut+renesas@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: devicetree@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Simon Horman <horms+renesas@verge.net.au>, linux-arm-kernel@lists.infradead.org, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org


--===============2233623911609831582==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="adJ1OR3c6QgCpb/j"
Content-Disposition: inline


--adJ1OR3c6QgCpb/j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 18, 2018 at 06:33:27PM +0100, Marek Vasut wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>=20
> This patch adds CAN FD controller nodes for the R8A77965 SoC.
>=20
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org

Why seperate patches for CAN and CANFD here while they are merged for
r8a77990 into one patch?


--adJ1OR3c6QgCpb/j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvx8X0ACgkQFA3kzBSg
Kba0axAAhw+zxouDzk/7UZWhVOLojAdmdZb+gWpuzgW6214/demff+75UaT6Js/d
4n/y0X6w4WcxX8sJtJ2o22Q7kHSfxlLyUbO7+ZID7xuuThTbxvwM1yjni5WHFmn9
jOW4KVPQcQWcklBGVAyI4DOD2t1EwQEZ2MkJQl8O/Mtf91Ez32zgXF1ST1VqXcmW
dKmcC16vaSK0iUiOQSvOMWI+azAd1CLJ9Ei3V9NxzIiOPXU4ed9hk7wqxZY0cyUj
MknxqBjoxyTXZg90JzB3aywGILXbk53yKrS2us8xTmnxTF/9j5bFZCmoSlCcIe9e
Bp7+eth3Yk2pKypCIaunvpiBL79rMJSso3p4r+zWIWyNFIyj9kfXamN/8BPCUiHN
5yhNSmCLsK1mPSmbfOpSo1JwC/fNjFLV3P5KE2TliI3S8rG16LMkwT7k9AREXvQi
sM1/DCCjjgWilaumwXdl1EgHnlfbVExlSxM6LWlBPnNfAR6WopGXvSgJDTmcoiI3
uSRzX74woJH+mpsD9D+YlvVX9/iArl676mRc2cIJo7G/fxzdtD7qWVJLPgr62WD8
KA8X4oBvoXT93paeV1f+RKcs3Vpyfm4euLd9NV6H3NPYLoqUILsE2UDhBHKHOeNP
sZao/u359+AYIvlQXA8buAY+RWgzmD7b8pZx3TQ35YexKRgDWuc=
=OYbO
-----END PGP SIGNATURE-----

--adJ1OR3c6QgCpb/j--


--===============2233623911609831582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2233623911609831582==--
