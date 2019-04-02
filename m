From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 4/4] ARM: dts: sunxi: Remove useless address and size cells
Date: Tue, 2 Apr 2019 13:11:38 +0200
Message-ID: <20190402111138.d2qnitlri3audk7r@flea>
References: <75ad3b89e4a6f8ad5bc414c3dccbb1f99361495a.1554153146.git-series.maxime.ripard@bootlin.com>
 <8774db23f87fe401f8ac7b775decba3cde2a56ea.1554153146.git-series.maxime.ripard@bootlin.com>
 <20190402101952.657ee274@xps13>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3244941292241639283=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190402101952.657ee274@xps13>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============3244941292241639283==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jyvuwjnoisiuqv2e"
Content-Disposition: inline


--jyvuwjnoisiuqv2e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 02, 2019 at 10:19:52AM +0200, Miquel Raynal wrote:
> Hi Maxime,
>
> Maxime Ripard <maxime.ripard@bootlin.com> wrote on Mon,  1 Apr 2019
> 23:13:56 +0200:
>
> > The NAND chips in our DTs have address and size cells, even though they
> > don't have any child nodes. Remove them.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
> >  arch/arm/boot/dts/sun5i-gr8-chip-pro.dts             | 2 --
> >  arch/arm/boot/dts/sun8i-r16-nintendo-nes-classic.dts | 2 --
> >  2 files changed, 4 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts b/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts
> > index 533a4ecc05e2..a32cde3e32eb 100644
> > --- a/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts
> > +++ b/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts
> > @@ -133,8 +133,6 @@
> >  	status = "okay";
> >
> >  	nand@0 {
> > -		#address-cells = <2>;
> > -		#size-cells = <2>;
> >  		reg = <0>;
> >  		allwinner,rb = <0>;
> >  		nand-ecc-mode = "hw";
> > diff --git a/arch/arm/boot/dts/sun8i-r16-nintendo-nes-classic.dts b/arch/arm/boot/dts/sun8i-r16-nintendo-nes-classic.dts
> > index 32cf1ab33aab..246dec5846a4 100644
> > --- a/arch/arm/boot/dts/sun8i-r16-nintendo-nes-classic.dts
> > +++ b/arch/arm/boot/dts/sun8i-r16-nintendo-nes-classic.dts
> > @@ -34,8 +34,6 @@
> >
> >  	/* 2Gb Macronix MX30LF2G18AC (3V) */
> >  	nand@0 {
> > -		#address-cells = <1>;
> > -		#size-cells = <1>;
> >  		reg = <0>;
> >  		allwinner,rb = <0>;
> >  		nand-ecc-mode = "hw";
>
>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied 3 and 4, thanks!

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--jyvuwjnoisiuqv2e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKNDagAKCRDj7w1vZxhR
xUaQAP9A+69BOUo8X/jrSFvJ5KW/vBUAT8LQyk85JrIidgr9HgEA14ZaNVdq58Qd
mtku/ItH4H8wKVKIGWHw3FTEXg9GpAI=
=AHB1
-----END PGP SIGNATURE-----

--jyvuwjnoisiuqv2e--


--===============3244941292241639283==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3244941292241639283==--
