From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH v2 3/5] extcon: arizona: Convert to gpiod
Date: Fri, 19 Jun 2015 11:36:47 +0900
Message-ID: <CAGTfZH0AsRwcFwevAiQeyL=VUxiCvCx+3OEFKQ4nV3DpRdsdoQ@mail.gmail.com>
References: <1434638631-16451-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
	<1434638631-16451-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Reply-To: cw00.choi@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434638631-16451-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: Lee Jones <lee.jones@linaro.org>, "myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Hi Charles,

On Thu, Jun 18, 2015 at 11:43 PM, Charles Keepax
<ckeepax@opensource.wolfsonmicro.com> wrote:
> Convert to using the newer gpiod interface for the micd_pol_gpio.
> Although we still carry support for the old gpio interface from pdata.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  drivers/extcon/extcon-arizona.c |   36 +++++++++++++++++++++++++++++++-----
>  1 files changed, 31 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
> index 5bf1b19..71d60ba 100644
> --- a/drivers/extcon/extcon-arizona.c
> +++ b/drivers/extcon/extcon-arizona.c
> @@ -20,6 +20,7 @@
>  #include <linux/slab.h>
>  #include <linux/interrupt.h>
>  #include <linux/err.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/gpio.h>
>  #include <linux/input.h>
>  #include <linux/platform_device.h>
> @@ -95,6 +96,8 @@ struct arizona_extcon_info {
>         int hpdet_ip_version;
>
>         struct extcon_dev *edev;
> +
> +       struct gpio_desc *micd_pol_gpio;
>  };
>
>  static const struct arizona_micd_config micd_default_modes[] = {
> @@ -205,6 +208,10 @@ static void arizona_extcon_set_mode(struct arizona_extcon_info *info, int mode)
>         if (arizona->pdata.micd_pol_gpio > 0)
>                 gpio_set_value_cansleep(arizona->pdata.micd_pol_gpio,
>                                         info->micd_modes[mode].gpio);
> +       else if (info->micd_pol_gpio)
> +               gpiod_set_value_cansleep(info->micd_pol_gpio,
> +                                        info->micd_modes[mode].gpio);

gpiod_set_value_cansleep() check always the whether
info->micd_pol_gpiod is NULl or not. So, I think that you can modify
it as following without additional if statemet.

e.g.,
             else
                     gpiod_set_value_cansleep(info->micd_pol_gpio,


> +
>         regmap_update_bits(arizona->regmap, ARIZONA_MIC_DETECT_1,
>                            ARIZONA_MICD_BIAS_SRC_MASK,
>                            info->micd_modes[mode].bias <<
> @@ -1271,6 +1278,22 @@ static int arizona_extcon_probe(struct platform_device *pdev)
>                                 arizona->pdata.micd_pol_gpio, ret);
>                         goto err_register;
>                 }
> +       } else {
> +               if (info->micd_modes[0].gpio)

I'd like you to define the constant varaible for index (0) on separate patch.

> +                       mode = GPIOD_OUT_HIGH;
> +               else
> +                       mode = GPIOD_OUT_LOW;
> +
> +               info->micd_pol_gpio = gpiod_get_optional(arizona->dev,
> +                                                        "wlf,micd-pol",
> +                                                        GPIOD_OUT_LOW);

You can use the devm_gpiod_get_optional() to manage the system
resource automatically.

> +               if (IS_ERR(info->micd_pol_gpio)) {
> +                       ret = PTR_ERR(info->micd_pol_gpio);
> +                       dev_err(arizona->dev,
> +                               "Failed to get microphone polarity GPIO: %d\n",
> +                               ret);
> +                       goto err_register;
> +               }
>         }
>
>         if (arizona->pdata.hpdet_id_gpio > 0) {
> @@ -1281,7 +1304,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
>                 if (ret != 0) {
>                         dev_err(arizona->dev, "Failed to request GPIO%d: %d\n",
>                                 arizona->pdata.hpdet_id_gpio, ret);
> -                       goto err_register;
> +                       goto err_gpio;
>                 }
>         }
>
> @@ -1325,7 +1348,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
>                                 dev_err(arizona->dev,
>                                         "MICD ranges must be sorted\n");
>                                 ret = -EINVAL;
> -                               goto err_input;
> +                               goto err_gpio;
>                         }
>                 }
>         }
> @@ -1344,7 +1367,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
>                         dev_err(arizona->dev, "Unsupported MICD level %d\n",
>                                 info->micd_ranges[i].max);
>                         ret = -EINVAL;
> -                       goto err_input;
> +                       goto err_gpio;
>                 }
>
>                 dev_dbg(arizona->dev, "%d ohms for MICD threshold %d\n",
> @@ -1417,7 +1440,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
>         if (ret != 0) {
>                 dev_err(&pdev->dev, "Failed to get JACKDET rise IRQ: %d\n",
>                         ret);
> -               goto err_input;
> +               goto err_gpio;
>         }
>
>         ret = arizona_set_irq_wake(arizona, jack_irq_rise, 1);
> @@ -1488,7 +1511,8 @@ err_rise_wake:
>         arizona_set_irq_wake(arizona, jack_irq_rise, 0);
>  err_rise:
>         arizona_free_irq(arizona, jack_irq_rise, info);
> -err_input:
> +err_gpio:
> +       gpiod_put(info->micd_pol_gpio);
>  err_register:
>         pm_runtime_disable(&pdev->dev);
>         return ret;
> @@ -1500,6 +1524,8 @@ static int arizona_extcon_remove(struct platform_device *pdev)
>         struct arizona *arizona = info->arizona;
>         int jack_irq_rise, jack_irq_fall;
>
> +       gpiod_put(info->micd_pol_gpio);
> +
>         pm_runtime_disable(&pdev->dev);
>
>         regmap_update_bits(arizona->regmap,

Thanks,
Chanwoo Choi
