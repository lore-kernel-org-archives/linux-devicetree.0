From: <sean.wang@mediatek.com>
Subject: [PATCH v3 7/9] arm: dts: mt7623: enable the usb device on the mt7623n
 rfb
Date: Fri, 12 May 2017 15:56:44 +0800
Message-ID: <98cb8c175852364c58425d7b59fe7b182e2b8d02.1494574682.git.sean.wang@mediatek.com>
References: <cover.1494574682.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1494574682.git.sean.wang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, john@phrozen.org, linux-mediatek@lists.infradead.org
Cc: Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: John Crispin <john@phrozen.org>

All versions of the mt7623n RFB have an USB port so enable the device.
There is a gpio that gets used to power up the port supply. Add support
for this gpio using the fixed-regulator driver.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 arch/arm/boot/dts/mt7623n-rfb.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623n-rfb.dtsi b/arch/arm/boot/dts/mt7623n-rfb.dtsi
index 4963e6a..2964b4c 100644
--- a/arch/arm/boot/dts/mt7623n-rfb.dtsi
+++ b/arch/arm/boot/dts/mt7623n-rfb.dtsi
@@ -28,6 +28,15 @@
 		serial1 = &uart1;
 		serial2 = &uart2;
 	};
+
+	usb_p1_vbus: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&pio 135 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &uart0 {
@@ -41,3 +50,12 @@
 &uart2 {
 	status = "okay";
 };
+
+&usb1 {
+	vbus-supply = <&usb_p1_vbus>;
+	status = "okay";
+};
+
+&u3phy1 {
+	status = "okay";
+};
-- 
2.7.4
