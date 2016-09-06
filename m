From: Jun Nie <jun.nie@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: export pin_request to support parent pin
Date: Tue, 6 Sep 2016 14:07:22 +0800
Message-ID: <CABymUCOxD-tgt2S73zebJqZiKK8UiOTp0EeBBOv=gV66eAZ1pQ@mail.gmail.com>
References: <1472213942-4815-1-git-send-email-jun.nie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1472213942-4815-1-git-send-email-jun.nie@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Shawn Guo <shawn.guo@linaro.org>, Jason Liu <jason.liu@linaro.org>, Jun Nie <jun.nie@linaro.org>
List-Id: devicetree@vger.kernel.org

2016-08-26 20:19 GMT+08:00 Jun Nie <jun.nie@linaro.org>:
> Some pin functions may be controlled in 2nd level multiplex.
> We need configure 1st level multiplex when request such
> functions. Export pin_request functionality so that parent
> can be configured automatically with calling it in
> pinmux_ops->request().
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/pinctrl/core.c          | 20 ++++++++++++++++++++
>  drivers/pinctrl/pinmux.c        |  3 ++-
>  drivers/pinctrl/pinmux.h        |  9 +++++++++
>  include/linux/pinctrl/pinctrl.h |  2 ++
>  4 files changed, 33 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index fb38e20..0782a93 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -688,6 +688,26 @@ int pinctrl_gpio_direction_output(unsigned gpio)
>  }
>  EXPORT_SYMBOL_GPL(pinctrl_gpio_direction_output);
>
> +/**
> + * pinctrl_request_pin() - request a single pin to be used
> + * @offset: the pin number from pinctrl dev pin number space
> + */
> +int pinctrl_request_pin(struct pinctrl_dev *pctldev,
> +                       int offset, const char *owner)
> +{
> +       int ret;
> +
> +       mutex_lock(&pctldev->mutex);
> +
> +       ret = pin_request(pctldev, offset, owner, NULL);
> +
> +       mutex_unlock(&pctldev->mutex);
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(pinctrl_request_pin);
> +
> +
>  static struct pinctrl_state *find_state(struct pinctrl *p,
>                                         const char *name)
>  {
> diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
> index ece7028..b18c1f0 100644
> --- a/drivers/pinctrl/pinmux.c
> +++ b/drivers/pinctrl/pinmux.c
> @@ -80,7 +80,7 @@ int pinmux_validate_map(struct pinctrl_map const *map, int i)
>   * @gpio_range: the range matching the GPIO pin if this is a request for a
>   *     single GPIO pin
>   */
> -static int pin_request(struct pinctrl_dev *pctldev,
> +int pin_request(struct pinctrl_dev *pctldev,
>                        int pin, const char *owner,
>                        struct pinctrl_gpio_range *gpio_range)
>  {
> @@ -180,6 +180,7 @@ out:
>
>         return status;
>  }
> +EXPORT_SYMBOL(pin_request);
>
>  /**
>   * pin_free() - release a single muxed in pin so something else can be muxed
> diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
> index d1a98b1c..6ff9baf 100644
> --- a/drivers/pinctrl/pinmux.h
> +++ b/drivers/pinctrl/pinmux.h
> @@ -30,6 +30,9 @@ int pinmux_map_to_setting(struct pinctrl_map const *map,
>  void pinmux_free_setting(struct pinctrl_setting const *setting);
>  int pinmux_enable_setting(struct pinctrl_setting const *setting);
>  void pinmux_disable_setting(struct pinctrl_setting const *setting);
> +int pin_request(struct pinctrl_dev *pctldev,
> +               int pin, const char *owner,
> +               struct pinctrl_gpio_range *gpio_range);
>
>  #else
>
> @@ -83,6 +86,12 @@ static inline void pinmux_disable_setting(
>  {
>  }
>
> +int pin_request(struct pinctrl_dev *pctldev,
> +               int pin, const char *owner,
> +               struct pinctrl_gpio_range *gpio_range)
> +{
> +}
> +
>  #endif
>
>  #if defined(CONFIG_PINMUX) && defined(CONFIG_DEBUG_FS)
> diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
> index a42e57d..13bb7a1 100644
> --- a/include/linux/pinctrl/pinctrl.h
> +++ b/include/linux/pinctrl/pinctrl.h
> @@ -167,6 +167,8 @@ pinctrl_find_gpio_range_from_pin(struct pinctrl_dev *pctldev,
>  extern int pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
>                                 const char *pin_group, const unsigned **pins,
>                                 unsigned *num_pins);
> +extern int pinctrl_request_pin(struct pinctrl_dev *pctldev,
> +                               int offset, const char *owner);
>
>  #ifdef CONFIG_OF
>  extern struct pinctrl_dev *of_pinctrl_get(struct device_node *np);
> --
> 1.9.1
>

Linus,

Do you have any comments on these change and following ZX pinctrl driver?

Thank you!
Jun
