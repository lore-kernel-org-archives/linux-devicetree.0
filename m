From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 3/6] ARM: DTS: da850: Add node for McASP
Date: Fri, 1 Aug 2014 09:13:27 +0300
Message-ID: <1406873610-5037-4-git-send-email-peter.ujfalusi@ti.com>
References: <1406873610-5037-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406873610-5037-1-git-send-email-peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nsekhar-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: khilman-1D3HCaltpLuhEniVeURVKkEOCMrvLtNR@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Node for mcasp0

Signed-off-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/da850.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index 41ce4e8bf227..0bd98cd00816 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -276,6 +276,19 @@
 			ti,davinci-gpio-unbanked = <0>;
 			status = "disabled";
 		};
+
+		mcasp0: mcasp@01d00000 {
+			compatible = "ti,da830-mcasp-audio";
+			reg = <0x100000 0x2000>,
+			      <0x102000 0x400000>;
+			reg-names = "mpu", "dat";
+			interrupts = <54>;
+			interrupt-names = "common";
+			status = "disabled";
+			dmas = <&edma0 1>,
+				<&edma0 0>;
+			dma-names = "tx", "rx";
+		};
 	};
 	nand_cs3@62000000 {
 		compatible = "ti,davinci-nand";
-- 
2.0.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
