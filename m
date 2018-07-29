From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO driver
Date: Sun, 29 Jul 2018 23:59:45 +0200
Message-ID: <CACRpkdbcqA4gBv7W2SNSFJRQ26GGCE315UsDDG9zr458GK709g@mail.gmail.com>
References: <20180712214203.114844-1-tmaimon77@gmail.com> <20180712214203.114844-3-tmaimon77@gmail.com>
 <CACRpkdYOQMkA6BHtY3-NSXhyhoG7KzDg8SkqL2B6M8GQrvXgMA@mail.gmail.com> <CAP6Zq1h5TXBcfvxDA5Ae9XuW65s_zQd_JrM3vRWR6KBRYCHRrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAP6Zq1h5TXBcfvxDA5Ae9XuW65s_zQd_JrM3vRWR6KBRYCHRrg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tmaimon77@gmail.com
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, avifishman70@gmail.com, Nancy Yuen <yuenn@google.com>, Brendan Higgins <brendanhiggins@google.com>, Patrick Venture <venture@google.com>, Joel Stanley <joel@jms.id.au>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 26, 2018 at 2:01 AM Tomer Maimon <tmaimon77@gmail.com> wrote:

> I initialize bgpio as follow:
>
>                         ret = bgpio_init(&pctrl->gpio_bank[id].gc,
>                                          pctrl->dev, 4,
>                                          pctrl->gpio_bank[id].base +
>                                          NPCM7XX_GP_N_DIN,
>                                          pctrl->gpio_bank[id].base +
>                                          NPCM7XX_GP_N_DOUT,
>                                          NULL,
>                                          NULL,
>                                          pctrl->gpio_bank[id].base +
>                                          NPCM7XX_GP_N_IEM,
>                                          BGPIOF_READ_OUTPUT_REG_SET);

(...)
> The problem occur when reading the GPIO value from bgpio_get_set function,
> because the directions value are inverse it reading the wrong I/O registers
>
> For direction out it reading dat register (instead of set register)
>
> For direction in it calling set register (instead of dat register)

Hm I don't quite get it... sorry. Maybe if you show your fix and what
you expect to happen I can understand better?

Do you mean that because you write the inverse value to
IEM this happens, and the BGPIO code assumes that
you always write 1 to set a line as input and 0 to set it
as output?

I would say if this causes the problem we should just add
a new BGPIOF_INVERTED_REG_DIR with comment in
include/linux/gpio/driver.h and make the necessary fix to
respect this flag in the gpio-mmio.c core so it works right.

If you do this as a separate patch I would be grateful :)

Yours,
Linus Walleij
