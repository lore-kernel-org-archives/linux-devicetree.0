From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH linux-next (v2) 1/3] mtd: brcmnand: Add brcm,bcm6368-nand
 device tree binding
Date: Wed, 9 Dec 2015 18:30:01 -0800
Message-ID: <20151210023001.GI144338@google.com>
References: <566891DA.1050208@simon.arlott.org.uk>
 <566896B6.9010204@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <566896B6.9010204@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Simon Arlott <simon@fire.lp0.eu>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, bcm-kernel-feedback-list@broadcom.com, Kamal Dasu <kdasu.kdev@gmail.com>, Jonas Gorski <jogo@openwrt.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 09, 2015 at 01:01:42PM -0800, Florian Fainelli wrote:
> Le 09/12/2015 12:40, Simon Arlott a =E9crit :
> > Add device tree binding for NAND on the BCM6368.
> >=20
> > The BCM6368 has a NAND interrupt register with combined status and =
enable
> > registers. It also requires a clock, so add an optional clock to th=
e
> > common brcmnand binding.
> >=20
>=20
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

Applied this and patches 2 and 3 to l2-mtd.git, with one small fix,
below.

> > Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
> > ---
> > Changed "nand-intr-base" reg name to "nand-int-base".
> >=20
> >  .../devicetree/bindings/mtd/brcm,brcmnand.txt      | 32 ++++++++++=
++++++++++++
> >  1 file changed, 32 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.tx=
t b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> > index 4ff7128..ebfa6fc 100644
> > --- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> > +++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> > @@ -45,6 +45,8 @@ Required properties:
> >  - #size-cells      : <0>
> > =20
> >  Optional properties:
> > +- clock                     : reference to the clock for the NAND =
controller
> > +- clock-names               : "nand" (required for the above clock=
)
> >  - brcm,nand-has-wp          : Some versions of this IP include a w=
rite-protect
> >                                (WP) control bit. It is always avail=
able on >=3D
> >                                v7.0. Use this property to describe =
the rare
> > @@ -72,6 +74,12 @@ we define additional 'compatible' properties and=
 associated register resources w
> >         and enable registers
> >       - reg-names: (required) "nand-int-base"
> > =20
> > +   * "brcm,nand-bcm6368"
> > +     - compatible: should contain "brcm,nand-bcm<soc>", "brcm,nand=
-bcm6368"
> > +     - reg: (required) the 'NAND_INTR_BASE' register range, with c=
ombined status
> > +       and enable registers, and boot address registers
> > +     - reg-names: (required) "nand-int-base"
> > +
> >     * "brcm,nand-iproc"
> >       - reg: (required) the "IDM" register range, for interrupt ena=
ble and APB
> >         bus access endianness configuration, and the "EXT" register=
 range,
> > @@ -148,3 +156,27 @@ nand@f0442800 {
> >  		};
> >  	};
> >  };
> > +
> > +nand@10000200 {
> > +	compatible =3D "brcm,nand-bcm63168", "brcm,nand-bcm6368",
> > +		"brcm,brcmnand-v4.0", "brcm,brcmnand";
> > +	reg =3D <0x10000200 0x180>,
> > +	      <0x10000600 0x200>,
> > +	      <0x100000b0 0x10>;
> > +	reg-names =3D "nand", "nand-cache", "nand-intr-base";

s/intr/int/

> > +	interrupt-parent =3D <&periph_intc>;
> > +	interrupts =3D <50>;
> > +	clocks =3D <&periph_clk 20>;
> > +	clock-names =3D "nand";
> > +
> > +	#address-cells =3D <1>;
> > +	#size-cells =3D <0>;
> > +
> > +	nand0: nandcs@0 {
> > +		compatible =3D "brcm,nandcs";
> > +		reg =3D <0>;
> > +		nand-on-flash-bbt;
> > +		nand-ecc-strength =3D <1>;
> > +		nand-ecc-step-size =3D <512>;
> > +	};
> > +};
> >=20
>=20
>=20
> --=20
> Florian
