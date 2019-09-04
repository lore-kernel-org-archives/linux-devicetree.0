From: Talel Shenhar <talel@amazon.com>
Subject: [PATCH 1/3] dt-bindings: edac: al-mc-edac: Amazon's Annapurna Labs Memory Controller EDAC
Date: Wed, 4 Sep 2019 16:32:21 +0300
Message-ID: <1567603943-25316-2-git-send-email-talel@amazon.com>
References: <1567603943-25316-1-git-send-email-talel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567603943-25316-1-git-send-email-talel@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, talel@amazon.com, davem@davemloft.net, gregkh@linuxfoundation.org, nicolas.ferre@microchip.com, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will@kernel.org, linux-edac@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: hhhawa@amazon.com, ronenk@amazon.com, jonnyc@amazon.com, hanochu@amazon.com, barakw@amazon.com
List-Id: devicetree@vger.kernel.org

Document Amazon's Annapurna Labs Memory Controller EDAC SoC binding.

Signed-off-by: Talel Shenhar <talel@amazon.com>
---
 .../devicetree/bindings/edac/amazon,al-mc-edac.txt | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/amazon,al-mc-edac.txt

diff --git a/Documentation/devicetree/bindings/edac/amazon,al-mc-edac.txt b/Documentation/devicetree/bindings/edac/amazon,al-mc-edac.txt
new file mode 100644
index 0000000..9a3803f
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/amazon,al-mc-edac.txt
@@ -0,0 +1,24 @@
+Amazon's Annapurna Labs Memory Controller EDAC
+
+EDAC node is defined to describe on-chip error detection and correction for
+Amazon's Annapurna Labs Memory Controller.
+
+Required properties:
+- compatible:	Shall be "amazon,al-mc-edac".
+- reg:		DDR controller resource.
+
+Optional:
+- interrupt-names:	may include "ue", for uncorrectable errors,
+			and/or "ce", for correctable errors.
+- interrupts:		should contain the interrupts associated with the
+			interrupts names.
+
+Example:
+
+al_mc_edac {
+	compatible = "amazon,al-mc-edac";
+	reg = <0x0 0xf0080000 0x0 0x00010000>;
+	interrupt-parent = <&amazon_al_system_fabric>;
+	interrupt-names = "ue";
+	interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
+};
-- 
2.7.4
