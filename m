From: Jia Hongtao <hongtao.jia-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 1/2] powerpc: Add ADT7461 to device tree for supported boards
Date: Wed, 5 Nov 2014 14:59:52 +0800
Message-ID: <1415170793-13196-1-git-send-email-hongtao.jia@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org, hongtao.jia-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Including: T104xRDB T208xQDS B4QDS

Signed-off-by: Jia Hongtao <hongtao.jia-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/powerpc/boot/dts/b4qds.dtsi    | 11 +++++++++++
 arch/powerpc/boot/dts/t104xrdb.dtsi |  7 +++++++
 arch/powerpc/boot/dts/t208xqds.dtsi | 11 +++++++++++
 3 files changed, 29 insertions(+)

diff --git a/arch/powerpc/boot/dts/b4qds.dtsi b/arch/powerpc/boot/dts/b4qds.dtsi
index 8b47edc..bccc986 100644
--- a/arch/powerpc/boot/dts/b4qds.dtsi
+++ b/arch/powerpc/boot/dts/b4qds.dtsi
@@ -152,6 +152,17 @@
 						reg = <0x68>;
 					};
 				};
+
+				i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x3>;
+
+					adt7461@4c {
+						compatible = "adi,adt7461";
+						reg = <0x4c>;
+					};
+				};
 			};
 		};
 
diff --git a/arch/powerpc/boot/dts/t104xrdb.dtsi b/arch/powerpc/boot/dts/t104xrdb.dtsi
index 1cf0f3c..187add8 100644
--- a/arch/powerpc/boot/dts/t104xrdb.dtsi
+++ b/arch/powerpc/boot/dts/t104xrdb.dtsi
@@ -83,6 +83,13 @@
 			};
 		};
 
+		i2c@118000 {
+			adt7461@4c {
+				compatible = "adi,adt7461";
+				reg = <0x4c>;
+			};
+		};
+
 		i2c@118100 {
 			pca9546@77 {
 				compatible = "nxp,pca9546";
diff --git a/arch/powerpc/boot/dts/t208xqds.dtsi b/arch/powerpc/boot/dts/t208xqds.dtsi
index 555dc6e..5906183 100644
--- a/arch/powerpc/boot/dts/t208xqds.dtsi
+++ b/arch/powerpc/boot/dts/t208xqds.dtsi
@@ -169,6 +169,17 @@
 						shunt-resistor = <1000>;
 					};
 				};
+
+				i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x3>;
+
+					adt7461@4c {
+						compatible = "adi,adt7461";
+						reg = <0x4c>;
+					};
+				};
 			};
 		};
 
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
