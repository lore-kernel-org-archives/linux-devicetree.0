From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: gpio: Add Spreadtrum GPIO controller documentation
Date: Tue, 13 Feb 2018 10:20:18 +0100
Message-ID: <CACRpkdZzqbhRs+JTiezkNfD4ne-foGgoW+b51DLcFeJsXH2Edg@mail.gmail.com>
References: <2834309f69a1ec37b84a33f153a3d0b90336bcc6.1517795460.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2834309f69a1ec37b84a33f153a3d0b90336bcc6.1517795460.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 5, 2018 at 2:55 AM, Baolin Wang <baolin.wang@linaro.org> wrote:

> This patch adds the device tree bindings for the Spreadtrum
> GPIO controller. The gpios will be supported by the GPIO
> generic library.
>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>

I took this patch out again for now, as it turns out
that not all of the variants are really GPIO controllers,
but rather irqchips.

If they can't read nor write any GPIO lines, they should
not have the property gpio-controller at all. Then they are
just irqchips.

We need some extended discussion about this.

Yours,
Linus Walleij
