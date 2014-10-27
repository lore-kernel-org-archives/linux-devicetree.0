From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: socfpga: fpga bridges bindings docs
Date: Mon, 27 Oct 2014 13:48:02 +0200
Message-ID: <CCE2D027-AA89-41C4-B9AA-2B92AA62129B@konsulko.com>
References: <1414108267-22058-1-git-send-email-atull@opensource.altera.com> <1414108267-22058-3-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1414108267-22058-3-git-send-email-atull@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: atull@opensource.altera.com
Cc: jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, mgerlach@opensource.altera.com, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com
List-Id: devicetree@vger.kernel.org

Hi Alan,

> On Oct 24, 2014, at 02:51 , atull@opensource.altera.com wrote:
>=20
> From: Alan Tull <atull@opensource.altera.com>
>=20
> Add DTS binding documentation for the Altera FPGA bridges.
>=20
> Signed-off-by: Alan Tull <atull@opensource.altera.com>
> ---
> .../bindings/fpga/altera-fpga2sdram-bridge.txt     |   57 +++++++++++=
+++++++++
> .../bindings/fpga/altera-hps2fpga-bridge.txt       |   53 +++++++++++=
+++++++
> 2 files changed, 110 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/fpga/altera-fpga=
2sdram-bridge.txt
> create mode 100644 Documentation/devicetree/bindings/fpga/altera-hps2=
fpga-bridge.txt
>=20
> diff --git a/Documentation/devicetree/bindings/fpga/altera-fpga2sdram=
-bridge.txt b/Documentation/devicetree/bindings/fpga/altera-fpga2sdram-=
bridge.txt
> new file mode 100644
> index 0000000..cc8f522
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fpga/altera-fpga2sdram-bridge=
=2Etxt
> @@ -0,0 +1,57 @@
> +Altera FPGA To SDRAM Bridge Driver
> +
> +This driver manages a bridge between an FPGA and the SDRAM used by a=
n host
> +processor system (HPS). The bridge contains a number read ports, wri=
te ports,
> +and command ports.  Reconfiguring these ports requires that no SDRAM
> +transactions occur during reconfiguration.  In other words, the code
> +reconfiguring the ports cannot be run out of SDRAM nor can the FPGA =
access the
> +SDRAM during the reconfiguration.  This driver does not support reco=
nfiguring
> +the ports.  Typcially, the ports are configured by code running out =
of onchip
> +ram before Linux is started.
> +
> +This driver supports enabling and disabling of the configured ports =
all at
> +once, which allows for safe reprogramming of the FPGA from user spac=
e, provided
> +the new FPGA image uses the same port configuration. User space can =
enable or
> +disable the bridge by writing a "1" or a "0", respectively, to its e=
nable file
> +under bridge's entry in /sys/class/fpga-bridge. Typically, one disab=
les the
> +bridges before reprogramming the FPGA.  Once the FPGA is reprogramme=
d, the
> +bridges are reenabled.
> +
> +Required properties:
> +
> + - compatible       : "altr,socfpga-fpga2sdram-bridge"
> +
> + - read-ports-mask  : Bits 0 to 3 corresponds read ports 0 to 3. A b=
it set to 1
> +                      indicates the corresponding read port should b=
e enabled.
> +
> + - write-ports-mask : Bits 0 to 3 corresponds write ports 0 to 3. A =
bit set
> +                      to 1 indicates the corresponding write port sh=
ould be
> +                      enabled.
> +
> + - cmd-ports-mask   : Bits 0 to 5 correspond to command ports 0 to 5=
=2E A bit set
> +                      to 1 indicates the corresponding command port =
should be
> +                      enabled.
> +
> + - altr,sdr-syscon  : phandle of the sdr module
> +
> +Optional properties:
> +
> + - label            : name that you want this bridge to show up as u=
nder
> +                      /sys/class/fpga-bridge. Default is br<device#>=
 if this is
> +                      not specified.
> +
> + - init-val         : 0 if driver should disable bridge at startup
> +                      1 if driver should enable bridge at startup
> +                      driver leaves bridge in current state if prope=
rty not
> +		      specified.

