From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V1 2/3] pinctrl: qcom: spmi-gpio: Add dtest route for
 digital input
Date: Tue, 20 Jun 2017 13:14:00 +0200
Message-ID: <CACRpkdax1Qhz_b6Z62qv7xF90aVk15AsUFHK=+GJ_+Y6Fyqq3A@mail.gmail.com>
References: <20170613061707.13892-1-fenglinw@codeaurora.org> <20170613061707.13892-3-fenglinw@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170613061707.13892-3-fenglinw@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: fenglinw@codeaurora.org, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, collinsd@quicinc.com, aghayal@qti.qualcomm.com, wruan@quicinc.com, kgunda@qti.qualcomm.com
List-Id: devicetree@vger.kernel.org

Bj=C3=B6rn can you look at this patch?

...and make a patch adding yourself to MAINTAINERS for drivers/pinctrl/qcom=
/*
as so many people seem to miss including you on reviews.

Yours,
Linus Walleij

On Tue, Jun 13, 2017 at 8:16 AM,  <fenglinw@codeaurora.org> wrote:
> From: Fenglin Wu <fenglinw@codeaurora.org>
>
> Add property "qcom,dtest-buffer" to specify which dtest rail to feed
> when the pin is configured as a digital input.
>
> Signed-off-by: Fenglin Wu <fenglinw@codeaurora.org>
> ---
>  .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 15 ++++++++
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           | 45 ++++++++++++++++=
++++++
>  include/dt-bindings/pinctrl/qcom,pmic-gpio.h       |  6 +++
>  3 files changed, 66 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt=
 b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> index 1493c0a..521c783 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> @@ -195,6 +195,21 @@ to specify in a pin configuration subnode:
>                     Valid values are 0-3 corresponding to PMIC_GPIO_AOUT_=
ATESTx
>                     defined in <dt-bindings/pinctrl/qcom,pmic-gpio.h>.
>
> +- qcom,dtest-buffer:
> +       Usage: optional
> +       Value type: <u32>
> +       Definition: Selects DTEST rail to route to GPIO when it's configu=
red
> +                   as a digital input.
> +                   For LV/MV GPIO subtypes, the valid values are 0-3
> +                   corresponding to PMIC_GPIO_DIN_DTESTx defined in
> +                   <dt-bindings/pinctrl/qcom,pmic-gpio.h>. Only one
> +                   DTEST rail can be selected at a time.
> +                   For 4CH/8CH GPIO subtypes, supported values are 1-15.
> +                   4 DTEST rails are supported in total and more than 1 =
DTEST
> +                   rail can be selected simultaneously. Each bit of the
> +                   4 LSBs represent one DTEST rail, such as [3:0] =3D 01=
01
> +                   means both DTEST1 and DTEST3 are selected.
> +
>  Example:
>
>         pm8921_gpio: gpio@150 {
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/q=
com/pinctrl-spmi-gpio.c
> index caa07e9..581309d 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -51,6 +51,7 @@
>  #define PMIC_GPIO_REG_DIG_VIN_CTL              0x41
>  #define PMIC_GPIO_REG_DIG_PULL_CTL             0x42
>  #define PMIC_GPIO_REG_LV_MV_DIG_OUT_SOURCE_CTL 0x44
> +#define PMIC_GPIO_REG_DIG_IN_CTL               0x43
>  #define PMIC_GPIO_REG_DIG_OUT_CTL              0x45
>  #define PMIC_GPIO_REG_EN_CTL                   0x46
>  #define PMIC_GPIO_REG_LV_MV_ANA_PASS_THRU_SEL  0x4A
> @@ -85,6 +86,11 @@
>  #define PMIC_GPIO_LV_MV_OUTPUT_INVERT_SHIFT    7
>  #define PMIC_GPIO_LV_MV_OUTPUT_SOURCE_SEL_MASK 0xF
>
> +/* PMIC_GPIO_REG_DIG_IN_CTL */
> +#define PMIC_GPIO_LV_MV_DIG_IN_DTEST_EN                0x80
> +#define PMIC_GPIO_LV_MV_DIG_IN_DTEST_SEL_MASK  0x7
> +#define PMIC_GPIO_DIG_IN_DTEST_SEL_MASK                0xf
> +
>  /* PMIC_GPIO_REG_DIG_OUT_CTL */
>  #define PMIC_GPIO_REG_OUT_STRENGTH_SHIFT       0
>  #define PMIC_GPIO_REG_OUT_STRENGTH_MASK                0x3
> @@ -111,6 +117,7 @@
>  #define PMIC_GPIO_CONF_PULL_UP                 (PIN_CONFIG_END + 1)
>  #define PMIC_GPIO_CONF_STRENGTH                        (PIN_CONFIG_END +=
 2)
