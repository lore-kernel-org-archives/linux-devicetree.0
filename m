From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] ARM: dts: mmp2: Fix typo in max8925 compatible property
Date: Tue, 16 Sep 2014 18:18:02 +0200
Message-ID: <1410884282-18041-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: devicetree@vger.kernel.org

Fix typo in the compatible property for max8925 MFD driver. The proper
compatible as in Documentation and driver is 'maxim,max8925'.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/boot/dts/mmp2-brownstone.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mmp2-brownstone.dts b/arch/arm/boot/dts/mmp2-brownstone.dts
index 7f70a39459f6..29eeb465f99c 100644
--- a/arch/arm/boot/dts/mmp2-brownstone.dts
+++ b/arch/arm/boot/dts/mmp2-brownstone.dts
@@ -30,7 +30,7 @@
 			twsi1: i2c@d4011000 {
 				status = "okay";
 				pmic: max8925@3c {
-					compatible = "maxium,max8925";
+					compatible = "maxim,max8925";
 					reg = <0x3c>;
 					interrupts = <1>;
 					interrupt-parent = <&intcmux4>;
-- 
1.9.1
