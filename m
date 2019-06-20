From: Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH] ARM: dts: msm8974-FP2: add reboot-mode node
Date: Fri, 21 Jun 2019 00:58:24 +0200
Message-ID: <20190620225824.2845-1-luca@z3ntu.xyz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org
Cc: ~martijnbraam/pmos-upstream@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This enables userspace to signal the bootloader to go into the
bootloader or recovery mode.

The magic values can be found in both the downstream kernel and the LK
kernel (bootloader).

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
Sidenote: Why are there no userspace tools to be found that support
this? Anyways, we have one now in postmarketOS :)

 arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts b/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
index 643c57f84818..f86736a6d77e 100644
--- a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
@@ -338,6 +338,20 @@
 			};
 		};
 	};
+
+	imem@fe805000 {
+		compatible = "syscon", "simple-mfd";
+		reg = <0xfe805000 0x1000>;
+
+		reboot-mode {
+			compatible = "syscon-reboot-mode";
+			offset = <0x65c>;
+
+			mode-normal	= <0x77665501>;
+			mode-bootloader	= <0x77665500>;
+			mode-recovery	= <0x77665502>;
+		};
+	};
 };
 
 &spmi_bus {
-- 
2.22.0
