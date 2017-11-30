From: Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] powerpc/kmcent2: update the ethernet nodes to the internal switch
Date: Thu, 30 Nov 2017 10:16:21 +0100
Message-ID: <20171130091621.6997-1-valentin.longchamp@keymile.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The fman driver only calls of_get_phy_node, ignoring the
phy-connection-type field. While we're at it, update the fixed link to
the new more readable way to specify it.

Signed-off-by: Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
---
 arch/powerpc/boot/dts/fsl/kmcent2.dts | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/kmcent2.dts b/arch/powerpc/boot/dts/fsl/kmcent2.dts
index 5922c1ea0e96..b53ff8f71474 100644
--- a/arch/powerpc/boot/dts/fsl/kmcent2.dts
+++ b/arch/powerpc/boot/dts/fsl/kmcent2.dts
@@ -214,13 +214,19 @@
 
 		fman@400000 {
 			ethernet@e0000 {
-				fixed-link = <0 1 1000 0 0>;
-				phy-connection-type = "sgmii";
+				phy-mode = "sgmii";
+				fixed-link {
+					speed = <1000>;
+					full-duplex;
+				};
 			};
 
 			ethernet@e2000 {
-				fixed-link = <1 1 1000 0 0>;
-				phy-connection-type = "sgmii";
+				phy-mode = "sgmii";
+				fixed-link {
+					speed = <1000>;
+					full-duplex;
+				};
 			};
 
 			ethernet@e4000 {
-- 
2.14.3
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
