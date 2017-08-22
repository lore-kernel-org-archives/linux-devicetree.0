From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 4/4] clk: rockchip: rv1108: fix up the clk_mac sel register description
Date: Tue, 22 Aug 2017 02:56:44 +0200
Message-ID: <3808559.a1EKnBSiS9@phil>
References: <1503303367-17915-1-git-send-email-zhangqing@rock-chips.com> <1503303367-17915-5-git-send-email-zhangqing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1503303367-17915-5-git-send-email-zhangqing@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, xxx@rock-chips.com, xf@rock-chips.com, huangtao@rock-chips.com, cl@rock-chips.com, andy.yan@rock-chips.com, wdc@rock-chips.com
List-Id: devicetree@vger.kernel.org

Am Montag, 21. August 2017, 16:16:07 CEST schrieb Elaine Zhang:
> cru_sel24_con[8]
> rmii_extclk_sel
> clock source select control register
> 1'b0: from internal PLL
> 1'b1: from external IO
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>

applied for 4.14.


Thanks
Heiko
