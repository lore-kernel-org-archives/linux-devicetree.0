From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] GPIO: 74xx-mmio: Add DT bindings documentation
Date: Mon, 22 Sep 2014 13:39:26 +0200
Message-ID: <CAMuHMdV2gkx+tVoYL_zcYg0ZtYkkascQiTOaTfDUuRVMxFkdTw@mail.gmail.com>
References: <1411112404-16040-1-git-send-email-shc_work@mail.ru>
	<1411112404-16040-3-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1411112404-16040-3-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 19, 2014 at 9:40 AM, Alexander Shiyan <shc_work@mail.ru> wrote:
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-74xx-mmio.txt
> @@ -0,0 +1,30 @@
> +* 74XX MMIO GPIO driver
> +
> +Required properties:
> +- compatible: Should contain one of the following:
> +   "ti,74ahc1g125": for 74AHC1G125 (1-bit Input),
> +   "ti,74auc1g174": for 74AUC1G74 (1-bit Output),
> +   "ti,74lvc2g125": for 74LVC2G125 (2-bit Input),
> +   "ti,74hc74":     for 74HC74 (2-bit Output),
> +   "ti,74hc125":    for 74HC125 (4-bit Input),
> +   "ti,74hc175":    for 74HC175 (4-bit Output),
> +   "ti,74hc365":    for 74HC365 (6-bit Input),
> +   "ti,74hc174":    for 74HC174 (6-bit Output),
> +   "ti,74hc244":    for 74HC244 (8-bit Input),
> +   "ti,74hc273":    for 74HC273 (8-bit Output),
> +   "ti,74ac1624":   for 74AC1624 (16-bit Input),
> +   "ti,74ac16374":  for 74AC16374 (16-bit Output).

As the actual implementation technology doesn't matter, I think you
should use the base name where appropriate.
E.g. "ti,7474" instead of "ti,74hc74".

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
