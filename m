From: Jamie Lentin <jm@lentin.co.uk>
Subject: [PATCH 3/4] ARM: Kirkwood: Move common portions into a
 kirkwood-dnskw.dtsi
Date: Thu, 19 Jul 2012 21:30:59 +0100
Message-ID: <1342729860-14647-4-git-send-email-jm@lentin.co.uk>
References: <y>
 <1342729860-14647-1-git-send-email-jm@lentin.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1342729860-14647-1-git-send-email-jm@lentin.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>, Jason <jason@lakedaemon.net>
Cc: devicetree-discuss@lists.ozlabs.org, Jamie Lentin <jm@lentin.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

A lot of device setup is shared between DNS-320 and DNS-325, move the
definitions into a common include.

Signed-off-by: Jamie Lentin <jm@lentin.co.uk>
---
 arch/arm/boot/dts/kirkwood-dns320.dts |   42 +----------------------------
 arch/arm/boot/dts/kirkwood-dns325.dts |   42 +----------------------------
 arch/arm/boot/dts/kirkwood-dnskw.dtsi |   48 +++++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+), 82 deletions(-)
 create mode 100644 arch/arm/boot/dts/kirkwood-dnskw.dtsi

diff --git a/arch/arm/boot/dts/kirkwood-dns320.dts b/arch/arm/boot/dts/kirkwood-dns320.dts
index a81c3a9..d41e204 100644
--- a/arch/arm/boot/dts/kirkwood-dns320.dts
+++ b/arch/arm/boot/dts/kirkwood-dns320.dts
@@ -1,6 +1,6 @@
 /dts-v1/;
 
-/include/ "kirkwood.dtsi"
+/include/ "kirkwood-dnskw.dtsi"
 
 / {
 	model = "D-Link DNS-320 NAS (Rev A1)";
@@ -50,45 +50,5 @@
 			clock-frequency = <166666667>;
 			status = "okay";
 		};
-
-		sata@80000 {
-			status = "okay";
-			nr-ports = <2>;
-		};
-
-		nand@3000000 {
-			status = "okay";
-
-			partition@0 {
-				label = "u-boot";
-				reg = <0x0000000 0x100000>;
-				read-only;
-			};
-
-			partition@100000 {
-				label = "uImage";
-				reg = <0x0100000 0x500000>;
-			};
-
-			partition@600000 {
-				label = "ramdisk";
-				reg = <0x0600000 0x500000>;
-			};
-
-			partition@b00000 {
-				label = "image";
-				reg = <0x0b00000 0x6600000>;
-			};
-
-			partition@7100000 {
-				label = "mini firmware";
-				reg = <0x7100000 0xa00000>;
-			};
-
-			partition@7b00000 {
-				label = "config";
-				reg = <0x7b00000 0x500000>;
-			};
-		};
 	};
 };
diff --git a/arch/arm/boot/dts/kirkwood-dns325.dts b/arch/arm/boot/dts/kirkwood-dns325.dts
index 421dcab..2662efc 100644
--- a/arch/arm/boot/dts/kirkwood-dns325.dts
+++ b/arch/arm/boot/dts/kirkwood-dns325.dts
@@ -1,6 +1,6 @@
 /dts-v1/;
 
-/include/ "kirkwood.dtsi"
+/include/ "kirkwood-dnskw.dtsi"
 
 / {
 	model = "D-Link DNS-325 NAS (Rev A1)";
@@ -53,45 +53,5 @@
 			clock-frequency = <200000000>;
 			status = "okay";
 		};
-
-		sata@80000 {
-			status = "okay";
-			nr-ports = <2>;
-		};
-
-		nand@3000000 {
-			status = "okay";
-
-			partition@0 {
-				label = "u-boot";
-				reg = <0x0000000 0x100000>;
-				read-only;
-			};
-
-			partition@100000 {
-				label = "uImage";
-				reg = <0x0100000 0x500000>;
-			};
-
-			partition@600000 {
-				label = "ramdisk";
-				reg = <0x0600000 0x500000>;
-			};
-
-			partition@b00000 {
-				label = "image";
-				reg = <0x0b00000 0x6600000>;
-			};
-
-			partition@7100000 {
-				label = "mini firmware";
-				reg = <0x7100000 0xa00000>;
-			};
-
-			partition@7b00000 {
-				label = "config";
-				reg = <0x7b00000 0x500000>;
-			};
-		};
 	};
 };
diff --git a/arch/arm/boot/dts/kirkwood-dnskw.dtsi b/arch/arm/boot/dts/kirkwood-dnskw.dtsi
new file mode 100644
index 0000000..067672c
--- /dev/null
+++ b/arch/arm/boot/dts/kirkwood-dnskw.dtsi
@@ -0,0 +1,48 @@
+/include/ "kirkwood.dtsi"
+
+/ {
+	model = "D-Link DNS NASes (kirkwood-based)";
+	compatible = "dlink,dns-kirkwood", "mrvl,kirkwood-88f6281", "mrvl,kirkwood";
+
+	ocp@f1000000 {
+		sata@80000 {
+			status = "okay";
+			nr-ports = <2>;
+		};
+
+		nand@3000000 {
+			status = "okay";
+
+			partition@0 {
+				label = "u-boot";
+				reg = <0x0000000 0x100000>;
+				read-only;
+			};
+
+			partition@100000 {
+				label = "uImage";
+				reg = <0x0100000 0x500000>;
+			};
+
+			partition@600000 {
+				label = "ramdisk";
+				reg = <0x0600000 0x500000>;
+			};
+
+			partition@b00000 {
+				label = "image";
+				reg = <0x0b00000 0x6600000>;
+			};
+
+			partition@7100000 {
+				label = "mini firmware";
+				reg = <0x7100000 0xa00000>;
+			};
+
+			partition@7b00000 {
+				label = "config";
+				reg = <0x7b00000 0x500000>;
+			};
+		};
+	};
+};
-- 
1.7.10.4
