From: Al Cooper <alcooperx@gmail.com>
Subject: [PATCH V4 1/5] dt-bindings: Add Broadcom STB USB support
Date: Fri,  9 Nov 2018 09:01:56 -0500
Message-ID: <1541772120-40394-2-git-send-email-alcooperx@gmail.com>
References: <1541772120-40394-1-git-send-email-alcooperx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541772120-40394-1-git-send-email-alcooperx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Al Cooper <alcooperx@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, Alban Bedel <albeu@free.fr>, Alex Elder <elder@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Avi Fishman <avifishman70@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Hans de Goede <hdegoede@redhat.com>, James Hogan <jhogan@kernel.org>, Johan Hovold <johan@kernel.org>, Kees Cook <keescook@chromium.org>, linux-usb@vger.kernel.org, Lu Baolu <baolu.lu@li>
List-Id: devicetree@vger.kernel.org

Add DT bindings for Broadcom STB USB EHCI and XHCI drivers.
Add "phy-supplies-usb-clock" property description to usb-hcd.txt

NOTE: The OHCI driver is not included because it uses the generic
      platform driver.

Signed-off-by: Al Cooper <alcooperx@gmail.com>
---
 .../devicetree/bindings/usb/brcm,bcm7445-ehci.txt  | 24 ++++++++++++++++++++++
 Documentation/devicetree/bindings/usb/usb-hcd.txt  |  3 +++
 Documentation/devicetree/bindings/usb/usb-xhci.txt |  1 +
 3 files changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/brcm,bcm7445-ehci.txt

diff --git a/Documentation/devicetree/bindings/usb/brcm,bcm7445-ehci.txt b/Documentation/devicetree/bindings/usb/brcm,bcm7445-ehci.txt
new file mode 100644
index 000000000000..4dea956f2705
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/brcm,bcm7445-ehci.txt
@@ -0,0 +1,24 @@
+Broadcom STB USB EHCI controller
+
+Required properties:
+- compatible: should be "brcm,bcm7445-ehci"
+- reg: should contain one register range i.e. start and length
+- interrupts: description of the interrupt line
+- phys: phandle + phy specifier pair
+  The specifier should be 0 for the OHCI/EHCI PHY
+- phy-supplies-usb-clock: See usb-hcd.txt for details.
+
+Optional properties:
+- clocks: A phandle for the EHCI clock
+
+Example:
+
+ehci@f0b00300 {
+	compatible = "brcm,bcm7445-ehci";
+	reg = <0xf0b00300 0xa8>;
+	interrupts = <0x0 0x5a 0x0>;
+	interrupt-names = "usb0_ehci_0";
+	phys = <&usbphy_0 0x0>;
+	clocks = <&usb20>;
+	phy-supplies-usb-clock;
+};
diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.txt b/Documentation/devicetree/bindings/usb/usb-hcd.txt
index 50529b838c9c..6b4755924b15 100644
--- a/Documentation/devicetree/bindings/usb/usb-hcd.txt
+++ b/Documentation/devicetree/bindings/usb/usb-hcd.txt
@@ -2,6 +2,9 @@ Generic USB HCD (Host Controller Device) Properties
 
 Optional properties:
 - phys: a list of all USB PHYs on this HCD
+- phy-supplies-usb-clock: boolean, used for SoCs where the PHY supplies
+  the usb controller clock. This will prevent the PHY exit from being
+  called on suspend.
 
 Example:
 	&usb1 {
diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
index fea8b1545751..f58e617ee54c 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
@@ -21,6 +21,7 @@ Required properties:
       device
     - "renesas,rcar-gen3-xhci" for a generic R-Car Gen3 or RZ/G2 compatible
       device
+    - "brcm,bcm7445-xhci" for Broadcom STB SoCs
     - "xhci-platform" (deprecated)
 
     When compatible with the generic version, nodes must list the
-- 
1.9.0.138.g2de3478
