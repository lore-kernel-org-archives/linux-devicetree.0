From: Robert Marko <robimarko@gmail.com>
Subject: [PATCH] ARM: dts: ipq4019: Remove skeleton.dtsi
Date: Tue, 18 Dec 2018 21:42:04 +0100
Message-ID: <20181218204204.4771-1-robimarko@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Marko <robimarko@gmail.com>
List-Id: devicetree@vger.kernel.org

The skeleton.dtsi file was removed in ARM64 for different reasons as
explained in commit ("3ebee5a2e141 arm64: dts: kill skeleton.dtsi").

These also applies to ARM and it will also allow to get rid of the
following DTC warnings in the future:

"Node /memory has a reg or ranges property, but no unit name"

The disassembled DTB are almost the same besides an empty chosen
node being removed and nodes reordered, so it should not have
functional changes.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 arch/arm/boot/dts/qcom-ipq4019.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -13,12 +13,14 @@
 
 /dts-v1/;
 
-#include "skeleton.dtsi"
 #include <dt-bindings/clock/qcom,gcc-ipq4019.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 / {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
 	model = "Qualcomm Technologies, Inc. IPQ4019";
 	compatible = "qcom,ipq4019";
 	interrupt-parent = <&intc>;
