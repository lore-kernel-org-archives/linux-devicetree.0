From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 1/6] dt-bindings: interrupt-controller: add DT binding for the Marvell GICP
Date: Tue, 30 May 2017 11:16:06 +0200
Message-ID: <1496135772-20694-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1496135772-20694-1-git-send-email-thomas.petazzoni@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1496135772-20694-1-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>
Cc: linux-arm-kernel@lists.infradead.org, Nadav Haklai <nadavh@marvell.com>, Hanna Hawa <hannah@marvell.com>, Yehuda Yitschak <yehuday@marvell.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

This commit adds the Device Tree binding documentation for the Marvell
GICP, an extension to the GIC that allows to trigger GIC SPI interrupts
using memory transactions. It is used by the ICU unit in the Marvell
CP110 block to turn wired interrupts inside the CP into SPI interrupts
at the GIC level in the AP.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../bindings/interrupt-controller/marvell,gicp.txt   | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,gicp.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/marvell,gicp.txt b/Documentation/devicetree/bindings/interrupt-controller/marvell,gicp.txt
new file mode 100644
index 0000000..996bdbf
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/marvell,gicp.txt
@@ -0,0 +1,20 @@
+Marvell GICP Controller
+-----------------------
+
+GICP is a Marvell extension of the GIC that allows to trigger GIC SPI
+interrupts by doing a memory transaction. It is used by the ICU
+located in the Marvell CP110 to turn wired interrupts inside the CP
+into GIC SPI interrupts.
+
+Required properties:
+
+- compatible: Must be "marvell,gicp"
+
+- reg: Must be the address and size of the GICP SPI registers
+
+Example:
+
+gicp_spi: gicp-spi@3f0040 {
+	compatible = "marvell,gicp";
+	reg = <0x3f0040 0x10>;
+};
-- 
2.7.4
