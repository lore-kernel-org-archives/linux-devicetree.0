From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH] ARM: dts: berlin2q.dtsi: set L2CC tag and data latency as 2 cycles
Date: Thu, 12 Jun 2014 17:38:40 +0800
Message-ID: <1402565920-5636-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, sebastian.hesselbarth@gmail.com, alexandre.belloni@free-electrons.com, antoine.tenart@free-electrons.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jisheng Zhang <jszhang@marvell.com>
List-Id: devicetree@vger.kernel.org

For all BG2Q SoCs, 2 cycles is the best/correct value

Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
---
 arch/arm/boot/dts/berlin2q.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/berlin2q.dtsi
index 635a16a..3f95dc5 100644
--- a/arch/arm/boot/dts/berlin2q.dtsi
+++ b/arch/arm/boot/dts/berlin2q.dtsi
@@ -90,6 +90,8 @@
 			compatible = "arm,pl310-cache";
 			reg = <0xac0000 0x1000>;
 			cache-level = <2>;
+			arm,data-latency = <2 2 2>;
+			arm,tag-latency = <2 2 2>;
 		};
 
 		scu: snoop-control-unit@ad0000 {
-- 
2.0.0
