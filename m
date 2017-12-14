From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v7 4/6] clk: meson-axg: add clock controller drivers
Date: Thu, 14 Dec 2017 10:59:09 +0100
Message-ID: <1513245549.32163.3.camel@baylibre.com>
References: <20171211141348.22048-1-yixun.lan@amlogic.com>
         <20171211141348.22048-5-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20171211141348.22048-5-yixun.lan@amlogic.com>
Sender: linux-clk-owner@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Carlo Caione <carlo@caione.org>, Qiufang Dai <qiufang.dai@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 2017-12-11 at 22:13 +0800, Yixun Lan wrote:
> From: Qiufang Dai <qiufang.dai@amlogic.com>
> 
> Add clock controller drivers for Amlogic Meson-AXG SoC.
> 
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Qiufang Dai <qiufang.dai@amlogic.com>
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>

Applied to next/drivers

Thx

> ---
>  arch/arm64/Kconfig.platforms |   1 +
>  drivers/clk/meson/Kconfig    |   8 +
>  drivers/clk/meson/Makefile   |   1 +
>  drivers/clk/meson/axg.c      | 936 +++++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/meson/axg.h      | 126 ++++++
>  5 files changed, 1072 insertions(+)
>  create mode 100644 drivers/clk/meson/axg.c
>  create mode 100644 drivers/clk/meson/axg.h

