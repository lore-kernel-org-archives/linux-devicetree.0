From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 06/10] pinctrl: sunxi: add support of R40 to A10
 pinctrl driver
Date: Mon, 29 May 2017 18:43:09 +0200
Message-ID: <CACRpkdb87XPN3QqxRR+U2PP8=H2yZXPLYZXHYLWP4NexgQDp6w@mail.gmail.com>
References: <20170527102308.1988-1-icenowy@aosc.io> <20170527102308.1988-7-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20170527102308.1988-7-icenowy@aosc.io>
Sender: linux-doc-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, May 27, 2017 at 12:23 PM, Icenowy Zheng <icenowy@aosc.io> wrote:

> R40 is said to be an upgrade of A20, and its pin configuration is also
> similar to A20 (and thus similar to A10).
>
> Add support for R40 to the A10 pinctrl driver.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Since I applied patches 2-5 you only need to resend from this point
for pin control.

Please send pin control patches separately from the rest of the series if you
can, and rebase on my "devel" branch, so I don't have to sift throgh so much
patches to find what I need to apply and what I can ignore.

Yours,
Linus Walleij
