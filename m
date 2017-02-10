From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 6/6] arm64: dts: rockchip: sort rk3399 by unit address
Date: Thu,  9 Feb 2017 17:05:21 -0800
Message-ID: <20170210010521.78872-7-briannorris@chromium.org>
References: <20170210010521.78872-1-briannorris@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20170210010521.78872-1-briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Stephen Barber <smbarber-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

f8000000 is less than all the other (top-level) unit addresses.

Signed-off-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
v2: new
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 88 ++++++++++++++++----------------
 1 file changed, 44 insertions(+), 44 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index a9702c29d71a..f5681bea1271 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -211,6 +211,50 @@
 		};
 	};
 
+	pcie0: pcie@f8000000 {
+		compatible = "rockchip,rk3399-pcie";
+		reg = <0x0 0xf8000000 0x0 0x2000000>,
+		      <0x0 0xfd000000 0x0 0x1000000>;
+		reg-names = "axi-base", "apb-base";
+		#address-cells = <3>;
+		#size-cells = <2>;
+		#interrupt-cells = <1>;
+		aspm-no-l0s;
+		bus-range = <0x0 0x1>;
+		clocks = <&cru ACLK_PCIE>, <&cru ACLK_PERF_PCIE>,
+			 <&cru PCLK_PCIE>, <&cru SCLK_PCIE_PM>;
+		clock-names = "aclk", "aclk-perf",
+			      "hclk", "pm";
+		interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "sys", "legacy", "client";
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &pcie0_intc 0>,
+				<0 0 0 2 &pcie0_intc 1>,
+				<0 0 0 3 &pcie0_intc 2>,
+				<0 0 0 4 &pcie0_intc 3>;
+		max-link-speed = <1>;
+		msi-map = <0x0 &its 0x0 0x1000>;
+		phys = <&pcie_phy>;
+		phy-names = "pcie-phy";
+		ranges = <0x83000000 0x0 0xfa000000 0x0 0xfa000000 0x0 0x600000
+			  0x81000000 0x0 0xfa600000 0x0 0xfa600000 0x0 0x100000>;
+		resets = <&cru SRST_PCIE_CORE>, <&cru SRST_PCIE_MGMT>,
+			 <&cru SRST_PCIE_MGMT_STICKY>, <&cru SRST_PCIE_PIPE>,
+			 <&cru SRST_PCIE_PM>, <&cru SRST_P_PCIE>,
+			 <&cru SRST_A_PCIE>;
+		reset-names = "core", "mgmt", "mgmt-sticky", "pipe",
+			      "pm", "pclk", "aclk";
+		status = "disabled";
+
+		pcie0_intc: interrupt-controller {
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
+		};
+	};
+
 	gmac: ethernet@fe300000 {
 		compatible = "rockchip,rk3399-gmac";
 		reg = <0x0 0xfe300000 0x0 0x10000>;
@@ -275,50 +319,6 @@
 		status = "disabled";
 	};
 
-	pcie0: pcie@f8000000 {
-		compatible = "rockchip,rk3399-pcie";
-		reg = <0x0 0xf8000000 0x0 0x2000000>,
-		      <0x0 0xfd000000 0x0 0x1000000>;
-		reg-names = "axi-base", "apb-base";
-		#address-cells = <3>;
-		#size-cells = <2>;
-		#interrupt-cells = <1>;
-		aspm-no-l0s;
-		bus-range = <0x0 0x1>;
-		clocks = <&cru ACLK_PCIE>, <&cru ACLK_PERF_PCIE>,
-			 <&cru PCLK_PCIE>, <&cru SCLK_PCIE_PM>;
-		clock-names = "aclk", "aclk-perf",
-			      "hclk", "pm";
-		interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH 0>,
-			     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH 0>,
-			     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH 0>;
-		interrupt-names = "sys", "legacy", "client";
-		interrupt-map-mask = <0 0 0 7>;
-		interrupt-map = <0 0 0 1 &pcie0_intc 0>,
-				<0 0 0 2 &pcie0_intc 1>,
-				<0 0 0 3 &pcie0_intc 2>,
-				<0 0 0 4 &pcie0_intc 3>;
-		max-link-speed = <1>;
-		msi-map = <0x0 &its 0x0 0x1000>;
-		phys = <&pcie_phy>;
-		phy-names = "pcie-phy";
-		ranges = <0x83000000 0x0 0xfa000000 0x0 0xfa000000 0x0 0x600000
-			  0x81000000 0x0 0xfa600000 0x0 0xfa600000 0x0 0x100000>;
-		resets = <&cru SRST_PCIE_CORE>, <&cru SRST_PCIE_MGMT>,
-			 <&cru SRST_PCIE_MGMT_STICKY>, <&cru SRST_PCIE_PIPE>,
-			 <&cru SRST_PCIE_PM>, <&cru SRST_P_PCIE>,
-			 <&cru SRST_A_PCIE>;
-		reset-names = "core", "mgmt", "mgmt-sticky", "pipe",
-			      "pm", "pclk", "aclk";
-		status = "disabled";
-
-		pcie0_intc: interrupt-controller {
-			interrupt-controller;
-			#address-cells = <0>;
-			#interrupt-cells = <1>;
-		};
-	};
-
 	usb_host0_ehci: usb@fe380000 {
 		compatible = "generic-ehci";
 		reg = <0x0 0xfe380000 0x0 0x20000>;
-- 
2.11.0.483.g087da7b7c-goog
