From: york sun <york.sun@nxp.com>
Subject: Re: [Patch v9] driver/clk/clk-si5338: Add common clock framework
 driver for si5338
Date: Fri, 2 Sep 2016 15:57:52 +0000
Message-ID: <AM4PR0401MB17325C321529FA8D71258FC39AE50@AM4PR0401MB1732.eurprd04.prod.outlook.com>
References: <1472247978-29312-1-git-send-email-york.sun@nxp.com>
 <20160902140444.GA13679@rob-hp-laptop>
Reply-To: york sun <york.sun@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, York Sun <yorksun@freescale.com>, Mike Turquette <mturquette@baylibre.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Andrey Filippov <andrey@elphel.com>, Paul Bolle <pebolle@tiscali.nl>, Stephen Boyd <sboyd@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 09/02/2016 07:04 AM, Rob Herring wrote:=0A=
> On Fri, Aug 26, 2016 at 02:45:49PM -0700, York Sun wrote:=0A=
>> From: York Sun <yorksun@freescale.com>=0A=
>>=0A=
>> SI5338 is a programmable clock generator. It has 4 sets of inputs,=0A=
>> PLL, multisynth and dividers to make 4 outputs. This driver splits=0A=
>> them into multiple clocks to comply with common clock framework.=0A=
>>=0A=
>> See Documentation/devicetree/bindings/clock/silabs,si5338.txt for=0A=
>> details.=0A=
>>=0A=
>> Signed-off-by: York Sun <yorksun@freescale.com>=0A=
>> CC: Mike Turquette <mturquette@baylibre.com>=0A=
>> CC: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>=0A=
>> CC: Guenter Roeck <linux@roeck-us.net>=0A=
>> CC: Andrey Filippov <andrey@elphel.com>=0A=
>> CC: Paul Bolle <pebolle@tiscali.nl>=0A=
>=0A=
> 7 versions before you decide to start cc'ing DT list?=0A=
=0A=
7? I only started to CC DT list since version 8. Didn't know I needed =0A=
to. I thought device tree binding is part of driver.=0A=
=0A=
>=0A=
> [...]=0A=
>=0A=
>> diff --git a/Documentation/devicetree/bindings/clock/silabs,si5338.txt b=
/Documentation/devicetree/bindings/clock/silabs,si5338.txt=0A=
>> new file mode 100644=0A=
>> index 0000000..cc7ae8e=0A=
>> --- /dev/null=0A=
>> +++ b/Documentation/devicetree/bindings/clock/silabs,si5338.txt=0A=
>> @@ -0,0 +1,192 @@=0A=
>> +Binding for Silicon Labs Si5338 programmable i2c clock generator.=0A=
>> +=0A=
>> +Reference=0A=
>> +[1] Si5338 Data Sheet=0A=
>> +    http://www.silabs.com/Support%20Documents/TechnicalDocs/Si5338.pdf=
=0A=
>> +=0A=
>> +The Si5338 is a programmable i2c clock generators with up to 4 output=
=0A=
>> +clocks. It has 4 sets of possible input clocks=0A=
>> +=0A=
>> +IN1/IN2: differential=0A=
>> +IN3: single-ended=0A=
>> +IN4: single-ended=0A=
>> +IN5/IN6: differential=0A=
>> +=0A=
>> +Additionally, IN1/IN2 can be used as XTAL with different setting.=0A=
>> +The clock tree looks like below (without support of zero-delay)=0A=
>> +=0A=
>> +=0A=
>> +      IN1/IN2 IN3         IN4 IN5/IN6=0A=
>> +         |     |           |     |=0A=
>> +   ------|     |           |     |=0A=
>> +   |     |     |           |     |=0A=
>> +   |     \     /           \     /=0A=
>> +   |      \   /             \   /=0A=
>> +   |       \ /               \ /=0A=
>> + XTAL     REFCLK            FBCLK=0A=
>> +   |       |  \             /   |=0A=
>> +   |       |   \           /    |=0A=
>> +   |       | DIVREFCLK DIVFBCLK |=0A=
>> +   |       |     \       /      |=0A=
>> +   |       |      \     /       |=0A=
>> +   |       |       \   /        |=0A=
>> +   |       |        PLL         |=0A=
>> +   |       |      / | | \       |=0A=
>> +   |       |     /  / \  \      |=0A=
>> +   |       |    /  /   \  \     |=0A=
>> +   |       |   /   |   |   \    |=0A=
>> +   |       |   |   |   |   |    |=0A=
>> +   |       |  MS0 MS1 MS2 MS3   |=0A=
>> +   |       |   |   |   |   |    |=0A=
>> +=0A=
>> +       OUT0  OUT1  OUT2  OUT3=0A=
>> +=0A=
>> +The output clock can choose from any of the above clock as its source, =
with=0A=
>> +exceptions: MS1 can only be used for OUT1, MS2 can only be used for OUT=
2, MS3=0A=
>> +can only be used for OUT3.=0A=
>> +=0A=
>> +=3D=3DI2C device node=3D=3D=0A=
>> +=0A=
>> +Required properties:=0A=
>> +- compatible: shall be "silabs,si5338".=0A=
>> +- reg: i2c device address, shall be 0x60, 0x61, 0x70, or 0x71=0A=
>> +- #clock-cells: shall be set to 1 for multiple outputs=0A=
>> +- clocks: list of parent clocks in the order of <xtal>, <in1/2>, <in3>,=
 <in4>,=0A=
