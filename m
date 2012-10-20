From: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
Subject: [PATCH v2 2/2] USB: doc: Binding document for ehci-platform driver
Date: Sun, 21 Oct 2012 11:10:32 +1300
Message-ID: <1350771032-11527-3-git-send-email-linux@prisktech.co.nz>
References: <1350771032-11527-1-git-send-email-linux@prisktech.co.nz>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1350771032-11527-1-git-send-email-linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a binding document for ehci-platform driver.

Signed-off-by: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
---
 .../devicetree/bindings/usb/ehci-platform.txt      |   27 ++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/ehci-platform.txt

diff --git a/Documentation/devicetree/bindings/usb/ehci-platform.txt b/Documentation/devicetree/bindings/usb/ehci-platform.txt
new file mode 100644
index 0000000..930b19e
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ehci-platform.txt
@@ -0,0 +1,27 @@
+Generic Platform EHCI Controller
+-----------------------------------------------------
+
+Required properties:
+- compatible : "linux,ehci-platform"
+- reg : Should contain 1 register ranges(address and length)
+- interrupts : EHCI controller interrupt
+
+Optional properties:
+- caps-offset : offset to the capabilities register (default = 0)
+- has-tt : controller has transaction translator(s).
+- has-synopsys-hc-bug : controller has the synopsys hc bug
+- no-io-watchdog : controller does not need io watchdog
+
+- big-endian : descriptors and registers are both big endian. This
+  is the equivalent of specifying big-endian-desc and big-endian-regs.
+OR
+- big-endian-desc : descriptors are in big-endian format
+- big-endian-regs : mmio is in big-endian format
+
+Example:
+	ehci@d8007c00 {
+		compatible = "ehci-platform";
+		reg = <0xd8007c00 0x200>;
+		interrupts = <43>;
+		has-tt;
+	};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
