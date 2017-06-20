From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V1 1/3] pinctrl: qcom: spmi-gpio: Add support for GPIO
 LV/MV subtype
Date: Tue, 20 Jun 2017 13:15:05 +0200
Message-ID: <CACRpkdYrsOB71gJjXeQn0Q8xBTEvYSeDnRpSGm4GQ0h-=Pk3=Q@mail.gmail.com>
References: <20170613061707.13892-1-fenglinw@codeaurora.org> <20170613061707.13892-2-fenglinw@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170613061707.13892-2-fenglinw@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: fenglinw@codeaurora.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Ivan Ivanov <iivanov.xz@gmail.com>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, collinsd@quicinc.com, aghayal@qti.qualcomm.com, wruan@quicinc.com, kgunda@qti.qualcomm.com
List-Id: devicetree@vger.kernel.org

Bjr=C3=B6n and/or Ivan: please look at this.

Yours,
Linus Walleij

On Tue, Jun 13, 2017 at 8:16 AM,  <fenglinw@codeaurora.org> wrote:

> From: Fenglin Wu <fenglinw@codeaurora.org>
>
> GPIO LV (low voltage)/MV (medium voltage) subtypes have different
> features and register mappings than 4CH/8CH subtypes. Add support
> for LV and MV subtypes.
>
> Signed-off-by: Fenglin Wu <fenglinw@codeaurora.org>
> ---
>  .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt |  28 ++-
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           | 269 +++++++++++++++=
+++---
>  include/dt-bindings/pinctrl/qcom,pmic-gpio.h       |   9 +
>  3 files changed, 264 insertions(+), 42 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt=
 b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> index 8d893a8..1493c0a 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> @@ -91,14 +91,18 @@ to specify in a pin configuration subnode:
>         Value type: <string>
>         Definition: Specify the alternative function to be configured for=
 the
