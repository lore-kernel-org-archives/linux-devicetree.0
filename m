From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v3 0/2] arm64: dts: allwinner: a64: Add A64 OlinuXino
 board (with eMMC)
Date: Thu, 22 Aug 2019 16:09:35 +0200
Message-ID: <20190822140935.pwtpu7pzbd7y2xdg@flea>
References: <20190821195217.4166-1-sunil@medhas.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2741552821829658258=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190821195217.4166-1-sunil@medhas.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sunil Mohan Adapa <sunil@medhas.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, wens@csie.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============2741552821829658258==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o357ly3g6xw34l2g"
Content-Disposition: inline


--o357ly3g6xw34l2g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 21, 2019 at 12:52:15PM -0700, Sunil Mohan Adapa wrote:
> A64 OLinuXino board from Olimex has three variants with onboard eMMC:
> A64-OLinuXino-1Ge16GW, A64-OLinuXino-1Ge4GW and A64-OLinuXino-2Ge8G-IND. In
> addition, there are two variants without eMMC. One without eMMC and one with SPI
> flash. This suggests the need for separate device tree for the three eMMC
> variants.
>
> Changes:
>
>   v3: Separate dts for eMMC variants
>
>   v2: Fix descriptions for VCC and VCCQ
>
> Version 2 of this series already committed in linux-sunxi tree as
> 8d3071f3e85894be35a1b35bcf6fdef970c81018 must be reverted before applying this.

Applied, thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--o357ly3g6xw34l2g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXV6iHgAKCRDj7w1vZxhR
xWLhAQDOkw9X6DlCQETlzeftJrXZtaROlRQI7eMcpSHu1NX55QD9GLwat/8lSR48
phvN3wKPU67uCQ7L3ceu7WVMPjUoFQY=
=G4R+
-----END PGP SIGNATURE-----

--o357ly3g6xw34l2g--


--===============2741552821829658258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2741552821829658258==--
