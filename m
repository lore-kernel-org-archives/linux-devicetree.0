From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2] pinctrl: msm: Add msm8960 definitions
Date: Tue, 24 Jun 2014 19:27:08 +0100
Message-ID: <20140624182708.GA29789@leverpostej>
References: <1403633766-25796-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1403633766-25796-1-git-send-email-bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 24, 2014 at 07:16:06PM +0100, Bjorn Andersson wrote:
> Signed-off-by: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> ---
> 
> Changes since v1:
>  - Deduplicated functions for alternative pins
> 
>  .../bindings/pinctrl/qcom,msm8960-pinctrl.txt      |  103 ++
>  drivers/pinctrl/Kconfig                            |    8 +
>  drivers/pinctrl/Makefile                           |    1 +
>  drivers/pinctrl/pinctrl-msm8960.c                  | 1146 ++++++++++++++++++++
>  4 files changed, 1258 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.txt
>  create mode 100644 drivers/pinctrl/pinctrl-msm8960.c
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.txt
> new file mode 100644
> index 0000000..6e79eea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.txt
> @@ -0,0 +1,103 @@
> +Qualcomm MSM8960 TLMM block
> +
> +Required properties:
> +- compatible: "qcom,msm8960-pinctrl"
> +- reg: Should be the base address and length of the TLMM block.
> +- interrupts: Should be the parent IRQ of the TLMM block.
> +- interrupt-controller: Marks the device node as an interrupt controller.
> +- #interrupt-cells: Should be two.

There should be a description of valid values for the two cells of an
interrupt-specifier.

> +- gpio-controller: Marks the device node as a GPIO controller.
> +- #gpio-cells : Should be two.
> +                The first cell is the gpio pin number and the
> +                second cell is used for optional parameters.

And what are those optional parameters?

[...]

> +Example:
> +
> +       msmgpio: pinctrl@800000 {
> +               compatible = "qcom,msm8960-pinctrl";
> +               reg = <0x800000 0x4000>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +                interrupts = <0 32 0x4>;
> +
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&debug_uart>;

The fact that the pinctrl block itself supports pinctrl properties was
not described above.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
