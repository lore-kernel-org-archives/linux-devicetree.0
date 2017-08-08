From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 7/9] clk: rockchip: fix up some clks describe error for rv1108 SoC
Date: Tue, 08 Aug 2017 17:36:41 +0200
Message-ID: <2886228.L8ZHQJ0d60@phil>
References: <1502176547-30817-1-git-send-email-zhangqing@rock-chips.com> <1502176739-32321-1-git-send-email-zhangqing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502176739-32321-1-git-send-email-zhangqing@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, xxx@rock-chips.com, xf@rock-chips.com, huangtao@rock-chips.com, shawn.lin@rock-chips.com, andy.yan@rock-chips.com
List-Id: devicetree@vger.kernel.org

Am Dienstag, 8. August 2017, 15:18:59 CEST schrieb Elaine Zhang:
> 1. fix up the parent name
> 2. remove the CLK_IGNORE_UNUSED flag for some clk not need to always on.
> 3. fix up some clks regs describe error.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>

applied for 4.14

Thanks for restructuring the patches
Heiko
