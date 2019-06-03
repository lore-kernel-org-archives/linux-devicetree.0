From: Luca Weiss <luca@z3ntu.xyz>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: Add lradc node
Date: Mon, 03 Jun 2019 17:20:51 +0200
Message-ID: <3880268.VpfjThaCW4@g550jk>
References: <20190518170929.24789-1-luca@z3ntu.xyz> <6901794.oDhxEVzEqc@g550jk> <20190603074247.hlayod2pxq55f6ci@flea>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4884027.SNrMX4W1oj"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190603074247.hlayod2pxq55f6ci@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

--nextPart4884027.SNrMX4W1oj
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Montag, 3. Juni 2019 09:42:47 CEST Maxime Ripard wrote:
> Hi,
> 
> On Fri, May 31, 2019 at 12:27:55PM +0200, Luca Weiss wrote:
> > On Freitag, 24. Mai 2019 11:20:01 CEST Maxime Ripard wrote:
> > > It would be great to drop the -keys from the compatible, and to
> > > document the bindings
> > > 
> > > Looks good otherwise
> > > 
> > > Maxime
> > 
> > So I should just document the "allwinner,sun50i-a64-lradc" string in
> > Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt ? Don't I
> > also
> > have to add the compatible to the driver code then? Just adding the a64
> > compatible to a dts wouldn't work without that.
> 
> What I meant was that you needed both, something like:
> 
> compatible = "allwinner,sun50i-a64-lradc", "allwinner,sun8i-a83t-lradc";
> 
> That way, the OS will try to match a driver for the A64 compatible if
> any, and fallback to the A83's otherwise. And since we don't have any
> quirk at the moment, there's no change needed to the driver.
> 
> Maxime
> 
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Hi Maxime,
sorry for the long back and forth, I hope I understood you correctly now.
Here's what I would submit as v2 then (I'll split the two files into seperate 
patches as the devicetree documentation suggests)

Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt:
  - compatible: should be one of the following string:
                "allwinner,sun4i-a10-lradc-keys"
                "allwinner,sun8i-a83t-r-lradc"
+               "allwinner,sun50i-a64-lradc", "allwinner,sun8i-a83t-r-lradc"

arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:
+               lradc: lradc@1c21800 {
+                       compatible = "allwinner,sun50i-a64-lradc",
+                                    "allwinner,sun8i-a83t-r-lradc";
+                       reg = <0x01c21800 0x400>;
+                       interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+                       status = "disabled";
+               };
+

Thanks,
Luca
--nextPart4884027.SNrMX4W1oj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE66ocILd+OiPORlvAOY2pEqPLBhkFAlz1OtMACgkQOY2pEqPL
BhniWhAAlYK190VpcKotzROcAO4PQWaBW+NvYV6iqItgjYPBg88mefVeqvnC1P8n
aga2RYwebN4iL8W3Rr+jyAzMza2B0ofuyn/2FTSizOxnfF6IgmEUvs2VehLPHSM8
oYD/J2aGB8aBVMRfGLmEaI2Ky47lnDCfoBS8iF6sh4ownDJyWrKVctwjqg5yTidq
sA2Qr8VnJyRdu75RAz9mJ9xKxiSOOK1IZlBlcuJBWpHHP9RBga8vNX12iKAwSpy6
wScB1JSUV3SzrarYn0Rp5CgQ1GocJJBM7I41si3cTkkhGdcngto+j3D5b/EZl61U
yv4BMhBhPpXsWhlRiWu0AeixVMBahlmNIkxKouehpMs1OvsgtVamdo/KLXzi/q9A
yN1Ut/WJkC3l8LzRg7ZQ9eXGO2HcbEmgNos2b5q6MgG55SyLVOmnpH7wGqdVnXNB
HTOfA0j2GCnJGWfVySBXXKLn4uIVrRyDeX0grO8nJp74f6Xp1iX4MC8jOjLidFPk
wPZmzgiGNzajyDLwyHt2Ir94n2qCRDxdp4Oh6mdXBxIDc0UDWEW58VcDZCdYDiL3
93BM+E1+3sQpIzryj1K9IElpGsUhcLYRemD+TchmNLKJAlLb+KlKac6ykLwMNwat
510fwJqUGSMJdgM4TldRE8sNLjJFRtUsJRDQ0yti6lkfDIBS5kA=
=CDr4
-----END PGP SIGNATURE-----

--nextPart4884027.SNrMX4W1oj--
