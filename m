From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 1/2] mfd: devicetree: add bindings for Atmel Flexcom
Date: Tue, 21 Jul 2015 16:10:35 +0100
Message-ID: <20150721151035.GK3061@x1>
References: <cover.1434967670.git.cyrille.pitchen@atmel.com>
 <337ab4936bd6ec2f24c42e2f8f363df21f491a02.1434967670.git.cyrille.pitchen@atmel.com>
 <20150721090910.GG3061@x1>
 <55AE53F2.5080904@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55AE53F2.5080904@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com, alexandre.belloni@free-electrons.com, sameo@linux.intel.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 21 Jul 2015, Cyrille Pitchen wrote:

> Hi Lee,
>=20
> Le 21/07/2015 11:09, Lee Jones a =C3=A9crit :
> > On Mon, 22 Jun 2015, Cyrille Pitchen wrote:
> ...
> >> +- atmel,flexcom-mode: shall be a string among { "spi", "usart", "=
i2c", "twi" }.
> >> +  "i2c" and "twi" are synonymous.
> >=20
> > Please use a numerical value instead.  You can then define it in
> > include/dt-bindings/*
> >=20
> > This is only required if you supply more than one child node.  Is t=
hat
> > the plan?  I ask because you only have one child node in the exampl=
e
> > below.
> >=20
> The "atmel,flexcom-mode" property is always required. The reset value=
 of the
> Operating Mode bit field inside the Flexcom Mode Register is 0 for "n=
o serial
> device". So none of the 3 embedded serial devices is clocked and all =
of their
> registers are inaccessible (read as zero).
> Before using any of the 3 serial devices, the Operating Mode must be =
set
> accordingly by updating the Mode Register. Once done, only the select=
ed serial
> device is clocked. Also the external I/O lines of the Flexcom are mux=
ed to
> reach the selected serial device.
>=20
> The muxing is given by the following table:
>=20
> Flexcom pin    USART pin    SPI pin    I2C pin
>         IO0          TXD       MOSI        TWD
>         IO1          RXD       MISO       TWCK
>         IO2          SCK       SPCK          -
>         IO3          CTS      NPCS0          -=20
>         IO4          RTS      NPCS1          -
>=20
>=20
> Bus conflicting configuration:
>  ______________________________________
> |               Flexcom                |
> |  _____         _____         _____   |
> | |     |__CLK__| SPI |__I/O__|     |  |    ___________       _______=
____
> | |     |       |_____|       |     |  |   | SPI Slave |     | I2C Sl=
ave |
> | | CLK |                     | I/O |  |   |___________|     |_______=
____|
> |_| MUX |        _____        | MUX |__|_________|________________|
> | |     |__CLK__| I2C |__I/O__|     |  |             shared bus
> | |_____|       |_____|       |_____|  |
> |______________________________________|
>=20
>=20
> For instance, it is very unlikely to connect both I2C and SPI slaves =
to
> the very same Flexcom because I/O lines are shared. The operating mod=
e is
> selected once for all during the boot and will never change during ru=
ntime.
> That's why the Flexcom DT node should have exactly one child.

You have contradicted your self here.  Firstly you say that the
"atmel,flexcom-mode" property is always required, then you say that
the DT node should only ever have one child.  If the latter is true,
then you can infer which mode Flexcom needs to be in by which node is
present.

> >> +Example:
> >> +
> >> +flx0: flexcom@f8034000 {
> >=20
> > What references this node?  If nothing, then you can remove the lab=
el.
> OK, I will remove the label in the next series.
> >=20
> >> +	compatible =3D "atmel,sama5d2-flexcom";
> >> +	reg =3D <0xf8034000 0x200>;
> >> +	clocks =3D <&flx0_clk>;
> >> +	#address-cells =3D <1>;
> >> +	#size-cells =3D <1>;
> >> +	ranges =3D <0x0 0xf8034000 0x800>;
> >> +	atmel,flexcom-mode =3D "spi";
> >> +
> >> +	spi@f8034400 {
> >> +		compatible =3D "atmel,at91rm9200-spi";
> >> +		reg =3D <0x400 0x200>;
> >> +		interrupts =3D <19 IRQ_TYPE_LEVEL_HIGH 7>;
> >> +		pinctrl-names =3D "default";
> >> +		pinctrl-0 =3D <&pinctrl_flx0_ioset1>;
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
>=20
> Thanks for your review :)
>=20
> Best Regards,
>=20
> Cyrille

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
