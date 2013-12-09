From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v5 05/15] ARM: dts: imx6: add anatop phandle for usbphy
Date: Mon, 9 Dec 2013 14:30:54 +0800
Message-ID: <1386570664-6713-6-git-send-email-peter.chen@freescale.com>
References: <1386570664-6713-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386570664-6713-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, frank.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add anatop phandle for usbphy

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl.dtsi |    2 ++
 arch/arm/boot/dts/imx6sl.dtsi  |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index 59154dc..4e74962 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -557,6 +557,7 @@
 				reg = <0x020c9000 0x1000>;
 				interrupts = <0 44 0x04>;
 				clocks = <&clks 182>;
+				fsl,anatop = <&anatop>;
 			};
 
 			usbphy2: usbphy@020ca000 {
@@ -564,6 +565,7 @@
 				reg = <0x020ca000 0x1000>;
 				interrupts = <0 45 0x04>;
 				clocks = <&clks 183>;
+				fsl,anatop = <&anatop>;
 			};
 
 			snvs@020cc000 {
diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
index 28558f1..30322b5 100644
--- a/arch/arm/boot/dts/imx6sl.dtsi
+++ b/arch/arm/boot/dts/imx6sl.dtsi
@@ -489,6 +489,7 @@
 				reg = <0x020c9000 0x1000>;
 				interrupts = <0 44 0x04>;
 				clocks = <&clks IMX6SL_CLK_USBPHY1>;
+				fsl,anatop = <&anatop>;
 			};
 
 			usbphy2: usbphy@020ca000 {
@@ -496,6 +497,7 @@
 				reg = <0x020ca000 0x1000>;
 				interrupts = <0 45 0x04>;
 				clocks = <&clks IMX6SL_CLK_USBPHY2>;
+				fsl,anatop = <&anatop>;
 			};
 
 			snvs@020cc000 {
-- 
1.7.8


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
