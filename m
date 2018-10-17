From: Al Cooper <alcooperx@gmail.com>
Subject: [PATCH V2 1/6] dt-bindings: Add Broadcom STB OHCI, EHCI and XHCI binding document
Date: Wed, 17 Oct 2018 18:29:04 -0400
Message-ID: <1539815349-24126-2-git-send-email-alcooperx@gmail.com>
References: <1539815349-24126-1-git-send-email-alcooperx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1539815349-24126-1-git-send-email-alcooperx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Al Cooper <alcooperx@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, Alban Bedel <albeu@free.fr>, Alex Elder <elder@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Avi Fishman <avifishman70@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Hans de Goede <hdegoede@redhat.com>, James Hogan <jhogan@kernel.org>, Jianguo Sun <sunjianguo1@huawei.com>, Johan Hovold <johan@kernel.org>, Kees Cook <keescook@chromium.org>, linux-usb@
List-Id: devicetree@vger.kernel.org

Add DT bindings document for Broadcom STB USB OHCI, EHCI and
XHCI drivers.

Signed-off-by: Al Cooper <alcooperx@gmail.com>
---
 .../devicetree/bindings/usb/brcm,bcm7445-ehci.txt  | 22 +++++++++++++++++++++
 .../devicetree/bindings/usb/brcm,bcm7445-ohci.txt  | 22 +++++++++++++++++++++
 .../devicetree/bindings/usb/brcm,bcm7445-xhci.txt  | 23 ++++++++++++++++++++++
 3 files changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/brcm,bcm7445-ehci.txt
 create mode 100644 Documentation/devicetree/bindings/usb/brcm,bcm7445-ohci.txt
 create mode 100644 Documentation/devicetree/bindings/usb/brcm,bcm7445-xhci.txt

diff --git a/Documentation/devicetree/bindings/usb/brcm,bcm7445-ehci.txt b/Documentation/devicetree/bindings/usb/brcm,bcm7445-ehci.txt
new file mode 100644
index 000000000000..824f4bf5d07c
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/brcm,bcm7445-ehci.txt
@@ -0,0 +1,22 @@
+Broadcom STB USB EHCI controller
+
+Required properties:
+- compatible: should be "brcm,bcm7445-ehci"
+- reg: should contain one register range i.e. start and length
+- interrupts: description of the interrupt line
+- phys: phandle + phy specifier pair
+  The specifier should be 0 for the OHCI/EHCI PHY
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
+	clocks = <&usb20>
+};
diff --git a/Documentation/devicetree/bindings/usb/brcm,bcm7445-ohci.txt b/Documentation/devicetree/bindings/usb/brcm,bcm7445-ohci.txt
new file mode 100644
index 000000000000..de5a22b3d138
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/brcm,bcm7445-ohci.txt
@@ -0,0 +1,22 @@
+Broadcom STB USB OHCI controller
+
+Required properties:
+- compatible: should be "brcm,bcm7445-ohci"
+- reg: should contain one register range i.e. start and length
+- interrupts: description of the interrupt line
+- phys: phandle + phy specifier pair
+  The specifier should be 0 for the OHCI/EHCI PHY
+
+Optional properties:
+- clocks: A phandle for the OHCI clock
+
+Example:
+
+ohci@f0b00400 {
+	compatible = "brcm,bcm7445-ohci";
+	reg = <0xf0b00400 0x58>;
+	interrupts = <0x0 0x5b 0x0>;
+	interrupt-names = "usb0_ohci_0";
+	phys = <&usbphy_0 0x0>;
+	clocks = <&usb20>;
+};
diff --git a/Documentation/devicetree/bindings/usb/brcm,bcm7445-xhci.txt b/Documentation/devicetree/bindings/usb/brcm,bcm7445-xhci.txt
new file mode 100644
index 000000000000..c41f3f8d836d
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/brcm,bcm7445-xhci.txt
@@ -0,0 +1,23 @@
+Broadcom STB USB XHCI controller
+
+Required properties:
+- compatible: should be "brcm,bcm7445-xhci"
+- reg: should contain one register range i.e. start and length
+- interrupts: description of the interrupt line
+- phys: phandle + phy specifier pair
+  The specifier should be 1 for the XHCI PHY
+
+Optional properties:
+- clocks: A phandle for the XHCI clock
+- usb3-lpm-capable: determines if platform is USB3 LPM capable
+
+Example:
+
+xhci_0_0: xhci@f0b01000 {
+	compatible = "brcm,bcm7445-xhci";
+	reg = <0xf0b01000 0x1000>;
+	interrupts = <0x0 0x5c 0x0>;
+	interrupt-names = "usb0_xhci_0";
+	phys = <&usbphy_0 0x1>;
+	clocks = <&usb30>;
+};
-- 
1.9.0.138.g2de3478
