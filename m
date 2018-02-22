From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH 2/6] arm64: dts: renesas: r8a77965: Add #address-cells and
 #size-cells
Date: Thu, 22 Feb 2018 20:06:06 +0100
Message-ID: <1519326370-15805-3-git-send-email-jacopo+renesas@jmondi.org>
References: <1519326370-15805-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1519326370-15805-1-git-send-email-jacopo+renesas@jmondi.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arnd@arndb.de, geert@linux-m68k.org, horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add "#address-cells" and "#size-cells" properties to all place-holder nodes
that have children nodes defined by salvator-x[s].dtsi device tree.

This silences the following DTC compiler warnings:
Warning (reg_format): "reg" property in /soc/.. has invalid length (4 bytes)
(#address-cells == 2, #size-cells == 1)
Warning (avoid_default_addr_size): Relying on default #address-cells
value for /soc/...
Warning (avoid_default_addr_size): Relying on default #size-cells value
for /soc/...

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 4d9bba9..ab46cd2 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -521,6 +521,9 @@
 		};
 
 		avb: ethernet@e6800000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			reg = <0 0xe6800000 0 0x800>, <0 0xe6a00000 0 0x10000>;
 			/* placeholder */
 		};
@@ -528,11 +531,21 @@
 		csi20: csi2@fea80000 {
 			reg = <0 0xfea80000 0 0x10000>;
 			/* placeholder */
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		csi40: csi2@feaa0000 {
 			reg = <0 0xfeaa0000 0 0x10000>;
 			/* placeholder */
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		vin0: video@e6ef0000 {
@@ -611,6 +624,9 @@
 		};
 
 		i2c2: i2c@e6510000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			reg = <0 0xe6510000 0 0x40>;
 			/* placeholder */
 		};
@@ -621,6 +637,9 @@
 		};
 
 		i2c4: i2c@e66d8000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			reg = <0 0xe66d8000 0 0x40>;
 			/* placeholder */
 		};
@@ -636,6 +655,9 @@
 		};
 
 		i2c_dvfs: i2c@e60b0000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			reg = <0 0xe60b0000 0 0x425>;
 			/* placeholder */
 		};
@@ -681,6 +703,9 @@
 			/* placeholder */
 
 			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				port@0 {
 					reg = <0>;
 					du_out_rgb: endpoint {
-- 
2.7.4
