From: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/5] dt-bindings: Create Documentation for NSP DT bindings
Date: Thu, 20 Aug 2015 13:46:29 -0400
Message-ID: <1440092789-25693-1-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add the documentation for the Broadcom Northstar Plus device tree
bindings.

Signed-off-by: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/arm/bcm/brcm,nsp.txt       | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,nsp.txt

diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.txt
new file mode 100644
index 0000000..eae53e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.txt
@@ -0,0 +1,34 @@
+Broadcom Northstar Plus device tree bindings
+--------------------------------------------
+
+Broadcom Northstar Plus family of SoCs are used for switching control
+and management applications as well as residential router/gateway
+applications. The SoC features dual core Cortex A9 ARM CPUs, integrating
+several peripheral interfaces including multiple Gigabit Ethernet PHYs,
+DDR3 memory, PCIE Gen-2, USB 2.0 and USB 3.0, serial and NAND flash,
+SATA and several other IO controllers.
+
+Boards with Northstar Plus SoCs shall have the following properties:
+
+Required root node property:
+
+BCM58522
+compatible = "brcm,bcm58522", "brcm,nsp";
+
+BCM58525
+compatible = "brcm,bcm58525", "brcm,nsp";
+
+BCM58535
+compatible = "brcm,bcm58535", "brcm,nsp";
+
+BCM58622
+compatible = "brcm,bcm58622", "brcm,nsp";
+
+BCM58623
+compatible = "brcm,bcm58623", "brcm,nsp";
+
+BCM58625
+compatible = "brcm,bcm58625", "brcm,nsp";
+
+BCM88312
+compatible = "brcm,bcm88312", "brcm,nsp";
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
