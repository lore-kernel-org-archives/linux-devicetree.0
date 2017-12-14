From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v7 1/6] clk: meson: make the spinlock naming more
 specific
Date: Thu, 14 Dec 2017 10:57:17 +0100
Message-ID: <1513245437.32163.0.camel@baylibre.com>
References: <20171211141348.22048-1-yixun.lan@amlogic.com>
         <20171211141348.22048-2-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20171211141348.22048-2-yixun.lan@amlogic.com>
Sender: linux-clk-owner@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Carlo Caione <carlo@caione.org>, Qiufang Dai <qiufang.dai@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 2017-12-11 at 22:13 +0800, Yixun Lan wrote:
> Make the spinlock more specific, so better for lockdep
> debugging and ctags/grep.
> 
> Suggested-by: Stephen Boyd <sboyd@codeaurora.org>
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>

Applied to next/drivers

Thx

> 
> ---
> 
> this patch try to address the issue which bring up by Stephen at [1]
> [1] http://lists.infradead.org/pipermail/linux-amlogic/2017-December/005534.html
> ---
>  drivers/clk/meson/clkc.h    |   2 +-
>  drivers/clk/meson/gxbb.c    | 112 ++++++++++++++++++++++----------------------
>  drivers/clk/meson/meson8b.c |  24 +++++-----
>  3 files changed, 69 insertions(+), 69 deletions(-)

