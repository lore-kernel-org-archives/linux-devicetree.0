From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 1/5] MFD: Add rk808 device tree bindings documentation
Date: Sun, 24 Aug 2014 21:18:59 -0700
Message-ID: <CAD=FV=VcPHCZv4UoZBHkW+3hUJBG1W2Pi7drH_wQsga9S4_bbg@mail.gmail.com>
References: <1408789763-16369-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408789763-16369-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lin Huang <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, xxx <xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sonny Rao <sonnyrao@chr>
List-Id: devicetree@vger.kernel.org

Chris,

On Sat, Aug 23, 2014 at 3:29 AM, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> rk808.txt: Add device tree bindings for rockchip's rk808 pmic.
>
> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>
> ---
>
> Changes in v4:
> Adviced by doug
> - add "clock-output-names" propertiey
> - add a header file "rockchip,rk808.h"
>
> Changes in v3:
> - fix compile err
>
> Changes in v2:
> Adviced by javier.martinez
> - separated from rtc-rk808.c
>
>  Documentation/devicetree/bindings/mfd/rk808.txt |  133 +++++++++++++++++++++++
>  1 file changed, 133 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/rk808.txt
>
> diff --git a/Documentation/devicetree/bindings/mfd/rk808.txt b/Documentation/devicetree/bindings/mfd/rk808.txt
> new file mode 100644
> index 0000000..a9368fc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/rk808.txt
> @@ -0,0 +1,133 @@
> +RK808 Power Management Integrated Circuit
> +
> +Required properties:
> +- compatible: "rockchip,rk808"
> +- reg: I2C slave address
> +- interrupt-parent: The parent interrupt controller.
> +- interrupts: the interrupt outputs of the controller.
> +- pinctrl-names: Should contain only one value - "default".
> +- pinctrl-0: Should specify pin control groups used for this controller.
> +- regulators: This is the list of child nodes that specify the regulator
> +  initialization data for defined regulators. Not all regulators for the given
> +  device need to be present. The definition for each of these nodes is defined
> +  using the standard binding for regulators found at
> +  Documentation/devicetree/bindings/regulator/regulator.txt.
> +- #clock-cells: the value should be 1

Mark Brown said:

You need to identify all the valid names for regulators on the device so
people know which string to use for which regulator.

...and you haven't incorporated that feedback yet.  The Example below
is not enough.  You should have a string like:

The following are the names of the regulators that the rk808 pmic block
supports. Note: The 'n' below represents the number as per the datasheet:

        - DCDC_REGn
                  - valid values for n are 1 to 3.
        - LDO_REGn
                  - valid values for n are 1 to 8.
        - SWITCH_REGn
                  - valid values for n are 1 to 2.

> +
> +Optional properties:
> +- clock-output-names : From common clock binding to override the
> +  default output clock name
> +- rockchip,system-power-controller: Telling whether or not this pmic is controlling
> +  the system power.
> +
> +Example:
> +rk808: pmic@1b {
> +       compatible = "rockchip,rk808";
> +       interrupt-parent = <&gpio0>;
> +       interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pmic_int>;
> +       reg = <0x1b>;
> +       #clock-cells = <1>;
> +       clock-output-names = "xin32k0", "xin32k1";
> +       rockchip,system-power-controller;
> +
> +               regulators {
> +                       rk808_dcdc1_reg: DCDC_REG1 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt = <1200000>;
> +                               regulator-max-microvolt = <1200000>;
> +                               regulator-name = "vdd_arm";
> +                       };
> +
> +                       rk808_dcdc2_reg: DCDC_REG2 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt = <850000>;
> +                               regulator-max-microvolt = <1250000>;
> +                               regulator-name = "vdd_gpu";
> +                       };
> +
> +                       rk808_dcdc3_reg: DCDC_REG3 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-name = "vdd_ddr";
> +                       };
> +
> +                       rk808_dcdc4_reg: DCDC_REG4 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt = <3300000>;
> +                               regulator-max-microvolt = <3300000>;
> +                               regulator-name = "vccio";
> +                       };
> +
> +                       rk808_ldo1_reg: LDO_REG1 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt = <3300000>;
> +                               regulator-max-microvolt = <3300000>;
> +                       };
> +
> +                       rk808_ldo2_reg: LDO_REG2 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt = <3300000>;
> +                               regulator-max-microvolt = <3300000>;
> +                       };
> +
> +                       rk808_ldo3_reg: LDO_REG3 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt = <1000000>;
> +                               regulator-max-microvolt = <1000000>;
> +                               regulator-name = "LDO_REG3";
> +                       };
> +
> +                       rk808_ldo4_reg: LDO_REG4 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <1800000>;
> +                       };
> +
> +                       rk808_ldo5_reg: LDO_REG5 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <3300000>;
> +                       };
> +
> +                       rk808_ldo6_reg: LDO_REG6 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt = <1000000>;
> +                               regulator-max-microvolt = <1000000>;
> +                       };
> +
> +                       rk808_ldo7_reg: LDO_REG7 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <1800000>;
> +                       };
> +
> +                       rk808_ldo8_reg: LDO_REG8 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt = <3300000>;
> +                               regulator-max-microvolt = <3300000>;
> +                       };
> +
> +                       rk808_switch1_reg: SWITCH_REG1 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       rk808_switch2_reg: SWITCH_REG2 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +               };
> +       };
> --
> 1.7.9.5
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
