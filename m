From: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/3] pinctrl: Add sleep related state to indicate sleep
 related configs
Date: Wed, 2 Aug 2017 14:50:05 +0800
Message-ID: <CAMz4kuKJ+8XiaK9MaU+2wh1OoXeVFq=9zq2ab-CtDcZZzhzMrA@mail.gmail.com>
References: <eb7925c9642efb8a1ee5804a9b06f06d9f082089.1500018536.git.baolin.wang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <eb7925c9642efb8a1ee5804a9b06f06d9f082089.1500018536.git.baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi LinusW and Rob,

On 14 July 2017 at 16:08, Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org> wrote:
> In some scenarios, we should set some pins as input/output/pullup/pulldown
> when the specified system goes into deep sleep mode, then when the system
> goes into deep sleep mode, these pins will be set automatically by hardware.
>
> That means some pins are not controlled by any specific driver in the OS, but
> need to be controlled when entering sleep mode. Thus we introduce one sleep
> state config into pinconf-generic for users to configure.
>
> Signed-off-by: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
> ---
> Changes since v4:
>  - Add sleep-hardware-state config to indicate sleep related configs.
> ---

Do you have any comments about this patch set? Thanks.

>  .../bindings/pinctrl/pinctrl-bindings.txt          |    2 ++
>  drivers/pinctrl/pinconf-generic.c                  |    2 ++
>  include/linux/pinctrl/pinconf-generic.h            |    2 ++
>  3 files changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> index bf3f7b0..2365a21 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> @@ -236,6 +236,8 @@ low-power-enable    - enable low power mode
>  low-power-disable      - disable low power mode
>  output-low             - set the pin to output mode with low level
>  output-high            - set the pin to output mode with high level
> +sleep-hardware-state   - indicate this is sleep related state which will be programmed
> +                         into the registers for the sleep state.
>  slew-rate              - set the slew rate
>
>  For example:
> diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
> index ce3335a..9a7f168 100644
> --- a/drivers/pinctrl/pinconf-generic.c
> +++ b/drivers/pinctrl/pinconf-generic.c
> @@ -46,6 +46,7 @@
>         PCONFDUMP(PIN_CONFIG_LOW_POWER_MODE, "pin low power", "mode", true),
>         PCONFDUMP(PIN_CONFIG_OUTPUT, "pin output", "level", true),
>         PCONFDUMP(PIN_CONFIG_POWER_SOURCE, "pin power source", "selector", true),
> +       PCONFDUMP(PIN_CONFIG_SLEEP_HARDWARE_STATE, "sleep hardware state", NULL, false),
>         PCONFDUMP(PIN_CONFIG_SLEW_RATE, "slew rate", NULL, true),
>  };
>
> @@ -175,6 +176,7 @@ void pinconf_generic_dump_config(struct pinctrl_dev *pctldev,
>         { "output-high", PIN_CONFIG_OUTPUT, 1, },
>         { "output-low", PIN_CONFIG_OUTPUT, 0, },
>         { "power-source", PIN_CONFIG_POWER_SOURCE, 0 },
> +       { "sleep-hardware-state", PIN_CONFIG_SLEEP_HARDWARE_STATE, 0 },
>         { "slew-rate", PIN_CONFIG_SLEW_RATE, 0 },
>  };
>
> diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
> index 7620eb1..a5d0fb4 100644
> --- a/include/linux/pinctrl/pinconf-generic.h
> +++ b/include/linux/pinctrl/pinconf-generic.h
> @@ -80,6 +80,7 @@
>   * @PIN_CONFIG_POWER_SOURCE: if the pin can select between different power
>   *     supplies, the argument to this parameter (on a custom format) tells
>   *     the driver which alternative power source to use.
> + * @PIN_CONFIG_SLEEP_HARDWARE_STATE: indicate this is sleep related state.
>   * @PIN_CONFIG_SLEW_RATE: if the pin can select slew rate, the argument to
>   *     this parameter (on a custom format) tells the driver which alternative
>   *     slew rate to use.
> @@ -107,6 +108,7 @@ enum pin_config_param {
>         PIN_CONFIG_LOW_POWER_MODE,
>         PIN_CONFIG_OUTPUT,
>         PIN_CONFIG_POWER_SOURCE,
> +       PIN_CONFIG_SLEEP_HARDWARE_STATE,
>         PIN_CONFIG_SLEW_RATE,
>         PIN_CONFIG_END = 0x7F,
>         PIN_CONFIG_MAX = 0xFF,
> --
> 1.7.9.5
>



-- 
Baolin.wang
Best Regards
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
