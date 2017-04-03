From: Alexander Syring <alex@asyring.de>
Subject: [PATCH] ARM: sun7i: Cubietruck: enable ACIN und USB power supply
 subnode
Date: Mon,  3 Apr 2017 11:12:45 +0200
Message-ID: <20170403091245.9766-1-alex@asyring.de>
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
To: alex@asyring.de
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-sunxi@googlegroups.com, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The Cubietruck has an AXP209 PMIC and can be power-supplied by ACIN via
 the CHG-IN pin or by USB.

This enables the ACIN and the USB power supply subnode in the DT.

Signed-off-by: Alexander Syring <alex@asyring.de>
---

Send again to all relevant people

---
 arch/arm/boot/dts/sun7i-a20-cubietruck.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
index feb995d29799..98431ef15bc9 100644
--- a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
+++ b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
@@ -267,6 +267,10 @@

 #include "axp209.dtsi"

+&ac_power_supply {
+	status = "okay";
+};
+
 &reg_dcdc2 {
 	regulator-always-on;
 	regulator-min-microvolt = <1000000>;
@@ -323,6 +327,10 @@
 	status = "okay";
 };

+&usb_power_supply {
+	status = "okay";
+};
+
 &usbphy {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usb0_id_detect_pin>, <&usb0_vbus_detect_pin>;
@@ -333,3 +341,4 @@
 	usb2_vbus-supply = <&reg_usb2_vbus>;
 	status = "okay";
 };
+
--
2.11.0
