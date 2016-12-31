From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v5 3/4] clk: rockchip: add new pll-type for rk3328
Date: Sat, 31 Dec 2016 13:53:51 +0100
Message-ID: <2438805.XRRMBVrdEM@phil>
References: <1482979511-6847-1-git-send-email-zhangqing@rock-chips.com> <1482979511-6847-4-git-send-email-zhangqing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1482979511-6847-4-git-send-email-zhangqing@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, xf@rock-chips.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-clk@vger.kernel.org, huangtao@rock-chips.com, xxx@rock-chips.com, cl@rock-chips.com, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 29. Dezember 2016, 10:45:10 CET schrieb Elaine Zhang:
> The rk3328's pll and clock are similar with rk3036's,
> it different with pll_mode_mask, the rk3328 soc
> pll mode only one bit(rk3036 soc have two bits)
> so these should be independent and separate from
> the series of rk3328s.
> 
> Changes in v4:
>   adjust the pacth 3 and 4 order.
>   move pll_rk3328 to patch 3.
> Changes in v3:
>   fix up the pll type pll_rk3328 description and use
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>

applied to my clk-branch for 4.11

The clock controller itself also looks good now, I'll just give Rob or someone 
else a bit of time for eventual comments after new years :-)

Heiko
