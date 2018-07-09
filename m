From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 0/2] pinctrl: imx: Add driver for i.MX8MQ
Date: Mon, 9 Jul 2018 16:02:00 +0200
Message-ID: <CACRpkdb=0uR4uYF_N8HcySJGPct6q5zT+fd6ZfnMqS4OCT_=GA@mail.gmail.com>
References: <1530532746-619-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530532746-619-1-git-send-email-abel.vesa@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: abel.vesa@nxp.com, Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>
Cc: Lucas Stach <l.stach@pengutronix.de>, Rob Herring <robh@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, abelvesa@linux.com, Pengutronix Kernel Team <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 2, 2018 at 1:59 PM Abel Vesa <abel.vesa@nxp.com> wrote:

> This is the sixth version for the patch series sent by Lucas.
>
> https://www.spinics.net/lists/devicetree/msg212752.html
>
> Fifth version can be found here:
>
> https://lkml.org/lkml/2018/6/22/501
>
> Changes since v5:
>  * implemented Rob's review comments related to bindings

Can I get some review tag from one of the listed maintainers so
we can proceed with Abel's patches? It all looks fine to me.

PIN CONTROLLER - FREESCALE
M:      Dong Aisheng <aisheng.dong@nxp.com>
M:      Fabio Estevam <festevam@gmail.com>
M:      Shawn Guo <shawnguo@kernel.org>
M:      Stefan Agner <stefan@agner.ch>
R:      Pengutronix Kernel Team <kernel@pengutronix.de>
L:      linux-gpio@vger.kernel.org
S:      Maintained
F:      drivers/pinctrl/freescale/
F:      Documentation/devicetree/bindings/pinctrl/fsl,*

Yours,
Linus Walleij
