From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH v3 1/2] ARM: Exynos5250: Enabling samsung-usb2phy driver
Date: Tue, 05 Feb 2013 18:33:53 +0530
Message-ID: <1360069434-20417-2-git-send-email-gautam.vivek@samsung.com>
References: <1360069434-20417-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1360069434-20417-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, balbi@ti.com, grant.likely@secretlab.ca, sylvester.nawrocki@gmail.com, tomasz.figa@gmail.com, dianders@chromium.org, p.paneri@samsung.com
List-Id: devicetree@vger.kernel.org

Adding device node for Samsung USB 2.0 PHY controller driver
on Exynos5250 along with the necessary device data to be parsed.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 30485de..d1865a8 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -99,6 +99,19 @@
 		interrupts = <0 65 0>;
 	};
 
+	usbphy@12130000 {
+		compatible = "samsung,exynos5250-usb2phy";
+		reg = <0x12130000 0x100>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		usbphy-sys {
+			reg = <0x10040704 0x8>,
+			      <0x10050230 0x4>;
+		};
+	};
+
 	serial@12C00000 {
 		compatible = "samsung,exynos4210-uart";
 		reg = <0x12C00000 0x100>;
-- 
1.7.6.5
