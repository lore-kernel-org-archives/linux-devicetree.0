From: Niklas Cassel <niklas.cassel@axis.com>
Subject: [PATCH v3 16/17] bindings: PCI: artpec: Add support for the ARTPEC-7 SoC
Date: Tue, 31 Oct 2017 23:39:34 +0100
Message-ID: <20171031223936.27549-17-niklas.cassel@axis.com>
References: <20171031223936.27549-1-niklas.cassel@axis.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171031223936.27549-1-niklas.cassel@axis.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklass@axis.com>, Jesper Nilsson <jespern@axis.com>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@axis.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The ARTPEC-6 SoC and the ARTPEC-7 SoC are very similar.
Unfortunately, some fields in the PCIECFG and PCIESTAT
register have changed.

Signed-off-by: Niklas Cassel <niklas.cassel@axis.com>
Acked-by: Rob Herring <robh@kernel.org>
---
V3:
* No change.

 Documentation/devicetree/bindings/pci/axis,artpec6-pcie.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/axis,artpec6-pcie.txt b/Documentation/devicetree/bindings/pci/axis,artpec6-pcie.txt
index 33eef7ae5a23..979dc7b6cfe8 100644
--- a/Documentation/devicetree/bindings/pci/axis,artpec6-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/axis,artpec6-pcie.txt
@@ -6,6 +6,8 @@ and thus inherits all the common properties defined in designware-pcie.txt.
 Required properties:
 - compatible: "axis,artpec6-pcie", "snps,dw-pcie" for ARTPEC-6 in RC mode;
 	      "axis,artpec6-pcie-ep", "snps,dw-pcie" for ARTPEC-6 in EP mode;
+	      "axis,artpec7-pcie", "snps,dw-pcie" for ARTPEC-7 in RC mode;
+	      "axis,artpec7-pcie-ep", "snps,dw-pcie" for ARTPEC-7 in EP mode;
 - reg: base addresses and lengths of the PCIe controller (DBI),
 	the PHY controller, and configuration address space.
 - reg-names: Must include the following entries:
-- 
2.14.2
