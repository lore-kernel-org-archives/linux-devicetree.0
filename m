From: matthew.gerlach@linux.intel.com
Subject: [PATCH v2 1/3] dt-bindings: mtd: Altera ASMI Parallel II IP Core
Date: Wed, 20 Sep 2017 11:28:57 -0700
Message-ID: <1505932139-2905-2-git-send-email-matthew.gerlach@linux.intel.com>
References: <1505932139-2905-1-git-send-email-matthew.gerlach@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1505932139-2905-1-git-send-email-matthew.gerlach@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vndao@altera.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, davem@davemloft.net, mchehab@kernel.org, linux-fpga@vger.kernel.org, tien.hock.loh@intel.com, hean.loong.ong@intel.com
Cc: Matthew Gerlach <matthew.gerlach@linux.intel.com>
List-Id: devicetree@vger.kernel.org

From: Matthew Gerlach <matthew.gerlach@linux.intel.com>

Device Tree bindings for Altera ASMI Parallel II IP Core
connected to a flash chip.

Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
---
v2:
    Made substitutions suggested by Rob Herring.
    Emphasize driver expects controller is connected to spi-nor flash.
---
 Documentation/devicetree/bindings/mtd/altera-asmip2.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/altera-asmip2.txt

diff --git a/Documentation/devicetree/bindings/mtd/altera-asmip2.txt b/Documentation/devicetree/bindings/mtd/altera-asmip2.txt
new file mode 100644
index 0000000..2e58817
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/altera-asmip2.txt
@@ -0,0 +1,15 @@
+* Altera ASMI Parallel II IP Core
+
+Devicetree bindings for an Altera ASMI Parallel II IP core connected to a
+spi-nor flash chip.
+
+Required properties:
+- compatible : Should be "altr,asmi-parallel2-spi-nor".
+- reg : A tuple consisting of a physical address and length.
+
+Example:
+
+qspi: spi@a0001000 {
+	compatible = "altr,asmi-parallel2-spi-nor";
+	reg = <0xa0001000 0x10>;
+};
-- 
2.7.4
