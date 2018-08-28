From: Jonas Gorski <jonas.gorski@gmail.com>
Subject: [PATCH 4/5] dt-bindings: mtd: describe BCM963XX ImageTag format and
 usage
Date: Tue, 28 Aug 2018 13:19:43 +0200
Message-ID: <20180828111944.5956-5-jonas.gorski@gmail.com>
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

Describe how to use the BCM963XX ImageTag format in a mixed flash layout
environment.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 .../mtd/partitions/brcm,bcm963xx-imagetag.txt      | 78 ++++++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/brcm,bcm963xx-imagetag.txt

diff --git a/Documentation/devicetree/bindings/mtd/partitions/brcm,bcm963xx-imagetag.txt b/Documentation/devicetree/bindings/mtd/partitions/brcm,bcm963xx-imagetag.txt
new file mode 100644
index 000000000000..f4a444d69d9a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/brcm,bcm963xx-imagetag.txt
@@ -0,0 +1,78 @@
+Broadcom BCM963XX ImageTag Partition Container
+==============================================
+
+Some Broadcom BCM63XX SoC based devices contain additional, non discoverable
+partitions or non standard bootloader partition sizes. For these a mixed layout
+needs to be used with an explicit firmware partition.
+
+The BCM963XX ImageTag is a simple firmware header describing the offsets and
+sizes of the rootfs and kernel parts contained in the firmware.
+
+Required properties:
+- compatible : must be "brcm,bcm963xx-imagetag"
+
+Examples:
+
+flash@1e000000 {
+	compatible = "cfi-flash";
+	reg = <0x1e000000 0x2000000>;
+	bank-width = <2>;
+
+	partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		cfe@0 {
+			reg = <0x0 0x10000>;
+			read-only;
+		};
+
+		firmware@10000 {
+			reg = <0x10000 0x7d0000>;
+			compatible = "brcm,bcm963xx-imagetag";
+		};
+
+		caldata@7e0000 {
+			reg = <0x7e0000 0x10000>;
+			read-only;
+		};
+
+		nvram@7f0000 {
+			reg = <0x7f0000 0x10000>;
+		};
+	};
+};
+
+
+flash@1e000000 {
+	compatible = "cfi-flash";
+	reg = <0x1e000000 0x2000000>;
+	bank-width = <2>;
+
+	partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		/*
+		 * Some devices use a flash chip with 64k erase blocks, some
+		 * use one with 128k erase blocks, so the vendor decided to
+		 * always use 128k as the firmware offset.
+		 */
+
+		cfe@0 {
+			reg = <0x0 0x20000>;
+			read-only;
+		};
+
+		firmware@20000 {
+			reg = <0x20000 0x7c0000>;
+			compatible = "brcm,bcm963xx-imagetag";
+		};
+
+		nvram@7e0000 {
+			reg = <0x7e0000 0x20000>;
+		};
+	};
+};
-- 
2.13.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
