From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] clk: sunxi: Add support for A80 APBS clock
Date: Mon, 1 Feb 2016 08:57:49 -0600
Message-ID: <20160201145749.GA31544@rob-hp-laptop>
References: <1454337769-4130-1-git-send-email-wens@csie.org>
 <1454337769-4130-2-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1454337769-4130-2-git-send-email-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 01, 2016 at 10:42:48PM +0800, Chen-Yu Tsai wrote:
> A80's APBS clock is not the same as the APB0 clock on A23. The A80's
> is a zero-based divider, while the A23's is a power-of-two divider.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt |  1 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/clk/sunxi/Makefile                        |  2 +-
>  drivers/clk/sunxi/clk-sun9i-apbs.c                | 64 +++++++++++++++++++++++
>  3 files changed, 66 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/sunxi/clk-sun9i-apbs.c
