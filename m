From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH 1/5] dt-bindings: MIPS: Document xilfpga bindings and
 boot style
Date: Thu, 15 Oct 2015 08:22:16 +0100
Message-ID: <20151015072216.GC14475@jhogan-linux.le.imgtec.org>
References: <1444827117-10939-1-git-send-email-Zubair.Kakakhel@imgtec.com>
 <1444827117-10939-2-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jy6Sn24JjFx/iggw"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444827117-10939-2-git-send-email-Zubair.Kakakhel@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: ralf@linux-mips.org, robh+dt@kernel.org, linus.walleij@linaro.org, linux-mips@linux-mips.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--jy6Sn24JjFx/iggw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Zubair,

On Wed, Oct 14, 2015 at 01:51:53PM +0100, Zubair Lutfullah Kakakhel wrote:
> Xilfpga boots only with device-tree. Document the required properties
> and the unique boot style
>=20
> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> ---
>  .../devicetree/bindings/mips/img/xilfpga.txt       | 76 ++++++++++++++++=
++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/img/xilfpga.txt
>=20
> diff --git a/Documentation/devicetree/bindings/mips/img/xilfpga.txt b/Doc=
umentation/devicetree/bindings/mips/img/xilfpga.txt
> new file mode 100644
> index 0000000..1e7084c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/img/xilfpga.txt
> @@ -0,0 +1,76 @@
> +Imagination University Program MIPSFpga
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Under the Imagination University Program, a microAptiv UP core has been =
released for academic usage.

Documentation files should still be wrapped to 80 columns.

> +
> +As we are dealing with a mips core instantiated on an FPGA, specificatio=
ns are fluid and can be varied in RTL.
> +
> +This binding document is provided as baseline guidance for the example p=
roject provided by IMG.
> +
> +The example project runs on the Nexys4DDR board by Digilent powered by t=
he ARTIX-7 FPGA by Xilinx.
> +
> +Relevant details about the example project and the Nexys4DDR board:
> +
> +- microAptiv UP core m14Kc
> +- 50MHz clock speed
> +- 128Mbyte DDR RAM	at 0x0000_0000
> +- 8Kbyte RAM		at 0x1000_0000
> +- axi_intc		at 0x1020_0000
> +- axi_uart16550		at 0x1040_0000
> +- axi_gpio		at 0x1060_0000
> +- axi_i2c		at 0x10A0_0000
> +- custom_gpio		at 0x10C0_0000
> +- axi_ethernetlite	at 0x10E0_0000
> +- 8Kbyte BootRAM	at 0x1FC0_0000
> +
> +Required properties:
> +--------------------
> + - compatible: Must include "img,xilfpga".

Is that specific enough to describe the system you're referring to
unambiguously?

> +
> +CPU nodes:
> +----------
> +A "cpus" node is required.  Required properties:
> + - #address-cells: Must be 1.
> + - #size-cells: Must be 0.
> +A CPU sub-node is also required for at least CPU 0. Required properties:
> + - device_type: Must be "cpu".
> + - compatible: Must be "mips,m14Kc".
> + - reg: Must be <0>.
> + - clocks: Must include the CPU clock.  See ../../clock/clock-bindings.t=
xt for
> +   details on clock bindings.
> + - ext clock handle for fixed-clock received by MIPS core.

that last bullet would appear to be a description of required clocks,
rather than a required property of the cpu node. Perhaps it should be in
the same paragraph as clocks property description.

> +Example:

your example doesn't have the required compatible string.

> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type =3D "cpu";
> +			compatible =3D "mips,m14Kc";
> +			reg =3D <0>;
> +			clocks	=3D <&ext>;
> +		};
> +	};
> +
> +	ext: ext {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <50000000>;
> +	};
> +
> +Boot protocol:
> +--------------
> +
> +The BootRAM is a writeable "RAM" in FPGA at 0x1FC0_0000. This is for eas=
y reprogrammibility via JTAG.
> +
> +The BootRAM inializes the cache and the axi_uart peripheral.
> +
> +DDR initialiation is already handled by a HW IP block.
> +
> +When the example project bitstream is loaded, the cpu_reset button needs=
 to be pressed.
> +
> +The bootram initializes the cache and axi_uart. Then outputs MIPSFPGA\n\=
r on the serial port
> +on the Nexys4DDR board.
> +
> +At this point, the board is ready to load the Linux kernel vmlinux file =
via JTAG.

Maybe worth clarifying whether register state should be set to anything
in particular, such as setting argument registers to zero so that you
could use them for passing command line or device tree in future, e.g.
if somebody ported u-boot to it (maybe ensure its compatible with the
UHI boot specs).

Cheers
James

--jy6Sn24JjFx/iggw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWH1QoAAoJEGwLaZPeOHZ6KTkP/iIsYuSv6Gq6rbGLYLK9kx5D
PIyuQz98ryPkUANK6ha6EG4moPFY9m07BheCp6tgqsTZDq3A1MZPoxxq2XqdRLaP
BziPVlBxdzLO6rkFa2mK0qxOknC744k0+2ZhTYUpRcYCl3k4CxBAjQgaHnZLRRGr
OIDgmOx9zNhcmKhBV/sjY8/+YbZDghFKasqv/9uxl6kshUJ/f9sNi3RZSNv/wER9
0R3Py+hzKDJQROAiqbC6RKaSEMV/7QxiBedZ+Jdg0pj8kgvzJZq+bN1SW746KsJA
jvG5h1/vcbbwyMeKrDCwNvtOgBkEOcG7P6pzY1FTJRXHrAvaHslAiQ0mmSLBVQiF
F0LRgSTIPWDbjgpNflm58iWnYdCClSQcIgbcRf2w1ZZAz0sTMagpWnHl2GjI0HjU
MftjZNdJKJ0a4sG1wZQUWjQ0QTNPSVciiTAmQhGYyFE4u+/2lDLFzRpOqAZRSCtx
TBgT+vfZ7QJxbVuFaGXHbKLUSql+8OQfmrt/qxgBgPhWtaXXGdwduohgPLDusyEl
xMsyl1285quTmEEkUyJuZZHPmlIJ/05IhAzZsmqTO7C4AGP6RK36v4ueoiakj3Mp
Ohx5GIRv9IxZx6tz9B5KjC7Wz/FcpeSYx1u1zrazPf9UlJFdIhFeH9UENzfGUTtL
aZc1vC+v6bDH4uXlN0Pl
=2KRR
-----END PGP SIGNATURE-----

--jy6Sn24JjFx/iggw--
