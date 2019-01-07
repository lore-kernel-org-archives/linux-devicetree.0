Return-Path: <SRS0=iARg=PP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:48252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726485AbfAGK3G (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 7 Jan 2019 05:29:06 -0500
Subject: patch "staging: mt7621-pci-phy: dt-bindings: add bindings for Mediatek" added to staging-testing
From: <gregkh@linuxfoundation.org>
Date: Mon, 07 Jan 2019 11:28:35 +0100
Message-ID: <15468569157618@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: sergio.paracuellos@gmail.com, devicetree@vger.kernel.org, gregkh@linuxfoundation.org
List-ID: <devicetree@vger.kernel.org>


This is a note to let you know that I've just added the patch titled

    staging: mt7621-pci-phy: dt-bindings: add bindings for Mediatek

to my staging git tree which can be found at
    git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
in the staging-testing branch.

The patch will show up in the next release of the linux-next tree
(usually sometime within the next 24 hours during the week.)

The patch will be merged to the staging-next branch sometime soon,
after it passes testing, and the merge window is open.

If you have any questions about this process, please let me know.


>From 9e2ddbdd9218bf0e465d19daecdd053052ffd79c Mon Sep 17 00:00:00 2001
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 4 Jan 2019 08:08:24 +0100
Subject: staging: mt7621-pci-phy: dt-bindings: add bindings for Mediatek
 MT7621 Pcie PHY

Add bindings documentation for PCie PHY of Mediatek MT7621.
This file will be moved into its appropiate documentation bindings'place
when this driver is mainlined.

CC: Device Tree mailing list <devicetree@vger.kernel.org>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 .../mediatek,mt7621-pci-phy.txt               | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 drivers/staging/mt7621-pci-phy/mediatek,mt7621-pci-phy.txt

diff --git a/drivers/staging/mt7621-pci-phy/mediatek,mt7621-pci-phy.txt b/drivers/staging/mt7621-pci-phy/mediatek,mt7621-pci-phy.txt
new file mode 100644
index 000000000000..33a8a698bdd0
--- /dev/null
+++ b/drivers/staging/mt7621-pci-phy/mediatek,mt7621-pci-phy.txt
@@ -0,0 +1,54 @@
+Mediatek Mt7621 PCIe PHY
+
+Required properties:
+- compatible: must be "mediatek,mt7621-pci-phy"
+- reg: base address and length of the PCIe PHY block
+- #address-cells: must be 1
+- #size-cells: must be 0
+
+Each PCIe PHY should be represented by a child node
+
+Required properties For the child node:
+- reg: the PHY ID
+0 - PCIe RC 0
+1 - PCIe RC 1
+- #phy-cells: must be 0
+
+Example:
+	pcie0_phy: pcie-phy@1a149000 {
+		compatible = "mediatek,mt7621-pci-phy";
+		reg = <0x1a149000 0x0700>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pcie0_port: pcie-phy@0 {
+			reg = <0>;
+			#phy-cells = <0>;
+		};
+
+		pcie1_port: pcie-phy@1 {
+			reg = <1>;
+			#phy-cells = <0>;
+		};
+	};
+
+	pcie1_phy: pcie-phy@1a14a000 {
+		compatible = "mediatek,mt7621-pci-phy";
+		reg = <0x1a14a000 0x0700>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pcie2_port: pcie-phy@0 {
+			reg = <0>;
+			#phy-cells = <0>;
+		};
+	};
+
+	/* users of the PCIe phy */
+
+	pcie: pcie@1e140000 {
+		...
+		...
+		phys = <&pcie0_port>, <&pcie1_port>, <&pcie2_port>;
+		phy-names = "pcie-phy0", "pcie-phy1", "pcie-phy2";
+	};
\ No newline at end of file
-- 
2.20.1
