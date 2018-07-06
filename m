From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 3/4] clk: rockchip: add support for half divider
Date: Fri, 06 Jul 2018 19:19:11 +0200
Message-ID: <5208192.saTfdjLqfi@phil>
References: <1529029011-15021-1-git-send-email-zhangqing@rock-chips.com> <1529029011-15021-4-git-send-email-zhangqing@rock-chips.com> <153089585197.143105.10633953093490493144@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <153089585197.143105.10633953093490493144@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Elaine Zhang <zhangqing@rock-chips.com>, robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, cl@rock-chips.com, xxx@rock-chips.com, xf@rock-chips.com, huangtao@rock-chips.com
List-Id: devicetree@vger.kernel.org

Am Freitag, 6. Juli 2018, 18:50:51 CEST schrieb Stephen Boyd:
> Quoting Elaine Zhang (2018-06-14 19:16:50)
> > 
> > diff --git a/drivers/clk/rockchip/clk-half-divider.c b/drivers/clk/rockchip/clk-half-divider.c
> > new file mode 100644
> > index 000000000000..fb7a6501e0c1
> > --- /dev/null
> > +++ b/drivers/clk/rockchip/clk-half-divider.c
> > @@ -0,0 +1,230 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2018 Fuzhou Rockchip Electronics Co., Ltd
> > + */
> > +
> > +#include <linux/slab.h>
> > +#include <linux/bitops.h>
> > +#include <linux/regmap.h>
> > +#include <linux/clk.h>
> 
> Is this include used?

nope, and so are bitops and regmap as well.
I've amended the commit patch accordingly.


Heiko
