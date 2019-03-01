From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH v2 mailbox 2/3] dt-bindings: mailbox: Document armada-37xx-rwtm-mailbox binding
Date: Fri,  1 Mar 2019 05:23:40 +0100
Message-ID: <20190301042341.29484-3-marek.behun@nic.cz>
References: <20190301042341.29484-1-marek.behun@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190301042341.29484-1-marek.behun@nic.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This adds device tree binding documentation for the rWTM BIU mailbox
driver on the Armada 37xx SOC (EspressoBin, Turris Mox).

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---
 .../mailbox/armada-37xx-rwtm-mailbox.txt         | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/armada-37xx-rwtm-mailbox.txt

diff --git a/Documentation/devicetree/bindings/mailbox/armada-37xx-rwtm-mailbox.txt b/Documentation/devicetree/bindings/mailbox/armada-37xx-rwtm-mailbox.txt
new file mode 100644
index 000000000000..282ab81a4ea6
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/armada-37xx-rwtm-mailbox.txt
@@ -0,0 +1,16 @@
+* rWTM BIU Mailbox driver for Armada 37xx
+
+Required properties:
+- compatible:	must be "marvell,armada-3700-rwtm-mailbox"
+- reg:		physical base address of the mailbox and length of memory mapped
+		region
+- interrupts:	the IRQ line for the mailbox
+- #mbox-cells:	must be 1
+
+Example:
+	rwtm: mailbox@b0000 {
+		compatible = "marvell,armada-3700-rwtm-mailbox";
+		reg = <0xb0000 0x100>;
+		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+		#mbox-cells = <1>;
+	};
-- 
2.19.2
