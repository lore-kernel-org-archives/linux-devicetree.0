From: Oza Pawandeep <oza.oza-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4 2/3] dt-bindings: PCI: add PCIe hotplug property
Date: Thu, 24 Aug 2017 14:19:07 +0530
Message-ID: <1503564548-1834-3-git-send-email-oza.oza@broadcom.com>
References: <1503564548-1834-1-git-send-email-oza.oza@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1503564548-1834-1-git-send-email-oza.oza-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Oza Pawandeep <oza.oza-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Andy Gospodarek <gospo-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Oza Pawandeep <oza.pawandeep-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Host drivers have the requirement of implementing PCI hotplug
based on the how their SOC supports PCI hotplug.

Couple of properties have been added. the one to enable
the hotplug feature itself, and the other caters to
the PCI hotplug implementation with the use of gpios.

Signed-off-by: Oza Pawandeep <oza.oza-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

diff --git a/Documentation/devicetree/bindings/pci/pci.txt b/Documentation/devicetree/bindings/pci/pci.txt
index 50f9e2c..0bf25a1 100644
--- a/Documentation/devicetree/bindings/pci/pci.txt
+++ b/Documentation/devicetree/bindings/pci/pci.txt
@@ -24,3 +24,18 @@ driver implementation may support the following properties:
    unsupported link speed, for instance, trying to do training for
    unsupported link speed, etc.  Must be '4' for gen4, '3' for gen3, '2'
    for gen2, and '1' for gen1. Any other values are invalid.
+
+- slot-pluggable:
+   PCI hotplug feature is supported.
+   PCI hotplug implementation is SOC/Board specific, and also it depends on
+   how add-in card is designed (e.g. how many present pins are implemented).
+   If the slot-pluggable property is present, the following propertey could
+   become effective.
+   - prsnt-gpios:
+      Array of gpios, could be present if hotplug is supported.
+      This property defines gpio based hotplug implementation.
+      Example:
+      If x8 card is connected, then it might be possible that all the
+      3 present pins could go low, or at least one pin goes low.
+      If x4 card is connected, then it might be possible that 2 present
+      pins go low, or at least one pin goes low.
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
