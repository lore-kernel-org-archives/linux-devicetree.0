From: Phil Edworthy <phil.edworthy@renesas.com>
Subject: RE: [PATCH v2 1/2] dt-bindings/interrupt-controller: rzn1: Add RZ/N1
 gpio irq mux binding
Date: Wed, 31 Oct 2018 13:43:59 +0000
Message-ID: <TY1PR01MB176943688317D3099AD69727F5CD0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
References: <20181030104438.27827-1-phil.edworthy@renesas.com>
 <20181030104438.27827-2-phil.edworthy@renesas.com>
 <20181030230420.GA25133@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181030230420.GA25133@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Many thanks for a quick review!

On 30 October 2018 23:04, Rob Herring wrote:
> On Tue, Oct 30, 2018 at 10:44:37AM +0000, Phil Edworthy wrote:
> > Add device binding documentation for the Renesas RZ/N1 GPIO interrupt
> > multiplexer.
> >
<snip>

> This looks a bit strange...
>=20
> > +
> > +	gpioirqmux: gpioirqmux@51000480 {
> > +		compatible =3D "renesas,r9a06g032-gpioirqmux",
> > +				"renesas,rzn1-gpioirqmux";
> > +		reg =3D <0x51000480 0x20>;
> > +
>=20
> > +		interrupt-controller;
> > +		#interrupt-cells =3D <1>;
> > +		interrupt-parent =3D <&gpioirqmux_map>;
> > +		interrupts =3D
> > +			<0 1 17>,	/* gpio1a 17 */
> > +			<1 1 24>,	/* gpio1a 24 */
> > +			<2 1 26>;	/* gpio1a 26 */
>=20
> Remove all these and...
>
> > +
> > +		gpioirqmux_map: gpioirqmux-map {
>=20
> Move everything in this node up a level.
>=20
> > +			#interrupt-cells =3D <3>;
>=20
> This should be 1.
>=20
> Or perhaps 2 cells if you need the GPIO controller index (cell 2 above).
> But is that numbering really meaningful to the GPIO irq mux or does it ju=
st
> have Nx32 inputs? #interrupt-cells should be defined based on the GPIO ir=
q
> mux, not what it is connected to. You could always have a single linear
> number space and mask out bits to get banks if you need to.
You are absolutely correct, the irq mux should not concern itself with wher=
e
interrupts came from, all it sees is 96 inputs.


> > +			#address-cells =3D <0>;
> > +			interrupt-map-mask =3D <7 0 0>;
>=20
> Then 1 cell here, but the mask should be 31.
>=20
> > +			interrupt-map =3D
> > +				<0 0 0 &gic GIC_SPI 103
> IRQ_TYPE_LEVEL_HIGH>,
>=20
> Then this should be:
>=20
> <17 &gic GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>
>=20
> > +				<1 0 0 &gic GIC_SPI 104
> IRQ_TYPE_LEVEL_HIGH>,
>=20
> <24 &gic GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>
>=20
> If I understand what you are trying to do. :)
I think you do!

>=20
> If the 0-7 numbering and mapping to the downstream numbering was
> important (i.e. the 1 combined with 1 and 24 in the interrupts property),=
 then
> you can use the index of the interrupt-map entries for that.
Yes, the 0-7 numbering and mapping are important as we need to pin the inpu=
t
interrupt to a specific output interrupt due to firmware running on another=
 core.
Using the index makes complete sense.

> > +				<2 0 0 &gic GIC_SPI 105
> IRQ_TYPE_LEVEL_HIGH>,
> > +				<3 0 0 &gic GIC_SPI 106
> IRQ_TYPE_LEVEL_HIGH>,
> > +				<4 0 0 &gic GIC_SPI 107
> IRQ_TYPE_LEVEL_HIGH>,
> > +				<5 0 0 &gic GIC_SPI 108
> IRQ_TYPE_LEVEL_HIGH>,
> > +				<6 0 0 &gic GIC_SPI 109
> IRQ_TYPE_LEVEL_HIGH>,
> > +				<7 0 0 &gic GIC_SPI 110
> IRQ_TYPE_LEVEL_HIGH>;
>=20
> These all seem to be unused?
I think that's just an artefact of the way I abused interrupt-map!

Thanks
Phil

> > +		};
> > +	};
> > +
> > +	gpio1: gpio@5000c000 {
> > +		compatible =3D "snps,dw-apb-gpio";
> > +		reg =3D <0x5000c000 0x80>;
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		clock-names =3D "bus";
> > +		clocks =3D <&sysctrl R9A06G032_HCLK_GPIO1>;
> > +
> > +		gpio1a: gpio-controller@0 {
> > +			compatible =3D "snps,dw-apb-gpio-port";
> > +			bank-name =3D "gpio1a";
> > +			gpio-controller;
> > +			#gpio-cells =3D <2>;
> > +			snps,nr-gpios =3D <32>;
> > +			reg =3D <0>;
> > +
> > +			interrupt-controller;
> > +			interrupt-parent =3D <&gpioirqmux>;
> > +			interrupts =3D   < 0  1  2  3  4  5  6  7
> > +					 8  9 10 11 12 13 14 15
> > +					16 17 18 19 20 21 22 23
> > +					24 25 26 27 28 29 30 31 >;
> > +			#interrupt-cells =3D <2>;
> > +		};
> > +	};
> > --
> > 2.17.1
>
