From: Hanna Hawa <hhhawa@amazon.com>
Subject: [PATCH v3 1/4] dt-bindings: EDAC: Add Amazon's Annapurna Labs L1 EDAC
Date: Mon, 15 Jul 2019 16:24:06 +0300
Message-ID: <1563197049-12679-2-git-send-email-hhhawa@amazon.com>
References: <1563197049-12679-1-git-send-email-hhhawa@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1563197049-12679-1-git-send-email-hhhawa@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, davem@davemloft.net, gregkh@linuxfoundation.org, linus.walleij@linaro.org, Jonathan.Cameron@huawei.com, nicolas.ferre@microchip.com, paulmck@linux.ibm.com
Cc: dwmw@amazon.co.uk, benh@amazon.com, ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com, hanochu@amazon.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, hhhawa@amazon.com
List-Id: devicetree@vger.kernel.org

Document Amazon's Annapurna Labs L1 EDAC SoC binding.

Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
---
 .../devicetree/bindings/edac/amazon,al-l1-edac.txt         | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/amazon,al-l1-edac.txt

diff --git a/Documentation/devicetree/bindings/edac/amazon,al-l1-edac.txt b/Documentation/devicetree/bindings/edac/amazon,al-l1-edac.txt
new file mode 100644
index 0000000..2ae8370
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/amazon,al-l1-edac.txt
@@ -0,0 +1,14 @@
+* Amazon's Annapurna Labs L1 EDAC
+
+Amazon's Annapurna Labs SoCs supports L1 single bit correction and
+two bits detection capability based on ARM implementation.
+
+Required properties:
+- compatible:
+	should be "amazon,al-l1-edac".
+
+Example:
+
+	al_l1_edac {
+		compatible = "amazon,al-l1-edac";
+	};
-- 
2.7.4
