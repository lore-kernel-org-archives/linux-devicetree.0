From: Al Cooper <alcooperx@gmail.com>
Subject: [PATCH 1/5] dt-bindings: Add Broadcom STB OHCI, EHCI and XHCI binding document
Date: Wed, 26 Sep 2018 18:20:10 -0400
Message-ID: <1538000414-24873-2-git-send-email-alcooperx@gmail.com>
References: <1538000414-24873-1-git-send-email-alcooperx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1538000414-24873-1-git-send-email-alcooperx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Al Cooper <alcooperx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@intel.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S. Miller" <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Dmitry Osipenko <digetx@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Jianguo Sun <sunjianguo1@huawei.com>, James Hogan <jhogan@kernel.org>, Alban Bedel <albeu@free.fr>, Lu Baolu <baolu.lu@linux.intel.com>, Avi Fishman <avifishman70@gmail.com>, Alex Elder <elder@linaro.org>, Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org, dev
List-Id: devicetree@vger.kernel.org

Add DT bindings document for Broadcom STB USB OHCI, EHCI and
XHCI drivers.

Signed-off-by: Al Cooper <alcooperx@gmail.com>
---
 .../devicetree/bindings/usb/brcm,ehci-brcm.txt     | 22 +++++++++++++++++++++
 .../devicetree/bindings/usb/brcm,ohci-brcm.txt     | 22 +++++++++++++++++++++
 .../devicetree/bindings/usb/brcm,xhci-brcm.txt     | 23 ++++++++++++++++++++++
 3 files changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/brcm,ehci-brcm.txt
 create mode 100644 Documentation/devicetree/bindings/usb/brcm,ohci-brcm.txt
 create mode 100644 Documentation/devicetree/bindings/usb/brcm,xhci-brcm.txt

diff --git a/Documentation/devicetree/bindings/usb/brcm,ehci-brcm.txt b/Documentation/devicetree/bindings/usb/brcm,ehci-brcm.txt
new file mode 100644
index 000000000000..020b5ec40f5b
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/brcm,ehci-brcm.txt
@@ -0,0 +1,22 @@
+Broadcom STB USB EHCI controller
+
+Required properties:
+- compatible: should be "brcm,ehci-brcm-v2"
+- reg: should contain one register range i.e. start and length
+- interrupts: description of the interrupt line
+- phys: phandle + phy specifier pair
+  The specifier should be 0 for the OHCI/EHCI PHY and 1 for the XHCI PHY
+
+Optional properties:
+- clocks: A list of phandles for the clocks
+
+Example:
+
+ehci@f0b00300 {
+	compatible = "brcm,ehci-brcm-v2";
+	reg = <0xf0b00300 0xa8>;
+	interrupts = <0x0 0x5a 0x0>;
+	interrupt-names = "usb0_ehci_0";
+	phys = <&usbphy_0 0x0>;
+	clocks = <&usb20>
+};
diff --git a/Documentation/devicetree/bindings/usb/brcm,ohci-brcm.txt b/Documentation/devicetree/bindings/usb/brcm,ohci-brcm.txt
new file mode 100644
index 000000000000..c7bb56f30540
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/brcm,ohci-brcm.txt
@@ -0,0 +1,22 @@
+Broadcom STB USB OHCI controller
+
+Required properties:
+- compatible: should be "brcm,ohci-brcm-v2"
+- reg: should contain one register range i.e. start and length
+- interrupts: description of the interrupt line
+- phys: phandle + phy specifier pair
+  The specifier should be 0 for the OHCI/EHCI PHY and 1 for the XHCI PHY
+
+Optional properties:
+- clocks: A list of phandles for the clocks
+
+Example:
+
+ohci@f0b00400 {
+	compatible = "brcm,ohci-brcm-v2";
+	reg = <0xf0b00400 0x58>;
+	interrupts = <0x0 0x5b 0x0>;
+	interrupt-names = "usb0_ohci_0";
+	phys = <&usbphy_0 0x0>;
+	clocks = <&usb20>;
+};
diff --git a/Documentation/devicetree/bindings/usb/brcm,xhci-brcm.txt b/Documentation/devicetree/bindings/usb/brcm,xhci-brcm.txt
new file mode 100644
index 000000000000..7ca5f126c2f6
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/brcm,xhci-brcm.txt
@@ -0,0 +1,23 @@
+Broadcom STB USB XHCI controller
+
+Required properties:
+- compatible: should be "brcm,xhci-brcm-v2"
+- reg: should contain one register range i.e. start and length
+- interrupts: description of the interrupt line
+- phys: phandle + phy specifier pair
+  The specifier should be 0 for the OHCI/EHCI PHY and 1 for the XHCI PHY
+
+Optional properties:
+- clocks: A list of phandles for the clocks
+- usb3-lpm-capable: determines if platform is USB3 LPM capable
+
+Example:
+
+xhci_0_0: xhci@f0b01000 {
+	compatible = "brcm,xhci-brcm-v2";
+	reg = <0xf0b01000 0x1000>;
+	interrupts = <0x0 0x5c 0x0>;
+	interrupt-names = "usb0_xhci_0";
+	phys = <&usbphy_0 0x1>;
+	clocks = <&usb30>;
+};
-- 
1.9.0.138.g2de3478
