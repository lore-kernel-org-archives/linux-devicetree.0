From: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
Subject: [PATCH] ARM: dts: am335x-boneblack: Add blue-and-red-wiring -property to LCDC node
Date: Thu, 17 Nov 2016 22:13:42 +0200
Message-ID: <a7a7cd2666199316cbf13f5c1c9a387838f645bf.1479413359.git.jsarha@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org
Cc: tomi.valkeinen-l0cyMroinI0@public.gmane.org, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add blue-and-red-wiring -property to LCDC node. Also adds comments on
how to get support 24 bit RGB mode. After this patch am335x-boneblack
support RGB565, BGR888, and XBGR8888 color formats. See details in
Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt.

The BBB has straight color wiring from am335x to tda19988, however the
tda19988 can be configured to cross the blue and red wires. The
comments show how to do that with video-ports property of tda19988
node and how to tell LCDC that blue and red wires are crossed, with
blue-and-red-wiring LCDC node property. This changes supported color
formats from 16 bit RGB and 24 bit BGR to 16 bit BGR and 24 bit RGB.

Signed-off-by: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
---
Hi Tony,
Could you pick this for 4.10. We left it out form 4.9 to avoid
conflict with beaglebone-back hdmi audio dts patches that slipped in
trough drm branch.

Cheers,
Jyri

 arch/arm/boot/dts/am335x-boneblack.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-boneblack.dts b/arch/arm/boot/dts/am335x-boneblack.dts
index 6bbb1fe..db00d8e 100644
--- a/arch/arm/boot/dts/am335x-boneblack.dts
+++ b/arch/arm/boot/dts/am335x-boneblack.dts
@@ -79,6 +79,14 @@
 
 &lcdc {
 	status = "okay";
+
+	/* If you want to get 24 bit RGB and 16 BGR mode instead of
+	 * current 16 bit RGB and 24 BGR modes, set the propety
+	 * below to "crossed" and uncomment the video-ports -property
+	 * in tda19988 node.
+	 */
+	blue-and-red-wiring = "straight";
+
 	port {
 		lcdc_0: endpoint@0 {
 			remote-endpoint = <&hdmi_0>;
@@ -95,6 +103,9 @@
 		pinctrl-0 = <&nxp_hdmi_bonelt_pins>;
 		pinctrl-1 = <&nxp_hdmi_bonelt_off_pins>;
 
+		/* Convert 24bit BGR to RGB, e.g. cross red and blue wiring */
+		/* video-ports = <0x234501>; */
+
 		#sound-dai-cells = <0>;
 		audio-ports = <	TDA998x_I2S	0x03>;
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
