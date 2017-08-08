From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 9/9] clk: rockchip: add some critical clocks for rv1108 SoC
Date: Tue, 08 Aug 2017 17:37:10 +0200
Message-ID: <3649046.pOvQWI1C9i@phil>
References: <1502176547-30817-1-git-send-email-zhangqing@rock-chips.com> <1502176773-32415-1-git-send-email-zhangqing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502176773-32415-1-git-send-email-zhangqing@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, xxx@rock-chips.com, xf@rock-chips.com, huangtao@rock-chips.com, shawn.lin@rock-chips.com, andy.yan@rock-chips.com
List-Id: devicetree@vger.kernel.org

Am Dienstag, 8. August 2017, 15:19:33 CEST schrieb Elaine Zhang:
> the bus/periph/nclk_ddrupctl/pclk_ddrmon/pclk_acodecphy/pclk_pmu
> no driver to handle them,
> Chip design requirements for these clock to always on.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>

applied for 4.14

Thanks
Heiko
