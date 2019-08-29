From: Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH RFC 05/14] dt-bindings/interrupt-controller: pdc: add SPI config register
Date: Thu, 29 Aug 2019 12:11:54 -0600
Message-ID: <20190829181203.2660-6-ilina@codeaurora.org>
References: <20190829181203.2660-1-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190829181203.2660-1-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: swboyd@chromium.org, evgreen@chromium.org, marc.zyngier@arm.com, linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, mkshah@codeaurora.org, linux-gpio@vger.kernel.org, rnayak@codeaurora.org, Lina Iyer <ilina@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

In addition to configuring the PDC, additional registers that interface
the GIC have to be configured to match the GPIO type. The registers on
some QCOM SoCs are access restricted, while on other SoCs are not. They
SoCs with access restriction to these SPI registers need to be written
from the firmware using the SCM interface. Add a flag to indicate if the
register is to be written using SCM interface.

Cc: devicetree@vger.kernel.org
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
 .../bindings/interrupt-controller/qcom,pdc.txt           | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
index 8e0797cb1487..852fcba98ea6 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
@@ -50,15 +50,22 @@ Properties:
 		    The second element is the GIC hwirq number for the PDC port.
 		    The third element is the number of interrupts in sequence.
 
+- qcom,scm-spi-cfg:
+	Usage: optional
+	Value type: <bool>
+	Definition: Specifies if the SPI configuration registers have to be
+		    written from the firmware.
+
 Example:
 
 	pdc: interrupt-controller@b220000 {
 		compatible = "qcom,sdm845-pdc";
-		reg = <0xb220000 0x30000>;
+		reg = <0xb220000 0x30000>, <0x179900f0 0x60>;
 		qcom,pdc-ranges = <0 512 94>, <94 641 15>, <115 662 7>;
 		#interrupt-cells = <2>;
 		interrupt-parent = <&intc>;
 		interrupt-controller;
+		qcom,scm-spi-cfg;
 	};
 
 DT binding of a device that wants to use the GIC SPI 514 as a wakeup
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
