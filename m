From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 0/5] Fix and improve clock controller for the RK322x SoCs
Date: Wed, 22 Jun 2016 01:07:29 +0200
Message-ID: <13345941.K3V3BNYxTY@phil>
References: <1466484811-26923-1-git-send-email-zhengxing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1466484811-26923-1-git-send-email-zhengxing@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Yakir Yang <ykk@rock-chips.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Jeffy Chen <jeffy.chen@rock-chips.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Caesar Wang <wxt@rock-chips.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 21. Juni 2016, 12:53:26 schrieb Xing Zheng:
> Hi,
>   These patchset fix some clocks bugs, and improve clock configuration
> for i2s/spdif/MAC on RK322x SoCs.

applied to my clock-branch with the following changes:

- fixed the error in patch1 - missing ")" in
      COMPOSITE_FRAC(0, "i2s1_frac", "i2s1_src", CLK_SET_RATE_PARENT,
-                       RK3288_CLKSEL_CON(7), 0,
-                       RK3288_CLKGATE_CON(0), 11, GFLAGS),
+                       RK2928_CLKSEL_CON(7), 0,
+                       RK2928_CLKGATE_CON(0), 11, GFLAGS,

- adapted patch2 accordingly
- split out clock id addition into separate patches, as they need a shared 
branch. Xing please remember to add clock-ids to the header in separate 
patches.


Heiko
