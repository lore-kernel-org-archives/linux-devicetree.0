From: Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 2/2] ARM: dts: ux500: Remove ab8500_ldo_usb regulator from device tree
Date: Thu, 22 Aug 2019 13:07:20 +0200
Message-ID: <20190822110720.118828-2-stephan@gerhold.net>
References: <20190822110720.118828-1-stephan@gerhold.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190822110720.118828-1-stephan@gerhold.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
List-Id: devicetree@vger.kernel.org

Support for the USB regulator of AB8500 was removed in
commit 41a06aa738ad ("regulator: ab8500: Remove USB regulator").
However, the configuration was never removed from the device tree.

It does no longer have any effect, remove it from the device tree.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm/boot/dts/ste-ab8500.dtsi  | 4 ----
 arch/arm/boot/dts/ste-href.dtsi    | 4 ----
 arch/arm/boot/dts/ste-snowball.dts | 4 ----
 3 files changed, 12 deletions(-)

diff --git a/arch/arm/boot/dts/ste-ab8500.dtsi b/arch/arm/boot/dts/ste-ab8500.dtsi
index 3ef1906e375c..55fff4d44277 100644
--- a/arch/arm/boot/dts/ste-ab8500.dtsi
+++ b/arch/arm/boot/dts/ste-ab8500.dtsi
@@ -182,10 +182,6 @@
 					ab8500_ldo_tvout_reg: ab8500_ldo_tvout {
 					};
 
-					// supply for ab8500-usb; USB LDO
-					ab8500_ldo_usb_reg: ab8500_ldo_usb {
-					};
-
 					// supply for ab8500-vaudio; VAUDIO LDO
 					ab8500_ldo_audio_reg: ab8500_ldo_audio {
 					};
diff --git a/arch/arm/boot/dts/ste-href.dtsi b/arch/arm/boot/dts/ste-href.dtsi
index 6422c53f2046..4f6acbd8c040 100644
--- a/arch/arm/boot/dts/ste-href.dtsi
+++ b/arch/arm/boot/dts/ste-href.dtsi
@@ -234,10 +234,6 @@
 						regulator-name = "V-TVOUT";
 					};
 
-					ab8500_ldo_usb_reg: ab8500_ldo_usb {
-						regulator-name = "dummy";
-					};
-
 					ab8500_ldo_audio_reg: ab8500_ldo_audio {
 						regulator-name = "V-AUD";
 					};
diff --git a/arch/arm/boot/dts/ste-snowball.dts b/arch/arm/boot/dts/ste-snowball.dts
index 3428290644ba..c6074912c368 100644
--- a/arch/arm/boot/dts/ste-snowball.dts
+++ b/arch/arm/boot/dts/ste-snowball.dts
@@ -474,10 +474,6 @@
 						regulator-name = "V-TVOUT";
 					};
 
-					ab8500_ldo_usb_reg: ab8500_ldo_usb {
-						regulator-name = "dummy";
-					};
-
 					ab8500_ldo_audio_reg: ab8500_ldo_audio {
 						regulator-name = "V-AUD";
 					};
-- 
2.22.1
