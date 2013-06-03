From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: DT bindings for the palmas family MFD
Date: Mon, 3 Jun 2013 15:18:51 +0100
Message-ID: <20130603141851.GG3370@gmail.com>
References: <1370261333-5121-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1370261333-5121-1-git-send-email-j-keerthy@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: J Keerthy <j-keerthy@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, swarren@wwwdotorg.org, broonie@opensource.wolfsonmicro.com, rob.herring@calxeda.com, rob@landley.net, mturquette@linaro.org, sameo@linux.intel.com, wim@iguana.be, lgirdwood@gmail.com, gg@slimlogic.co.uk, t-kristo@ti.com, Ian Lartey <ian@slimlogic.co.uk>
List-Id: devicetree@vger.kernel.org

On Mon, 03 Jun 2013, J Keerthy wrote:

> From: Graeme Gregory <gg@slimlogic.co.uk>=20
>=20
> Add the various binding files for the palmas family of chips. There i=
s a
> top level MFD binding then a seperate binding for regulators IP block=
s on chips.
>=20
> Signed-off-by: Graeme Gregory <gg@slimlogic.co.uk>
> Signed-off-by: J Keerthy <j-keerthy@ti.com>
> Signed-off-by: Ian Lartey <ian@slimlogic.co.uk>
> ---
>  Documentation/devicetree/bindings/mfd/palmas.txt   |   49 ++++++
>  .../devicetree/bindings/regulator/palmas-pmic.txt  |  165 ++++++++++=
++++++++++
>  2 files changed, 214 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/palmas.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/palma=
s-pmic.txt
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/palmas.txt b/Docum=
entation/devicetree/bindings/mfd/palmas.txt
> new file mode 100644
> index 0000000..c6c5e78
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/palmas.txt
> @@ -0,0 +1,49 @@
> +* palmas device tree bindings
> +
> +The TI palmas family current members :-
> +twl6035 (palmas)
> +twl6037 (palmas)
> +tps65913 (palmas)
> +tps65914 (palmas)
> +
> +Required properties:
> +- compatible : Should be from the list
> +  ti,twl6035
> +  ti,twl6036
> +  ti,twl6037
> +  ti,tps65913
> +  ti,tps65914
> +  ti,tps80036
> +and also the generic series names
> +  ti,palmas
> +- interrupt-controller : palmas has its own internal IRQs
> +- #interrupt-cells : should be set to 2 for IRQ number and flags
> +  The first cell is the IRQ number.
> +  The second cell is the flags, encoded as the trigger masks from
> +  Documentation/devicetree/bindings/interrupts.txt
> +- interrupt-parent : The parent interrupt controller.
> +
> +Optional properties:
> +  ti,mux_padX : set the pad register X (1-2) to the correct muxing f=
or the
> +  		hardware, if not set will use muxing in OTP.
> +
> +Example:
> +
> +palmas {

Should this be 'palmas@48 {', as it has an address?

> +	compatible =3D "ti,twl6035", "ti,palmas";
> +	reg =3D <0x48>
> +	interrupt-parent =3D <&intc>;
> +	interrupt-controller;
> +	#interrupt-cells =3D <2>;
> +
> +	ti,mux-pad1 =3D <0>;
> +	ti,mux-pad2 =3D <0>;
> +
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	pmic {
> +		compatible =3D "ti,twl6035-pmic", "ti,palmas-pmic";
> +		....
> +	};
> +}
> diff --git a/Documentation/devicetree/bindings/regulator/palmas-pmic.=
txt b/Documentation/devicetree/bindings/regulator/palmas-pmic.txt
> new file mode 100644
> index 0000000..f7bbc3e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/palmas-pmic.txt
> @@ -0,0 +1,165 @@
> +* palmas regulator IP block devicetree bindings
> +
> +Required properties:
> +- compatible : Should be from the list
> +  ti,twl6035-pmic
> +  ti,twl6036-pmic
> +  ti,twl6037-pmic
> +  ti,tps65913-pmic
> +  ti,tps65914-pmic
> +and also the generic series names
> +  ti,palmas-pmic
> +
> +Optional properties:
> +- ti,ldo6-vibrator : ldo6 is in vibrator mode
> +
> +Optional nodes:
> +- regulators : should contain the constrains and init information fo=
r the
> +	       regulators. It should contain a subnode per regulator from t=
he
> +	       list.
> +	       For ti,palmas-pmic - smps12, smps123, smps3 depending on OTP=
,
> +	       smps45, smps457, smps7 depending on varient, smps6, smps[8-1=
0],
> +	       ldo[1-9], ldoln, ldousb
> +
> +	       optional chip specific regulator fields :-
> +	       ti,warm-reset - maintain voltage during warm reset(boolean)

Pushing the boat out a bit here, but is it possible to reuse
'regulator-always-on' for this?

> +	       ti,roof-floor - control voltage selection by pin(boolean)

Is this the same as a GPIO regulator?

If so, you might not need to add superfluous vendor specific properties=
=2E

See: Documentation/devicetree/bindings/regulator/gpio-regulator.txt

> +	       ti,sleep-mode - mode to adopt in pmic sleep 0 - off, 1 - aut=
o,
> +	       2 - eco, 3 - forced pwm

