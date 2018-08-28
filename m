From: Jonas Gorski <jonas.gorski@gmail.com>
Subject: [PATCH 1/5] dt-bindings: mtd: describe the simple BCM963XX NOR flash
 layout
Date: Tue, 28 Aug 2018 13:19:40 +0200
Message-ID: <20180828111944.5956-2-jonas.gorski@gmail.com>
References: <20180828111944.5956-1-jonas.gorski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20180828111944.5956-1-jonas.gorski@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Boris Brezillon <boris.brezillon@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

Add binding documentation for the standard CFE based BCM963XX flash
layout, found in most devices using a BCM63XX SoC with NOR flash.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 .../brcm,bcm963xx-cfe-nor-partitions.txt           | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/brcm,bcm963xx-cfe-nor-partitions.txt

diff --git a/Documentation/devicetree/bindings/mtd/partitions/brcm,bcm963xx-cfe-nor-partitions.txt b/Documentation/devicetree/bindings/mtd/partitions/brcm,bcm963xx-cfe-nor-partitions.txt
new file mode 100644
index 000000000000..9f630e95f180
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/brcm,bcm963xx-cfe-nor-partitions.txt
@@ -0,0 +1,24 @@
+Broadcom BCM963XX CFE Loader NOR Flash Partitions
+=================================================
+
+Most Broadcom BCM63XX SoC based devices follow the Broadcom reference layout for
+NOR. The first erase block used for the CFE bootloader, the last for an
+NVRAM partition, and the remainder in-between for one to two firmware partitions
+at fixed offsets. A valid firmware partition is identified by the ImageTag
+header found at beginning of the second erase block, containing the rootfs and
+kernel offsets and sizes within the firmware partition.
+
+Required properties:
+- compatible : must be "brcm,bcm963xx-cfe-nor-partitions"
+
+Example:
+
+flash@1fc00000 {
+	compatible = "cfi-flash";
+	reg = <0x1fc00000 0x400000>;
+	bank-width = <2>;
+
+	partitions {
+		compatible = "brcm,bcm963xx-cfe-nor-partitions";
+	};
+};
-- 
2.13.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
