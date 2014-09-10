From: Robin Gong <b38343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v1] ARM: dts: imx6dl: disable dma support for spi on i.mx6dl
Date: Wed, 10 Sep 2014 09:33:36 +0800
Message-ID: <1410312816-32171-1-git-send-email-b38343@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

There is one weird data in rxfifo after one full rx/tx transfer
done sometimes. It looks a design issue and hard to workaround
totally, so disable dma functhion here. And will re-enable it
once the root cause found.

Signed-off-by: Robin Gong <b38343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx6dl.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/imx6dl.dtsi b/arch/arm/boot/dts/imx6dl.dtsi
index b453e0e..e84a1ff 100644
--- a/arch/arm/boot/dts/imx6dl.dtsi
+++ b/arch/arm/boot/dts/imx6dl.dtsi
@@ -102,6 +102,22 @@
 	};
 };
 
+&ecspi1 {
+	dma-names = "", "";
+};
+
+&ecspi2 {
+	dma-names = "", "";
+};
+
+&ecspi3 {
+	dma-names = "", "";
+};
+
+&ecspi4 {
+	dma-names = "", "";
+};
+
 &hdmi {
 	compatible = "fsl,imx6dl-hdmi";
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
