From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH] gpio-pca953x driver and PCA9536 chip
Date: Sat, 5 Sep 2015 23:15:05 +0200
Message-ID: <CACRpkdZcju7tpoi9+R4Bb98FEJNSfmYaRyLp7YF2ZT+hjkAMVA@mail.gmail.com>
References: <55E4641D.7050603@elpromaelectronics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <55E4641D.7050603@elpromaelectronics.com>
Sender: linux-gpio-owner@vger.kernel.org
To: =?UTF-8?Q?Janusz_U=C5=BCycki?= <j.uzycki@elpromaelectronics.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Joshua Scott <joshua.scott@alliedtelesis.co.nz>, Toby Smith <toby@tismith.id.au>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Krzysztof Borgulski <k.borgulski@elproma.com.pl>
List-Id: devicetree@vger.kernel.org

Adding linux-gpio and some people that have been patching
this driver to TO-line.

Grygorii et al, does this look correct? Anyone who can test and
send a patch for mainline?

Yours,
Linus Walleij

On Mon, Aug 31, 2015 at 4:26 PM, Janusz U=C5=BCycki
<j.uzycki@elpromaelectronics.com> wrote:
> Hi,
>
> The driver sets register #02 (inversion) to 0x01 instead of 0x00 on m=
y
> board.
> Reason: device_pca953x_init() does not initialize val buffer because =
NBANK()
> returns
> for PCA9536 ngpio=3D4 value 0 instead of 1.
>
> My proposed code-patch for 3.14.17 is below.
> Because I don't work on stable/next I can't deliver complete/ready pa=
tch.
> Please for comments.
>
> best regards
> Janusz
>
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -75,7 +75,7 @@ MODULE_DEVICE_TABLE(i2c, pca953x_id);
>  #define MAX_BANK 5
>  #define BANK_SZ 8
>
> -#define NBANK(chip) (chip->gpio_chip.ngpio / BANK_SZ)
> +#define NBANK(chip) DIV_ROUND_UP(chip->gpio_chip.ngpio, BANK_SZ)
>
>  struct pca953x_chip {
>         unsigned gpio_start;
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
