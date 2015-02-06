From: Gordon Bos <gordon-PMRpws9CsXpfxmBXdGbrbQ@public.gmane.org>
Subject: [PATCH 1/1] arm: Fix unavailable MTD userland devices on Excito B3 boards
Date: Fri,  6 Feb 2015 09:45:11 +0100
Message-ID: <1423212311-10793-1-git-send-email-gordon@bosvangennip.nl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gordon Bos <gordon-PMRpws9CsXpfxmBXdGbrbQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Excito B3 boards use SPI flash for booting and several userland
functions require access to this flash memory, including power down
control. However /proc/mtd shows an empty list and the userland
tools respond with "device not found".

Change driver reference for spi@10600 to M25P80

Verified on my own Excito B3

Signed-off-by: Gordon Bos <gordon-PMRpws9CsXpfxmBXdGbrbQ@public.gmane.org>
---
 arch/arm/boot/dts/kirkwood-b3.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/kirkwood-b3.dts b/arch/arm/boot/dts/kirkwood-b3.dts
index c9247f8..4b1e414 100644
--- a/arch/arm/boot/dts/kirkwood-b3.dts
+++ b/arch/arm/boot/dts/kirkwood-b3.dts
@@ -71,10 +71,10 @@
 		spi@10600 {
 			status = "okay";
 
-			m25p16@0 {
+			m25p80@0 {
 				#address-cells = <1>;
 				#size-cells = <1>;
-				compatible = "st,m25p16";
+				compatible = "st,m25p80";
 				reg = <0>;
 				spi-max-frequency = <40000000>;
 				mode = <0>;
-- 
2.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
