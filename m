From: Otavio Salvador <otavio-fKevB0iiKLMBZ+LybsDmbA@public.gmane.org>
Subject: [PATCH] ARM: dts: imx6qdl-nitrogen6x: Add SPI NOR partitions
Date: Fri, 24 Nov 2017 09:21:51 -0200
Message-ID: <20171124112151.2758-1-otavio@ossystems.com.br>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>, Otavio Salvador <otavio-fKevB0iiKLMBZ+LybsDmbA@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds the partitions definition for the SPI NOR to provide
backward compatibility with the documented[1] layout used with
Boundary Devices BSP.

1. https://boundarydevices.com/boot-flash-access-linux/

It exports to Linux:

 mtd0: U-Boot
 mtd1: U-Boot Environment
 mtd2: Bootsplash

Signed-off-by: Otavio Salvador <otavio-fKevB0iiKLMBZ+LybsDmbA@public.gmane.org>
---

 arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi b/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
index 4bdf29169d2a..f8b267875e1c 100644
--- a/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
@@ -276,6 +276,23 @@
 		compatible = "sst,sst25vf016b", "jedec,spi-nor";
 		spi-max-frequency = <20000000>;
 		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@0 {
+			label = "U-Boot";
+			reg = <0x0 0xc0000>;
+		};
+
+		partition@c0000 {
+			label = "U-Boot Environment";
+			reg = <0xc0000 0x2000>;
+		};
+
+		partition@c2000 {
+			label = "Bootsplash";
+			reg = <0xc2000 0x13e000>;
+		};
 	};
 };
 
-- 
2.15.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
