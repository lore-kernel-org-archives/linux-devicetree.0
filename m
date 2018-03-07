From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 1/2] mfd: arizona: Update reset pin to use GPIOD
Date: Wed, 7 Mar 2018 11:24:10 -0300
Message-ID: <CAOMZO5BNYkuz6pH2qZmj+4kBPQB=j-JniiqVbqzdH8nTOXVZQQ@mail.gmail.com>
References: <20180220163540.6704-1-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180220163540.6704-1-ckeepax@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com
List-Id: devicetree@vger.kernel.org

Hi Charles,

On Tue, Feb 20, 2018 at 1:35 PM, Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
> index 77875250abe5..9558c4d9c8ca 100644
> --- a/drivers/mfd/arizona-core.c
> +++ b/drivers/mfd/arizona-core.c
> @@ -279,7 +279,7 @@ static int arizona_wait_for_boot(struct arizona *arizona)
>  static inline void arizona_enable_reset(struct arizona *arizona)
>  {
>         if (arizona->pdata.reset)
> -               gpio_set_value_cansleep(arizona->pdata.reset, 0);
> +               gpiod_set_value_cansleep(arizona->pdata.reset, 0);

This should be:

gpiod_set_value_cansleep(arizona->pdata.reset, 1);

as here you want to put the reset GPIO into its active state.

Assuming that in the dts this GPIO is defined as GPIO_ACTIVE_LOW, then
the command should put it to logic level 0 as done originally.

>  static void arizona_disable_reset(struct arizona *arizona)
> @@ -295,7 +295,7 @@ static void arizona_disable_reset(struct arizona *arizona)
>                         break;
>                 }
>
> -               gpio_set_value_cansleep(arizona->pdata.reset, 1);
> +               gpiod_set_value_cansleep(arizona->pdata.reset, 1);

This should be:

gpiod_set_value_cansleep(arizona->pdata.reset, 0);

as here you want to put the reset GPIO into its inactive state.
