From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 3/3] ARM64: dts: meson-gxl-s905x: Enable internal ethernet PHY
Date: Mon,  7 Nov 2016 11:43:57 +0100
Message-ID: <20161107104357.24428-4-narmstrong@baylibre.com>
References: <20161107104357.24428-1-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161107104357.24428-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: khilman@baylibre.com, carlo@caione.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x.dtsi
index 07f0e0b..08237ee 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x.dtsi
@@ -46,3 +46,9 @@
 / {
 	compatible = "amlogic,s905x", "amlogic,meson-gxl";
 };
+
+/* S905X Only has access to its internal PHY */
+&ethmac {
+	phy-mode = "rmii";
+	phy-handle = <&internal_phy>;
+};
-- 
2.7.0
