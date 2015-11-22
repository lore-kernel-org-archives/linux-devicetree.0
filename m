From: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
Subject: [PATCH 2/2] dt-bindings: Misc fix for the ATH79 DDR controllers
Date: Sun, 22 Nov 2015 12:52:17 +0100
Message-ID: <1448193137-30456-2-git-send-email-albeu@free.fr>
References: <1448193137-30456-1-git-send-email-albeu@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448193137-30456-1-git-send-email-albeu-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Fix a few typos and reword the description of the

Signed-off-by: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
CC: trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
---
 .../bindings/memory-controllers/ath79-ddr-controller.txt          | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ath79-ddr-controller.txt b/Documentation/devicetree/bindings/memory-controllers/ath79-ddr-controller.txt
index efe35a06..c81af75 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ath79-ddr-controller.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/ath79-ddr-controller.txt
@@ -1,6 +1,6 @@
 Binding for Qualcomm  Atheros AR7xxx/AR9xxx DDR controller
 
-The DDR controller of the ARxxx and AR9xxx families provides an interface
+The DDR controller of the AR7xxx and AR9xxx families provides an interface
 to flush the FIFO between various devices and the DDR. This is mainly used
 by the IRQ controller to flush the FIFO before running the interrupt handler
 of such devices.
@@ -11,9 +11,9 @@ Required properties:
   "qca,[ar7100|ar7240]-ddr-controller" as fallback.
   On SoC with PCI support "qca,ar7100-ddr-controller" should be used as
   fallback, otherwise "qca,ar7240-ddr-controller" should be used.
-- reg: Base address and size of the controllers memory area
-- #qca,ddr-wb-channel-cells: has to be 1, the index of the write buffer
-  channel
+- reg: Base address and size of the controller's memory area
+- #qca,ddr-wb-channel-cells: Specifies the number of cells needed to encode
+			     the write buffer channel index, should be 1.
 
 Example:
 
-- 
2.0.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
