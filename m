From: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
Subject: [PATCH V5 4/4] ARM: kirkwood: Define DNS-320/DNS-325 NAND in fdt
Date: Wed, 18 Apr 2012 11:06:43 +0100
Message-ID: <1334743603-8488-5-git-send-email-jm@lentin.co.uk>
References: <1334743603-8488-1-git-send-email-jm@lentin.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1334743603-8488-1-git-send-email-jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Use devicetree to define NAND partitions. Use D-link partition scheme by
default, to be vaguely compatible with their userland.

Changes since last submission (V4):-
* Don't add NAND support then throw it away immediately after [Grant Likely]

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Acked-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Signed-off-by: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
---
 arch/arm/boot/dts/kirkwood-dns320.dts |   35 +++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/kirkwood-dns325.dts |   35 +++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/kirkwood-dns320.dts b/arch/arm/boot/dts/kirkwood-dns320.dts
index 78c834f..dc09a73 100644
--- a/arch/arm/boot/dts/kirkwood-dns320.dts
+++ b/arch/arm/boot/dts/kirkwood-dns320.dts
@@ -25,5 +25,40 @@
 			clock-frequency = <166666667>;
 			status = "okay";
 		};
+
+		nand@3000000 {
+			status = "okay";
+
+			partition@0 {
+				label = "u-boot";
+				reg = <0x0000000 0x100000>;
+				read-only;
+			};
+
+			partition@100000 {
+				label = "uImage";
+				reg = <0x0100000 0x500000>;
+			};
+
+			partition@600000 {
+				label = "ramdisk";
+				reg = <0x0600000 0x500000>;
+			};
+
+			partition@b00000 {
+				label = "image";
+				reg = <0x0b00000 0x6600000>;
+			};
+
+			partition@7100000 {
+				label = "mini firmware";
+				reg = <0x7100000 0xa00000>;
+			};
+
+			partition@7b00000 {
+				label = "config";
+				reg = <0x7b00000 0x500000>;
+			};
+		};
 	};
 };
diff --git a/arch/arm/boot/dts/kirkwood-dns325.dts b/arch/arm/boot/dts/kirkwood-dns325.dts
index 23241ab..c2a5562 100644
--- a/arch/arm/boot/dts/kirkwood-dns325.dts
+++ b/arch/arm/boot/dts/kirkwood-dns325.dts
@@ -20,5 +20,40 @@
 			clock-frequency = <200000000>;
 			status = "okay";
 		};
+
+		nand@3000000 {
+			status = "okay";
+
+			partition@0 {
+				label = "u-boot";
+				reg = <0x0000000 0x100000>;
+				read-only;
+			};
+
+			partition@100000 {
+				label = "uImage";
+				reg = <0x0100000 0x500000>;
+			};
+
+			partition@600000 {
+				label = "ramdisk";
+				reg = <0x0600000 0x500000>;
+			};
+
+			partition@b00000 {
+				label = "image";
+				reg = <0x0b00000 0x6600000>;
+			};
+
+			partition@7100000 {
+				label = "mini firmware";
+				reg = <0x7100000 0xa00000>;
+			};
+
+			partition@7b00000 {
+				label = "config";
+				reg = <0x7b00000 0x500000>;
+			};
+		};
 	};
 };
-- 
1.7.9.1
