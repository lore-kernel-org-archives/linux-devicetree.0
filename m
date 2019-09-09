From: Talel Shenhar <talel@amazon.com>
Subject: [PATCH 1/3] dt-bindings: soc: al-pos: Amazon's Annapurna Labs POS
Date: Mon, 9 Sep 2019 12:10:18 +0300
Message-ID: <1568020220-7758-2-git-send-email-talel@amazon.com>
References: <1568020220-7758-1-git-send-email-talel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568020220-7758-1-git-send-email-talel@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, mchehab+samsung@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, nicolas.ferre@microchip.com, tglx@linutronix.de, arnd@arndb.de, venture@google.com, linus.walleij@linaro.org, olof@lixom.net, mripard@kernel.org, ssantosh@kernel.org, paul.kocialkowski@bootlin.com, mjourdan@baylibre.com, catalin.marinas@arm.com, will@kernel.org, talel@amazon.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: dwmw@amazon.co.uk, benh@kernel.crashing.org, hhhawa@amazon.com, ronenk@amazon.com, jonnyc@amazon.com, hanochu@amazon.com, barakw@amazon.com
List-Id: devicetree@vger.kernel.org

Document Amazon's Annapurna Labs POS SoC binding.

Signed-off-by: Talel Shenhar <talel@amazon.com>
---
 .../devicetree/bindings/soc/amazon/amazon,al-pos.txt   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/amazon/amazon,al-pos.txt

diff --git a/Documentation/devicetree/bindings/soc/amazon/amazon,al-pos.txt b/Documentation/devicetree/bindings/soc/amazon/amazon,al-pos.txt
new file mode 100644
index 00000000..035cc571
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/amazon/amazon,al-pos.txt
@@ -0,0 +1,18 @@
+Amazon's Annapurna Labs POS
+
+POS node is defined to describe the Point Of Serialization (POS) logger
+unit.
+
+Required properties:
+- compatible:	Shall be "amazon,al-pos".
+- reg:		POS logger resources.
+- interrupts:	should contain the interrupt for pos error event.
+
+Example:
+
+al_pos {
+	compatible = "amazon,al-pos";
+	reg = <0x0 0xf0070084 0x0 0x00000008>;
+	interrupt-parent = <&amazon_system_fabric>;
+	interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
+};
-- 
2.7.4
