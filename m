From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 04/10] pinctrl: sunxi: drop dedicated A20 driver
Date: Mon, 29 May 2017 18:39:06 +0200
Message-ID: <CACRpkdbuiemtje+Xvwjnp1+afjFMyetgNyMUtS-WsNYhpP3HSw@mail.gmail.com>
References: <20170527102308.1988-1-icenowy@aosc.io> <20170527102308.1988-5-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20170527102308.1988-5-icenowy@aosc.io>
Sender: linux-doc-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, May 27, 2017 at 12:23 PM, Icenowy Zheng <icenowy@aosc.io> wrote:

> As we added A20 support to A10 pinctrl driver, now we can delete the
> dedicated A20 pinctrl driver, which is duplicated code.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Changes in v3:
> - Only remove the A20 driver(A10 driver for A20 is enabled in
>   the previous commit now).

Patch applied with Chen-Yu's review tag, and I also fixed
up the Makefile by removing the rule for this file.

Yours,
Linus Walleij