>                     specified pins.  Valid values are:
> -                   "normal",
> -                   "paired",
> -                   "func1",
> -                   "func2",
> -                   "dtest1",
> -                   "dtest2",
> -                   "dtest3",
> -                   "dtest4"
> +                       "normal",
> +                       "paired",
> +                       "func1",
> +                       "func2",
> +                       "dtest1",
> +                       "dtest2",
> +                       "dtest3",
> +                       "dtest4",
> +                   And following values are supported by LV/MV GPIO subt=
ypes:
> +                       "func3",
> +                       "func4",
> +                       "analog"
>
>  - bias-disable:
>         Usage: optional
> @@ -183,6 +187,14 @@ to specify in a pin configuration subnode:
>         Value type: <none>
>         Definition: The specified pins are configured in open-source mode=
.
>
> +- qcom,atest:
> +       Usage: optional
> +       Value type: <u32>
> +       Definition: Selects ATEST rail to route to GPIO when it's configu=
red
> +                   in analog-pass-through mode by specifying "analog" fu=
nction.
> +                   Valid values are 0-3 corresponding to PMIC_GPIO_AOUT_=
ATESTx
> +                   defined in <dt-bindings/pinctrl/qcom,pmic-gpio.h>.
> +
>  Example:
>
>         pm8921_gpio: gpio@150 {
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/q=
com/pinctrl-spmi-gpio.c
> index 664b641..caa07e9 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -40,6 +40,8 @@
>  #define PMIC_GPIO_SUBTYPE_GPIOC_4CH            0x5
>  #define PMIC_GPIO_SUBTYPE_GPIO_8CH             0x9
>  #define PMIC_GPIO_SUBTYPE_GPIOC_8CH            0xd
> +#define PMIC_GPIO_SUBTYPE_GPIO_LV              0x10
> +#define PMIC_GPIO_SUBTYPE_GPIO_MV              0x11
>
>  #define PMIC_MPP_REG_RT_STS                    0x10
>  #define PMIC_MPP_REG_RT_STS_VAL_MASK           0x1
> @@ -48,8 +50,10 @@
>  #define PMIC_GPIO_REG_MODE_CTL                 0x40
>  #define PMIC_GPIO_REG_DIG_VIN_CTL              0x41
>  #define PMIC_GPIO_REG_DIG_PULL_CTL             0x42
> +#define PMIC_GPIO_REG_LV_MV_DIG_OUT_SOURCE_CTL 0x44
>  #define PMIC_GPIO_REG_DIG_OUT_CTL              0x45
>  #define PMIC_GPIO_REG_EN_CTL                   0x46
> +#define PMIC_GPIO_REG_LV_MV_ANA_PASS_THRU_SEL  0x4A
>
>  /* PMIC_GPIO_REG_MODE_CTL */
>  #define PMIC_GPIO_REG_MODE_VALUE_SHIFT         0x1
> @@ -58,6 +62,13 @@
>  #define PMIC_GPIO_REG_MODE_DIR_SHIFT           4
>  #define PMIC_GPIO_REG_MODE_DIR_MASK            0x7
>
> +#define PMIC_GPIO_MODE_DIGITAL_INPUT           0
> +#define PMIC_GPIO_MODE_DIGITAL_OUTPUT          1
> +#define PMIC_GPIO_MODE_DIGITAL_INPUT_OUTPUT    2
> +#define PMIC_GPIO_MODE_ANALOG_PASS_THRU                3
> +
> +#define PMIC_GPIO_REG_LV_MV_MODE_DIR_MASK      0x3
> +
>  /* PMIC_GPIO_REG_DIG_VIN_CTL */
>  #define PMIC_GPIO_REG_VIN_SHIFT                        0
>  #define PMIC_GPIO_REG_VIN_MASK                 0x7
> @@ -69,6 +80,11 @@
>  #define PMIC_GPIO_PULL_DOWN                    4
>  #define PMIC_GPIO_PULL_DISABLE                 5
>
> +/* PMIC_GPIO_REG_LV_MV_DIG_OUT_SOURCE_CTL for LV/MV */
> +#define PMIC_GPIO_LV_MV_OUTPUT_INVERT          0x80
> +#define PMIC_GPIO_LV_MV_OUTPUT_INVERT_SHIFT    7
> +#define PMIC_GPIO_LV_MV_OUTPUT_SOURCE_SEL_MASK 0xF
> +
>  /* PMIC_GPIO_REG_DIG_OUT_CTL */
>  #define PMIC_GPIO_REG_OUT_STRENGTH_SHIFT       0
>  #define PMIC_GPIO_REG_OUT_STRENGTH_MASK                0x3
> @@ -88,9 +104,28 @@
>
>  #define PMIC_GPIO_PHYSICAL_OFFSET              1
>
> +/* PMIC_GPIO_REG_LV_MV_ANA_PASS_THRU_SEL */
> +#define PMIC_GPIO_LV_MV_ANA_MUX_SEL_MASK               0x3
> +
>  /* Qualcomm specific pin configurations */
>  #define PMIC_GPIO_CONF_PULL_UP                 (PIN_CONFIG_END + 1)
>  #define PMIC_GPIO_CONF_STRENGTH                        (PIN_CONFIG_END +=
 2)
