From: Ilya Ledvich <ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: [PATCH] ARM: dts: compulab: add new board description
Date: Tue, 22 Dec 2015 11:10:59 +0200
Message-ID: <1450775459-18937-1-git-send-email-ilya@compulab.co.il>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nikita Kiryanov <nikita-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ilya Ledvich <ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add description for newly introduced Compulab devices:
- CL-SOM-iMX7
- SBC-iMX7

Signed-off-by: Ilya Ledvich <ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
---

Arnd, Olof, this patch follows the discussion in [1].
Can you please apply it on top of arm-soc next/dt branch?

Thanks!

[1] - http://www.spinics.net/lists/arm-kernel/msg470410.html

 .../devicetree/bindings/arm/compulab-boards.txt    | 24 ++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/compulab-boards.txt b/Documentation/devicetree/bindings/arm/compulab-boards.txt
index 71172d5..42a1028 100644
--- a/Documentation/devicetree/bindings/arm/compulab-boards.txt
+++ b/Documentation/devicetree/bindings/arm/compulab-boards.txt
@@ -1,5 +1,25 @@
-CompuLab SB-SOM is a multi-module baseboard capable of carrying CM-T43, CM-T54,
-and CM-QS600 modules with minor modifications to the SB-SOM assembly.
+CompuLab SB-SOM is a multi-module baseboard capable of carrying:
+ - CM-T43
+ - CM-T54
+ - CM-QS600
+ - CL-SOM-AM57x
+ - CL-SOM-iMX7
+modules with minor modifications to the SB-SOM assembly.
 
 Required root node properties:
     - compatible = should be "compulab,sb-som"
+
+Compulab CL-SOM-iMX7 is a miniature System-on-Module (SoM) based on
+Freescale i.MX7 ARM Cortex-A7 System-on-Chip.
+
+Required root node properties:
+    - compatible = "compulab,cl-som-imx7", "fsl,imx7d";
+
+Compulab SBC-iMX7 is a single board computer based on the
+Freescale i.MX7 system-on-chip. SBC-iMX7 is implemented with
+the CL-SOM-iMX7 System-on-Module providing most of the functions,
+and SB-SOM-iMX7 carrier board providing additional peripheral
+functions and connectors.
+
+Required root node properties:
+    - compatible = "compulab,sbc-imx7", "compulab,cl-som-imx7", "fsl,imx7d";
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
