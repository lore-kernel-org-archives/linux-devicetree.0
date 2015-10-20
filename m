From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH v2 0/4] berlin sdhci clock clean up
Date: Tue, 20 Oct 2015 19:16:43 +0800
Message-ID: <1445339807-2351-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mturquette@baylibre.com, sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jisheng Zhang <jszhang@marvell.com>
List-Id: devicetree@vger.kernel.org

Add or fix the optional clock property, then remove the CLK_IGNORE_UNUSED
flag for sdio clk(s).

Since v1:
  - remove the "mmc: sdhci-pxav3: fix optional clock name" patch to not
    block the clock clean up patches, will send another separate patch 
    after talking with HW people.

Jisheng Zhang (4):
  ARM: dts: berlin: correct BG2Q's sdhci2 2nd clock
  ARM: dts: berlin: add 2nd clock for BG2Q sdhci0 and sdhci1
  clk: berlin: bg2q: remove CLK_IGNORE_UNUSED flag for sdio clk
  clk: berlin: bg2: remove CLK_IGNORE_UNUSED flag for sdio clk

 arch/arm/boot/dts/berlin2q.dtsi | 8 +++++---
 drivers/clk/berlin/bg2.c        | 4 ++--
 drivers/clk/berlin/bg2q.c       | 2 +-
 3 files changed, 8 insertions(+), 6 deletions(-)

-- 
2.6.1

