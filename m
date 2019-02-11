From: Alexander Syring <alex@asyring.de>
Subject: [PATCH 1/2] arm64: dts: marvell: mcbin: Adding SPI-NOR Flash Config
Date: Mon, 11 Feb 2019 18:14:01 +0100
Message-ID: <20190211171401.434-1-alex@asyring.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King <linux@armlinux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>, linux-kernel@vger.kernel.org, Alexander Syring <alex@asyring.de>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

According to U-Boot dts file enabling the SPI-NOR flash for use in
Linux

Signed-off-by: Alexander Syring <alex@asyring.de>
---
 .../boot/dts/marvell/armada-8040-mcbin.dtsi   | 23 +++++++++++++++----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
index 329f8ceeebea..83994ff46e2d 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
@@ -333,11 +333,24 @@
 	status = "okay";
 
 	spi-flash@0 {
-		compatible = "st,w25q32";
-		spi-max-frequency = <50000000>;
-		reg = <0>;
-	};
-};
+		compatible = "st,w25q32", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+
+		partitions {
+			compatible = "fixed-partitions";
+
+			partition@0 {
+				label = "U-Boot";
+				reg = <0 0x200000>;
+			};
+			partition@400000 {
+				label = "U-Boot Env";
+				reg = <0x200000 0xce0000>;
+			};
+		};
+	};
+};
 
 &cp1_usb3_0 {
 	/* CPS Lane 2 - CON7 */
-- 
2.20.1
