From: <dinguyen@opensource.altera.com>
Subject: [PATCH] ARM: dts: socfpga: use stdout-path for chosen node
Date: Wed, 15 Jul 2015 15:48:58 -0500
Message-ID: <1436993338-32172-1-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mark.rutland@arm.com, pawel.moll@arm.com
Cc: devicetree@vger.kernel.org, Dinh Nguyen <dinguyen@opensource.altera.com>, dinh.linux@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen@opensource.altera.com>

Use stdout-path dts property for kernel console.

Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
---
 arch/arm/boot/dts/socfpga_arria10.dtsi        | 5 +++++
 arch/arm/boot/dts/socfpga_arria10_socdk.dtsi  | 3 ++-
 arch/arm/boot/dts/socfpga_arria5_socdk.dts    | 3 ++-
 arch/arm/boot/dts/socfpga_cyclone5_socdk.dts  | 3 ++-
 arch/arm/boot/dts/socfpga_cyclone5_sockit.dts | 3 ++-
 5 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index 4779b07..a252905 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -21,6 +21,11 @@
 	#address-cells = <1>;
 	#size-cells = <1>;
 
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi b/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
index 94a0709..99aa9a1 100644
--- a/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
@@ -21,7 +21,8 @@
 	compatible = "altr,socfpga-arria10", "altr,socfpga";
 
 	chosen {
-		bootargs = "console=ttyS0,115200 rootwait";
+		bootargs = "earlyprintk";
+		stdout-path = "serial1:115200n8";
 	};
 
 	memory {
diff --git a/arch/arm/boot/dts/socfpga_arria5_socdk.dts b/arch/arm/boot/dts/socfpga_arria5_socdk.dts
index ccaf417..a75a666 100644
--- a/arch/arm/boot/dts/socfpga_arria5_socdk.dts
+++ b/arch/arm/boot/dts/socfpga_arria5_socdk.dts
@@ -22,7 +22,8 @@
 	compatible = "altr,socfpga-arria5", "altr,socfpga";
 
 	chosen {
-		bootargs = "console=ttyS0,115200";
+		bootargs = "earlyprintk";
+		stdout-path = "serial0:115200n8";
 	};
 
 	memory {
diff --git a/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts b/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
index 258865d..d4d0a28 100644
--- a/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
+++ b/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
@@ -22,7 +22,8 @@
 	compatible = "altr,socfpga-cyclone5", "altr,socfpga";
 
 	chosen {
-		bootargs = "console=ttyS0,115200";
+		bootargs = "earlyprintk";
+		stdout-path = "serial0:115200n8";
 	};
 
 	memory {
diff --git a/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts b/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
index 71468a7..42d6092 100644
--- a/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
+++ b/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
@@ -22,7 +22,8 @@
 	compatible = "altr,socfpga-cyclone5", "altr,socfpga";
 
 	chosen {
-		bootargs = "console=ttyS0,115200";
+		bootargs = "earlyprintk";
+		stdout-path = "serial0:115200n8";
 	};
 
 	memory {
-- 
2.4.5
