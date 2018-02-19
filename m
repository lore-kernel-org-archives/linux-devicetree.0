Return-Path: <SRS0=Kvo1=FN=gmail.com=andy.shevchenko@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180219133038.21995-1-ckeepax@opensource.cirrus.com>
References: <20180219133038.21995-1-ckeepax@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 19 Feb 2018 15:36:29 +0200
Message-ID: <CAHp75Vc6ok2s0fiQi9ePgmf4BVyO5N125B6iE1jnqWmgWF01Ng@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mfd: arizona: Update reset pin to use GPIOD
Content-Type: text/plain; charset="UTF-8"
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com
List-ID: <devicetree@vger.kernel.org>

On Mon, Feb 19, 2018 at 3:30 PM, Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
> Now GPIOD has support for both pdata systems and for non-standard DT
> bindings the Arizona reset GPIO can be converted to use it.

>  static inline void arizona_enable_reset(struct arizona *arizona)
>  {
> -       if (arizona->pdata.reset)
> -               gpio_set_value_cansleep(arizona->pdata.reset, 0);
> +       gpiod_set_value_cansleep(arizona->pdata.reset, 0);
>  }

Did you try that code when !GPIOLIB ?

Or driver depends on it?

-- 
With Best Regards,
Andy Shevchenko
