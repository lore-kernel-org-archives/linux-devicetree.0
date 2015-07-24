From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 1/2] mfd: devicetree: add bindings for Atmel Flexcom
Date: Fri, 24 Jul 2015 15:56:13 +0100
Message-ID: <20150724145613.GG3436@x1>
References: <cover.1437669004.git.cyrille.pitchen@atmel.com>
 <60057bbf7d39ec63d391d26271747cf0228a3ed1.1437669004.git.cyrille.pitchen@atmel.com>
 <20150723214857.4322c758@bbrezillon>
 <55B1F9B7.2080206@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55B1F9B7.2080206-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 24 Jul 2015, Nicolas Ferre wrote:

> Le 23/07/2015 21:48, Boris Brezillon a =C3=A9crit :
> > On Thu, 23 Jul 2015 18:42:55 +0200
> > Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> wrote:
> >=20
> >> This patch documents the DT bindings for the Atmel Flexcom which w=
ill be
> >> introduced by sama5d2x SoCs. These bindings will be used by the ac=
tual
> >> Flexcom driver to be sent in another patch.
> >>
> >> Signed-off-by: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> >> ---
> >>  .../devicetree/bindings/mfd/atmel-flexcom.txt      | 68 +++++++++=
+++++++++++++
> >>  1 file changed, 68 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/mfd/atmel-fl=
excom.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/mfd/atmel-flexcom.t=
xt b/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
> >> new file mode 100644
> >> index 000000000000..a63226b7a9cb
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
> >> @@ -0,0 +1,68 @@
> >> +* Device tree bindings for Atmel Flexcom (Flexible Serial Communi=
cation Unit)
> >> +
> >> +The Atmel Flexcom is just a wrapper which embeds a SPI controller=
, an I2C
> >> +controller and an USART. Only one function can be used at a time =
and is chosen
> >> +at boot time according to the device tree.
> >> +
> >> +Required properties:
> >> +- compatible:		Should be "atmel,sama5d2-flexcom"
> >> +- reg:			Should be the pair (offset, size) for the Flexcom
> >> +			dedicated I/O registers (without USART, TWI or SPI
> >> +			registers).
> >> +- clocks:		Should be the Flexcom peripheral clock from PMC.
> >> +- #address-cells:	Should be <2>
> >> +- #size-cells:		Should be <1>
> >> +- ranges:		Should be a list of ranges.
> >> +			One range per peripheral wrapped by the Flexcom. So each
> >> +			range is a triplet (child_addr, parent_addr, size). The
> >> +			first u32 of "child_addr" is the value to be set in the
> >> +			Operating Mode bitfield of the Flexcom Mode Register.
> >> +			Then "parent_addr" stores the base address of the
> >> +			corresponding peripheral in the system memory. Finally,
> >> +			"size" if the size of the memory region of this
> >> +			peripheral.
> >> +
> >> +Required child:
> >> +A single available child for the serial controller to enable.
> >> +
> >> +Required properties of this child:
> >> +- reg:			Should be a pair (child_addr, size) with child_addr
> >> +			matching one of the parent ranges.
> >> +- clocks:		Should be the very same phandle as for the parent's on=
e.
> >> +
> >> +Other properties remain unchanged. See documentation of the respe=
ctive device:
> >> +- ../serial/atmel-usart.txt
> >> +- ../spi/spi_atmel.txt
> >> +- ../i2c/i2c-at91.txt
> >> +
> >> +Example:
> >> +
> >> +flexcom@f8034000 {
> >> +	compatible =3D "atmel,sama5d2-flexcom";
> >> +	reg =3D <0xf8034000 0x200>;
> >> +	clocks =3D <&flx0_clk>;
> >> +	#address-cells =3D <2>;
> >> +	#size-cells =3D <1>;
> >> +	ranges =3D <1 0 0xf8034200 0x200		/* opmode 1: USART */
> >> +		  2 0 0xf8034400 0x200		/* opmode 2: SPI */
> >> +		  3 0 0xf8034600 0x200>;	/* opmode 3: I2C */
>=20
> Yes, the opmode(s) are exactly the values described in the product
> datasheet.
>=20
> >> +
> >> +	spi@f8034400 {
> >=20
> > Should be:
> >=20
> > 	spi@2,0 {
>=20
> Yep!
>=20
> I was silently following the discussion in the background and I admit
> that this approach is pretty elegant.
>=20
> So, if this approach is validated you can also add my:
> Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Please see my reply to v6 for the usual way to achieve this.

> >> +		compatible =3D "atmel,at91rm9200-spi";
> >> +		reg =3D <2 0 0x200>;
> >> +		interrupts =3D <19 IRQ_TYPE_LEVEL_HIGH 7>;
> >> +		pinctrl-names =3D "default";
> >> +		pinctrl-0 =3D <&pinctrl_flx0_default>;
> >> +		#address-cells =3D <1>;
> >> +		#size-cells =3D <0>;
> >> +		clocks =3D <&flx0_clk>;
> >> +		clock-names =3D "spi_clk";
> >> +		atmel,fifo-size =3D <32>;
> >> +
> >> +		mtd_dataflash@0 {
> >> +			compatible =3D "atmel,at25f512b";
> >> +			reg =3D <0>;
> >> +			spi-max-frequency =3D <20000000>;
> >> +		};
> >> +	};
> >> +};
> >=20
> >=20
> >=20
>=20
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
