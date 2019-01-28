From: Liming Sun <lsun@mellanox.com>
Subject: [PATCH v8 2/2] dt-bindings: soc: Add TmFifo binding for Mellanox BlueField SoC
Date: Mon, 28 Jan 2019 12:28:07 -0500
Message-ID: <1548696487-8840-3-git-send-email-lsun@mellanox.com>
References: <1548696487-8840-1-git-send-email-lsun@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548696487-8840-1-git-send-email-lsun@mellanox.com>
In-Reply-To: <b143b40446c1870fb8d422b364ead95d54552be9.1527264077.git.lsun@mellanox.com>
References: <b143b40446c1870fb8d422b364ead95d54552be9.1527264077.git.lsun@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, David Woods <dwoods@mellanox.com>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Vadim Pasternak <vadimp@mellanox.com>
Cc: Liming Sun <lsun@mellanox.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add devicetree bindings for the TmFifo which is found on Mellanox
BlueField SoCs.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: David Woods <dwoods@mellanox.com>
Signed-off-by: Liming Sun <lsun@mellanox.com>
---
 .../devicetree/bindings/soc/mellanox/tmfifo.txt    | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mellanox/tmfifo.txt

diff --git a/Documentation/devicetree/bindings/soc/mellanox/tmfifo.txt b/Documentation/devicetree/bindings/soc/mellanox/tmfifo.txt
new file mode 100644
index 0000000..8a13fa6
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mellanox/tmfifo.txt
@@ -0,0 +1,23 @@
+* Mellanox BlueField SoC TmFifo
+
+BlueField TmFifo provides a shared FIFO between the target and the
+external host machine, which can be accessed by external host via
+USB or PCIe. In the current tmfifo driver, this FIFO has been demuxed
+to implement virtual console and network interface based on the virtio
+framework.
+
+Required properties:
+
+- compatible:	Should be "mellanox,bf-tmfifo"
+- reg:		Physical base address and length of Rx/Tx block
+- interrupts:	The interrupt number of Rx low water mark, Rx high water mark
+		Tx low water mark, Tx high water mark respectively.
+
+Example:
+
+tmfifo@800a20 {
+	compatible = "mellanox,bf-tmfifo";
+	reg = <0x00800a20 0x00000018
+	       0x00800a40 0x00000018>;
+	interrupts = <41, 42, 43, 44>;
+};
-- 
1.8.3.1
