From: Jon Mason <jon.mason@broadcom.com>
Subject: [PATCH 2/2] arm64: dts: NS2: Add PCI PHYs
Date: Thu, 17 Nov 2016 18:25:03 -0500
Message-ID: <1479425103-2119-3-git-send-email-jon.mason@broadcom.com>
References: <1479425103-2119-1-git-send-email-jon.mason@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479425103-2119-1-git-send-email-jon.mason@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

PCI PHYs are missing from the Northstar2 DT entries for the 2 PCI buses.
Add them so that PCI devices can be discovered.

Signed-off-by: Jon Mason <jon.mason@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/ns2.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi b/arch/arm64/boot/dts/broadcom/ns2.dtsi
index e4cd868..4fcdeca 100644
--- a/arch/arm64/boot/dts/broadcom/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi
@@ -133,6 +133,9 @@
 
 		status = "disabled";
 
+		phys = <&pci_phy0>;
+		phy-names = "pcie-phy";
+
 		msi-parent = <&msi0>;
 		msi0: msi@20020000 {
 			compatible = "brcm,iproc-msi";
@@ -171,6 +174,9 @@
 
 		status = "disabled";
 
+		phys = <&pci_phy1>;
+		phy-names = "pcie-phy";
+
 		msi-parent = <&msi4>;
 		msi4: msi@50020000 {
 			compatible = "brcm,iproc-msi";
-- 
2.7.4
