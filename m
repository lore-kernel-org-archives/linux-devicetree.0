From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/4] pinctrl: mvebu: Add support for MV98DX1135
Date: Tue, 25 Jun 2019 14:26:45 +0200
Message-ID: <CACRpkdbSS18us3o=v7ki_=8cLXYjfDd8q321xMCounXPh11GAQ@mail.gmail.com>
References: <20190617215458.32688-1-chris.packham@alliedtelesis.co.nz> <20190617215458.32688-4-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190617215458.32688-4-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 17, 2019 at 11:55 PM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:

> The 98DX1135 is a switch chip with an integrated CPU. This is similar to
> the 98DX4122 except the MPP assignments differ.
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Patch applied.
I just assume this one has no dependency on the clock patches
so I can merge it separately.

Yours,
Linus Walleij