>> +	 <in5/6>.=0A=
>> +	Note, xtal and in1/2 are mutually exclusive. Only one can be set.=0A=
>> +- clock-names: The name of the clocks in the same order.=0A=
>> +- #address-cells: shall be set to 1.=0A=
>> +- #size-cells: shall be set to 0.=0A=
>> +- silabs,pll-master: If PLL is used, pick one MS (0, 1, 2, or 3) to all=
ow=0A=
>> +	chaning PLL rate. This is arbitrary since MS0/1/2/3 share one PLL.=0A=
>> +	PLL can be calculated backward to satisfy MS. This node is not=0A=
>> +	required if PLL is not used, or if silabs,pll-vco is set.=0A=
>> +=0A=
>> +Optional properties if not set by platform driver:=0A=
>> +- silab,name-prefix: name prefix for si5338=0A=
>> +        If multiple si5338 chips exist, use name-prefix to form unique =
names.=0A=
>> +	If omitted, i2c bus name will be used as the prefix.=0A=
>=0A=
> Drop this please. There should not be any need for it.=0A=
=0A=
Which part? The default name, or slab,name-prefix completely?=0A=
=0A=
When multiple si5338 chips exist, we need to name the clocks =0A=
differently, don't we?=0A=
=0A=
>=0A=
>> +- silab,ref-source: source of refclk, valid value is defined as=0A=
>> +	#define SI5338_REF_SRC_CLKIN12          0=0A=
>> +	#define SI5338_REF_SRC_CLKIN3           1=0A=
>> +	#define SI5338_REF_SRC_XTAL             4=0A=
>> +- silab,fb-source:  source of fbclk, valid value is defined as=0A=
>> +	#define SI5338_FB_SRC_CLKIN4            2=0A=
>> +	#define SI5338_FB_SRC_CLKIN56           3=0A=
>> +	#define SI5338_FB_SRC_NOCLK             5=0A=
>> +- silabs,pll-source: source of pll, valid value is defined as=0A=
>> +	#define SI5338_PFD_IN_REF_REFCLK           0=0A=
>> +	#define SI5338_PFD_IN_REF_FBCLK            1=0A=
>> +	#define SI5338_PFD_IN_REF_DIVREFCLK        2=0A=
>> +	#define SI5338_PFD_IN_REF_DIVFBCLK         3=0A=
>> +	#define SI5338_PFD_IN_REF_XOCLK            4=0A=
>> +	#define SI5338_PFD_IN_REF_NOCLK            5=0A=
>> +- silabs,pll-vco: Specify VCO frequency for optimal ratios for all outp=
uts.=0A=
>> +	If specified, silabs,pll-master is ignored.=0A=
>> +=0A=
>> +=3D=3DChild nodes=3D=3D=0A=
>> +=0A=
>> +Each of the clock outputs can be configured individually by=0A=
>> +using a child node to the I2C device node. If a child node for a clock=
=0A=
>> +output is not set, platform driver has to set up.=0A=
>> +=0A=
>> +Required child node properties:=0A=
>> +- name: name for the child node=0A=
>> +        It has to be unique. The name prefix is ignored.=0A=
>> +	If using platform data and the name is not specificed,=0A=
>> +        clkout0/1/2/3 will be used with name prefix.=0A=
>> +- reg: number of clock output.=0A=
>> +=0A=
>> +Optional child node properties:=0A=
>> +- silabs,drive-config: the configuration of output driver=0A=
>> +  The valid value list is long. Please refer to soruce code.=0A=
>=0A=
> May be long, but needs to be documented here. I don't follow why you are=
=0A=
> using strings for the values here.=0A=
=0A=
Using string so it is readable. The acceptable values are=0A=
=0A=
3V3_CMOS_A+=0A=
3V3_CMOS_A-=0A=
3V3_CMOS_B+=0A=
3V3_CMOS_B-=0A=
3V3_CMOS_A+B+=0A=
3V3_CMOS_A-B+=0A=
3V3_CMOS_A+B-=0A=
3V3_CMOS_A-B-=0A=
=0A=
2V5_CMOS_A+=0A=
2V5_CMOS_A-=0A=
2V5_CMOS_B+=0A=
2V5_CMOS_B-=0A=
2V5_CMOS_A+B+=0A=
2V5_CMOS_A-B+=0A=
2V5_CMOS_A+B-=0A=
2V5_CMOS_A-B-=0A=
=0A=
1V8_CMOS_A+=0A=
1V8_CMOS_A-=0A=
1V8_CMOS_B+=0A=
1V8_CMOS_B-=0A=
1V8_CMOS_A+B+=0A=
1V8_CMOS_A-B+=0A=
1V8_CMOS_A+B-=0A=
1V8_CMOS_A-B-=0A=
=0A=
1V5_HSTL_A+=0A=
1V5_HSTL_A-=0A=
1V5_HSTL_B+=0A=
1V5_HSTL_B-=0A=
1V5_HSTL_A+B+=0A=
1V5_HSTL_A-B+=0A=
1V5_HSTL_A+B-=0A=
1V5_HSTL_A-B-=0A=
=0A=
3V3_SSTL_A+=0A=
3V3_SSTL_A-=0A=
3V3_SSTL_B+=0A=
3V3_SSTL_B-=0A=
3V3_SSTL_A+B+=0A=
3V3_SSTL_A-B+=0A=
3V3_SSTL_A+B-=0A=
3V3_SSTL_A-B-=0A=
=0A=
2V5_SSTL_A+=0A=
2V5_SSTL_A-=0A=
2V5_SSTL_B+=0A=
2V5_SSTL_B-=0A=
2V5_SSTL_A+B+=0A=
2V5_SSTL_A-B+=0A=
2V5_SSTL_A+B-=0A=
2V5_SSTL_A-B-=0A=
=0A=
1V8_SSTL_A+=0A=
1V8_SSTL_A-=0A=
1V8_SSTL_B+=0A=
1V8_SSTL_B-=0A=
1V8_SSTL_A+B+=0A=
1V8_SSTL_A-B+=0A=
1V8_SSTL_A+B-=0A=
1V8_SSTL_A-B-=0A=
=0A=
3V3_LVPECL=0A=
2V5_LVPECL=0A=
3V3_LVDS=0A=
2V5_LVDS=0A=
1V8_LVDS=0A=
=0A=
Will add here in next version.=0A=
=0A=
>=0A=
>> +- silabs,clock-source: source clock of the output divider=0A=
>> +	#define SI5338_OUT_MUX_FBCLK            0=0A=
>> +	#define SI5338_OUT_MUX_REFCLK           1=0A=
>> +	#deinfe SI5338_OUT_MUX_DIVFBCLK         2=0A=
>> +	#deinfe SI5338_OUT_MUX_DIVREFCLK        3=0A=
>> +	#deinfe SI5338_OUT_MUX_XOCLK            4=0A=
>> +	#deinfe SI5338_OUT_MUX_MS0              5=0A=
>> +	#deinfe SI5338_OUT_MUX_MSN              6 /* MS0/1/2/3 */=0A=
>> +	#deinfe SI5338_OUT_MUX_NOCLK            7=0A=
>> +- silabs,disable-state : clock output disable state, shall be=0A=
>> +	#define SI5338_OUT_DIS_HIZ              0=0A=
>> +	#define SI5338_OUT_DIS_LOW              1=0A=
>> +	#define SI5338_OUT_DIS_HI               2=0A=
>> +	#define SI5338_OUT_DIS_ALWAYS_ON        3=0A=
>> +- enabled: the output is enabled by default=0A=
>> +	The existence of this node enables the output when the driver is loade=
d=0A=
>> +	otherwise the clock is only enabled when used=0A=
>=0A=
> Drop this. Either platform code should claim this and enable the clock=0A=
> or use the critical clocks binding.=0A=
=0A=
The idea is to specify if the clock(s) should be enabled upon loading =0A=
the driver.  I am not familiar with critical clocks binding. Can you =0A=
point me to its document/code? Not seeing it in kernel tree.=0A=
=0A=
>=0A=
>> +=0A=
>> +=3D=3DExample=3D=3D=0A=
>> +=0A=
>> +/* 25MHz reference crystal */=0A=
>> +ref25: ref25M {=0A=
>> +	compatible =3D "fixed-clock";=0A=
>> +	#clock-cells =3D <0>;=0A=
>> +	clock-frequency =3D <25000000>;=0A=
>> +};=0A=
>> +clkin56: ref100M {=0A=
>> +	compatible =3D "fixed-clock";=0A=
>> +	#clock-cells =3D <0>;=0A=
>> +	clock-frequency =3D <100000000>;=0A=
>> +};=0A=
>> +i2c-master-node {=0A=
>> +	si5338: clock-generator@70 {=0A=
>> +		compatible =3D "silabs,si5338";=0A=
>> +		reg =3D <0x70>;=0A=
>> +		#address-cells =3D <1>;=0A=
>> +		#size-cells =3D <0>;=0A=
>> +		#clock-cells =3D <1>;=0A=
>> +=0A=
>> +		/* connect xtal to 25MHz, in5/in6 to 100MHz */=0A=
>> +		clocks =3D <&ref25>, <0>, <0>, <0>, <&clkin56>;=0A=
>> +		clock-names =3D "xtal", "in12", "in3", "in4", "in56";=0A=
>> +=0A=
>> +		/* connect xtal as source of refclk */=0A=
>> +		silab,ref-source =3D <SI5338_REF_SRC_XTAL>;=0A=
>> +=0A=
>> +		/* connect in5/in6 as source of fbclk */=0A=
>> +		silab,fb-source =3D <SI5338_FB_SRC_CLKIN56>;=0A=
>> +=0A=
>> +		/* connect divrefclk as source of pll */=0A=
>> +		silab,pll-source =3D <SI5338_PFD_IN_REF_DIVREFCLK>;=0A=
>> +=0A=
>> +		/* Choose one MS for pll master */=0A=
>> +		silabs,pll-master =3D <0>;=0A=
>> +=0A=
>> +		/* Specify pll-vco frequency. pll-master is ignored. */=0A=
>> +		silabs,pll-vco =3D <2450000000>;=0A=
>> +=0A=
>> +		/* output */=0A=
>> +		clkout0 {=0A=
>=0A=
> reg property means you need a unit address.=0A=
=0A=
The reg has the address of each output, i.e. 0, 1, 2, 3. What's wrong here?=
=0A=
=0A=
>=0A=
>> +			reg =3D <0>;=0A=
>> +			silabs,drive-config =3D "1V8_LVDS";=0A=
>> +			silabs,clock-source =3D <SI5338_OUT_MUX_MS0>;=0A=
>> +			silabs,disable-state =3D <SI5338_OUT_DIS_HIZ>;=0A=
>> +			clock-frequency =3D <125000000>;=0A=
>> +		};=0A=
>> +		clkout1 {=0A=
>> +			reg =3D <1>;=0A=
>> +			silabs,drive-config =3D "1V8_LVDS";=0A=
>> +			silabs,clock-source =3D <SI5338_OUT_MUX_MSN>;=0A=
>> +			silabs,disable-state =3D <SI5338_OUT_DIS_HIZ>;=0A=
>> +			clock-frequency =3D <125000000>;=0A=
>> +		};=0A=
>> +		clkout2 {=0A=
>> +			reg =3D <2>;=0A=
>> +			silabs,drive-config =3D "1V8_LVDS";=0A=
>> +			silabs,clock-source =3D <SI5338_OUT_MUX_MSN>;=0A=
>> +			silabs,disable-state =3D <SI5338_OUT_DIS_HIZ>;=0A=
>> +			clock-frequency =3D <125000000>;=0A=
>> +		};=0A=
>> +		clkout3 {=0A=
>> +			reg =3D <3>;=0A=
>> +			silabs,drive-config =3D "1V8_LVDS";=0A=
>> +			silabs,clock-source =3D <SI5338_OUT_MUX_MSN>;=0A=
>> +			silabs,disable-state =3D <SI5338_OUT_DIS_HIZ>;=0A=
>> +			clock-frequency =3D <125000000>;=0A=
>> +		};=0A=
>> +=0A=
>> +	};=0A=
>> +};=0A=
=0A=
I see no more comment below. Are you OK with the rest of the patch?=0A=
=0A=
York=0A=
=0A=
=0A=
