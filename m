From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] dt-bindings: Add silabs,si5341
Date: Thu, 25 Apr 2019 16:04:06 -0700
Message-ID: <155623344648.15276.18213024444708122458@swboyd.mtv.corp.google.com>
References: <20190424090216.18417-1-mike.looijmans@topic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190424090216.18417-1-mike.looijmans@topic.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Looijmans <mike.looijmans@topic.nl>
List-Id: devicetree@vger.kernel.org

Quoting Mike Looijmans (2019-04-24 02:02:16)
> Adds the devicetree bindings for the si5341 driver that supports the
> Si5341 and Si5340 chips.
>=20
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>  .../bindings/clock/silabs,si5341.txt          | 141 ++++++++++++++++++
>  1 file changed, 141 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/silabs,si5341=
.txt
>=20
> diff --git a/Documentation/devicetree/bindings/clock/silabs,si5341.txt b/=
Documentation/devicetree/bindings/clock/silabs,si5341.txt
> new file mode 100644
> index 000000000000..1a00dd83100f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/silabs,si5341.txt
> @@ -0,0 +1,141 @@
> +Binding for Silicon Labs Si5341 and Si5340 programmable i2c clock genera=
tor.
> +
> +Reference
> +[1] Si5341 Data Sheet
> +    https://www.silabs.com/documents/public/reference-manuals/Si5341-40-=
D-RM.pdf

Thanks! I also had to look up the pinout in the datasheet, not the
reference manual above.

> +
> +The Si5341 and Si5340 are programmable i2c clock generators with up to 1=
0 output
> +clocks. The chip contains a PLL that sources 5 (or 4) multisynth clocks,=
 which
> +in turn can be directed to any of the 10 (or 4) outputs through a divide=
r.
> +The internal structure of the clock generators can be found in [1].
> +
> +The driver can be used in "as is" mode, reading the current settings fro=
m the
> +chip at boot, in case you have a (pre-)programmed device. If the PLL is =
not
> +configured when the driver probes, it assumes the driver must fully init=
ialize
> +it.
> +
> +The device type, speed grade and revision are determined runtime by prob=
ing.
> +
> +The driver currently only supports XTAL input mode, and does not support=
 any
> +fancy input configurations. They can still be programmed into the chip a=
nd
> +the driver will leave them "as is".
> +
> +=3D=3DI2C device node=3D=3D
> +
> +Required properties:
> +- compatible: shall be one of the following: "silabs,si5341", "silabs,si=
5340"
> +- reg: i2c device address, usually 0x74
> +- #clock-cells: from common clock binding; shall be set to 1.
> +- clocks: from common clock binding; list of parent clock
> +  handles, shall be xtal reference clock. Usually a fixed clock.

Is there only one possible clk parent? Looks like there's an optional
xtal on the XA/XB pins and then up to three more input clks on IN0/1/2.
So shouldn't this list all of those and then indicate that at least one
should be specified at all times?

> +- clock-names: Shall be "xtal".

This should include the other clk inputs?

> +- #address-cells: shall be set to 1.
> +- #size-cells: shall be set to 0.

I'd expect to see all the input voltage supplies here too.

	vdd-supply
	vdda-supply
	vdds-supply
	vdd0-supply
	vdd1-supply
	vdd2-supply
	vdd3-supply
	vdd4-supply
	vdd5-supply
	vdd6-supply
	vdd7-supply
	vdd8-supply
	vdd9-supply

> +
> +Optional properties:
> +- silabs,pll-m-num, silabs,pll-m-den: Numerator and denominator for PLL
> +  feedback divider. Must be such that the PLL output is in the valid ran=
ge. For
> +  example, to create 14GHz from a 48MHz xtal, use m-num=3D14000 and m-de=
n=3D48. Only
> +  the fraction matters, using 3500 and 12 will deliver the exact same re=
sult.
> +  If these are not specified, and the PLL is not yet programmed when the=
 driver
> +  probes, the PLL will be set to 14GHz.

Can this be done via assigned-clock-rates? Possibly with a table in the
clk driver to tell us how to generate those rates.

> +- silabs,reprogram: When present, the driver will always assume the devi=
ce must
> +  be initialized, and always performs the soft-reset routine. Since this=
 will
> +  temporarily stop all output clocks, don't do this if the chip is gener=
ating
> +  the CPU clock for example.

Could this be done with the reset framework? It almost sounds like if
the clk is a CLK_IS_CRITICAL then we shouldn't do the reset, otherwise
we probably should reset the chip when the driver probes. If we don't
have a case where it's going to be supplying a critical clk for a long
time then perhaps we shouldn't even consider this topic until later.

> +

Looks like there is an interrupt pin? So we need an optional interrupts
property?  Also, a reset pin, so maybe a 'resets' property. There's also
another input pin for 'output enable' which maybe someone wants to use?
Plus some other pins to control step up/down of frequency and clock
synchronization? Maybe those should be optional gpios, but it probably
can wait until later.

> +=3D=3DChild nodes=3D=3D
> +
> +Each of the clock outputs can be overwritten individually by
> +using a child node to the I2C device node. If a child node for a clock
> +output is not set, the configuration remains unchanged.
> +
> +Required child node properties:
> +- reg: number of clock output.
> +
> +Optional child node properties:
> +- silabs,format: Output format, see [1], 1=3Ddifferential, 2=3Dlow-power=
, 4=3DLVCMOS
> +- silabs,common-mode: Output common mode, depends on standard.
> +- silabs,amplitude: Output amplitude, depends on standard.
> +- silabs,synth-source: Select which multisynth to use for this output
> +- silabs,synth-frequency: Sets the frequency for the multisynth connecte=
d to
> +  this output. This will affect other outputs connected to this multisyn=
th. The
> +  setting is applied before silabs,synth-master and clock-frequency.
> +- silabs,synth-master: If present, this output is allowed to change the
> +  multisynth frequency dynamically.

These above properties look like highly detailed configuration data to
let the driver configure the clk output exactly how it's supposed to be
configured. Can these properties be rewritten in more high-level terms
that a system integrator would understand? Ideally, I shouldn't have to
read the datasheet and the driver and then figure out what DT properties
need the values from the datasheet in them so that the driver writes
them to a particular register. I don't know if that's possible here,
because I haven't read the driver or the datasheet too closely yet, but
that should be the goal.

> +- clock-frequency: Sets a default frequency for this output.

Why not use assigned-clock-rates?

> +- always-on: Immediately and permanently enable this output. Particulary
> +  useful when combined with assigned-clocks, since that does not prepare=
 clocks.

Looks like you want CLK_IS_CRITICAL in DT. We've had that discussion
before but maybe we should revisit it here and add a way to indicate
that some clk should never be turned off instead of assuming that we
can do this from C code all the time.
