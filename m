From: Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH v3 2/2] dt-bindings/interrupt-controller: pdc: fix example to match actual bindings
Date: Fri, 24 Aug 2018 13:11:11 -0600
Message-ID: <20180824191111.14571-2-ilina@codeaurora.org>
References: <20180824191111.14571-1-ilina@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180824191111.14571-1-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: marc.zyngier@arm.com, bjorn.andersson@linaro.org, sboyd@kernel.org, evgreen@chromium.org, linus.walleij@linaro.org
Cc: rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, andy.gross@linaro.org, dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The PDC map should use the GIC SPI port and not the vector. GIC
internally adds 32 to SPI hwirq numbers.

Fixes: 1ae8862e27e ("dt-bindings/interrupt-controller: pdc: Describe PDC device binding")
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.txt     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
index 0b2c97ddb520..30f2f10d75e9 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
@@ -61,13 +61,13 @@ Example:
 	pdc: interrupt-controller@b220000 {
 		compatible = "qcom,sdm845-pdc";
 		reg = <0xb220000 0x30000>;
-		qcom,pdc-ranges = <0 512 94>, <94 641 15>, <115 662 7>;
+		qcom,pdc-ranges = <0 480 94>, <94 609 15>, <115 630 7>;
 		#interrupt-cells = <2>;
 		interrupt-parent = <&intc>;
 		interrupt-controller;
 	};
 
-DT binding of a device that wants to use the GIC SPI 514 as a wakeup
+DT binding of a device that wants to use the GIC SPI 482 as a wakeup
 interrupt, must do -
 
 	wake-device {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
