From: Zhiqiang Hou <Zhiqiang.Hou-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] dts/spi: Change compatible to use right device name
Date: Wed, 13 Jan 2016 15:54:46 +0800
Message-ID: <1452671686-2693-1-git-send-email-Zhiqiang.Hou@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Mingkai.Hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Hou Zhiqiang <Zhiqiang.Hou-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Hou Zhiqiang <Zhiqiang.Hou-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

On the t208xrdb and t1040rdb, the SPI devices is n25q512ax3
instead of n25q512a.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/powerpc/boot/dts/fsl/t104xrdb.dtsi | 2 +-
 arch/powerpc/boot/dts/fsl/t208xrdb.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi b/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi
index 830ea48..27758ff 100644
--- a/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi
@@ -103,7 +103,7 @@
 			flash@0 {
 				#address-cells = <1>;
 				#size-cells = <1>;
-				compatible = "micron,n25q512a";
+				compatible = "micron,n25q512ax3";
 				reg = <0>;
 				spi-max-frequency = <10000000>; /* input clock */
 			};
diff --git a/arch/powerpc/boot/dts/fsl/t208xrdb.dtsi b/arch/powerpc/boot/dts/fsl/t208xrdb.dtsi
index 693d2a8..4a17150 100644
--- a/arch/powerpc/boot/dts/fsl/t208xrdb.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t208xrdb.dtsi
@@ -113,7 +113,7 @@
 			flash@0 {
 				#address-cells = <1>;
 				#size-cells = <1>;
-				compatible = "micron,n25q512a";
+				compatible = "micron,n25q512ax3";
 				reg = <0>;
 				spi-max-frequency = <10000000>; /* input clock */
 			};
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
