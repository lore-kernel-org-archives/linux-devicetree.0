From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH 3/6] arm64: dts: marvell: mcbin: add pinctrl nodes
Date: Sat, 08 Jul 2017 20:16:39 +0100
Message-ID: <E1dTvDb-0007Eo-PK@rmk-PC.armlinux.org.uk>
References: <20170708191317.GM4902@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170708191317.GM4902-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rabeeh Khoury <rabeeh-UBr1pzP51AyaMJb+Lgu22Q@public.gmane.org>, Jon Nettleton <jon-UBr1pzP51AyaMJb+Lgu22Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add pinctrl nodes to describe the CPM I2C0 and CPS SPI1 settings.

Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
---
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts | 31 +++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
index dfced8c8f9e9..773a157e4af5 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
@@ -115,10 +115,14 @@
 
 &cpm_i2c0 {
 	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&cpm_i2c0_pins>;
 	status = "okay";
 };
 
 &cpm_mdio {
+	pinctrl-names = "default";
+	pinctrl-0 = <&cpm_ge_mdio_pins>;
 	status = "okay";
 
 	ge_phy: ethernet-phy@0 {
@@ -126,6 +130,22 @@
 	};
 };
 
+&cpm_pinctrl {
+	cpm_ge_mdio_pins: ge-mdio-pins {
+		marvell,pins = "mpp32", "mpp34";
+		marvell,function = "ge";
+	};
+	cpm_i2c0_pins: i2c0-pins {
+		marvell,pins = "mpp37", "mpp38";
+		marvell,function = "i2c0";
+	};
+	cpm_sdhci_pins: sdhci-pins {
+		marvell,pins = "mpp55", "mpp56", "mpp57", "mpp58", "mpp59",
+			       "mpp60", "mpp61";
+		marvell,function = "sdio";
+	};
+};
+
 &cpm_sata0 {
 	/* CPM Lane 0 - U29 */
 	status = "okay";
@@ -135,6 +155,8 @@
 	/* U6 */
 	broken-cd;
 	bus-width = <4>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&cpm_sdhci_pins>;
 	status = "okay";
 	vqmmc-supply = <&v_3_3>;
 };
@@ -160,6 +182,13 @@
 	phy-mode = "sgmii";
 };
 
+&cps_pinctrl {
+	cps_spi1_pins: spi1-pins {
+		marvell,pins = "mpp12", "mpp13", "mpp14", "mpp15", "mpp16";
+		marvell,function = "spi1";
+	};
+};
+
 &cps_sata0 {
 	/* CPS Lane 1 - U32 */
 	/* CPS Lane 3 - U31 */
@@ -167,6 +196,8 @@
 };
 
 &cps_spi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&cps_spi1_pins>;
 	status = "okay";
 
 	spi-flash@0 {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
