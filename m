From: Alexandre Lopes <alexaraujolopes-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/1] ARM: dts: socfpga: Add global timer node
Date: Mon, 14 Sep 2015 19:52:12 +0200
Message-ID: <CANB=fuBuaqFdBdy3YOVyHPGExrRBOgeRBWDmEvphJhOBX9DrGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Global timer node is missing from Altera ARM Cortex A9 based
SoCs DT.
It is thus impossible for drivers to make use of this timer on
Altera Arria and Cyclone boards.

Tested on the Altera Cyclone V Devkit and on the MitySoM
(Cyclone based) DevKit.

Signed-off-by: Alexandre Lopes <alexaraujolopes-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/socfpga.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index 314e589..51d08d1 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -714,6 +714,13 @@
                        clocks = <&spi_m_clk>;
                        status = "disabled";
                };
+               /* Global Timer */
+               timer@fffec200 {
+                       compatible = "arm,cortex-a9-global-timer";
+                       reg = <0xfffec200 0x20>;
+                       interrupts = <1 11 0xf04>;
+                       clocks = <&mpu_periph_clk>;
+               };

                /* Local timer */
                timer@fffec600 {
--
1.9.1
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
