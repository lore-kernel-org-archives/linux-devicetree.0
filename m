From: Rocky Liao <rjliao@codeaurora.org>
Subject: [PATCH v4 2/2] dt-bindings: net: bluetooth: Add device property firmware-name for QCA6174
Date: Sun, 12 May 2019 11:19:45 +0800
Message-ID: <1557631185-5167-1-git-send-email-rjliao@codeaurora.org>
References: <1554888476-17560-1-git-send-email-rjliao@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554888476-17560-1-git-send-email-rjliao@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, marcel@holtmann.org, johan.hedberg@gmail.com, thierry.escande@linaro.org
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org, Rocky Liao <rjliao@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This patch adds an optional device property "firmware-name" to allow the
driver to load customized nvm firmware file based on this property.

Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
---
Changes in v4:
  * rebased the code base and merge with latest code
---
 Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
index 7ef6118..7a3eda7 100644
--- a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
+++ b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
@@ -17,6 +17,7 @@ Optional properties for compatible string qcom,qca6174-bt:
 
  - enable-gpios: gpio specifier used to enable chip
  - clocks: clock provided to the controller (SUSCLK_32KHZ)
+ - firmware-name: specify the name of nvm firmware to load
 
 Required properties for compatible string qcom,wcn399x-bt:
 
@@ -40,6 +41,7 @@ serial@7570000 {
 
 		enable-gpios = <&pm8994_gpios 19 GPIO_ACTIVE_HIGH>;
 		clocks = <&divclk4>;
+		firmware-name = "nvm_00440302.bin";
 	};
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
