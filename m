From: Phil Edworthy <phil.edworthy@renesas.com>
Subject: RE: [PATCH v3 1/2] dt-bindings/interrupt-controller: rzn1: Add RZ/N1
 gpio irq mux binding
Date: Mon, 19 Nov 2018 09:39:33 +0000
Message-ID: <TY1PR01MB176917D755CB102AB5FD6BEAF5D80@TY1PR01MB1769.jpnprd01.prod.outlook.com>
References: <20181113130910.22130-1-phil.edworthy@renesas.com>
 <20181113130910.22130-2-phil.edworthy@renesas.com>
 <20181117143253.GA27381@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181117143253.GA27381@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 17 November 2018 14:33 Rob Herring wrote:
> On Tue, Nov 13, 2018 at 01:09:09PM +0000, Phil Edworthy wrote:
> > Add device binding documentation for the Renesas RZ/N1 GPIO interrupt
> > multiplexer.
> >
> > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> > ---
> > v3:
> >  - Use 'interrupt-map' DT property correctly.
> > v2:
> >  - Use interrupt-map to allow the GPIO controller info to be specified
> >    as part of the irq.
> >  - Don't show status in binding examples.
> >  - Don't show the soc/board split in binding doc.
> > ---
> >  .../interrupt-controller/renesas,rzn1-mux.txt | 73
> > +++++++++++++++++++
> >  1 file changed, 73 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/interrupt-controller/renesas,rzn1-mu
> > x.txt
>=20
> A few nits, otherwise:
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
Thanks for the review!

> >
> > diff --git
> > a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzn1-
> > mux.txt
> > b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzn1-
> > mux.txt
> > new file mode 100644
> > index 000000000000..6515880e25cc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,r
> > +++ zn1-mux.txt
> > @@ -0,0 +1,73 @@
> > +* Renesas RZ/N1 GPIO Interrupt Multiplexer
> > +
> > +On Renesas RZ/N1 devices, there are several GPIO Controllers each
> > +with a number of interrupt outputs. All of the interrupts from the
> > +GPIO Controllers are passed to the GPIO Interrupt Multiplexer, which
> > +selects a sub-set of the interrupts to pass onto the system interrupt
> controller.
> > +
> > +A single node in the device tree is used to describe the GPIO IRQ Muxe=
r.
> > +
> > +Required properties:
> > +- compatible: SoC-specific compatible string "renesas,<soc-specific>-
> gpioirqmux"
> > +  followed by "renesas,rzn1-gpioirqmux" as fallback. The SoC-specific
> > +compatible
> > +  strings must be one of:
> > +	"renesas,r9a06g032-gpioirqmux" for RZ/N1D
> > +	"renesas,r9a06g033-gpioirqmux" for RZ/N1S
> > +- reg: Base address and size of GPIO IRQ Muxer registers.
> > +- interrupts: List of output interrupts.
> > +- #interrupt-cells: Numder of cells in the input interrupt specifier, =
must be
> 1.
> > +- #address-cells: Must be 0.
> > +- interrupt-map-mask: must be 127.
> > +- interrupt-map: Standard property detailing the maps between input
> > +irqs and the
> > +  corresponding output irq. This consist of a list of:
> > +	<input-irq-spec phandle-to-interrupt-controller output-irq-spec>
> > +  The input-irq-spec is from 0 to 95, corresponding to the outputs of
> > +the GPIO
> > +  Controllers.
> > +
> > +Example:
> > +
> > +	The following is an example for the RZ/N1D SoC.
> > +
> > +	gpioirqmux: gpioirqmux@51000480 {
>=20
> interrupt-controller@...
Sure

> > +		compatible =3D "renesas,r9a06g032-gpioirqmux",
> > +				"renesas,rzn1-gpioirqmux";
> > +		reg =3D <0x51000480 0x20>;
> > +		interrupts =3D
> > +			<GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
> > +			<GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
>=20
> This is a bit redundant as the same information is in interrupt-map, but =
I
> guess you need it to get the irq resources.
That's right.

> > +
> > +		#interrupt-cells =3D <1>;
> > +		#address-cells =3D <0>;
> > +		interrupt-map-mask =3D <127>;
>=20
> Use hex for masks.
Ok.

> > +		interrupt-map =3D
> > +			/* gpio2a 24, pin 146: ETH Port 1 IRQ */
> > +			<88 &gic GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
> > +			/* gpio2a 26, pin 148: TouchSCRN_IRQ */
> > +			<90 &gic GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
> > +	};
> > +
> > +	gpio2: gpio@5000d000 {
> > +		compatible =3D "snps,dw-apb-gpio";
> > +		reg =3D <0x5000d000 0x80>;
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		clock-names =3D "bus";
> > +		clocks =3D <&sysctrl R9A06G032_HCLK_GPIO2>;
> > +
> > +		gpio2a: gpio-controller@0 {
>=20
> gpio@0
Are you sure about this?
The bindings in Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
show an example where the sub-nodes for gpio banks are gpio-controller@.
This is also in Documentation/devicetree/bindings/gpio/gpio.txt.

Thanks
Phil

> > +			compatible =3D "snps,dw-apb-gpio-port";
> > +			bank-name =3D "gpio2a";
> > +			gpio-controller;
> > +			#gpio-cells =3D <2>;
> > +			snps,nr-gpios =3D <32>;
> > +			reg =3D <0>;
> > +
> > +			interrupt-controller;
> > +			interrupt-parent =3D <&gpioirqmux>;
> > +			interrupts =3D  < 64 65 66 67 68 69 70 71
> > +					72 73 74 75 76 77 78 79
> > +					80 81 82 83 84 85 86 87
> > +					88 89 90 91 92 93 94 95 >;
> > +			#interrupt-cells =3D <2>;
> > +		};
> > +	};
> > --
> > 2.17.1
> >
