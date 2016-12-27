From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 05/12] Document: dt: binding: imx: update pinctrl doc
 for imx6sll
Date: Tue, 27 Dec 2016 13:59:23 +0100
Message-ID: <CACRpkdYUME8K+JusA0ORRKqxyBuhDdyei8eg7UZbHidKw9=bQw@mail.gmail.com>
References: <1482832070-22668-1-git-send-email-ping.bai@nxp.com> <1482832070-22668-6-git-send-email-ping.bai@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1482832070-22668-6-git-send-email-ping.bai@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Bai Ping <ping.bai@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, linux-clk <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, jacky.baip@gmail.com
List-Id: devicetree@vger.kernel.org

On Tue, Dec 27, 2016 at 10:47 AM, Bai Ping <ping.bai@nxp.com> wrote:

> Add pinctrl binding doc update for imx6sll.
>
> Signed-off-by: Bai Ping <ping.bai@nxp.com>

I have to push back on this a bit.

> +Please refer to fsl,imx-pinctrl.txt in this directory for common binding part
> +and usage.

I understand that it is building on top of the old i.MX bindings and that
it has some kind of "tradition" coming with it.

At the same time, the i.MX bindings came about before we had the
generic pin control bindings defined.

> +CONFIG bits definition:
> +PAD_CTL_LVE                    (1 << 22)
> +PAD_CTL_HYS                     (1 << 16)
> +PAD_CTL_PUS_100K_DOWN           (0 << 14)
> +PAD_CTL_PUS_47K_UP              (1 << 14)
> +PAD_CTL_PUS_100K_UP             (2 << 14)
> +PAD_CTL_PUS_22K_UP              (3 << 14)
> +PAD_CTL_PUE                     (1 << 13)
> +PAD_CTL_PKE                     (1 << 12)
> +PAD_CTL_ODE                     (1 << 11)
> +PAD_CTL_SPEED_LOW               (0 << 6)
> +PAD_CTL_SPEED_MED               (1 << 6)
> +PAD_CTL_SPEED_HIGH              (3 << 6)
> +PAD_CTL_DSE_DISABLE             (0 << 3)
> +PAD_CTL_DSE_260ohm              (1 << 3)
> +PAD_CTL_DSE_130ohm              (2 << 3)
> +PAD_CTL_DSE_87ohm               (3 << 3)
> +PAD_CTL_DSE_65ohm               (4 << 3)
> +PAD_CTL_DSE_52ohm               (5 << 3)
> +PAD_CTL_DSE_43ohm               (6 << 3)
> +PAD_CTL_DSE_37ohm               (7 << 3)
> +PAD_CTL_SRE_FAST                (1 << 0)
> +PAD_CTL_SRE_SLOW                (0 << 0)

A whole slew of these if not all correspond to the generic bindings.

I would consider augmenting the code in the driver to handle the generic
bindings *in addition* to the old legacy bindings, and use those over these
random custom bits.

Read drivers using CONFIG_GENERIC_PINCONF as an inspiration.

For example see commit
cefbf1a1b29531a970bc2908a50a75d6474fcc38
"pinctrl: sunxi: Support generic binding"
from Maxime Ripard, where he does a similar thing for sunxi.

Yours,
Linus Walleij
