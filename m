From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH v3 3/5] mtd: ofpart: update devicetree binding specification
Date: 18 Aug 2015 15:34:08 -0000
Message-ID: <e47db0c8eeaeb11353bcb2f4dcd138e813c3ecd7.1439911625.git.hramrach@gmail.com>
References: <cover.1439911625.git.hramrach@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <cover.1439911625.git.hramrach@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Michal Suchanek <hramrach@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

To avoid conflict with other drivers using subnodes of the mtd device
create only one ofpart-specific node rather than any number of
arbitrary partition subnodes.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
v3:

 - rename DT node ofpart -> partitions
---
 .../devicetree/bindings/mtd/partition.txt          | 68 +++++++++++++---------
 1 file changed, 40 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
index 8e5557d..8c2aff7 100644
--- a/Documentation/devicetree/bindings/mtd/partition.txt
+++ b/Documentation/devicetree/bindings/mtd/partition.txt
@@ -4,10 +4,16 @@ Partitions can be represented by sub-nodes of an mtd device. This can be used
 on platforms which have strong conventions about which portions of a flash are
 used for what purposes, but which don't use an on-flash partition table such
 as RedBoot.
+
+The partition table should be partitions subnode of the mtd node. Partitions are
+defined in subnodes of the partitions node.
+
+For backwards compatibility partitions as direct subnodes of the mtd device are
+supported. This use is discouraged.
 NOTE: if the sub-node has a compatible string, then it is not a partition.
 
-#address-cells & #size-cells must both be present in the mtd device. There are
-two valid values for both:
+#address-cells & #size-cells must both be present in the partitions subnode of the
+mtd device. There are two valid values for both:
 <1>: for partitions that require a single 32-bit cell to represent their
      size/address (aka the value is below 4 GiB)
 <2>: for partitions that require two 32-bit cells to represent their
@@ -28,44 +34,50 @@ Examples:
 
 
 flash@0 {
-	#address-cells = <1>;
-	#size-cells = <1>;
+	partitions {
+		#address-cells = <1>;
+		#size-cells = <1>;
 
-	partition@0 {
-		label = "u-boot";
-		reg = <0x0000000 0x100000>;
-		read-only;
-	};
+		partition@0 {
+			label = "u-boot";
+			reg = <0x0000000 0x100000>;
+			read-only;
+		};
 
-	uimage@100000 {
-		reg = <0x0100000 0x200000>;
+		uimage@100000 {
+			reg = <0x0100000 0x200000>;
+		};
 	};
 };
 
 flash@1 {
-	#address-cells = <1>;
-	#size-cells = <2>;
+	partitions {
+		#address-cells = <1>;
+		#size-cells = <2>;
 
-	/* a 4 GiB partition */
-	partition@0 {
-		label = "filesystem";
-		reg = <0x00000000 0x1 0x00000000>;
+		/* a 4 GiB partition */
+		partition@0 {
+			label = "filesystem";
+			reg = <0x00000000 0x1 0x00000000>;
+		};
 	};
 };
 
 flash@2 {
-	#address-cells = <2>;
-	#size-cells = <2>;
+	partitions {
+		#address-cells = <2>;
+		#size-cells = <2>;
 
-	/* an 8 GiB partition */
-	partition@0 {
-		label = "filesystem #1";
-		reg = <0x0 0x00000000 0x2 0x00000000>;
-	};
+		/* an 8 GiB partition */
+		partition@0 {
+			label = "filesystem #1";
+			reg = <0x0 0x00000000 0x2 0x00000000>;
+		};
 
-	/* a 4 GiB partition */
-	partition@200000000 {
-		label = "filesystem #2";
-		reg = <0x2 0x00000000 0x1 0x00000000>;
+		/* a 4 GiB partition */
+		partition@200000000 {
+			label = "filesystem #2";
+			reg = <0x2 0x00000000 0x1 0x00000000>;
+		};
 	};
 };
-- 
2.1.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
