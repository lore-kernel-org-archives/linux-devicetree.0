From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v1] pinctrl: generic: Add output-enable property
Date: Fri, 16 Jun 2017 11:04:36 +0200
Message-ID: <CAMuHMdW0nVPTRmur=y8cqmoOiE5E=9pU9nPMMs27QXuJwyBDcQ@mail.gmail.com>
References: <1497603581-9632-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1497603581-9632-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, dongas86@gmail.com, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Brandt <Chris.Brandt@renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 16, 2017 at 10:59 AM, Jacopo Mondi
<jacopo+renesas@jmondi.org> wrote:
> Add output-enable generic pin configuration property.
> This properties allows enabling/disabling pin's output capabilities
> without actually driving any value on the line.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
