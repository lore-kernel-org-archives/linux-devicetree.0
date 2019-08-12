From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 03/11] clocksource: sun4i: Add missing compatibles
Date: Mon, 12 Aug 2019 10:58:05 +0200
Message-ID: <20190812085805.qwjbsms6kktjkf45@flea>
References: <20190722081229.22422-1-maxime.ripard@bootlin.com>
 <20190722081229.22422-3-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3492413607852525166=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190722081229.22422-3-maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: daniel.lezcano@linaro.org, tglx@linutronix.de
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============3492413607852525166==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ac53bymogihrt7bf"
Content-Disposition: inline


--ac53bymogihrt7bf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel, Thomas,

On Mon, Jul 22, 2019 at 10:12:21AM +0200, Maxime Ripard wrote:
> Newer Allwinner SoCs have different number of interrupts, let's add
> different compatibles for all of them to deal with this properly.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Ping?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ac53bymogihrt7bf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXVEqHQAKCRDj7w1vZxhR
xcoeAQDX2OPSnyQP6fMTStReVJ7LbtqbCcnDfcxvducn1Y65JAEArH9kGf+VdAsI
4xyZWrH+YOLr59ZbO6yyf/X1sDZ45wQ=
=Thbx
-----END PGP SIGNATURE-----

--ac53bymogihrt7bf--


--===============3492413607852525166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3492413607852525166==--
