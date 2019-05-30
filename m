From: Hanna Hawa <hhhawa@amazon.com>
Subject: [PATCH 1/2] dt-bindings: EDAC: add Amazon Annapurna Labs EDAC binding
Date: Thu, 30 May 2019 13:15:28 +0300
Message-ID: <1559211329-13098-2-git-send-email-hhhawa@amazon.com>
References: <1559211329-13098-1-git-send-email-hhhawa@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559211329-13098-1-git-send-email-hhhawa@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, davem@davemloft.net, gregkh@linuxfoundation.org, nicolas.ferre@microchip.com, paulmck@linux.ibm.com, dwmw@amazon.co.uk, benh@amazon.com
Cc: ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com, hanochu@amazon.com, hhhawa@amazon.com, linux-edac@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
---
 .../devicetree/bindings/edac/amazon-al-edac.txt          | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/amazon-al-edac.txt

diff --git a/Documentation/devicetree/bindings/edac/amazon-al-edac.txt b/Documentation/devicetree/bindings/edac/amazon-al-edac.txt
new file mode 100644
index 0000000..76165a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/amazon-al-edac.txt
@@ -0,0 +1,16 @@
+* Amazon Annapurna Labs EDAC
+
+Amazon Annapurna Labs Alpine V2 SoC is based on ARM Cortex-A57, and Alpine V3 SoC is
+based on ARM Cortex-A72.
+Alpine SoCs support L1 and L2 error correction check based on ARM implementation.
+
+Required properties:
+- compatible:
+	should be "amazon,al-cortex-a57-edac" for Alpine V2.
+	should be "amazon,al-cortex-a72-edac" for Alpine V3.
+
+Example:
+
+	edac_l1_l2 {
+		compatible = "amazon,al-cortex-a57-edac";
+	};
-- 
2.7.4
