From: Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/2] misc: Add DT binding for cygnus Digital Timing Engine (DTE) driver.
Date: Wed, 22 Apr 2015 16:22:02 -0700
Message-ID: <1429744923-2007-2-git-send-email-jonathar@broadcom.com>
References: <1429744923-2007-1-git-send-email-jonathar@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429744923-2007-1-git-send-email-jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Darren Edamura <dedamura-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Reviewed-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Tested-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Signed-off-by: Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 .../bindings/arm/bcm/brcm,cygnus-dte.txt           |   24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,cygnus-dte.txt

diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,cygnus-dte.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,cygnus-dte.txt
new file mode 100644
index 0000000..f30ca86
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,cygnus-dte.txt
@@ -0,0 +1,24 @@
+Broadcom Cygnus DTE Digital Timing Engine device tree bindings
+
+The DTE block allows for hardware timestamping of network packets,
+audio/video samples and/or GPIO inputs in a common adjustable time base.
+
+Required SoC Specific Properties:
+- compatible: should be "brcm,cygnus-dte"
+
+- reg: Requires two separate register sets
+	Base address of the Audio EAV Regsiters for DTE block and length of memory
+	mapped region.
+
+- interrupts: The DTE interrupt number to the cpu.
+
+Example:
+
+/ {
+	dte: dte@0x180af000 {
+		compatible = "brcm,cygnus-dte";
+		reg = <0x180af000 0x1000>;
+		interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+
+	};
+};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