I've seen lots of sleep-mode properties, can't we define a generic
one?

> +	       ti,tstep - slope control 0 - Jump, 1 10mV/us, 2 5mV/us, 3 2.=
5mV/us
> +	       ti,smps-range - OTP has the wrong range set for the hardware=
 so override
> +	       0 - low range, 1 - high range
> +
> +Example:
> +
> +pmic@0 {

May as well drop the '@0' here unless it's meaningful.

> +	compatible =3D "ti,twl6035-pmic", "ti,palmas-pmic";
> +	interrupt-parent =3D <&palmas>;
> +	interrupts =3D <14 0>;

Use the defines found in:

arch/arm/boot/dts/include/dt-bindings/interrupt-controller/irq.h

> +	interrupt-name =3D "short-irq";
> +
> +	ti,ldo6_vibrator;

DT doesn't like '_'s, use a '-'s instead.

> +	regulators {
> +		smps12_reg : smps12 {
> +			regulator-name =3D "smps12";
> +			regulator-min-microvolt =3D < 600000>;
> +			regulator-max-microvolt =3D <1500000>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +			ti,warm-reset;

Hmm.. I see you're using 'regulator-always-on' and 'ti,warm-reset'
here. Is there every a case where there is one without the other?

> +			ti,roof-floor;
> +			ti,mode-sleep =3D <0>;
> +			ti,tstep =3D <0>;
> +			ti,smps-range =3D <1>;
> +		};
> +
> +		smps3_reg: smps3 {
> +			regulator-name =3D "smps3";
> +			regulator-min-microvolt =3D < 600000>;
> +			regulator-max-microvolt =3D <1310000>;
> +		};

Wow, this is a big example.

I don't think you need to provide more than 1 or 2 of these _reg nodes.

> +		smps45_reg: smps45 {
> +			regulator-name =3D "smps45";
> +			regulator-min-microvolt =3D < 600000>;
> +			regulator-max-microvolt =3D <1310000>;
> +		};
> +
> +		smps6_reg: smps6 {
> +			regulator-name =3D "smps6";
> +			regulator-min-microvolt =3D <1200000>;
> +			regulator-max-microvolt =3D <1200000>;
> +		};
> +
> +		smps7_reg: smps7 {
> +			regulator-name =3D "smps7";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1800000>;
> +		};
> +
> +		smps8_reg: smps8 {
> +			regulator-name =3D "smps8";
> +			regulator-min-microvolt =3D < 600000>;
> +			regulator-max-microvolt =3D <1310000>;
> +		};
> +
> +		smps9_reg: smps9 {
> +			regulator-name =3D "smps9";
> +			regulator-min-microvolt =3D <2100000>;
> +			regulator-max-microvolt =3D <2100000>;
> +		};
> +
> +		smps10_reg: smps10 {
> +			regulator-name =3D "smps10";
> +			regulator-min-microvolt =3D <5000000>;
> +			regulator-max-microvolt =3D <5000000>;
> +		};
> +
> +		ldo1_reg: ldo1 {
> +			regulator-name =3D "ldo1";
> +			regulator-min-microvolt =3D <2800000>;
> +			regulator-max-microvolt =3D <2800000>;
> +		};
> +
> +		ldo2_reg: ldo2 {
> +			regulator-name =3D "ldo2";
> +			regulator-min-microvolt =3D <2900000>;
> +			regulator-max-microvolt =3D <2900000>;
> +		};
> +
> +		ldo3_reg: ldo3 {
> +			regulator-name =3D "ldo3";
> +			regulator-min-microvolt =3D <3000000>;
> +			regulator-max-microvolt =3D <3000000>;
> +		};
> +
> +		ldo4_reg: ldo4 {
> +			regulator-name =3D "ldo4";
> +			regulator-min-microvolt =3D <2200000>;
> +			regulator-max-microvolt =3D <2200000>;
> +		};
> +
> +		ldo5_reg: ldo5 {
> +			regulator-name =3D "ldo5";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1800000>;
> +		};
> +
> +		ldo6_reg: ldo6 {
> +			regulator-name =3D "ldo6";
> +			regulator-min-microvolt =3D <1500000>;
> +			regulator-max-microvolt =3D <1500000>;
> +		};
> +
> +		ldo7_reg: ldo7 {
> +			regulator-name =3D "ldo7";
> +			regulator-min-microvolt =3D <1500000>;
> +			regulator-max-microvolt =3D <1500000>;
> +		};
> +
> +		ldo8_reg: ldo8 {
> +			regulator-name =3D "ldo8";
> +			regulator-min-microvolt =3D <1500000>;
> +			regulator-max-microvolt =3D <1500000>;
> +		};
> +
> +		ldo9_reg: ldo9 {
> +			regulator-name =3D "ldo9";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1800000>;
> +		};
> +
> +		ldoln_reg: ldoln {
> +			regulator-name =3D "ldoln";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1800000>;
> +		};
> +
> +		ldousb_reg: ldousb {
> +			regulator-name =3D "ldousb";
> +			regulator-min-microvolt =3D <3250000>;
> +			regulator-max-microvolt =3D <3250000>;
> +		};
> +	};
> +};

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
