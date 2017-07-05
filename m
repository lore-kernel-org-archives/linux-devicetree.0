From: Zhiqiang Hou <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCHv4 5/9] arm64: dts: ls1043a: share all MSIs
Date: Wed, 5 Jul 2017 14:58:59 +0800
Message-ID: <1499237943-24203-5-git-send-email-Zhiqiang.Hou@nxp.com>
References: <1499237943-24203-1-git-send-email-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1499237943-24203-1-git-send-email-Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Minghuan.Lian-3arQi8VN3Tc@public.gmane.org
Cc: Hou Zhiqiang <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Minghuan Lian <Minghuan.Lian-3arQi8VN3Tc@public.gmane.org>

In order to maximize the use of MSI, a PCIe controller will share
all MSI controllers. The patch changes "msi-parent" to refer to all
MSI controller dts nodes.

Signed-off-by: Minghuan Lian <Minghuan.Lian-3arQi8VN3Tc@public.gmane.org>
Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>
---
v4-v1:
 - None

 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index 7ff98f4..d16b9cc 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -689,7 +689,7 @@
 			bus-range = <0x0 0xff>;
 			ranges = <0x81000000 0x0 0x00000000 0x40 0x00010000 0x0 0x00010000   /* downstream I/O */
 				  0x82000000 0x0 0x40000000 0x40 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
-			msi-parent = <&msi1>;
+			msi-parent = <&msi1>, <&msi2>, <&msi3>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
 			interrupt-map = <0000 0 0 1 &gic 0 110 0x4>,
@@ -714,7 +714,7 @@
 			bus-range = <0x0 0xff>;
 			ranges = <0x81000000 0x0 0x00000000 0x48 0x00010000 0x0 0x00010000   /* downstream I/O */
 				  0x82000000 0x0 0x40000000 0x48 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
-			msi-parent = <&msi2>;
+			msi-parent = <&msi1>, <&msi2>, <&msi3>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
 			interrupt-map = <0000 0 0 1 &gic 0 120  0x4>,
@@ -739,7 +739,7 @@
 			bus-range = <0x0 0xff>;
 			ranges = <0x81000000 0x0 0x00000000 0x50 0x00010000 0x0 0x00010000   /* downstream I/O */
 				  0x82000000 0x0 0x40000000 0x50 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
-			msi-parent = <&msi3>;
+			msi-parent = <&msi1>, <&msi2>, <&msi3>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
 			interrupt-map = <0000 0 0 1 &gic 0 154 0x4>,
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
