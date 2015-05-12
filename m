From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 06/13] ARM: STi: STiH407: Add Restart support for Cannes
Date: Tue, 12 May 2015 13:51:43 +0100
Message-ID: <1431435110-22595-7-git-send-email-lee.jones@linaro.org>
References: <1431435110-22595-1-git-send-email-lee.jones@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431435110-22595-1-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel@stlinux.com, devicetree@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/boot/dts/stih407-family.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
index 85159b8..46e6a38 100644
--- a/arch/arm/boot/dts/stih407-family.dtsi
+++ b/arch/arm/boot/dts/stih407-family.dtsi
@@ -65,6 +65,12 @@
 		ranges;
 		compatible = "simple-bus";
 
+		restart {
+			compatible = "st,stih407-restart";
+			st,syscfg = <&syscfg_sbc_reg>;
+			status = "okay";
+		};
+
 		powerdown: powerdown-controller {
 			compatible = "st,stih407-powerdown";
 			#reset-cells = <1>;
-- 
1.9.1
