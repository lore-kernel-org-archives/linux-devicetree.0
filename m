From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 1/2] dt-bindings: nvmem: add binding for Rockchip OTP controller
Date: Wed, 25 Sep 2019 20:49:56 +0200
Message-ID: <20190925184957.14338-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, christoph.muellner@theobroma-systems.com, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

Newer Rockchip SoCs use a different IP for accessing special one-
time-programmable memory, so add a binding for these controllers.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../bindings/nvmem/rockchip-otp.txt           | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/rockchip-otp.txt

diff --git a/Documentation/devicetree/bindings/nvmem/rockchip-otp.txt b/Documentation/devicetree/bindings/nvmem/rockchip-otp.txt
new file mode 100644
index 000000000000..40f649f7c2e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/rockchip-otp.txt
@@ -0,0 +1,25 @@
+Rockchip internal OTP (One Time Programmable) memory device tree bindings
+
+Required properties:
+- compatible: Should be one of the following.
+  - "rockchip,px30-otp" - for PX30 SoCs.
+  - "rockchip,rk3308-otp" - for RK3308 SoCs.
+- reg: Should contain the registers location and size
+- clocks: Must contain an entry for each entry in clock-names.
+- clock-names: Should be "otp", "apb_pclk" and "phy".
+- resets: Must contain an entry for each entry in reset-names.
+  See ../../reset/reset.txt for details.
+- reset-names: Should be "phy".
+
+See nvmem.txt for more information.
+
+Example:
+	otp: otp@ff290000 {
+		compatible = "rockchip,px30-otp";
+		reg = <0x0 0xff290000 0x0 0x4000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		clocks = <&cru SCLK_OTP_USR>, <&cru PCLK_OTP_NS>,
+			 <&cru PCLK_OTP_PHY>;
+		clock-names = "otp", "apb_pclk", "phy";
+	};
-- 
2.23.0
