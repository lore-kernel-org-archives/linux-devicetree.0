From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 07/13] ARM: STi: STiH416: Add Restart support for Orly2
Date: Tue, 12 May 2015 13:51:44 +0100
Message-ID: <1431435110-22595-8-git-send-email-lee.jones@linaro.org>
References: <1431435110-22595-1-git-send-email-lee.jones@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431435110-22595-1-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel@stlinux.com, devicetree@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/boot/dts/stih416.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/stih416.dtsi b/arch/arm/boot/dts/stih416.dtsi
index 9ead8bb..6452d33 100644
--- a/arch/arm/boot/dts/stih416.dtsi
+++ b/arch/arm/boot/dts/stih416.dtsi
@@ -30,6 +30,12 @@
 		ranges;
 		compatible	= "simple-bus";
 
+		restart {
+			compatible = "st,stih416-restart";
+			st,syscfg = <&syscfg_sbc>;
+			status = "okay";
+		};
+
 		powerdown: powerdown-controller {
 			#reset-cells = <1>;
 			compatible = "st,stih416-powerdown";
-- 
1.9.1
