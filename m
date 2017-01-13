From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v4 0/2] Add support rockchip,grf property for RK3399 PMU/GRU
Date: Fri, 13 Jan 2017 20:10:54 +0100
Message-ID: <3210111.1N6x2AkRMx@phil>
References: <1484028930-20305-1-git-send-email-zhengxing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1484028930-20305-1-git-send-email-zhengxing@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: dianders@google.com, linux-rockchip@lists.infradead.org, Douglas Anderson <dianders@chromium.org>, David Wu <david.wu@rock-chips.com>, Jianqun Xu <jay.xu@rock-chips.com>, devicetree@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Elaine Zhang <zhangqing@rock-chips.com>, Brian Norris <briannorris@chromium.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Caesar Wang <wxt@rock-chips.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 10. Januar 2017, 14:15:28 CET schrieb Xing Zheng:
> Hi,
>   The structure rockchip_clk_provider needs to refer the GRF regmap
> in somewhere, if the CRU node has not "rockchip,grf" property,
> calling syscon_regmap_lookup_by_phandle will return an invalid GRF
> regmap, and the MUXGRF type clock will be not supported.
> 
> Therefore, we need to add them.
> 
> Thanks.

applied both for 4.11

binding-change is in my clock-branch (so that dt-binding doc changes stay 
together) and the dts change is of course in the dts64 branch.


Thanks
Heiko
