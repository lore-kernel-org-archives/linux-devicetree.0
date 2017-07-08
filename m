From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH CFT 6/6] arm64: dts: marvell: mcbin: add support for PCIe
Date: Sat, 08 Jul 2017 20:16:55 +0100
Message-ID: <E1dTvDr-0007FB-7Z@rmk-PC.armlinux.org.uk>
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

Add support for PCIe with the the PCIe reset signal wired up to the
appropriate GPIO pin.

Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
---
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
index 1372558d037b..53346ccad6cf 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
@@ -161,6 +161,15 @@
 	};
 };
 
+&cpm_pcie0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&cpm_pcie_pins>;
+	num-lanes = <4>;
+	num-viewport = <8>;
+	reset-gpio = <&cpm_gpio1 20 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
 &cpm_pinctrl {
 	cpm_ge_mdio_pins: ge-mdio-pins {
 		marvell,pins = "mpp32", "mpp34";
@@ -178,6 +187,10 @@
 		marvell,pins = "mpp47";
 		marvell,function = "gpio";
 	};
+	cpm_pcie_pins: pcie-pins {
+		marvell,pins = "mpp52";
+		marvell,function = "gpio";
+	};
 	cpm_sdhci_pins: sdhci-pins {
 		marvell,pins = "mpp55", "mpp56", "mpp57", "mpp58", "mpp59",
 			       "mpp60", "mpp61";
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
