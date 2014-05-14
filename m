From: Anders Berg <anders.berg@avagotech.com>
Subject: [PATCH v3 6/6] ARM: dts: axxia: Add reset controller
Date: Wed, 14 May 2014 20:38:01 +0200
Message-ID: <b4860db76b5af89cef4246ce73a00293b7fe912b.1400072260.git.anders.berg@avagotech.com>
References: <cover.1400072260.git.anders.berg@avagotech.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1400072260.git.anders.berg@avagotech.com>
In-Reply-To: <cover.1400072260.git.anders.berg@avagotech.com>
References: <cover.1400072260.git.anders.berg@avagotech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Anders Berg <anders.berg@lsi.com>
List-Id: devicetree@vger.kernel.org

From: Anders Berg <anders.berg@lsi.com>

Add the reset controller to the AXM5xx device tree.

Signed-off-by: Anders Berg <anders.berg@lsi.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/axm55xx.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/axm55xx.dtsi b/arch/arm/boot/dts/axm55xx.dtsi
index 5d63887..bd1e07d 100644
--- a/arch/arm/boot/dts/axm55xx.dtsi
+++ b/arch/arm/boot/dts/axm55xx.dtsi
@@ -208,6 +208,11 @@
 			reg = <0x20 0x10030000 0 0x2000>;
 		};
 
+		reset: reset@2010031000 {
+			compatible = "lsi,axm55xx-reset";
+			syscon = <&syscon>;
+		};
+
 		amba {
 			compatible = "arm,amba-bus";
 			#address-cells = <2>;
-- 
1.8.3.2
