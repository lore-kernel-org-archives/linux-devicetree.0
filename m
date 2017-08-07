From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] gpio: 74x164: handling enable-gpios
Date: Mon, 7 Aug 2017 09:40:11 -0300
Message-ID: <CAOMZO5D6gUCjLstFLYEZ0e6eMAGgzff03BfJywB4znEct5gYMw@mail.gmail.com>
References: <1502108833-10317-1-git-send-email-peng.fan@nxp.com> <1502108833-10317-2-git-send-email-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1502108833-10317-2-git-send-email-peng.fan@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Peng Fan <peng.fan@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 7, 2017 at 9:27 AM, Peng Fan <peng.fan@nxp.com> wrote:

> +       chip->enable_gpio = devm_gpiod_get(&spi->dev, "enable", GPIOD_OUT_LOW);
> +       if (IS_ERR(chip->enable_gpio)) {
> +               dev_dbg(&spi->dev, "No enable-gpios property\n");
> +               chip->enable_gpio = NULL;

Also, the error handling here is not correct as it will never
propagate EPROBE_DEFER.

I will submit my version of the patch if you don't mind.
