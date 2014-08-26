From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v5 1/5] dt-bindings: Add RK808 device tree bindings document
Date: Tue, 26 Aug 2014 10:18:16 +0800
Message-ID: <53FBEE68.20403@rock-chips.com>
References: <1408973362-21355-1-git-send-email-zyw@rock-chips.com> <CAD=FV=Wp7e__00WAcXZB-kZZ28hsnWwq+eYOYeeDMYNQVSmkzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=Wp7e__00WAcXZB-kZZ28hsnWwq+eYOYeeDMYNQVSmkzA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lin Huang <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, xxx <xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sonny Rao <sonnyrao@c>
List-Id: devicetree@vger.kernel.org


On 08/26/2014 04:14 AM, Doug Anderson wrote:
> Chris,
>
> On Mon, Aug 25, 2014 at 6:29 AM, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
>> Add device tree bindings documentation and a header file
>> for rockchip's RK808 pmic.
>>
>> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>
>> ---
>>
>> Changes in v5:
>> Adviced by doug
>> - add some error checking in probe
>> - move "rockchip,rk808.h" into the patch about dt-bindings
>>
>> Changes in v4:
>> Adviced by doug
>> - add "clock-output-names" propertiey
>> - add a header file "rockchip,rk808.h"
>>
>> Changes in v3:
>> - fix compile err
>>
>> Changes in v2:
>> Adviced by javier.martinez
>> - separated from rtc-rk808.c
>>
>>   Documentation/devicetree/bindings/mfd/rk808.txt |  142 +++++++++++++++++++++++
>>   include/dt-bindings/clock/rockchip,rk808.h      |   11 ++
>>   2 files changed, 153 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/rk808.txt
>>   create mode 100644 include/dt-bindings/clock/rockchip,rk808.h
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/rk808.txt b/Documentation/devicetree/bindings/mfd/rk808.txt
>> new file mode 100644
>> index 0000000..e5786e9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/rk808.txt
>> @@ -0,0 +1,142 @@
>> +RK808 Power Management Integrated Circuit
>> +
>> +Required properties:
>> +- compatible: "rockchip,rk808"
>> +- reg: I2C slave address
>> +- interrupt-parent: The parent interrupt controller.
>> +- interrupts: the interrupt outputs of the controller.
>> +- pinctrl-names: Should contain only one value - "default".
>> +- pinctrl-0: Should specify pin control groups used for this controller.
> You could probably skip including the pinctrl stuff here.  Keep it in
> the example.  Nothing in the driver requires this and it's really an
> artifact of the board.

Done

>
>> +- regulators: This is the list of child nodes that specify the regulator
> Technically "regulators" is not a property, it's a child node.  See
> max8998 maybe for a sample, where it says:
>
> Regulators: All the regulators of MAX8998 to be instantiated shall be
> listed in a child node named 'regulators'. Each regulator is represented
> by a child node of the 'regulators' node.
>
>          regulator-name {
>                  /* standard regulator bindings here */
>          };

Done

>
>> +  initialization data for defined regulators. Not all regulators for the given
>> +  device need to be present. The definition for each of these nodes is defined
>> +  using the standard binding for regulators found at
>> +  Documentation/devicetree/bindings/regulator/regulator.txt.
>> +- #clock-cells: the value should be 1
>> +- The following are the names of the regulators that the rk808 pmic block
>> +  supports. Note: The 'n' below represents the number as per the datasheet:
>> +
>> +  - DCDC_REGn
>> +       - valid values for n are 1 to 4.
>> +  - LDO_REGn
>> +       - valid values for n are 1 to 8.
>> +  - SWITCH_REGn
>> +       - valid values for n are 1 to 2.
>> +
>> +Optional properties:
>> +- clock-output-names : From common clock binding to override the
>> +  default output clock name
> nit: no space before the ":"

Done

