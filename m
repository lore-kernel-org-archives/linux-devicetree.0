From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 02/10] pinctrl: sunxi: Add SoC ID definitions for A10,
 A20 and R40 SoCs
Date: Mon, 29 May 2017 18:33:13 +0200
Message-ID: <CACRpkdbPcAELAySk77xofYNVqach+0-2oJ1qMcGK5X1zA8gdeA@mail.gmail.com>
References: <20170527102308.1988-1-icenowy@aosc.io> <20170527102308.1988-3-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170527102308.1988-3-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, May 27, 2017 at 12:23 PM, Icenowy Zheng <icenowy@aosc.io> wrote:

> Allwinner A10, A20 and R40 SoCs have similar GPIO layout.
>
> Add SoC definitions in pinctrl-sunxi.h, in order to merge A20 support
> into A10 driver, and add R40 support into it.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Changes in v3:
> - Commit message change.

Patch applied with Chen-Yu's review tag.

Yours,
Linus Walleij
