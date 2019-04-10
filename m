From: Rocky Liao <rjliao@codeaurora.org>
Subject: [PATCH v3 2/2] dt-bindings: net: bluetooth: Add device property firmware-name for QCA6174
Date: Wed, 10 Apr 2019 17:27:56 +0800
Message-ID: <1554888476-17560-1-git-send-email-rjliao@codeaurora.org>
References: <1554368908-22017-2-git-send-email-rjliao@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554368908-22017-2-git-send-email-rjliao@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, marcel@holtmann.org, johan.hedberg@gmail.com, thierry.escande@linaro.org
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org, Rocky Liao <rjliao@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This patch adds an optional device property "firmware-name" to allow the
driver to load customized nvm firmware file based on this property.

Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
---
Changes in v3:
  * added firmware-name instead of nvm-postfix to specify full firmware name
---
 Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
index 824c0e2..2bcea50 100644
--- a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
+++ b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
@@ -16,6 +16,7 @@ Optional properties for compatible string qcom,qca6174-bt:
 
  - enable-gpios: gpio specifier used to enable chip
  - clocks: clock provided to the controller (SUSCLK_32KHZ)
+ - firmware-name: specify the name of nvm firmware to load
 
 Required properties for compatible string qcom,wcn3990-bt:
 
@@ -39,6 +40,7 @@ serial@7570000 {
 
 		enable-gpios = <&pm8994_gpios 19 GPIO_ACTIVE_HIGH>;
 		clocks = <&divclk4>;
+		firmware-name = "nvm_00440302.bin";
 	};
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
