From: Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v5 RESEND 1/3] dt-bindings: hisilicon: add doc for Hi3798CV200 peripheral controller
Date: Wed, 24 Jan 2018 13:47:35 +0800
Message-ID: <1516772857-3580-2-git-send-email-shawn.guo@linaro.org>
References: <1516772857-3580-1-git-send-email-shawn.guo@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1516772857-3580-1-git-send-email-shawn.guo@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jianguo Sun <sunjianguo1@huawei.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, project-aspen-dev@linaro.org, Shawn Guo <shawn.guo@linaro.org>
List-Id: devicetree@vger.kernel.org

It adds bindings doc for Hi3798CV200 peripheral controller.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 .../bindings/arm/hisilicon/hisilicon.txt           | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
index 7111fbc82a4e..199cd36fe1ba 100644
--- a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
+++ b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
@@ -75,6 +75,29 @@ Example:
 	};
 
 -----------------------------------------------------------------------
+Hisilicon Hi3798CV200 Peripheral Controller
+
+The Hi3798CV200 Peripheral Controller controls peripherals, queries
+their status, and configures some functions of peripherals.
+
+Required properties:
+- compatible: Should contain "hisilicon,hi3798cv200-perictrl", "syscon"
+  and "simple-mfd".
+- reg: Register address and size of Peripheral Controller.
+- #address-cells: Should be 1.
+- #size-cells: Should be 1.
+
+Examples:
+
+	perictrl: peripheral-controller@8a20000 {
+		compatible = "hisilicon,hi3798cv200-perictrl", "syscon",
+			     "simple-mfd";
+		reg = <0x8a20000 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
+-----------------------------------------------------------------------
 Hisilicon Hi6220 system controller
 
 Required properties:
-- 
1.9.1
