From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v7 0/6] Mediatek MT2712 clock and scpsys support
Date: Tue, 28 Nov 2017 15:28:15 +0800
Message-ID: <1511854102-23195-1-git-send-email-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, Weiyi Lu <weiyi.lu@mediatek.com>
List-Id: devicetree@vger.kernel.org

This series is based on v4.15-rc1 and composed of
scpsys control (PATCH 1-4) and device tree (PATCH 5-6)

changes since v6:
- Rebase to v4.15-rc1.

changes since v5:
- Refine bus protection with proper variable name
  and better implementation for the if statement.

changes since v4:
- Refine scpsys and infracfg for bus protection by passing 
  a boolean flag to determine the register update method

changes since v3:
- Rebase to v4.14-rc1.

changes since v2:
- ensure the clocks used by clocksource driver are registered
  before clocksource init() by using CLK_OF_DECLARE()
- correct the frequency of clk32k/clkrtc_ext/clkrtc_int

changes since v1:
- Rebase to v4.13-next-soc.
- Refine scpsys and infracfg for bus protection.
