From: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: [PATCH 1/3] ARM: at91/dt: sama5d3 fill in mmc1 and default disabled
Date: Thu, 26 Mar 2015 17:38:23 +0000
Message-ID: <1427391505-29129-2-git-send-email-ben.dooks@codethink.co.uk>
References: <1427391505-29129-1-git-send-email-ben.dooks@codethink.co.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427391505-29129-1-git-send-email-ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The mmc1 channel is not populated on the SAM5D3 Xplained board, however
it is enabled and therefore the driver is attaching to it.

The node configuration for mmc1 is missing, so add an mmc1 node in the
device tree so add the basic node, set it to default it to disabled. Also
add the vmmc and also the necessary slot configuration if this node
where to be enabled to avoid the following warnings from the driver.

atmel_mci f8000000.mmc: No vmmc regulator found
atmel_mci f8000000.mmc: No vqmmc regulator found

Signed-off-by: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
--
CC: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
CC: Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>
CC: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
CC: Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
CC: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
CC: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
CC: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
CC: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
CC: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
CC: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
CC: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
CC: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 arch/arm/boot/dts/at91-sama5d3_xplained.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/at91-sama5d3_xplained.dts b/arch/arm/boot/dts/at91-sama5d3_xplained.dts
index fec1fca..652c4dd 100644
--- a/arch/arm/boot/dts/at91-sama5d3_xplained.dts
+++ b/arch/arm/boot/dts/at91-sama5d3_xplained.dts
@@ -43,6 +43,17 @@
 				};
 			};
 
+			mmc1: mmc@f8000000 {
+				vmmc-supply = <&vcc_3v3_reg>;
+				vqmmc-supply = <&vcc_3v3_reg>;
+				status = "disabled";
+				slot@0 {
+					reg = <0>;
+					bus-width = <4>;
+					cd-gpios = <&pioE 1 GPIO_ACTIVE_LOW>;
+				};
+			};
+
 			spi0: spi@f0004000 {
 				cs-gpios = <&pioD 13 0>, <0>, <0>, <&pioD 16 0>;
 				status = "okay";
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
