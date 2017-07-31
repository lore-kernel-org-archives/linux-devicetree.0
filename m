From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 02/14] clk: rockchip: support more clks for rv1108
Date: Tue, 01 Aug 2017 01:31:10 +0200
Message-ID: <17095133.Ri7aPbk3bA@phil>
References: <1501495449-21290-1-git-send-email-andy.yan@rock-chips.com> <1501495719-21452-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1501495719-21452-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
To: Andy Yan <andy.yan@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, shawn.lin@rock-chips.com, zhangqing@rock-chips.com, mturquette@baylibre.com, sboyd@codeaurora.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Montag, 31. Juli 2017, 18:08:39 CEST schrieb Andy Yan:
> From: Elaine Zhang <zhangqing@rock-chips.com>
> 
> 1. Added the description of the missing clock,
> make the clock more complete.
> 2. fix up some clk descriptions error.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

Again, this should be split into multiple patches that are easier to review.
- pll-fixes
- fixes for existing clocks
- renames of things
- new clock-definitions

And should definitly include a bit more explanation.


Thanks
Heiko

