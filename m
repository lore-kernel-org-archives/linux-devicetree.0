From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 5/5] ARM: dts: gr8-evb: Fix RTC vendor
Date: Wed, 29 May 2019 09:27:10 +0200
Message-ID: <20190529072710.ipddsox4rzeqko4h@flea>
References: <20190525134140.6220-1-maxime.ripard@bootlin.com>
 <20190525134140.6220-5-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0613474634300256545=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190525134140.6220-5-maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0613474634300256545==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qjh6lptw2dk5bg75"
Content-Disposition: inline


--qjh6lptw2dk5bg75
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 25, 2019 at 03:41:40PM +0200, Maxime Ripard wrote:
> For some reason, the RTC vendor is reported to be phg, while the part is
> actually made by the much more known NXP. Fix that.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Applied.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--qjh6lptw2dk5bg75
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXO40TgAKCRDj7w1vZxhR
xSbWAQCWESCj0FTJl5kClqKo7k9z1VtSLNlsZs7ikyfTwXDBBQD9F02H5zZwvPJP
jPcpKgvaHfTXpGdSfeSKb0ZlgTuhEQ8=
=cUdi
-----END PGP SIGNATURE-----

--qjh6lptw2dk5bg75--


--===============0613474634300256545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0613474634300256545==--
