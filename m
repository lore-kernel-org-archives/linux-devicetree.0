From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 06/11] ARM: dts: imx: Add imx6sll EVK board dts support
Date: Mon, 5 Dec 2016 08:25:40 -0200
Message-ID: <CAOMZO5C5-tq-OWTYcmzJt=_57wOyXzNMUes1mctwwyoegwzJyQ@mail.gmail.com>
References: <1480660774-25055-1-git-send-email-ping.bai@nxp.com>
 <1480660774-25055-7-git-send-email-ping.bai@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1480660774-25055-7-git-send-email-ping.bai@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bai Ping <ping.bai@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawnguo@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 2, 2016 at 4:39 AM, Bai Ping <ping.bai@nxp.com> wrote:
> Add basic dts support for imx6sll EVK baoard.

s/baord/board

> +       battery: max8903@0 {
> +               compatible = "fsl,max8903-charger";
> +               pinctrl-names = "default";
> +               dok_input = <&gpio4 13 1>;
> +               uok_input = <&gpio4 13 1>;
> +               chg_input = <&gpio4 15 1>;
> +               flt_input = <&gpio4 14 1>;
> +               fsl,dcm_always_high;
> +               fsl,dc_valid;
> +               fsl,adc_disable;

These properties do not exist in mainline, please remove them.


> +               status = "okay";
> +       };
> +
> +       pxp_v4l2_out {
> +               compatible = "fsl,imx6sl-pxp-v4l2";
> +               status = "okay";
> +       };

We don't have pxp support in mainline kernel, please remove it.

> +
> +       regulators {
> +               compatible = "simple-bus";
> +               #address-cells = <1>;
> +               #size-cells = <0>;


Please remove it and place the regulator nodes directly as below:


> +
> +               reg_usb_otg1_vbus: regulator@0 {
> +                       compatible = "regulator-fixed";
> +                       reg = <0>;
> +                       regulator-name = "usb_otg1_vbus";
> +                       regulator-min-microvolt = <5000000>;
> +                       regulator-max-microvolt = <5000000>;
> +                       gpio = <&gpio4 0 GPIO_ACTIVE_HIGH>;
> +                       enable-active-high;
> +               };

    reg_usb_otg1_vbus: regulator-usb-otg1-vbus {
          compatible = "regulator-fixed";
          regulator-name = "usb_otg1_vbus";
          regulator-min-microvolt = <5000000>;
          regulator-max-microvolt = <5000000>;
          gpio = <&gpio4 0 GPIO_ACTIVE_HIGH>;
          enable-active-high;
    };

> +&cpu0 {
> +       arm-supply = <&sw1a_reg>;
> +       soc-supply = <&sw1c_reg>;
> +};

This is only for LDO bypass mode, right? We don't support LDO-bypass
in mainline.

> +&gpc {
> +       fsl,ldo-bypass = <1>;

We don't support ldo-bypass in mainline, please remove it.

> +&pxp {
> +       status = "okay";
> +};

We don't support PXP in mainline, please remove it.
