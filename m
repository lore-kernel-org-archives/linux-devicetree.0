From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v5 4/4] clk: rockchip: add clock controller for rk3328
Date: Thu, 05 Jan 2017 13:53:44 +0100
Message-ID: <2499480.rhkWDTFgrm@phil>
References: <1482979511-6847-1-git-send-email-zhangqing@rock-chips.com> <1482979511-6847-5-git-send-email-zhangqing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1482979511-6847-5-git-send-email-zhangqing@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, xf@rock-chips.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-clk@vger.kernel.org, huangtao@rock-chips.com, xxx@rock-chips.com, cl@rock-chips.com, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 29. Dezember 2016, 10:45:11 CET schrieb Elaine Zhang:
> Add the clock tree definition for the new rk3328 SoC.
> 
> Changes in v5:
>   fix up some code style, remove grf clk init and cru dump.
> Changes in v4:
>   adjust the pacth 3 and 4 order.
> Changes in v3:
>   fix up the pll parent only xin24m.
> Changes in v2:
>   fix up these *_sample error description.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>

applied for 4.11.

You might also want to readd your mac2phy grf clocks via the newly
introduced muxgrf clock-type [0] in a follow-up-patch.

Heiko

[0] https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.git/commit/?id=cb1d9f6ddaa436f2dce2710740b7a3546700949c

