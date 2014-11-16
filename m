From: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Subject: [PATCHv2 6/8] arm: mvebu: add common ge0/1 and spi0 pintcrl entries
 for Armada XP MV78230
Date: Sun, 16 Nov 2014 18:37:44 +0100
Message-ID: <8c861a1fe1026289bf17f02dc8d69539019f28b7.1416158990.git.arno@natisbad.org>
References: <cover.1416158990.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1416158990.git.arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


pinctrl entries for the two GbE interfaces using RGMII signaling w/ the PHY
via MPP0-11/MPP12-23 and the spi0 interface using MPP36-39 are common
configurations. Instead of replicating them in each .dts file, put those in
armada-xp-mv78230.dtsi file so that they can be referenced.

Suggested-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
---
 arch/arm/boot/dts/armada-xp-mv78230.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/armada-xp-mv78230.dtsi b/arch/arm/boot/dts/armada-xp-mv78230.dtsi
index 2592e1c13560..85a39aed00dd 100644
--- a/arch/arm/boot/dts/armada-xp-mv78230.dtsi
+++ b/arch/arm/boot/dts/armada-xp-mv78230.dtsi
@@ -171,6 +171,26 @@
 				compatible = "marvell,mv78230-pinctrl";
 				reg = <0x18000 0x38>;
 
+				ge0_rgmii_pins: ge0-rgmii-pins {
+					marvell,pins = "mpp0", "mpp1", "mpp2", "mpp3",
+						       "mpp4", "mpp5", "mpp6", "mpp7",
+						       "mpp8", "mpp9", "mpp10", "mpp11";
+					marvell,function = "ge0";
+				};
+
+				ge1_rgmii_pins: ge1-rgmii-pins {
+					marvell,pins = "mpp12", "mpp13", "mpp14", "mpp15",
+						       "mpp16", "mpp17", "mpp18", "mpp19",
+						       "mpp20", "mpp21", "mpp22", "mpp23";
+					marvell,function = "ge1";
+				};
+
+				spi0_pins: spi0-pins {
+					marvell,pins = "mpp36", "mpp37",
+						       "mpp38", "mpp39";
+					marvell,function = "spi";
+				};
+
 				sdio_pins: sdio-pins {
 					marvell,pins = "mpp30", "mpp31", "mpp32",
 						       "mpp33", "mpp34", "mpp35";
-- 
2.1.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
