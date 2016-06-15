From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [RESEND PATCH 2/2] ARM64: dts: meson-gxbb: Add Hardware Random Generator node
Date: Wed, 15 Jun 2016 12:01:46 +0200
Message-ID: <1465984906-17840-3-git-send-email-narmstrong@baylibre.com>
References: <1465984906-17840-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <1465984906-17840-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-crypto-owner@vger.kernel.org
To: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 063e3b6..806b903 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -221,6 +221,11 @@
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xc8834000 0x0 0x2000>;
 
+			rng {
+				compatible = "amlogic,meson-rng";
+				reg = <0x0 0x0 0x0 0x4>;
+			};
+
 			pinctrl_periphs: pinctrl@4b0 {
 				compatible = "amlogic,meson-gxbb-periphs-pinctrl";
 				#address-cells = <2>;
-- 
2.7.0
