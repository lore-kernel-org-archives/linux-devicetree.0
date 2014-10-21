From: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH/RFC 13/17] Documentation: DT: Add entries for BCM3384 and its peripherals
Date: Mon, 20 Oct 2014 21:28:03 -0700
Message-ID: <1413865687-15255-14-git-send-email-cernekee@gmail.com>
References: <1413865687-15255-1-git-send-email-cernekee@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413865687-15255-1-git-send-email-cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, jfraser-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This covers the new "brcm,*" devices added in the upcoming bcm3384 commit.

Signed-off-by: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/mips/brcm/bcm3384-intc.txt | 37 ++++++++++++++++++++++
 .../devicetree/bindings/mips/brcm/bmips.txt        |  8 +++++
 .../devicetree/bindings/mips/brcm/cm-dsl.txt       | 11 +++++++
 .../devicetree/bindings/mips/brcm/usb.txt          | 11 +++++++
 4 files changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/brcm/bcm3384-intc.txt
 create mode 100644 Documentation/devicetree/bindings/mips/brcm/bmips.txt
 create mode 100644 Documentation/devicetree/bindings/mips/brcm/cm-dsl.txt
 create mode 100644 Documentation/devicetree/bindings/mips/brcm/usb.txt

diff --git a/Documentation/devicetree/bindings/mips/brcm/bcm3384-intc.txt b/Documentation/devicetree/bindings/mips/brcm/bcm3384-intc.txt
new file mode 100644
index 0000000..d4e0141
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/brcm/bcm3384-intc.txt
@@ -0,0 +1,37 @@
+* Interrupt Controller
+
+Properties:
+- compatible: "brcm,bcm3384-intc"
+
+  Compatibility with BCM3384 and possibly other BCM33xx/BCM63xx SoCs.
+
+- reg: Address/length pairs for each mask/status register set.  Length must
+  be 8.  If multiple register sets are specified, the first set will
+  handle IRQ offsets 0..31, the second set 32..63, and so on.
+
+- interrupt-controller: This is an interrupt controller.
+
+- #interrupt-cells: Must be <1>.  Just a simple IRQ offset; no level/edge
+  or polarity configuration is possible with this controller.
+
+- interrupt-parent: This controller is cascaded from a MIPS CPU HW IRQ, or
+  from another INTC.
+
+- interrupts: The IRQ on the parent controller.
+
+Example:
+	periph_intc: periph_intc@14e00038 {
+		compatible = "brcm,bcm3384-intc";
+
+		/*
+		 * IRQs 0..31:  mask reg 0x14e00038, status reg 0x14e0003c
+		 * IRQs 32..63: mask reg 0x14e00340, status reg 0x14e00344
+		 */
+		reg = <0x14e00038 0x8 0x14e00340 0x8>;
+
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		interrupt-parent = <&cpu_intc>;
+		interrupts = <4>;
+	};
diff --git a/Documentation/devicetree/bindings/mips/brcm/bmips.txt b/Documentation/devicetree/bindings/mips/brcm/bmips.txt
new file mode 100644
index 0000000..8ef71b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/brcm/bmips.txt
@@ -0,0 +1,8 @@
+* Broadcom MIPS (BMIPS) CPUs
+
+Required properties:
+- compatible: "brcm,bmips3300", "brcm,bmips4350", "brcm,bmips4380",
+  "brcm,bmips5000"
+
+- mips-hpt-frequency: This is common to all CPUs in the system so it lives
+  under the "cpus" node.
diff --git a/Documentation/devicetree/bindings/mips/brcm/cm-dsl.txt b/Documentation/devicetree/bindings/mips/brcm/cm-dsl.txt
new file mode 100644
index 0000000..8a139cb
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/brcm/cm-dsl.txt
@@ -0,0 +1,11 @@
+* Broadcom cable/DSL platforms
+
+SoCs:
+
+Required properties:
+- compatible: "brcm,bcm3384", "brcm,bcm33843"
+
+Boards:
+
+Required properties:
+- compatible: "brcm,bcm93384wvg"
diff --git a/Documentation/devicetree/bindings/mips/brcm/usb.txt b/Documentation/devicetree/bindings/mips/brcm/usb.txt
new file mode 100644
index 0000000..452c45c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/brcm/usb.txt
@@ -0,0 +1,11 @@
+* Broadcom USB controllers
+
+Required properties:
+- compatible: "brcm,bcm3384-ohci", "brcm,bcm3384-ehci"
+
+  These currently use the generic-ohci and generic-ehci drivers.  On some
+  systems, special handling may be needed in the following cases:
+
+  - Restoring state after systemwide power save modes
+  - Sharing PHYs with the USBD (UDC) hardware
+  - Figuring out which controllers are disabled on ASIC bondout variants
-- 
2.1.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
