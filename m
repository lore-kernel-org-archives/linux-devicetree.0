From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v8 9/9] gpio: madera: Support Cirrus Logic Madera class codecs
Date: Mon, 26 Feb 2018 16:16:54 +0200
Message-ID: <CAHp75VebWArW6p4HbvnBYEsBqg5WJkn3Afh+cBNKCDS_W71LBg@mail.gmail.com>
References: <20180226130558.7634-1-rf@opensource.cirrus.com> <20180226130558.7634-10-rf@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180226130558.7634-10-rf@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, patches@opensource.cirrus.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 26, 2018 at 3:05 PM, Richard Fitzgerald
<rf@opensource.cirrus.com> wrote:
> This adds support for the GPIOs on Cirrus Logic Madera class codecs.
> Any pins not used for special functions (see the pinctrl driver) can be
> used as general single-bit input or output lines. The number of available
> GPIOs varies between codecs.
>
> Note that this is part of a composite MFD for these codecs and can only
> be used with the corresponding MFD and other child drivers on those
> silicon. The GPIO block on these codecs does not exist indepedently of
> the rest of the MFD.

> +struct madera_gpio {
> +       struct madera *madera;
> +       struct gpio_chip gpio_chip;
> +};

Why do you need this? I suppose one embeds or refers to the other.

-- 
With Best Regards,
Andy Shevchenko
