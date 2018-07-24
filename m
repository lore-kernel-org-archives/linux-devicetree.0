From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] clk: meson: add DT documentation for emmc clock
 controller
Date: Tue, 24 Jul 2018 17:29:17 -0600
Message-ID: <20180724232917.GA27041@rob-hp-laptop>
References: <20180712211244.11428-1-yixun.lan@amlogic.com>
 <20180712211244.11428-2-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180712211244.11428-2-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liang Yang <liang.yang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 12, 2018 at 09:12:43PM +0000, Yixun Lan wrote:
> Document the MMC sub clock controller driver, the potential consumer
> of this driver is MMC or NAND. Also add three clock bindings IDs which
> provided by this driver.
> 
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> ---
>  .../bindings/clock/amlogic,mmc-clkc.txt       | 31 +++++++++++++++++++
>  .../clock/amlogic,meson-mmc-clkc.h            | 16 ++++++++++
>  2 files changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.txt
>  create mode 100644 include/dt-bindings/clock/amlogic,meson-mmc-clkc.h

Reviewed-by: Rob Herring <robh@kernel.org>
