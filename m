From: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 4/6] arm64: dts: meson: libretech-ac: update model description
Date: Mon,  9 Sep 2019 19:01:25 +0400
Message-ID: <1568041287-7805-5-git-send-email-christianshewitt@gmail.com>
References: <1568041287-7805-1-git-send-email-christianshewitt@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568041287-7805-1-git-send-email-christianshewitt@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Chrisitian Hewitt <christianshewitt@gmail.com>
List-Id: devicetree@vger.kernel.org

Shorten the model description to improve readability in some app GUIs
that show the string.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
index 82b1c48..4d59494 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
@@ -14,7 +14,7 @@
 / {
 	compatible = "libretech,aml-s805x-ac", "amlogic,s805x",
 		     "amlogic,meson-gxl";
-	model = "Libre Computer Board AML-S805X-AC";
+	model = "Libre Computer AML-S805X-AC";
 
 	aliases {
 		serial0 = &uart_AO;
-- 
2.7.4
