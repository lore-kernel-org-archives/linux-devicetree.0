From: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v5 4/5] USB: ohci: da8xx: Add devicetree bindings
Date: Mon, 14 Nov 2016 15:41:02 +0100
Message-ID: <20161114144103.12120-5-ahaslam@baylibre.com>
References: <20161114144103.12120-1-ahaslam@baylibre.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161114144103.12120-1-ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch documents the device tree bindings required for
the ohci controller found in TI da8xx family of SoC's

Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/usb/ohci-da8xx.txt         | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/ohci-da8xx.txt

diff --git a/Documentation/devicetree/bindings/usb/ohci-da8xx.txt b/Documentation/devicetree/bindings/usb/ohci-da8xx.txt
new file mode 100644
index 0000000..2dc8f67
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ohci-da8xx.txt
@@ -0,0 +1,23 @@
+DA8XX USB OHCI controller
+
+Required properties:
+
+ - compatible: Should be "ti,da830-ohci"
+ - reg:        Should contain one register range i.e. start and length
+ - interrupts: Description of the interrupt line
+ - phys:       Phandle for the PHY device
+ - phy-names:  Should be "usb-phy"
+
+Optional properties:
+ - vbus-supply: phandle of regulator that controls vbus power / over-current
+
+Example:
+
+ohci: usb@0225000 {
+        compatible = "ti,da830-ohci";
+        reg = <0x225000 0x1000>;
+        interrupts = <59>;
+        phys = <&usb_phy 1>;
+        phy-names = "usb-phy";
+        vbus-supply = <&reg_usb_ohci>;
+};
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
