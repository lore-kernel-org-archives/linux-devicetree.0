From: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 6/6] arm64: dts: meson: libretech-cc: update model and compatible
Date: Mon,  9 Sep 2019 19:01:27 +0400
Message-ID: <1568041287-7805-7-git-send-email-christianshewitt@gmail.com>
References: <1568041287-7805-1-git-send-email-christianshewitt@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568041287-7805-1-git-send-email-christianshewitt@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Chrisitian Hewitt <christianshewitt@gmail.com>
List-Id: devicetree@vger.kernel.org

Shorten the model description to improve readability in some app GUIs
that show the string. Update compatible to be more descriptive, using
the format of the LaFrite board in meson-gxl-s805x-libretech-ac.dts.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
index 4b8ce73..e8348b2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
@@ -12,8 +12,9 @@
 #include "meson-gxl-s905x.dtsi"
 
 / {
-	compatible = "libretech,cc", "amlogic,s905x", "amlogic,meson-gxl";
-	model = "Libre Computer Board AML-S905X-CC";
+	compatible = "libretech,aml-s905x-cc", "amlogic,s905x",
+		     "amlogic,meson-gxl";
+	model = "Libre Computer AML-S905X-CC";
 
 	aliases {
 		serial0 = &uart_AO;
-- 
2.7.4
