From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 4/9] clk: sunxi-ng: v3s: add Allwinner V3 support
Date: Tue, 9 Jul 2019 16:56:47 -0600
Message-ID: <20190709225647.GA12966@bogus>
References: <20190623043801.14040-1-icenowy@aosc.io>
 <20190623043801.14040-5-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190623043801.14040-5-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On Sun, Jun 23, 2019 at 12:37:56PM +0800, Icenowy Zheng wrote:
> Allwinner V3 has the same main die with V3s, but with more pins wired.
> There's a I2S bus on V3 that is not available on V3s.
> 
> Add the V3-only peripheral's clocks and reset to the V3s CCU driver,
> bound to a new V3 compatible string. The driver name is not changed
> because it's part of the device tree binding (the header file name).
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> No changes in v3/v2.
> 
>  drivers/clk/sunxi-ng/ccu-sun8i-v3s.c      | 225 +++++++++++++++++++++-
>  drivers/clk/sunxi-ng/ccu-sun8i-v3s.h      |   2 +-

>  include/dt-bindings/clock/sun8i-v3s-ccu.h |   4 +
>  include/dt-bindings/reset/sun8i-v3s-ccu.h |   3 +

Acked-by: Rob Herring <robh@kernel.org>

>  4 files changed, 231 insertions(+), 3 deletions(-)
