From: Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH] ZynqMP: Align gic ranges for 64k in device tree
Date: Thu, 12 May 2016 13:44:01 +0200
Message-ID: <1463053441-57572-1-git-send-email-agraf@suse.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The GIC ranges in the zynqmp device tree are only 4kb aligned. Since
commit 12e14066f we automatically deal with aliases GIC regions though,
so we can map them transparently into guests even on 64kb page size
systems.

This patch makes use of that features and sets GICC and GICV to 64kb
aligned and sized regions.

Signed-off-by: Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>
---
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index e595f22..38c4310 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -81,9 +81,9 @@
 			compatible = "arm,gic-400", "arm,cortex-a15-gic";
 			#interrupt-cells = <3>;
 			reg = <0x0 0xf9010000 0x10000>,
-			      <0x0 0xf902f000 0x2000>,
+			      <0x0 0xf9020000 0x20000>,
 			      <0x0 0xf9040000 0x20000>,
-			      <0x0 0xf906f000 0x2000>;
+			      <0x0 0xf9060000 0x20000>;
 			interrupt-controller;
 			interrupt-parent = <&gic>;
 			interrupts = <1 9 0xf04>;
-- 
1.8.5.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
