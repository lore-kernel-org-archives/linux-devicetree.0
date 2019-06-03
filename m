From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH linux dev-5.1 v1] ARM: dts: aspeed: Add SGPM pinmux
Date: Tue, 4 Jun 2019 01:07:41 +0200
Message-ID: <CACRpkdYPHw994Ov0xCfK6tCg60tiuWrRwTcYpMSfOr4G0VKu_Q@mail.gmail.com>
References: <1559601789-27121-1-git-send-email-hongweiz@ami.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559601789-27121-1-git-send-email-hongweiz@ami.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hongwei Zhang <hongweiz@ami.com>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Hongwei,

On Tue, Jun 4, 2019 at 12:44 AM Hongwei Zhang <hongweiz@ami.com> wrote:
>
> Add SGPM pinmux to ast2500-pinctrl function and group, to prepare for
> supporting SGPIO in AST2500 SoC.
>
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt | 2 +-
>  arch/arm/boot/dts/aspeed-g5.dtsi                             | 5 +++++
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c                   | 4 ++++

Please try to separate out the change to arch/arm/boot/dts/aspeed-g5.dtsi
into a separate patch that goes through ARM SoC.

Other than that it looks fine to me.

Yours,
Linus Walleij
