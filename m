From: Krzysztof Adamski <k@japko.eu>
Subject: [PATCH] ARM: dts: sun8i: h3: enable USB OTG for NanoPi Neo board
Date: Fri, 1 Dec 2017 23:49:42 +0100
Message-ID: <20171201224942.GA12473@t440.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Similarly to Orange Pi Zero, NanoPi Neo board has an USB OTG port with
an ID pin but with unpowered VBUS. This patch enables this port in
forced peripheral mode.

Signed-off-by: Krzysztof Adamski <k@japko.eu>
---
 arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts b/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
index 78f6c24952dd..14c3f137dbd3 100644
--- a/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
+++ b/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
@@ -53,3 +53,20 @@
 	allwinner,leds-active-low;
 	status = "okay";
 };
+
+&usb_otg {
+	status = "okay";
+	dr_mode = "peripheral";
+};
+
+&usbphy {
+	usb0_id_det-gpios = <&pio 6 12 GPIO_ACTIVE_HIGH>; /* PG12 */
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
-- 
2.13.6
