From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v1 1/2] ARM: dts: sun8i: Add board dts file for
 t3-cqa3t-bv3.
Date: Thu, 22 Nov 2018 09:19:09 +0100
Message-ID: <20181122081909.2u3kt3ih5ma2dl2y@flea>
References: <20181121154356.GA4359@arx-s1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="twq3molfx3dmoi2t"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181121154356.GA4359@arx-s1>
Sender: linux-kernel-owner@vger.kernel.org
To: Hao Zhang <hao5781286@gmail.com>
Cc: robh+dt@kernel.org, wens@csie.org, icenowy@aosc.io, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--twq3molfx3dmoi2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 21, 2018 at 11:43:57PM +0800, Hao Zhang wrote:
> The T3/R40/V40 using the same sdk and config file in allwinner
> sdk, it seem they are the same SOC just with different name, so
> compatible with R40.
>=20
> The t3-cqa3t-bv3 based on Allwinner T3 SoC, it has various connectors,
> leds, buttons, and sell on:
> https://item.taobao.com/item.htm?spm=3D2013.1.w4023-4203040713.25.62704cc=
e7UCgLS&id=3D557154455330
>=20
> It features:
>  - X-Powers AXP221s PMIC connected to i2c0
>  - 1/2 GB DDR3 DRAM
>  - 8 GB eMMC
>  - 2x USB 2.0 hosts
>  - 1x USB 2.0 OTG
>  - 2 LVDS connectors
>  - 24 bit RGB LCD connector
>  - HDMI output
>  - DVP camera interface (support 500w cmos camera)
>  - GPIO connectors
>  - 5 TTL uarts and 2 RS232 uarts
>  - 1 RS485 connector
>  - support i2c capacitive tp and usb infrared tp
>  - boot control, reset and user buttons
>  - 3.5mm headphone and 3.5mm mic jack
>  - 100M RJ45
>  - micro SD card slot
>  - DC power jack
>  - RCT power slot
>  - 1 CVBS TVIN
>  - 1 CVBS TVOUT
>  - 2 customer leds
>  - 1 buzzer
>  - 1 minipcie
>  - I2C output
>  - SPI output
>  - PCM output
>  - wifi and bt connector reserved.
>=20
> Board info can find here:
> https://github.com/Axl-zhang/Allwinner-V40-T3-R40-manual
>=20
> Signed-off-by: Hao Zhang <hao5781286@gmail.com>

Applied both patches, thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--twq3molfx3dmoi2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCW/ZmfQAKCRDj7w1vZxhR
xa6DAP4sp8sY/XXSN4qWLdHs41eBFO/p3gmW3bsc8NYx/ruhVAD+NUtOtxWkL4D/
hwyorMZuxpCFUm/1eC7+RbngPPNzzg4=
=4bRA
-----END PGP SIGNATURE-----

--twq3molfx3dmoi2t--
