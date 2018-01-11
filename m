From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/5] pinctrl: imx: constify struct imx_pinctrl_soc_info
Date: Thu, 11 Jan 2018 10:26:09 +0100
Message-ID: <CACRpkdaP==bSxdSD7D50M8ZkH9p3BbLtCKL7mqyerk=qPHQ73w@mail.gmail.com>
References: <20180106142553.15322-1-stefan@agner.ch> <20180106142553.15322-4-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180106142553.15322-4-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jan 6, 2018 at 3:25 PM, Stefan Agner <stefan@agner.ch> wrote:

> Now that imx_pinctrl_probe accepts const struct imx_pinctrl_soc_info
> we can constify all declarations of struct imx_pinctrl_soc_info.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Patch applied.

Yours,
Linus Walleij
