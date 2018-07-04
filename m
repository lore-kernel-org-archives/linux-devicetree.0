From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 0/4] clk: rockchip: support clock controller for px30 SoC
Date: Wed, 04 Jul 2018 12:08:15 +0200
Message-ID: <19643053.9AiPb2dtV0@phil>
References: <1529029011-15021-1-git-send-email-zhangqing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529029011-15021-1-git-send-email-zhangqing@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, cl@rock-chips.com, xxx@rock-chips.com, xf@rock-chips.com, huangtao@rock-chips.com
List-Id: devicetree@vger.kernel.org

Hi Elaine,

Am Freitag, 15. Juni 2018, 04:16:47 CEST schrieb Elaine Zhang:
> Change in V3:
> [PATCH v3 1/4]: Correct description
> [PATCH v3 2/4]: Use an SPDX tag instead.
> [PATCH v3 3/4]: Use an SPDX tag instead,
> 		parent_rate might overflow and fix it.
> 		fix up the checkpatch warning.
> 		add more CMPOSITE_xxx_HALFdiv.
> 
> Change in V2:
> [PATCH v2 2/4]: modify the Author name
> [PATCH v2 3/4]: provide a bit more explanation for commit message
> 
> Elaine Zhang (4):
>   dt-bindings: add bindings for px30 clock controller
>   clk: rockchip: add dt-binding header for px30
>   clk: rockchip: add support for half divider
>   clk: rockchip: add clock controller for px30

I've applied the set for 4.19 but dropped the panic-notifier
dump function from the px30 clock driver.

Heiko
