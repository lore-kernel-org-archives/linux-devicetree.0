From: Jianxin Pan <jianxin.pan@amlogic.com>
Subject: Re: [PATCH v7 0/4] clk: meson: add a sub EMMC clock controller
 support
Date: Thu, 29 Nov 2018 09:48:19 +0800
Message-ID: <aa21f2d6-507d-a672-9e9b-0896df011307@amlogic.com>
References: <1542284312-55418-1-git-send-email-jianxin.pan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542284312-55418-1-git-send-email-jianxin.pan@amlogic.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Yixun Lan <yixun.lan@amlogic.com>, Liang Yang <liang.yang@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jerome,

I made some modifications as you suggested， could you please take a look?

On 2018/11/15 20:18, Jianxin Pan wrote:
> This driver will add a MMC clock controller driver support.
> The original idea about adding a clock controller is during the
> discussion in the NAND driver mainline effort[1].
> 
> This driver is tested in the S400 board (AXG platform) with NAND driver.
> 
> Changes since v6 [7]:
>  - add one based support for sclk divier
>  - alloc sclk in probe for multiple instance
>  - fix coding styles
> 
> Changes since v5 [6]:
>  - remove divider ops with .init and use sclk_div instead
>  - drop CLK_DIVIDER_ROUND_CLOSEST in mux and div
>  - drop the useless type cast 
> 
> Changes since v4 [5]:
>  - use struct parm in phase delay driver
>  - remove 0 delay releted part in phase delay driver
>  - don't rebuild the parent name once again
>  - add divider ops with .init
> 
> Changes since v3 [4]:
>  - separate clk-phase-delay driver
>  - replace clk_get_rate() with clk_hw_get_rate()
>  - collect Rob's R-Y
>  - drop 'meson-' prefix from compatible string
> 
>  Changes since v2 [3]:
>  - squash dt-binding clock-id patch
>  - update license
>  - fix alignment
>  - construct a clk register helper() function
> 
> Changes since v1 [2]:
>  - implement phase clock
>  - update compatible name
>  - adjust file name
>  - divider probe() into small functions, and re-use them
> 
> [1] https://lkml.kernel.org/r/20180628090034.0637a062@xps13
> [2] https://lkml.kernel.org/r/20180703145716.31860-1-yixun.lan@amlogic.com
> [3] https://lkml.kernel.org/r/20180710163658.6175-1-yixun.lan@amlogic.com
> [4] https://lkml.kernel.org/r/20180712211244.11428-1-yixun.lan@amlogic.com
> [5] https://lkml.kernel.org/r/20180809070724.11935-4-yixun.lan@amlogic.com
> [6] https://lkml.kernel.org/r/1539839245-13793-1-git-send-email-jianxin.pan@amlogic.com
> [7] https://lkml.kernel.org/r/1541089855-19356-1-git-send-email-jianxin.pan@amlogic.com
> Yixun Lan (3):
>   clk: meson: add emmc sub clock phase delay driver
>   clk: meson: add DT documentation for emmc clock controller
>   clk: meson: add sub MMC clock controller driver
>   clk: meson: add one based divider support for sclk divider
> 
>  .../devicetree/bindings/clock/amlogic,mmc-clkc.txt |  39 +++
>  drivers/clk/meson/Kconfig                          |  10 +
>  drivers/clk/meson/Makefile                         |   3 +-
>  drivers/clk/meson/clk-phase-delay.c                |  64 +++++
>  drivers/clk/meson/clkc-audio.h                     |   1 +
>  drivers/clk/meson/clkc.h                           |  13 +
>  drivers/clk/meson/mmc-clkc.c                       | 313 +++++++++++++++++++++
>  drivers/clk/meson/sclk-div.c                       |  28 +-
>  include/dt-bindings/clock/amlogic,mmc-clkc.h       |  17 ++
>  9 files changed, 477 insertions(+), 11 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.txt
>  create mode 100644 drivers/clk/meson/clk-phase-delay.c
>  create mode 100644 drivers/clk/meson/mmc-clkc.c
>  create mode 100644 include/dt-bindings/clock/amlogic,mmc-clkc.h
> 
