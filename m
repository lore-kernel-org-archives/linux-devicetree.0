From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 03/10] pinctrl: sunxi: add A20 support to A10 driver
Date: Mon, 29 May 2017 18:35:03 +0200
Message-ID: <CACRpkdZd7qHS=nK__wD2P2wnFxDc6F=sB+c5iOECs9-RVeSdLw@mail.gmail.com>
References: <20170527102308.1988-1-icenowy@aosc.io> <20170527102308.1988-4-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170527102308.1988-4-icenowy@aosc.io>
Sender: linux-gpio-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, May 27, 2017 at 12:23 PM, Icenowy Zheng <icenowy@aosc.io> wrote:

> As A20 is designed as a pin-compatible upgrade of A10, their pin
> controller are very similar, and can share one driver.
>
> Add A20 support to the A10 driver.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Changes in v3:
> - Enable A10 driver for A20 and disable A20 driver in this commit, in
>   order to prevent A10 driver from conflicting with A20 driver.

Patch applied with Chen-Yu's review tag.

Yours,
Linus Walleij