Isn=E2=80=99t init-val a boolean property? It=E2=80=99s not named very =
well.

Along with the label, is kinda hard to defend as configuration in DT.

We need to start thinking about configuration, so let me throw that in
and fan the Monday flames to a nice red-hot color.

/ {
	chosen {
		linux {
			fpga-bridge {
				node =3D <&FPGA_BRIDGE>;
				label =3D =E2=80=9Cfoo=E2=80=9D;
				enable-bridge-on-startup;
			}
		};
	};
};

We will need accessors for drivers that iterate over the chosen/linux n=
ode children
and pick up the properties meant for the given driver node.

We also need to define behaviour in case those configuration properties=
 are absent.=20

Let the flames begin=E2=80=A6

> +
> +Example:
> +	fpga2sdram_br: fpgabridge@3 {
> +		compatible =3D "altr,socfpga-fpga2sdram-bridge";
> +		label =3D "fpga2sdram";
> +		altr,sdr-syscon =3D <&sdr>;
> +		read-ports-mask =3D <3>;
> +		write-ports-mask =3D <3>;
> +		cmd-ports-mask =3D <0xd>;
> +		init-val =3D <0>;
> +	};
> diff --git a/Documentation/devicetree/bindings/fpga/altera-hps2fpga-b=
ridge.txt b/Documentation/devicetree/bindings/fpga/altera-hps2fpga-brid=
ge.txt
> new file mode 100644
> index 0000000..bc24a2e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fpga/altera-hps2fpga-bridge.t=
xt
> @@ -0,0 +1,53 @@
> +Altera FPGA/HPS Bridge Driver
> +
> +This driver manages a bridge between a FPGA and a host processor sys=
tem (HPS).
> +User space can enable or disable the bridge by writing a "1" or a "0=
",
> +respectively, to its enable file under bridge's entry in
> +/sys/class/fpga-bridge.  Typically, one disables the bridges before
> +reprogramming the FPGA.  Once the FPGA is reprogrammed, the bridges =
are
> +reenabled.
> +
> +Required properties:
> +
> + - compatible     : should contain one of:
> +                     "altr,socfpga-hps2fpga-bridge"
> +                     "altr,socfpga-lwhps2fpga-bridge"
> +                     "altr,socfpga-fpga2hps-bridge"
> +
> + - clocks         : clocks used by this module
> +
> + - altr,l3-syscon : phandle of the l3 interconnect module
> +
> +Optional properties:
> + - label          : name that you want this bridge to show up as und=
er
> +                    /sys/class/fpga-bridge.  Default is br<device#> =
if this is
> +                    not specified.
> +
> + - init-val       : 0 if driver should disable bridge at startup
> +                    1 if driver should enable bridge at startup
> +                    driver leaves bridge in current state if propert=
y not
> +                    specified.
> +
> +Example:
> +	hps_fpgabridge0: fpgabridge@0 {
> +		compatible =3D "altr,socfpga-hps2fpga-bridge";
> +		label =3D "hps2fpga";
> +		altr,l3-syscon =3D <&l3regs>;
> +		clocks =3D <&l4_main_clk>;
> +		init-val =3D <1>;
> +	};
> +
> +	hps_fpgabridge1: fpgabridge@1 {
> +		compatible =3D "altr,socfpga-lwhps2fpga-bridge";
> +		label =3D "lwhps2fpga";
> +		altr,l3-syscon =3D <&l3regs>;
> +		clocks =3D <&l4_main_clk>;
> +		init-val =3D <0>;
> +	};
> +
> +	hps_fpgabridge2: fpgabridge@2 {
> +		compatible =3D "altr,socfpga-fpga2hps-bridge";
> +		label =3D "fpga2hps";
> +		altr,l3-syscon =3D <&l3regs>;
> +		clocks =3D <&l4_main_clk>;
> +	};
> --=20
> 1.7.9.5
>=20

Regards

=E2=80=94 Pantelis


