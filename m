From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: Add lradc node
Date: Tue, 4 Jun 2019 10:28:06 +0200
Message-ID: <20190604082806.smght44dmhuoxw2u@flea>
References: <20190518170929.24789-1-luca@z3ntu.xyz>
 <6901794.oDhxEVzEqc@g550jk>
 <20190603074247.hlayod2pxq55f6ci@flea>
 <3880268.VpfjThaCW4@g550jk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rokvu4c2fxf472od"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3880268.VpfjThaCW4@g550jk>
Sender: linux-kernel-owner@vger.kernel.org
To: Luca Weiss <luca@z3ntu.xyz>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--rokvu4c2fxf472od
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 03, 2019 at 05:20:51PM +0200, Luca Weiss wrote:
> On Montag, 3. Juni 2019 09:42:47 CEST Maxime Ripard wrote:
> > Hi,
> >
> > On Fri, May 31, 2019 at 12:27:55PM +0200, Luca Weiss wrote:
> > > On Freitag, 24. Mai 2019 11:20:01 CEST Maxime Ripard wrote:
> > > > It would be great to drop the -keys from the compatible, and to
> > > > document the bindings
> > > >
> > > > Looks good otherwise
> > > >
> > > > Maxime
> > >
> > > So I should just document the "allwinner,sun50i-a64-lradc" string in
> > > Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt ? Don't I
> > > also
> > > have to add the compatible to the driver code then? Just adding the a64
> > > compatible to a dts wouldn't work without that.
> >
> > What I meant was that you needed both, something like:
> >
> > compatible = "allwinner,sun50i-a64-lradc", "allwinner,sun8i-a83t-lradc";
> >
> > That way, the OS will try to match a driver for the A64 compatible if
> > any, and fallback to the A83's otherwise. And since we don't have any
> > quirk at the moment, there's no change needed to the driver.
>
> sorry for the long back and forth, I hope I understood you correctly now.
> Here's what I would submit as v2 then (I'll split the two files into seperate
> patches as the devicetree documentation suggests)
>
> Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt:
>   - compatible: should be one of the following string:
>                 "allwinner,sun4i-a10-lradc-keys"
>                 "allwinner,sun8i-a83t-r-lradc"
> +               "allwinner,sun50i-a64-lradc", "allwinner,sun8i-a83t-r-lradc"
>
> arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:
> +               lradc: lradc@1c21800 {
> +                       compatible = "allwinner,sun50i-a64-lradc",
> +                                    "allwinner,sun8i-a83t-r-lradc";
> +                       reg = <0x01c21800 0x400>;
> +                       interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> +                       status = "disabled";
> +               };
> +
>
> Thanks,
> Luca

That looks correct :)

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--rokvu4c2fxf472od
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXPYrlgAKCRDj7w1vZxhR
xZ4wAQDYf4iwJpFsfR8XtFStVojYJ+87YKlwxsWeyc2AY+blqwD/bkhJERAV91vH
je0Y6DGnu87Ep+qyk/Jh5W384aSsxgM=
=Mcc7
-----END PGP SIGNATURE-----

--rokvu4c2fxf472od--
