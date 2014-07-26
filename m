From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2 05/15] ARM: dts: rockchip: add handles for shared nodes
 that don't have one yet
Date: Sun, 27 Jul 2014 01:18:21 +0200
Message-ID: <1406416711-28006-6-git-send-email-heiko@sntech.de>
References: <1406416711-28006-1-git-send-email-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1406416711-28006-1-git-send-email-heiko@sntech.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arnd@arndb.de, linux-arm-kernel@lists.infradead.org, olof@lixom.net, devicetree@vger.kernel.org, b.galvani@gmail.com, max.schwarz@online.de
Cc: Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

Some nodes that are changed in the dtsi hierarchy do not have handles yet.
As it was suggested in the rk3288 submission to do subsequent nodes changes
through such handle-references, add the missing ones.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/boot/dts/rk3066a.dtsi | 2 +-
 arch/arm/boot/dts/rk3188.dtsi  | 2 +-
 arch/arm/boot/dts/rk3xxx.dtsi  | 8 ++++----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/rk3066a.dtsi b/arch/arm/boot/dts/rk3066a.dtsi
index 4ad8f59..ecf722e 100644
--- a/arch/arm/boot/dts/rk3066a.dtsi
+++ b/arch/arm/boot/dts/rk3066a.dtsi
@@ -86,7 +86,7 @@
 		#reset-cells = <1>;
 	};
 
-	pinctrl@20008000 {
+	pinctrl: pinctrl@20008000 {
 		compatible = "rockchip,rk3066a-pinctrl";
 		rockchip,grf = <&grf>;
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/rk3188.dtsi b/arch/arm/boot/dts/rk3188.dtsi
index 038d9d4..7b631ec 100644
--- a/arch/arm/boot/dts/rk3188.dtsi
+++ b/arch/arm/boot/dts/rk3188.dtsi
@@ -82,7 +82,7 @@
 		#reset-cells = <1>;
 	};
 
-	pinctrl@20008000 {
+	pinctrl: pinctrl@20008000 {
 		compatible = "rockchip,rk3188-pinctrl";
 		rockchip,grf = <&grf>;
 		rockchip,pmu = <&pmu>;
diff --git a/arch/arm/boot/dts/rk3xxx.dtsi b/arch/arm/boot/dts/rk3xxx.dtsi
index f70addd..10e7586 100644
--- a/arch/arm/boot/dts/rk3xxx.dtsi
+++ b/arch/arm/boot/dts/rk3xxx.dtsi
@@ -57,14 +57,14 @@
 		cache-level = <2>;
 	};
 
-	global-timer@1013c200 {
+	global_timer: global-timer@1013c200 {
 		compatible = "arm,cortex-a9-global-timer";
 		reg = <0x1013c200 0x20>;
 		interrupts = <GIC_PPI 11 0x304>;
 		clocks = <&cru CORE_PERI>;
 	};
 
-	local-timer@1013c600 {
+	local_timer: local-timer@1013c600 {
 		compatible = "arm,cortex-a9-twd-timer";
 		reg = <0x1013c600 0x20>;
 		interrupts = <GIC_PPI 13 0x304>;
@@ -111,7 +111,7 @@
 		status = "disabled";
 	};
 
-	dwmmc@10214000 {
+	mmc0: dwmmc@10214000 {
 		compatible = "rockchip,rk2928-dw-mshc";
 		reg = <0x10214000 0x1000>;
 		interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
@@ -124,7 +124,7 @@
 		status = "disabled";
 	};
 
-	dwmmc@10218000 {
+	mmc1: dwmmc@10218000 {
 		compatible = "rockchip,rk2928-dw-mshc";
 		reg = <0x10218000 0x1000>;
 		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.0.1
