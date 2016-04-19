From: Dirk Behme <dirk.behme@de.bosch.com>
Subject: [PATCH] arm64: dts: r8a7795: Increase the size of GIC-400 mapped registers
Date: Tue, 19 Apr 2016 08:29:55 +0200
Message-ID: <1461047395-6532-1-git-send-email-dirk.behme@de.bosch.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, julien.grall@arm.com, Pooya Keshavarzi <Pooya.Keshavarzi@de.bosch.com>, Dirk Behme <dirk.behme@de.bosch.com>
List-Id: devicetree@vger.kernel.org

From: Pooya Keshavarzi <Pooya.Keshavarzi@de.bosch.com>

There are some requirements about the GIC-400 memory layout and its
mapping if using 64k aligned base addresses like on r8a7795.

See e.g.

http://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=21550029f709072aacf3b9

Map the whole memory range instead of only 0x2000. This will fix
the issue that some hypervisors, e.g. Xen, fail to handle the
interrupts correctly.

Signed-off-by: Pooya Keshavarzi <Pooya.Keshavarzi@de.bosch.com>
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
Note: This patch is against renesas-drivers-2016-04-12-v4.6-rc3

 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 8be9424..d880fd4 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -160,9 +160,9 @@
 			#address-cells = <0>;
 			interrupt-controller;
 			reg = <0x0 0xf1010000 0 0x1000>,
-			      <0x0 0xf1020000 0 0x2000>,
+			      <0x0 0xf1020000 0 0x20000>,
 			      <0x0 0xf1040000 0 0x20000>,
-			      <0x0 0xf1060000 0 0x2000>;
+			      <0x0 0xf1060000 0 0x20000>;
 			interrupts = <GIC_PPI 9
 					(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
-- 
2.8.0
