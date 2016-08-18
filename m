From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] ARM: dts: blanche: add SDHI0 support
Date: Thu, 18 Aug 2016 21:31:54 +0300
Message-ID: <3029697.f9plKzFKet@wasted.cogentembedded.com>
References: <5383928.8UnDsUpmkz@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5383928.8UnDsUpmkz@wasted.cogentembedded.com>
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

Define the Blanche board dependent part of the SDHI0 (connected to the
micro-SD slot) device node along with  the necessary voltage regulator.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'renesas-devel-20160817-v4.8-rc2' of Simon Horman's
'renesas.git' repo plus the general purpose switches patch  posted yesterday.

 arch/arm/boot/dts/r8a7792-blanche.dts |   25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7792-blanche.dts
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7792-blanche.dts
+++ renesas/arch/arm/boot/dts/r8a7792-blanche.dts
@@ -103,6 +103,17 @@
 			gpios = <&gpio11 2 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	vcc_sdhi0: regulator-vcc-sdhi0 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "SDHI0 Vcc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&gpio11 12 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &extal_clk {
@@ -139,6 +150,11 @@
 		groups = "can0_data", "can_clk";
 		function = "can0";
 	};
+
+	sdhi0_pins: sdhi0 {
+		groups = "sdhi0_data4", "sdhi0_ctrl";
+		function = "sdhi0";
+	};
 };
 
 &scif0 {
@@ -161,3 +177,12 @@
 
 	status = "okay";
 };
+
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_pins>;
+	pinctrl-names = "default";
+
+	vmmc-supply = <&vcc_sdhi0>;
+	cd-gpios = <&gpio11 11 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