>
>> +- rockchip,system-power-controller: Telling whether or not this pmic is controlling
>> +  the system power.
>> +
>> +Example:
>> +rk808: pmic@1b {
>> +       compatible = "rockchip,rk808";
>> +       interrupt-parent = <&gpio0>;
>> +       interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pmic_int>;
>> +       reg = <0x1b>;
>> +       #clock-cells = <1>;
>> +       clock-output-names = "xin32k0", "xin32k1";
>> +       rockchip,system-power-controller;
>> +
>> +               regulators {
> nit: you've indented regulators one too many spots.

Done

>
>
>> +                       rk808_dcdc1_reg: DCDC_REG1 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               regulator-min-microvolt = <1200000>;
>> +                               regulator-max-microvolt = <1200000>;
>> +                               regulator-name = "vdd_arm";
>> +                       };
>> +
>> +                       rk808_dcdc2_reg: DCDC_REG2 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               regulator-min-microvolt = <850000>;
>> +                               regulator-max-microvolt = <1250000>;
>> +                               regulator-name = "vdd_gpu";
>> +                       };
>> +
>> +                       rk808_dcdc3_reg: DCDC_REG3 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               regulator-name = "vdd_ddr";
>> +                       };
>> +
>> +                       rk808_dcdc4_reg: DCDC_REG4 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               regulator-min-microvolt = <3300000>;
>> +                               regulator-max-microvolt = <3300000>;
>> +                               regulator-name = "vccio";
>> +                       };
>> +
>> +                       rk808_ldo1_reg: LDO_REG1 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               regulator-min-microvolt = <3300000>;
>> +                               regulator-max-microvolt = <3300000>;
>> +                       };
>> +
>> +                       rk808_ldo2_reg: LDO_REG2 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               regulator-min-microvolt = <3300000>;
>> +                               regulator-max-microvolt = <3300000>;
>> +                       };
>> +
>> +                       rk808_ldo3_reg: LDO_REG3 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               regulator-min-microvolt = <1000000>;
>> +                               regulator-max-microvolt = <1000000>;
>> +                               regulator-name = "LDO_REG3";
>> +                       };
>> +
>> +                       rk808_ldo4_reg: LDO_REG4 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               regulator-min-microvolt = <1800000>;
>> +                               regulator-max-microvolt = <1800000>;
>> +                       };
>> +
>> +                       rk808_ldo5_reg: LDO_REG5 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               regulator-min-microvolt = <1800000>;
>> +                               regulator-max-microvolt = <3300000>;
>> +                       };
>> +
>> +                       rk808_ldo6_reg: LDO_REG6 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               regulator-min-microvolt = <1000000>;
>> +                               regulator-max-microvolt = <1000000>;
>> +                       };
>> +
>> +                       rk808_ldo7_reg: LDO_REG7 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               regulator-min-microvolt = <1800000>;
>> +                               regulator-max-microvolt = <1800000>;
>> +                       };
>> +
>> +                       rk808_ldo8_reg: LDO_REG8 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               regulator-min-microvolt = <3300000>;
>> +                               regulator-max-microvolt = <3300000>;
>> +                       };
>> +
>> +                       rk808_switch1_reg: SWITCH_REG1 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                       };
>> +
>> +                       rk808_switch2_reg: SWITCH_REG2 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                       };
>> +               };
>> +       };
>> diff --git a/include/dt-bindings/clock/rockchip,rk808.h b/include/dt-bindings/clock/rockchip,rk808.h
>> new file mode 100644
>> index 0000000..1a87343
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/rockchip,rk808.h
>> @@ -0,0 +1,11 @@
>> +/*
>> + * This header provides constants clk index RK808 pmic clkout
>> + */
>> +#ifndef _CLK_ROCKCHIP_RK808
>> +#define _CLK_ROCKCHIP_RK808
>> +
>> +/* CLOCKOUT index */
>> +#define RK808_CLKOUT0          0
>> +#define RK808_CLKOUT1          1
>> +
>> +#endif
> IMHO nothing above is terrible, but it would be nice to spin it if
> possible.  After those small cleanups I personally think this is ready
> to land.
>
> -Doug
>
>
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
