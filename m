From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 4/5] ARM: dts: sun7i: icnova-swac: Fix the model vendor
Date: Wed, 29 May 2019 09:26:55 +0200
Message-ID: <20190529072655.3zlpssjmidbf5djq@flea>
References: <20190525134140.6220-1-maxime.ripard@bootlin.com>
 <20190525134140.6220-4-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6117318499804640729=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190525134140.6220-4-maxime.ripard@bootlin.com>
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


--===============6117318499804640729==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mgqdrh2vmna5rpic"
Content-Disposition: inline


--mgqdrh2vmna5rpic
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 25, 2019 at 03:41:39PM +0200, Maxime Ripard wrote:
> Even though the SWAC is just a baseboard to the icnova SoM, the vendor of
> the baseboard somehow ended up with the board name instead of the vendor
> name. Fix that.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Applied.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--mgqdrh2vmna5rpic
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXO40PwAKCRDj7w1vZxhR
xTOiAP4w0jMv0U/jU1vKaNdAI7mKu22x5teHidnViwUaNQsN4QD+I9tJk+ELEHkI
1BfEXisxOX+TAViiVPuYNQfyP6brmgc=
=Iykm
-----END PGP SIGNATURE-----

--mgqdrh2vmna5rpic--


--===============6117318499804640729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6117318499804640729==--