> +#define PMIC_GPIO_CONF_ATEST                   (PIN_CONFIG_END + 3)
> +
> +/* The index of each function in pmic_gpio_functions[] array */
> +enum pmic_gpio_func_index {
> +       PMIC_GPIO_FUNC_INDEX_NORMAL     =3D 0x00,
> +       PMIC_GPIO_FUNC_INDEX_PAIRED     =3D 0x01,
> +       PMIC_GPIO_FUNC_INDEX_FUNC1      =3D 0x02,
> +       PMIC_GPIO_FUNC_INDEX_FUNC2      =3D 0x03,
> +       PMIC_GPIO_FUNC_INDEX_FUNC3      =3D 0x04,
> +       PMIC_GPIO_FUNC_INDEX_FUNC4      =3D 0x05,
> +       PMIC_GPIO_FUNC_INDEX_DTEST1     =3D 0x06,
> +       PMIC_GPIO_FUNC_INDEX_DTEST2     =3D 0x07,
> +       PMIC_GPIO_FUNC_INDEX_DTEST3     =3D 0x08,
> +       PMIC_GPIO_FUNC_INDEX_DTEST4     =3D 0x09,
> +       PMIC_GPIO_FUNC_INDEX_ANALOG     =3D 0x10,
> +};
>
>  /**
>   * struct pmic_gpio_pad - keep current GPIO settings
> @@ -102,12 +137,14 @@
>   *     open-drain or open-source mode.
>   * @output_enabled: Set to true if GPIO output logic is enabled.
>   * @input_enabled: Set to true if GPIO input buffer logic is enabled.
> + * @lv_mv_type: Set to true if GPIO subtype is GPIO_LV(0x10) or GPIO_MV(=
0x11).
>   * @num_sources: Number of power-sources supported by this GPIO.
>   * @power_source: Current power-source used.
>   * @buffer_type: Push-pull, open-drain or open-source.
>   * @pullup: Constant current which flow trough GPIO output buffer.
>   * @strength: No, Low, Medium, High
>   * @function: See pmic_gpio_functions[]
> + * @atest: the ATEST selection for GPIO analog-pass-through mode
>   */
>  struct pmic_gpio_pad {
>         u16             base;
> @@ -117,12 +154,14 @@ struct pmic_gpio_pad {
>         bool            have_buffer;
>         bool            output_enabled;
>         bool            input_enabled;
> +       bool            lv_mv_type;
>         unsigned int    num_sources;
>         unsigned int    power_source;
>         unsigned int    buffer_type;
>         unsigned int    pullup;
>         unsigned int    strength;
>         unsigned int    function;
> +       unsigned int    atest;
>  };
>
>  struct pmic_gpio_state {
> @@ -135,12 +174,14 @@ struct pmic_gpio_state {
>  static const struct pinconf_generic_params pmic_gpio_bindings[] =3D {
>         {"qcom,pull-up-strength",       PMIC_GPIO_CONF_PULL_UP,         0=
},
>         {"qcom,drive-strength",         PMIC_GPIO_CONF_STRENGTH,        0=
},
> +       {"qcom,atest",                  PMIC_GPIO_CONF_ATEST,   0},
>  };
>
>  #ifdef CONFIG_DEBUG_FS
>  static const struct pin_config_item pmic_conf_items[ARRAY_SIZE(pmic_gpio=
_bindings)] =3D {
>         PCONFDUMP(PMIC_GPIO_CONF_PULL_UP,  "pull up strength", NULL, true=
),
>         PCONFDUMP(PMIC_GPIO_CONF_STRENGTH, "drive-strength", NULL, true),
> +       PCONFDUMP(PMIC_GPIO_CONF_ATEST, "atest", NULL, true),
>  };
>  #endif
>
> @@ -152,11 +193,25 @@ struct pmic_gpio_state {
>         "gpio30", "gpio31", "gpio32", "gpio33", "gpio34", "gpio35", "gpio=
36",
>  };
>
> +/*
> + * Treat LV/MV GPIO analog-pass-through mode as a function, add it
> + * to the end of the function list. Add placeholder for the reserved
> + * functions defined in LV/MV OUTPUT_SOURCE_SEL register.
> + */
>  static const char *const pmic_gpio_functions[] =3D {
> -       PMIC_GPIO_FUNC_NORMAL, PMIC_GPIO_FUNC_PAIRED,
> -       PMIC_GPIO_FUNC_FUNC1, PMIC_GPIO_FUNC_FUNC2,
> -       PMIC_GPIO_FUNC_DTEST1, PMIC_GPIO_FUNC_DTEST2,
> -       PMIC_GPIO_FUNC_DTEST3, PMIC_GPIO_FUNC_DTEST4,
> +       [PMIC_GPIO_FUNC_INDEX_NORMAL]   =3D PMIC_GPIO_FUNC_NORMAL,
> +       [PMIC_GPIO_FUNC_INDEX_PAIRED]   =3D PMIC_GPIO_FUNC_PAIRED,
> +       [PMIC_GPIO_FUNC_INDEX_FUNC1]    =3D PMIC_GPIO_FUNC_FUNC1,
> +       [PMIC_GPIO_FUNC_INDEX_FUNC2]    =3D PMIC_GPIO_FUNC_FUNC2,
> +       [PMIC_GPIO_FUNC_INDEX_FUNC3]    =3D PMIC_GPIO_FUNC_FUNC3,
> +       [PMIC_GPIO_FUNC_INDEX_FUNC4]    =3D PMIC_GPIO_FUNC_FUNC4,
> +       [PMIC_GPIO_FUNC_INDEX_DTEST1]   =3D PMIC_GPIO_FUNC_DTEST1,
> +       [PMIC_GPIO_FUNC_INDEX_DTEST2]   =3D PMIC_GPIO_FUNC_DTEST2,
> +       [PMIC_GPIO_FUNC_INDEX_DTEST3]   =3D PMIC_GPIO_FUNC_DTEST3,
> +       [PMIC_GPIO_FUNC_INDEX_DTEST4]   =3D PMIC_GPIO_FUNC_DTEST4,
> +       "reserved-a", "reserved-b", "reserved-c",
> +       "reserved-d", "reserved-e", "reserved-f",
> +       [PMIC_GPIO_FUNC_INDEX_ANALOG]   =3D PMIC_GPIO_FUNC_ANALOG,
>  };
>
>  static int pmic_gpio_read(struct pmic_gpio_state *state,
> @@ -248,21 +303,74 @@ static int pmic_gpio_set_mux(struct pinctrl_dev *pc=
tldev, unsigned function,
>
>         pad->function =3D function;
>
> -       val =3D 0;
> +       val =3D PMIC_GPIO_MODE_DIGITAL_INPUT;
>         if (pad->output_enabled) {
>                 if (pad->input_enabled)
> -                       val =3D 2;
> +                       val =3D PMIC_GPIO_MODE_DIGITAL_INPUT_OUTPUT;
>                 else
> -                       val =3D 1;
> +                       val =3D PMIC_GPIO_MODE_DIGITAL_OUTPUT;
>         }
>
> -       val =3D val << PMIC_GPIO_REG_MODE_DIR_SHIFT;
> -       val |=3D pad->function << PMIC_GPIO_REG_MODE_FUNCTION_SHIFT;
> -       val |=3D pad->out_value & PMIC_GPIO_REG_MODE_VALUE_SHIFT;
> +       if (function > PMIC_GPIO_FUNC_INDEX_DTEST4 &&
> +                       function < PMIC_GPIO_FUNC_INDEX_ANALOG) {
> +               pr_err("reserved function: %s hasn't been enabled\n",
> +                               pmic_gpio_functions[function]);
> +               return -EINVAL;
> +       }
>
> -       ret =3D pmic_gpio_write(state, pad, PMIC_GPIO_REG_MODE_CTL, val);
> -       if (ret < 0)
> -               return ret;
> +       if (pad->lv_mv_type) {
> +               if (pad->function =3D=3D PMIC_GPIO_FUNC_INDEX_ANALOG) {
> +                       val =3D PMIC_GPIO_MODE_ANALOG_PASS_THRU;
> +                       ret =3D pmic_gpio_write(state, pad,
> +                                       PMIC_GPIO_REG_MODE_CTL, val);
> +                       if (ret < 0)
> +                               return ret;
> +
> +                       ret =3D pmic_gpio_write(state, pad,
> +                                       PMIC_GPIO_REG_LV_MV_ANA_PASS_THRU=
_SEL,
> +                                       pad->atest);
> +                       if (ret < 0)
> +                               return ret;
> +               } else {
> +                       ret =3D pmic_gpio_write(state, pad,
> +                                       PMIC_GPIO_REG_MODE_CTL, val);
> +                       if (ret < 0)
> +                               return ret;
> +
> +                       val =3D pad->out_value
> +                               << PMIC_GPIO_LV_MV_OUTPUT_INVERT_SHIFT;
> +                       val |=3D pad->function
> +                               & PMIC_GPIO_LV_MV_OUTPUT_SOURCE_SEL_MASK;
> +                       ret =3D pmic_gpio_write(state, pad,
> +                               PMIC_GPIO_REG_LV_MV_DIG_OUT_SOURCE_CTL, v=
al);
> +                       if (ret < 0)
> +                               return ret;
> +               }
> +       } else {
> +               /*
> +                * GPIO not of LV/MV subtype doesn't have "func3", "func4=
"
> +                * "analog" functions, and "dtest1" to "dtest4" functions
> +                * have register value 2 bits lower than the function ind=
ex
> +                * in pmic_gpio_functions[].
> +                */
> +               if (function =3D=3D PMIC_GPIO_FUNC_INDEX_FUNC3
> +                               || function =3D=3D PMIC_GPIO_FUNC_INDEX_F=
UNC4
> +                               || function =3D=3D PMIC_GPIO_FUNC_INDEX_A=
NALOG) {
> +                       return -EINVAL;
> +               } else if (function >=3D PMIC_GPIO_FUNC_INDEX_DTEST1 &&
> +                               function <=3D PMIC_GPIO_FUNC_INDEX_DTEST4=
) {
> +                       pad->function -=3D (PMIC_GPIO_FUNC_INDEX_DTEST1 -
> +                                       PMIC_GPIO_FUNC_INDEX_FUNC3);
> +               }
> +
> +               val =3D val << PMIC_GPIO_REG_MODE_DIR_SHIFT;
> +               val |=3D pad->function << PMIC_GPIO_REG_MODE_FUNCTION_SHI=
FT;
> +               val |=3D pad->out_value & PMIC_GPIO_REG_MODE_VALUE_SHIFT;
> +
> +               ret =3D pmic_gpio_write(state, pad, PMIC_GPIO_REG_MODE_CT=
L, val);
> +               if (ret < 0)
> +                       return ret;
> +       }
>
>         val =3D pad->is_enabled << PMIC_GPIO_REG_MASTER_EN_SHIFT;
>
> @@ -322,6 +430,9 @@ static int pmic_gpio_config_get(struct pinctrl_dev *p=
ctldev,
>         case PMIC_GPIO_CONF_STRENGTH:
>                 arg =3D pad->strength;
>                 break;
> +       case PMIC_GPIO_CONF_ATEST:
> +               arg =3D pad->atest;
> +               break;
>         default:
>                 return -EINVAL;
>         }
> @@ -396,6 +507,11 @@ static int pmic_gpio_config_set(struct pinctrl_dev *=
pctldev, unsigned int pin,
>                                 return -EINVAL;
>                         pad->strength =3D arg;
>                         break;
> +               case PMIC_GPIO_CONF_ATEST:
> +                       if (arg > PMIC_GPIO_AOUT_ATEST4)
> +                               return -EINVAL;
> +                       pad->atest =3D arg;
> +                       break;
>                 default:
>                         return -EINVAL;
>                 }
> @@ -420,19 +536,53 @@ static int pmic_gpio_config_set(struct pinctrl_dev =
*pctldev, unsigned int pin,
>         if (ret < 0)
>                 return ret;
>
> -       val =3D 0;
> +       val =3D PMIC_GPIO_MODE_DIGITAL_INPUT;
>         if (pad->output_enabled) {
>                 if (pad->input_enabled)
> -                       val =3D 2;
> +                       val =3D PMIC_GPIO_MODE_DIGITAL_INPUT_OUTPUT;
>                 else
> -                       val =3D 1;
> +                       val =3D PMIC_GPIO_MODE_DIGITAL_OUTPUT;
>         }
>
> -       val =3D val << PMIC_GPIO_REG_MODE_DIR_SHIFT;
> -       val |=3D pad->function << PMIC_GPIO_REG_MODE_FUNCTION_SHIFT;
> -       val |=3D pad->out_value & PMIC_GPIO_REG_MODE_VALUE_SHIFT;
> +       if (pad->lv_mv_type) {
> +               if (pad->function =3D=3D PMIC_GPIO_FUNC_INDEX_ANALOG) {
> +                       val =3D PMIC_GPIO_MODE_ANALOG_PASS_THRU;
> +                       ret =3D pmic_gpio_write(state, pad,
> +                                       PMIC_GPIO_REG_MODE_CTL, val);
> +                       if (ret < 0)
> +                               return ret;
>
> -       return pmic_gpio_write(state, pad, PMIC_GPIO_REG_MODE_CTL, val);
> +                       ret =3D pmic_gpio_write(state, pad,
> +                                       PMIC_GPIO_REG_LV_MV_ANA_PASS_THRU=
_SEL,
> +                                       pad->atest);
> +                       if (ret < 0)
> +                               return ret;
> +               } else {
> +                       ret =3D pmic_gpio_write(state, pad,
> +                                       PMIC_GPIO_REG_MODE_CTL, val);
> +                       if (ret < 0)
> +                               return ret;
> +
> +                       val =3D pad->out_value
> +                               << PMIC_GPIO_LV_MV_OUTPUT_INVERT_SHIFT;
> +                       val |=3D pad->function
> +                               & PMIC_GPIO_LV_MV_OUTPUT_SOURCE_SEL_MASK;
> +                       ret =3D pmic_gpio_write(state, pad,
> +                               PMIC_GPIO_REG_LV_MV_DIG_OUT_SOURCE_CTL, v=
al);
> +                       if (ret < 0)
> +                               return ret;
> +               }
> +       } else {
> +               val =3D val << PMIC_GPIO_REG_MODE_DIR_SHIFT;
> +               val |=3D pad->function << PMIC_GPIO_REG_MODE_FUNCTION_SHI=
FT;
> +               val |=3D pad->out_value & PMIC_GPIO_REG_MODE_VALUE_SHIFT;
> +
> +               ret =3D pmic_gpio_write(state, pad, PMIC_GPIO_REG_MODE_CT=
L, val);
> +               if (ret < 0)
> +                       return ret;
> +       }
> +
> +       return ret;
>  }
>
>  static void pmic_gpio_config_dbg_show(struct pinctrl_dev *pctldev,
> @@ -440,7 +590,7 @@ static void pmic_gpio_config_dbg_show(struct pinctrl_=
dev *pctldev,
>  {
>         struct pmic_gpio_state *state =3D pinctrl_dev_get_drvdata(pctldev=
);
>         struct pmic_gpio_pad *pad;
> -       int ret, val;
> +       int ret, val, function;
>
>         static const char *const biases[] =3D {
>                 "pull-up 30uA", "pull-up 1.5uA", "pull-up 31.5uA",
> @@ -471,9 +621,21 @@ static void pmic_gpio_config_dbg_show(struct pinctrl=
_dev *pctldev,
>                         ret &=3D PMIC_MPP_REG_RT_STS_VAL_MASK;
>                         pad->out_value =3D ret;
>                 }
> +               /*
> +                * For GPIO not of LV/MV subtypes, the register value of
> +                * the function mapping from "dtest1" to "dtest4" is 2 bi=
ts
> +                * lower than the function index in pmic_gpio_functions[]=
.
> +                */
> +               if (!pad->lv_mv_type &&
> +                               pad->function >=3D PMIC_GPIO_FUNC_INDEX_F=
UNC3) {
> +                       function =3D pad->function + (PMIC_GPIO_FUNC_INDE=
X_DTEST1
> +                                       - PMIC_GPIO_FUNC_INDEX_FUNC3);
> +               } else {
> +                       function =3D pad->function;
> +               }
>
>                 seq_printf(s, " %-4s", pad->output_enabled ? "out" : "in"=
);
> -               seq_printf(s, " %-7s", pmic_gpio_functions[pad->function]=
);
> +               seq_printf(s, " %-7s", pmic_gpio_functions[function]);
>                 seq_printf(s, " vin-%d", pad->power_source);
>                 seq_printf(s, " %-27s", biases[pad->pullup]);
>                 seq_printf(s, " %-10s", buffer_types[pad->buffer_type]);
> @@ -618,40 +780,72 @@ static int pmic_gpio_populate(struct pmic_gpio_stat=
e *state,
>         case PMIC_GPIO_SUBTYPE_GPIOC_8CH:
>                 pad->num_sources =3D 8;
>                 break;
> +       case PMIC_GPIO_SUBTYPE_GPIO_LV:
> +               pad->num_sources =3D 1;
> +               pad->have_buffer =3D true;
> +               pad->lv_mv_type =3D true;
> +               break;
> +       case PMIC_GPIO_SUBTYPE_GPIO_MV:
> +               pad->num_sources =3D 2;
> +               pad->have_buffer =3D true;
> +               pad->lv_mv_type =3D true;
> +               break;
>         default:
>                 dev_err(state->dev, "unknown GPIO type 0x%x\n", subtype);
>                 return -ENODEV;
>         }
>
> -       val =3D pmic_gpio_read(state, pad, PMIC_GPIO_REG_MODE_CTL);
> -       if (val < 0)
> -               return val;
> +       if (pad->lv_mv_type) {
> +               val =3D pmic_gpio_read(state, pad,
> +                               PMIC_GPIO_REG_LV_MV_DIG_OUT_SOURCE_CTL);
> +               if (val < 0)
> +                       return val;
> +
> +               pad->out_value =3D !!(val & PMIC_GPIO_LV_MV_OUTPUT_INVERT=
);
> +               pad->function =3D val & PMIC_GPIO_LV_MV_OUTPUT_SOURCE_SEL=
_MASK;
> +
> +               val =3D pmic_gpio_read(state, pad, PMIC_GPIO_REG_MODE_CTL=
);
> +               if (val < 0)
> +                       return val;
> +
> +               dir =3D val & PMIC_GPIO_REG_LV_MV_MODE_DIR_MASK;
> +       } else {
> +               val =3D pmic_gpio_read(state, pad, PMIC_GPIO_REG_MODE_CTL=
);
> +               if (val < 0)
> +                       return val;
> +
> +               pad->out_value =3D val & PMIC_GPIO_REG_MODE_VALUE_SHIFT;
>
> -       pad->out_value =3D val & PMIC_GPIO_REG_MODE_VALUE_SHIFT;
> +               dir =3D val >> PMIC_GPIO_REG_MODE_DIR_SHIFT;
> +               dir &=3D PMIC_GPIO_REG_MODE_DIR_MASK;
> +               pad->function =3D val >> PMIC_GPIO_REG_MODE_FUNCTION_SHIF=
T;
> +               pad->function &=3D PMIC_GPIO_REG_MODE_FUNCTION_MASK;
> +       }
>
> -       dir =3D val >> PMIC_GPIO_REG_MODE_DIR_SHIFT;
> -       dir &=3D PMIC_GPIO_REG_MODE_DIR_MASK;
>         switch (dir) {
> -       case 0:
> +       case PMIC_GPIO_MODE_DIGITAL_INPUT:
>                 pad->input_enabled =3D true;
>                 pad->output_enabled =3D false;
>                 break;
> -       case 1:
> +       case PMIC_GPIO_MODE_DIGITAL_OUTPUT:
>                 pad->input_enabled =3D false;
>                 pad->output_enabled =3D true;
>                 break;
> -       case 2:
> +       case PMIC_GPIO_MODE_DIGITAL_INPUT_OUTPUT:
>                 pad->input_enabled =3D true;
>                 pad->output_enabled =3D true;
>                 break;
> +       case PMIC_GPIO_MODE_ANALOG_PASS_THRU:
> +               if (pad->lv_mv_type)
> +                       pad->function =3D PMIC_GPIO_FUNC_INDEX_ANALOG;
> +               else
> +                       return -ENODEV;
> +               break;
>         default:
>                 dev_err(state->dev, "unknown GPIO direction\n");
>                 return -ENODEV;
>         }
>
> -       pad->function =3D val >> PMIC_GPIO_REG_MODE_FUNCTION_SHIFT;
> -       pad->function &=3D PMIC_GPIO_REG_MODE_FUNCTION_MASK;
> -
>         val =3D pmic_gpio_read(state, pad, PMIC_GPIO_REG_DIG_VIN_CTL);
>         if (val < 0)
>                 return val;
> @@ -676,6 +870,13 @@ static int pmic_gpio_populate(struct pmic_gpio_state=
 *state,
>         pad->buffer_type =3D val >> PMIC_GPIO_REG_OUT_TYPE_SHIFT;
>         pad->buffer_type &=3D PMIC_GPIO_REG_OUT_TYPE_MASK;
>
> +       if (pad->function =3D=3D PMIC_GPIO_FUNC_INDEX_ANALOG) {
> +               val =3D pmic_gpio_read(state, pad,
> +                               PMIC_GPIO_REG_LV_MV_ANA_PASS_THRU_SEL);
> +               if (val < 0)
> +                       return val;
> +               pad->atest =3D val & PMIC_GPIO_LV_MV_ANA_MUX_SEL_MASK;
> +       }
>         /* Pin could be disabled with PIN_CONFIG_BIAS_HIGH_IMPEDANCE */
>         pad->is_enabled =3D true;
>         return 0;
> diff --git a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h b/include/dt-bi=
ndings/pinctrl/qcom,pmic-gpio.h
> index d33f17c..85d8809 100644
> --- a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
> +++ b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
> @@ -93,15 +93,24 @@
>  #define PM8994_GPIO_S4                 2
>  #define PM8994_GPIO_L12                        3
>
> +/* ATEST MUX selection for analog-pass-through mode */
> +#define PMIC_GPIO_AOUT_ATEST1          0
> +#define PMIC_GPIO_AOUT_ATEST2          1
> +#define PMIC_GPIO_AOUT_ATEST3          2
> +#define PMIC_GPIO_AOUT_ATEST4          3
> +
>  /* To be used with "function" */
>  #define PMIC_GPIO_FUNC_NORMAL          "normal"
>  #define PMIC_GPIO_FUNC_PAIRED          "paired"
>  #define PMIC_GPIO_FUNC_FUNC1           "func1"
>  #define PMIC_GPIO_FUNC_FUNC2           "func2"
> +#define PMIC_GPIO_FUNC_FUNC3           "func3"
> +#define PMIC_GPIO_FUNC_FUNC4           "func4"
>  #define PMIC_GPIO_FUNC_DTEST1          "dtest1"
>  #define PMIC_GPIO_FUNC_DTEST2          "dtest2"
>  #define PMIC_GPIO_FUNC_DTEST3          "dtest3"
>  #define PMIC_GPIO_FUNC_DTEST4          "dtest4"
> +#define PMIC_GPIO_FUNC_ANALOG          "analog"
>
>  #define PM8038_GPIO1_2_LPG_DRV         PMIC_GPIO_FUNC_FUNC1
>  #define PM8038_GPIO3_5V_BOOST_EN       PMIC_GPIO_FUNC_FUNC1
> --
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project.
>
