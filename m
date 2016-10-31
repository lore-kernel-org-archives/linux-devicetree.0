From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 8/8] ARM64: dts: meson-gxl-p23x: Enable IR receiver
Date: Mon, 31 Oct 2016 17:44:46 +0100
Message-ID: <1477932286-27482-9-git-send-email-narmstrong@baylibre.com>
References: <1477932286-27482-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477932286-27482-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: khilman@baylibre.com, carlo@caione.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Enable the Infraread Receiver on the p23x board.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p23x.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p23x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p23x.dtsi
index 7830809..bbe46a2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p23x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p23x.dtsi
@@ -105,6 +105,12 @@
 	pinctrl-names = "default";
 };
 
+&ir {
+	status = "okay";
+	pinctrl-0 = <&remote_input_ao_pins>;
+	pinctrl-names = "default";
+};
+
 /* Wireless SDIO Module */
 &sd_emmc_a {
 	status = "okay";
-- 
1.9.1