>  #define PMIC_GPIO_CONF_ATEST                   (PIN_CONFIG_END + 3)
> +#define PMIC_GPIO_CONF_DTEST_BUFFER            (PIN_CONFIG_END + 4)
>
>  /* The index of each function in pmic_gpio_functions[] array */
>  enum pmic_gpio_func_index {
> @@ -145,6 +152,8 @@ enum pmic_gpio_func_index {
>   * @strength: No, Low, Medium, High
>   * @function: See pmic_gpio_functions[]
>   * @atest: the ATEST selection for GPIO analog-pass-through mode
> + * @dtest_buffer: the DTEST buffer selection for digital input mode,
> + *     the default value is INT_MAX if not used.
>   */
>  struct pmic_gpio_pad {
>         u16             base;
> @@ -162,6 +171,7 @@ struct pmic_gpio_pad {
>         unsigned int    strength;
>         unsigned int    function;
>         unsigned int    atest;
> +       unsigned int    dtest_buffer;
>  };
>
>  struct pmic_gpio_state {
> @@ -175,6 +185,7 @@ struct pmic_gpio_state {
>         {"qcom,pull-up-strength",       PMIC_GPIO_CONF_PULL_UP,         0=
},
>         {"qcom,drive-strength",         PMIC_GPIO_CONF_STRENGTH,        0=
},
>         {"qcom,atest",                  PMIC_GPIO_CONF_ATEST,   0},
> +       {"qcom,dtest-buffer",           PMIC_GPIO_CONF_DTEST_BUFFER,    0=
},
>  };
>
>  #ifdef CONFIG_DEBUG_FS
> @@ -433,6 +444,9 @@ static int pmic_gpio_config_get(struct pinctrl_dev *p=
ctldev,
>         case PMIC_GPIO_CONF_ATEST:
>                 arg =3D pad->atest;
>                 break;
> +       case PMIC_GPIO_CONF_DTEST_BUFFER:
> +               arg =3D pad->dtest_buffer;
> +               break;
>         default:
>                 return -EINVAL;
>         }
> @@ -512,6 +526,13 @@ static int pmic_gpio_config_set(struct pinctrl_dev *=
pctldev, unsigned int pin,
>                                 return -EINVAL;
>                         pad->atest =3D arg;
>                         break;
> +               case PMIC_GPIO_CONF_DTEST_BUFFER:
> +                       if ((pad->lv_mv_type && arg > PMIC_GPIO_DIN_DTEST=
4)
> +                                       || (!pad->lv_mv_type && arg >
> +                                       PMIC_GPIO_DIG_IN_DTEST_SEL_MASK))
> +                               return -EINVAL;
> +                       pad->dtest_buffer =3D arg;
> +                       break;
>                 default:
>                         return -EINVAL;
>                 }
> @@ -544,6 +565,17 @@ static int pmic_gpio_config_set(struct pinctrl_dev *=
pctldev, unsigned int pin,
>                         val =3D PMIC_GPIO_MODE_DIGITAL_OUTPUT;
>         }
>
> +       if (pad->dtest_buffer !=3D INT_MAX) {
> +               val =3D pad->dtest_buffer;
> +               if (pad->lv_mv_type)
> +                       val |=3D PMIC_GPIO_LV_MV_DIG_IN_DTEST_EN;
> +
> +               ret =3D pmic_gpio_write(state, pad,
> +                               PMIC_GPIO_REG_DIG_IN_CTL, val);
> +               if (ret < 0)
> +                       return ret;
> +       }
> +
>         if (pad->lv_mv_type) {
>                 if (pad->function =3D=3D PMIC_GPIO_FUNC_INDEX_ANALOG) {
>                         val =3D PMIC_GPIO_MODE_ANALOG_PASS_THRU;
> @@ -641,6 +673,8 @@ static void pmic_gpio_config_dbg_show(struct pinctrl_=
dev *pctldev,
>                 seq_printf(s, " %-10s", buffer_types[pad->buffer_type]);
>                 seq_printf(s, " %-4s", pad->out_value ? "high" : "low");
>                 seq_printf(s, " %-7s", strengths[pad->strength]);
> +               if (pad->dtest_buffer !=3D INT_MAX)
> +                       seq_printf(s, " dtest buffer %d", pad->dtest_buff=
er);
>         }
>  }
>
> @@ -860,6 +894,17 @@ static int pmic_gpio_populate(struct pmic_gpio_state=
 *state,
>         pad->pullup =3D val >> PMIC_GPIO_REG_PULL_SHIFT;
>         pad->pullup &=3D PMIC_GPIO_REG_PULL_MASK;
>
> +       val =3D pmic_gpio_read(state, pad, PMIC_GPIO_REG_DIG_IN_CTL);
> +       if (val < 0)
> +               return val;
> +
> +       if (pad->lv_mv_type && (val & PMIC_GPIO_LV_MV_DIG_IN_DTEST_EN))
> +               pad->dtest_buffer =3D val & PMIC_GPIO_LV_MV_DIG_IN_DTEST_=
SEL_MASK;
> +       else if (!pad->lv_mv_type)
> +               pad->dtest_buffer =3D val & PMIC_GPIO_DIG_IN_DTEST_SEL_MA=
SK;
> +       else
> +               pad->dtest_buffer =3D INT_MAX;
> +
>         val =3D pmic_gpio_read(state, pad, PMIC_GPIO_REG_DIG_OUT_CTL);
>         if (val < 0)
>                 return val;
> diff --git a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h b/include/dt-bi=
ndings/pinctrl/qcom,pmic-gpio.h
> index 85d8809..21738ed 100644
> --- a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
> +++ b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
> @@ -99,6 +99,12 @@
>  #define PMIC_GPIO_AOUT_ATEST3          2
>  #define PMIC_GPIO_AOUT_ATEST4          3
>
> +/* DTEST buffer for digital input mode */
> +#define PMIC_GPIO_DIN_DTEST1           0
> +#define PMIC_GPIO_DIN_DTEST2           1
> +#define PMIC_GPIO_DIN_DTEST3           2
> +#define PMIC_GPIO_DIN_DTEST4           3
> +
>  /* To be used with "function" */
>  #define PMIC_GPIO_FUNC_NORMAL          "normal"
>  #define PMIC_GPIO_FUNC_PAIRED          "paired"
> --
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project.
>
