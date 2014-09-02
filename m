From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v7 1/5] dt-bindings: Add RK808 device tree bindings document
Date: Mon, 1 Sep 2014 20:42:26 -0700
Message-ID: <CAD=FV=W75OA69xooHhuJT5tEGwOx53GFQEgyxFSr0ZzbfUUwWA@mail.gmail.com>
References: <1409562468-16586-1-git-send-email-zyw@rock-chips.com>
	<1409562468-16586-2-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409562468-16586-2-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lin Huang <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, xxx <xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Dmitry Torokhov <dtor@chromium>
List-Id: devicetree@vger.kernel.org

Chris,

On Mon, Sep 1, 2014 at 2:07 AM, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> Add device tree bindings documentation and a header file
> for rockchip's RK808 pmic.
>
> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Signed-off-by: Zhang Qing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>
> ---
>
> Changes in v7:
> Advices by Mark Rutland
> - modify description about clock-cells
> - update the example
>
> Changes in v6:
> Advices by Mark Rutland
> - add description about clock-cells
> Advices by Doug
> - modify description about regulator
> - remove pinctrl description
>
> Changes in v5:
> Advices by Mark Brown
> - add description about regulator valid name.
> - add a header file "rockchip,rk808".
>
> Changes in v4:
> Advices by Doug
> - add a "#clock-cells" propertiy
> - update the example
>
> Changes in v3: None
> Changes in v2: None
>
>  Documentation/devicetree/bindings/mfd/rk808.txt |  166 +++++++++++++++++++++++
>  include/dt-bindings/clock/rockchip,rk808.h      |   11 ++
>  2 files changed, 177 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/rk808.txt
>  create mode 100644 include/dt-bindings/clock/rockchip,rk808.h
>
> diff --git a/Documentation/devicetree/bindings/mfd/rk808.txt b/Documentation/devicetree/bindings/mfd/rk808.txt
> new file mode 100644
> index 0000000..f8932ac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/rk808.txt
> @@ -0,0 +1,166 @@
> +RK808 Power Management Integrated Circuit
> +
> +Required properties:
> +- compatible: "rockchip,rk808"
> +- reg: I2C slave address
> +- interrupt-parent: The parent interrupt controller.
> +- interrupts: the interrupt outputs of the controller.
> +- #clock-cells: from common clock binding; shall be set to 1 (multiple clock
> +  outputs)

I think Mark Rutland was looking for something like:

- #clock-cells: from common clock binding; shall be set to 1 (multiple clock
  outputs).  See <dt-bindings/clock/rockchip,rk808.h> for clock IDs.


> +Optional properties:
> +- clock-output-names: From common clock binding to override the
> +  default output clock name
> +- rockchip,system-power-controller: Telling whether or not this pmic is controlling
> +  the system power.
> +
> +Regulators: All the regulators of RK808 to be instantiated shall be
> +listed in a child node named 'regulators'. Each regulator is represented
> +by a child node of the 'regulators' node.
> +
> +       regulator-name {
> +               /* standard regulator bindings here */
> +       };
> +
> +Following regulators of the RK808 PMIC block are supported. Note that
> +the 'n' in regulator name, as in DCDC_REGn or LDOn, represents the DCDC or LDO
> +number as described in RK808 datasheet.
> +
> +       - DCDC_REGn
> +               - valid values for n are 1 to 4.
> +       - LDO_REGn
> +               - valid values for n are 1 to 8.
> +       - SWITCH_REGn
> +               - valid values for n are 1 to 2
> +
> +Standard regulator bindings are used inside regulator subnodes. Check
> +  Documentation/devicetree/bindings/regulator/regulator.txt
> +for more details
> +
> +Example:
> +       rk808: pmic@1b {
> +               compatible = "rockchip,rk808";
> +               clock-output-names = "xin32k", "rk808-clkout2";
> +               interrupt-parent = <&gpio0>;
> +               interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pmic_int>;
> +               reg = <0x1b>;
> +               rockchip,system-power-controller;
> +               wakeup-source;
> +               #clock-cells = <1>;
> +
> +               vcc8-supply = <&vcc_18>;
> +               vcc9-supply = <&vcc_io>;
> +               vcc10-supply = <&vcc_io>;
> +               vcc12-supply = <&vcc_io>;
> +               vddio-supply = <&vccio_pmu>;

Technically the "-supply" section shouldn't be here.  I plan to add
support for input supplies once you've landed your series.  See
<https://chromium-review.googlesource.com/#/c/214596/> for a preview.
Just leave the "-supply" section out for now.

Other than that, this looks great.

Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
