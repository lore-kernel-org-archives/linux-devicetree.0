From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 6/7] dt-bindings: PCI: rockchip: convert to use per-lane PHY model
Date: Mon, 17 Jul 2017 15:38:41 +0800
Message-ID: <1500277122-21835-2-git-send-email-shawn.lin@rock-chips.com>
References: <1500276982-208439-1-git-send-email-shawn.lin@rock-chips.com>
 <1500277122-21835-1-git-send-email-shawn.lin@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500277122-21835-1-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Deprecate legacy PHY model and encourage to use per-lane PHY
model.

Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

 .../devicetree/bindings/pci/rockchip-pcie.txt      | 25 ++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/rockchip-pcie.txt b/Documentation/devicetree/bindings/pci/rockchip-pcie.txt
index 1453a73..41bced4 100644
--- a/Documentation/devicetree/bindings/pci/rockchip-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/rockchip-pcie.txt
@@ -19,8 +19,6 @@ Required properties:
 	- "pm"
 - msi-map: Maps a Requester ID to an MSI controller and associated
 	msi-specifier data. See ./pci-msi.txt
-- phys: From PHY bindings: Phandle for the Generic PHY for PCIe.
-- phy-names:  MUST be "pcie-phy".
 - interrupts: Three interrupt entries must be specified.
 - interrupt-names: Must include the following names
 	- "sys"
@@ -42,6 +40,18 @@ Required properties:
 	interrupt source. The value must be 1.
 - interrupt-map-mask and interrupt-map: standard PCI properties
 
+Required properties for legacy PHY model (deprecated):
+- phys: From PHY bindings: Phandle for the Generic PHY for PCIe.
+- phy-names:  MUST be "pcie-phy".
+
+Required properties for per-lane PHY model (preferred):
+- phys: Must contain an phandle to a PHY for each entry in phy-names.
+- phy-names: Must include 4 entries for all 4 lanes even if some of
+  them won't be used for your cases. Entries are of the form "pcie-phy-N":
+  where N ranges from 0 to 3.
+  (see example below and you MUST also refer to ../phy/rockchip-pcie-phy.txt
+  for changing the #phy-cells of phy node to support it)
+
 Optional Property:
 - aspm-no-l0s: RC won't support ASPM L0s. This property is needed if
 	using 24MHz OSC for RC's PHY.
@@ -95,6 +105,7 @@ pcie0: pcie@f8000000 {
 		 <&cru SRST_PCIE_PM>, <&cru SRST_P_PCIE>, <&cru SRST_A_PCIE>;
 	reset-names = "core", "mgmt", "mgmt-sticky", "pipe",
 		      "pm", "pclk", "aclk";
+	/* deprecated legacy PHY model */
 	phys = <&pcie_phy>;
 	phy-names = "pcie-phy";
 	pinctrl-names = "default";
@@ -111,3 +122,13 @@ pcie0: pcie@f8000000 {
 		#interrupt-cells = <1>;
 	};
 };
+
+pcie0: pcie@f8000000 {
+	...
+
+	/* preferred per-lane PHY model */
+	phys = <&pcie_phy 0>, <&pcie_phy 1>, <&pcie_phy 2>, <&pcie_phy 3>;
+	phy-names = "pcie-phy-0", "pcie-phy-1", "pcie-phy-2", "pcie-phy-3";
+
+	...
+};
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
