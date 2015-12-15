From: Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 2/4] arm64: dts: Foundation model: increase GICC region to allow EOImode=1
Date: Tue, 15 Dec 2015 13:36:36 +0000
Message-ID: <1450186598-24504-3-git-send-email-andre.przywara@arm.com>
References: <1450186598-24504-1-git-send-email-andre.przywara@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450186598-24504-1-git-send-email-andre.przywara@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rob.herring@linaro.org, Pawel Moll <pawel.moll@arm.com>, ijc+devicetree@hellion.org.uk, marc.zyngier@arm.com
Cc: catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The Foundation model GIC mapping is wrong, as the GICC region should
be 8kB instead of 4kB (the model implements the GICv2 architecture).
This defect prevents the driver from switching to EOImode==1.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/arm/foundation-v8.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/arm/foundation-v8.dts b/arch/arm64/boot/dts/arm/foundation-v8.dts
index 3c5595d..57ad9fe 100644
--- a/arch/arm64/boot/dts/arm/foundation-v8.dts
+++ b/arch/arm64/boot/dts/arm/foundation-v8.dts
@@ -78,7 +78,7 @@
 		#address-cells = <2>;
 		interrupt-controller;
 		reg = <0x0 0x2c001000 0 0x1000>,
-		      <0x0 0x2c002000 0 0x1000>,
+		      <0x0 0x2c002000 0 0x2000>,
 		      <0x0 0x2c004000 0 0x2000>,
 		      <0x0 0x2c006000 0 0x2000>;
 		interrupts = <1 9 0xf04>;
-- 
2.5.1
