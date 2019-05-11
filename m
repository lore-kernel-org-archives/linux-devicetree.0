From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v5 5/6] pinctrl: meson: add support of drive-strength-microamp
Date: Sat, 11 May 2019 18:46:19 +0200
Message-ID: <CAFBinCAYNvBtNwZdKJVUpObogjaiAx0W0Y-cnOL7RtARhYOW_g@mail.gmail.com>
References: <20190510082324.21181-1-glaroque@baylibre.com> <20190510082324.21181-6-glaroque@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190510082324.21181-6-glaroque@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Guillaume La Roque <glaroque@baylibre.com>
Cc: linus.walleij@linaro.org, khilman@baylibre.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, jbrunet@baylibre.com
List-Id: devicetree@vger.kernel.org

Hi Guillaume,

On Fri, May 10, 2019 at 10:23 AM Guillaume La Roque
<glaroque@baylibre.com> wrote:
>
> drive-strength-microamp is a new feature needed for G12A SoC.
> the default DS setting after boot is usually 500uA and it is not enough for
> many functions. We need to be able to set the drive strength to reliably
> enable things like MMC, I2C, etc ...
>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Reviewed-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>

the warning messages when printing pinconf-pins (in debugfs) are gone
on my Meson8m2 board so:
Tested-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>

[...]
> +static int meson_pinconf_set_drive_strength(struct meson_pinctrl *pc,
> +                                           unsigned int pin,
> +                                           u16 drive_strength_ua)
> +{
> +       struct meson_bank *bank;
> +       unsigned int reg, bit, ds_val;
> +       int ret;
> +
> +       if (!pc->reg_ds) {
> +               dev_err(pc->dev, "drive-strength not supported\n");
> +               return -ENOTSUPP;
> +       }
> +
> +       ret = meson_get_bank(pc, pin, &bank);
> +       if (ret)
> +               return ret;
> +
> +       meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
> +       bit = bit << 1;
I was confused by this shifting (not sure why I haven't noticed this
in earlier revisions). however, it all made sense after I did the
maths for two examples:

BOOT_0 uses drive-strength register 0x0 bits [1:0] so the result
should be "bit = 0"
meson_calc_reg_and_bit returns bit = 0
0 << 1 = 0, so this seems right

BOOT_15 uses drive-strength register 0x0 bits [31:30] so the result
should be "bit = 30"
meson_calc_reg_and_bit returns bit = 15
15 << 1 = 30

so all seems fine, even though it wasn't obvious to me at first sight
that it's all good


Martin
