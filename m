From: Scott Branden <scott.branden@broadcom.com>
Subject: [PATCH] arm64: dts: stingray: Add otp device node
Date: Wed, 23 May 2018 13:17:10 -0700
Message-ID: <1527106630-4760-1-git-send-email-scott.branden@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Scott Branden <scott.branden@broadcom.com>
List-Id: devicetree@vger.kernel.org

Add otp device node for Stingray SOC.

Fixes: 2fa9e9e29ea2 ("arm64: dts: Add GPIO DT nodes for Stingray SOC")
Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
index 99aaff0..6013478 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
@@ -258,6 +258,13 @@
 
 		#include "stingray-clock.dtsi"
 
+		otp: otp@1c400 {
+			compatible = "brcm,ocotp-v2";
+			reg = <0x0001c400 0x68>;
+			brcm,ocotp-size = <2048>;
+			status = "okay";
+		};
+
 		gpio_crmu: gpio@24800 {
 			compatible = "brcm,iproc-gpio";
 			reg = <0x00024800 0x4c>;
-- 
2.5.0
