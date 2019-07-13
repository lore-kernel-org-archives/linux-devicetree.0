From: Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH v2] ARM: dts: msm8974-FP2: add reboot-mode node
Date: Sat, 13 Jul 2019 17:48:06 +0200
Message-ID: <20190713154805.17159-1-luca@z3ntu.xyz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org
Cc: ~martijnbraam/pmos-upstream@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>, Brian Masney <masneyb@onstation.org>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This enables userspace to signal the bootloader to go into the
bootloader or recovery mode.

The magic values can be found in both the downstream kernel and the LK
kernel (bootloader).

Reviewed-by: Brian Masney <masneyb@onstation.org>
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
Changes v1 -> v2:
- Move the majority of the node into the board dts, just keep the magic
  values in the device-specific dts.

 arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts | 10 ++++++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi              | 11 +++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts b/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
index 643c57f84818..ff4a3e0aa746 100644
--- a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
@@ -338,6 +338,16 @@
 			};
 		};
 	};
+
+	imem@fe805000 {
+		status = "okay";
+
+		reboot-mode {
+			mode-normal	= <0x77665501>;
+			mode-bootloader	= <0x77665500>;
+			mode-recovery	= <0x77665502>;
+		};
+	};
 };
 
 &spmi_bus {
diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 45b5c8ef0374..1927430bded7 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1085,6 +1085,17 @@
 				};
 			};
 		};
+
+		imem@fe805000 {
+			status = "disabled";
+			compatible = "syscon", "simple-mfd";
+			reg = <0xfe805000 0x1000>;
+
+			reboot-mode {
+				compatible = "syscon-reboot-mode";
+				offset = <0x65c>;
+			};
+		};
 	};
 
 	smd {
-- 
2.22.0
