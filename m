From: Emmanuel Vadot <manu@freebsd.org>
Subject: [PATCH] ARM64: dts: sun50i: h5: Add spi flash node for OrangePi PC2
Date: Thu, 17 May 2018 12:34:35 +0200
Message-ID: <20180517103435.92874-1-manu@freebsd.org>
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
To: maxime.ripard@bootlin.com, wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Emmanuel Vadot <manu@freebsd.org>
List-Id: devicetree@vger.kernel.org

The OrangePi PC2 have an mx25l1606e spi flash.
Add a node for it.

Signed-off-by: Emmanuel Vadot <manu@freebsd.org>
---
 .../boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
index 98862c7c7258..0b870e4b4fad 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
@@ -207,6 +207,18 @@
 	status = "okay";
 };
 
+&spi0  {
+	status = "okay";
+
+	flash@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "mx25l1606e", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <40000000>;
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins_a>;
-- 
2.17.0
