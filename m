From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/3] clk: meson: add sub MMC clock dt-bindings IDs
Date: Wed, 11 Jul 2018 13:45:46 -0600
Message-ID: <20180711194546.GA7090@rob-hp-laptop>
References: <20180710163658.6175-1-yixun.lan@amlogic.com>
 <20180710163658.6175-3-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180710163658.6175-3-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liang Yang <liang.yang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 10, 2018 at 04:36:57PM +0000, Yixun Lan wrote:
> Add two clock bindings IDs which provided by the MMC clock controller,
> These two clocks will be used by MMC or NAND driver.

I count 3 ids.

> 
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> ---
>  .../dt-bindings/clock/amlogic,meson-mmc-clkc.h   | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 include/dt-bindings/clock/amlogic,meson-mmc-clkc.h

This can go with the binding patch.

> 
> diff --git a/include/dt-bindings/clock/amlogic,meson-mmc-clkc.h b/include/dt-bindings/clock/amlogic,meson-mmc-clkc.h
> new file mode 100644
> index 000000000000..2ae988ebc3ae
> --- /dev/null
> +++ b/include/dt-bindings/clock/amlogic,meson-mmc-clkc.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> +/*
> + * Meson MMC sub clock tree IDs
> + *
> + * Copyright (c) 2018 Amlogic, Inc. All rights reserved.
> + * Author: Yixun Lan <yixun.lan@amlogic.com>
> + */
> +
> +#ifndef __MMC_CLKC_H
> +#define __MMC_CLKC_H
> +
> +#define CLKID_MMC_DIV				1
> +#define CLKID_MMC_PHASE_TX			3
> +#define CLKID_MMC_PHASE_RX			4
> +
> +#endif
> -- 
> 2.18.0
> 
