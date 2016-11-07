From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/3] ARM64: dts: meson-gxl-p23x: Enable ethernet
Date: Mon,  7 Nov 2016 11:43:56 +0100
Message-ID: <20161107104357.24428-3-narmstrong@baylibre.com>
References: <20161107104357.24428-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161107104357.24428-1-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: khilman@baylibre.com, carlo@caione.org
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Enable Ethernet on the p23x board, pinctrl attribute is only added for
the p230 board since the p231 only uses the Internal PHY.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-gxl-s905d-p230.dts      | 25 ++++++++++++++++++++++
 .../boot/dts/amlogic/meson-gxl-s905d-p231.dts      |  6 ++++++
 .../boot/dts/amlogic/meson-gxl-s905d-p23x.dtsi     |  4 ++++
 3 files changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
index 3dfaa37..4d082a7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
@@ -49,3 +49,28 @@
 	compatible = "amlogic,p230", "amlogic,s905d", "amlogic,meson-gxl";
 	model = "Amlogic Meson GXL (S905D) P230 Development Board";
 };
+
+/* P230 has exclusive choice between internal or external PHY */
+&ethmac {
+	pinctrl-0 = <&eth_pins>;
+	pinctrl-names = "default";
+
+	/* Select external PHY by default */
+	phy-handle = <&external_phy>;
+
+	/* External PHY reset is shared with internal PHY Led signals */
+	snps,reset-gpio = <&gpio GPIOZ_14 0>;
+	snps,reset-delays-us = <0 10000 1000000>;
+	snps,reset-active-low;
+
+	/* External PHY is in RGMII */
+	phy-mode = "rgmii";
+};
+
+&external_mdio {
+	external_phy: ethernet-phy@0 {
+		compatible = "ethernet-phy-id001c.c916", "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+		max-speed = <1000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dts
index ade8d29..1cc8d49 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dts
@@ -49,3 +49,9 @@
 	compatible = "amlogic,p231", "amlogic,s905d", "amlogic,meson-gxl";
 	model = "Amlogic Meson GXL (S905D) P231 Development Board";
 };
+
+/* P231 has only internal PHY port */
+&ethmac {
+	phy-mode = "rmii";
+	phy-handle = <&internal_phy>;
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p23x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p23x.dtsi
index bbe46a2..622ffbe 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p23x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p23x.dtsi
@@ -182,3 +182,7 @@
 	clocks = <&clkc CLKID_FCLK_DIV4>;
 	clock-names = "clkin0";
 };
+
+&ethmac {
+	status = "okay";
+};
-- 
2.7.0
