From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] ARM: dts: r8a7792: add SMP support
Date: Tue, 21 Jun 2016 01:31:01 +0300
Message-ID: <1627631.X1bJtVQHBF@wasted.cogentembedded.com>
References: <14666252.G84Ipxe6EL@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <14666252.G84Ipxe6EL@wasted.cogentembedded.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: linux@arm.linux.org.uk, magnus.damm@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add the device tree nodes for the Advanced Power Management Unit (APMU)
and the second Cortex-A15 CPU core.
Use the "enable-method" prop  to point out that the APMU should be used
for the SMP support.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'renesas-devel-20160620-v4.7-rc4' tag of Simon
Horman's 'renesas.git' repo.  It depends on Magnus'/Geert's SMP patchset...

 arch/arm/boot/dts/r8a7792.dtsi |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7792.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7792.dtsi
+++ renesas/arch/arm/boot/dts/r8a7792.dtsi
@@ -21,6 +21,7 @@
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		enable-method = "renesas,apmu";
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
@@ -32,6 +33,15 @@
 			next-level-cache = <&L2_CA15>;
 		};
 
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a15";
+			reg = <1>;
+			clock-frequency = <1000000000>;
+			power-domains = <&sysc R8A7792_PD_CA15_CPU1>;
+			next-level-cache = <&L2_CA15>;
+		};
+
 		L2_CA15: cache-controller@0 {
 			compatible = "cache";
 			reg = <0>;
@@ -49,6 +59,12 @@
 		#size-cells = <2>;
 		ranges;
 
+		apmu@e6152000 {
+			compatible = "renesas,r8a7792-apmu", "renesas,apmu";
+			reg = <0 0xe6152000 0 0x188>;
+			cpus = <&cpu0 &cpu1>;
+		};
+
 		gic: interrupt-controller@f1001000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
