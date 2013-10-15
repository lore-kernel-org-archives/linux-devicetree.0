From: Nishanth Menon <nm@ti.com>
Subject: [PATCH] ARM: dts: OMAP5: Add i2c aliases
Date: Tue, 15 Oct 2013 12:00:04 -0500
Message-ID: <1381856405-30970-1-git-send-email-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
To: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Nishanth Menon <nm@ti.com>
List-Id: devicetree@vger.kernel.org

Currently, i2c1 and i2c5 defer probe due to pinctrl dependencies.
This changes the i2c ID each bus is registered with in i2c-dev
interface.

As a result of this, many userspace tools break and there is no
consistent manner to fix the same if the i2c dev interface have no
consistent numbering. Provide alias to allow ordering the i2c devices
correctly.

Signed-off-by: Nishanth Menon <nm@ti.com>
---

 arch/arm/boot/dts/omap5.dtsi |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
index e18ee7e..8970deb 100644
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -21,6 +21,11 @@
 	interrupt-parent = <&gic>;
 
 	aliases {
+		i2c0 = &i2c1;
+		i2c1 = &i2c2;
+		i2c2 = &i2c3;
+		i2c3 = &i2c4;
+		i2c4 = &i2c5;
 		serial0 = &uart1;
 		serial1 = &uart2;
 		serial2 = &uart3;
-- 
1.7.9.5

