From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH linux-next 4/5] Documentation: atmel-quadspi: add binding
 file for Atmel QSPI driver
Date: Fri, 11 Dec 2015 10:26:08 +0100
Message-ID: <566A96B0.2010808@atmel.com>
References: <cover.1449494420.git.cyrille.pitchen@atmel.com>
 <caec561f882521b3896530404ecb2bbad9950435.1449494420.git.cyrille.pitchen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <caec561f882521b3896530404ecb2bbad9950435.1449494420.git.cyrille.pitchen@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, computersforpeace@gmail.com, linux-mtd@lists.infradead.org, marex@denx.de
Cc: vigneshr@ti.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
List-Id: devicetree@vger.kernel.org

Le 07/12/2015 15:09, Cyrille Pitchen a =E9crit :
> This patch documents the DT bindings for the driver of the Atmel QSPI
> controller embedded inside sama5d2x SoCs.
>=20
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>

The change is very small from previous one and moreover accepted by Rob=
=2E
So, for sure:

Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>


> ---
>  .../devicetree/bindings/mtd/atmel-quadspi.txt      | 32 ++++++++++++=
++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/atmel-quads=
pi.txt
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/atmel-quadspi.txt =
b/Documentation/devicetree/bindings/mtd/atmel-quadspi.txt
> new file mode 100644
> index 000000000000..e81f20f9faf1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/atmel-quadspi.txt
> @@ -0,0 +1,32 @@
> +* Atmel Quad Serial Peripheral Interface (QSPI)
> +
> +Required properties:
> +- compatible:     Should be "atmel,sama5d2-qspi".
> +- reg:            Should contain the locations and lengths of the ba=
se registers
> +                  and the mapped memory.
> +- reg-names:      Should contain the resource reg names:
> +                  - qspi_base: configuration register address space
> +                  - qspi_mmap: memory mapped address space
> +- interrupts:     Should contain the interrupt for the device.
> +- clocks:         The phandle of the clock needed by the QSPI contro=
ller.
> +- #address-cells: Should be <1>.
> +- #size-cells:    Should be <0>.
> +
> +Example:
> +
> +spi@f0020000 {
> +	compatible =3D "atmel,sama5d2-qspi";
> +	reg =3D <0xf0020000 0x100>, <0xd0000000 0x8000000>;
> +	reg-names =3D "qpsi_base", "qspi_mmap";
> +	interrupts =3D <52 IRQ_TYPE_LEVEL_HIGH 7>;
> +	clocks =3D <&spi0_clk>;
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_spi0_default>;
> +	status =3D "okay";
> +
> +	m25p80@0 {
> +		...
> +	};
> +};
>=20


--=20
Nicolas Ferre
