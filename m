From: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] dt: spi: fsl-imx-cspi: add explicit compatible strings and required clock properties
Date: Wed,  4 Mar 2015 14:12:58 -0500
Message-ID: <1425496378-16561-1-git-send-email-mporter@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Robin Gong <b38343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The fsl-imx-cspi binding contains language indicating compatible
strings to be used that is not valid for all supported parts
e.g. Should be "fsl,<soc>-cspi" or "fsl,<soc>-ecspi". Fix this
by enumerating the set of valid compatible strings.

The binding is also missing the clocks/clock-names properties
so document these and the two required ipg and per clocks.

Signed-off-by: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/spi/fsl-imx-cspi.txt | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/fsl-imx-cspi.txt b/Documentation/devicetree/bindings/spi/fsl-imx-cspi.txt
index aad527b..523341a 100644
--- a/Documentation/devicetree/bindings/spi/fsl-imx-cspi.txt
+++ b/Documentation/devicetree/bindings/spi/fsl-imx-cspi.txt
@@ -2,11 +2,21 @@
   (CSPI/eCSPI) for i.MX
 
 Required properties:
-- compatible : Should be "fsl,<soc>-cspi" or "fsl,<soc>-ecspi"
+- compatible :
+  - "fsl,imx1-cspi" for SPI compatible with the one integrated on i.MX1
+  - "fsl,imx21-cspi" for SPI compatible with the one integrated on i.MX21
+  - "fsl,imx27-cspi" for SPI compatible with the one integrated on i.MX27
+  - "fsl,imx31-cspi" for SPI compatible with the one integrated on i.MX31
+  - "fsl,imx35-cspi" for SPI compatible with the one integrated on i.MX35
+  - "fsl,imx51-ecspi" for SPI compatible with the one integrated on i.MX51
 - reg : Offset and length of the register set for the device
 - interrupts : Should contain CSPI/eCSPI interrupt
 - fsl,spi-num-chipselects : Contains the number of the chipselect
 - cs-gpios : Specifies the gpio pins to be used for chipselects.
+- clocks : Clock specifiers for both ipg and per clocks.
+- clock-names : Clock names should include both "ipg" and "per"
+See the clock consumer binding,
+	Documentation/devicetree/bindings/clock/clock-bindings.txt
 - dmas: DMA specifiers for tx and rx dma. See the DMA client binding,
 		Documentation/devicetree/bindings/dma/dma.txt
 - dma-names: DMA request names should include "tx" and "rx" if present.
-- 
1.8.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
