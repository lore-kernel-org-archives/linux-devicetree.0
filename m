From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH 2/3] clk: meson: add sub EMMC clock dt-bindings IDs
Date: Tue, 3 Jul 2018 09:21:07 +0200
Message-ID: <20180703092107.51497a8f@bbrezillon>
References: <20180703145716.31860-1-yixun.lan@amlogic.com>
 <20180703145716.31860-3-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180703145716.31860-3-yixun.lan@amlogic.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Yixun Lan <yixun.lan@amlogic.com>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jian Hu <jian.hu@amlogic.com>, Liang Yang <liang.yang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Tue, 3 Jul 2018 14:57:15 +0000
Yixun Lan <yixun.lan@amlogic.com> wrote:

> Add two clock bindings IDs which provided by the EMMC clock controller,
> These two clocks will be used by EMMC or NAND driver.
> 
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> ---
>  include/dt-bindings/clock/emmc-clkc.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 include/dt-bindings/clock/emmc-clkc.h
> 
> diff --git a/include/dt-bindings/clock/emmc-clkc.h b/include/dt-bindings/clock/emmc-clkc.h
> new file mode 100644
> index 000000000000..d9972c400e58
> --- /dev/null
> +++ b/include/dt-bindings/clock/emmc-clkc.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> +/*
> + * Meson EMMC sub clock tree IDs
> + *
> + * Copyright (c) 2018 Amlogic, Inc. All rights reserved.
> + */
> +
> +#ifndef __EMMC_CLKC_H
> +#define __EMMC_CLKC_H
> +
> +#define CLKID_EMMC_C_MUX				0

Looks like the MUX clk is the parent of the DIV one, and I guess the clk
driver is able to select the best parent+div pair for a requested rate.
Do you really need to expose the MUX to users?

> +#define CLKID_EMMC_C_DIV				1
> +
> +#endif
