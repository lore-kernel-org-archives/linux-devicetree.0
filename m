From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH v2 PART-RESEND 0/2] berlin sdhci clock clean up
Date: Mon, 16 Nov 2015 18:56:33 +0800
Message-ID: <1447671395-8023-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jisheng Zhang <jszhang@marvell.com>
List-Id: devicetree@vger.kernel.org

Add or fix the optional clock property, then remove the CLK_IGNORE_UNUSED
flag for sdio clk(s).

This is a partialy resend of 
http://lists.infradead.org/pipermail/linux-arm-kernel/2015-October/379457.html

patch3, patch4 has been merged.

Since v1:
 - remove the "mmc: sdhci-pxav3: fix optional clock name" patch to not
   block the clock clean up patches, will send another separate patch
   after talking with HW people.

Jisheng Zhang (2):
  ARM: dts: berlin: correct BG2Q's sdhci2 2nd clock
  ARM: dts: berlin: add 2nd clock for BG2Q sdhci0 and sdhci1

 arch/arm/boot/dts/berlin2q.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.6.2
