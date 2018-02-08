From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 4/6] clk: sunxi-ng: add support for the Allwinner H6
 CCU
Date: Thu, 8 Feb 2018 14:18:19 -0600
Message-ID: <20180208201819.dxc4e3utyybocbyj@rob-hp-laptop>
References: <20180203154942.63566-1-icenowy@aosc.io>
 <20180203154942.63566-5-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180203154942.63566-5-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On Sat, Feb 03, 2018 at 11:49:40PM +0800, Icenowy Zheng wrote:
> The Allwinner H6 SoC has a CCU which has been largely rearranged.
> 
> Add support for it in the sunxi-ng CCU framework.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Changes in v2:
> - Exported APB1 bus clock for PIO.
> - Switch to SPDX license identifier.
> 
>  .../devicetree/bindings/clock/sunxi-ccu.txt        |    1 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/clk/sunxi-ng/Kconfig                       |    5 +
>  drivers/clk/sunxi-ng/Makefile                      |    1 +
>  drivers/clk/sunxi-ng/ccu-sun50i-h6.c               | 1199 ++++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu-sun50i-h6.h               |   57 +
>  include/dt-bindings/clock/sun50i-h6-ccu.h          |  125 ++
>  include/dt-bindings/reset/sun50i-h6-ccu.h          |   74 ++
>  7 files changed, 1462 insertions(+)
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-h6.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-h6.h
>  create mode 100644 include/dt-bindings/clock/sun50i-h6-ccu.h
>  create mode 100644 include/dt-bindings/reset/sun50i-h6-ccu.h
