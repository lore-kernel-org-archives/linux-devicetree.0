Return-Path: <SRS0=Rw9b=HW=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: [PATCH v3 5/5] DT: pci: rcar-pci: document R8A77980 bindings
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
References: <b98130a7-b128-9fc3-aee1-1a5a2590b320@cogentembedded.com>
Message-ID: <eb928983-475a-c238-5a44-505c07472b93@cogentembedded.com>
Date: Thu, 3 May 2018 22:44:58 +0300
MIME-Version: 1.0
In-Reply-To: <b98130a7-b128-9fc3-aee1-1a5a2590b320@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: horms@verge.net.au, bhelgaas@google.com, linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Document the R-Car V3H (R8A77980) SoC in the R-Car PCIe bindings.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- new patch.

 Documentation/devicetree/bindings/pci/rcar-pci.txt |    1 +
 1 file changed, 1 insertion(+)

Index: pci/Documentation/devicetree/bindings/pci/rcar-pci.txt
===================================================================
--- pci.orig/Documentation/devicetree/bindings/pci/rcar-pci.txt
+++ pci/Documentation/devicetree/bindings/pci/rcar-pci.txt
@@ -8,6 +8,7 @@ compatible: "renesas,pcie-r8a7743" for t
 	    "renesas,pcie-r8a7793" for the R8A7793 SoC;
 	    "renesas,pcie-r8a7795" for the R8A7795 SoC;
 	    "renesas,pcie-r8a7796" for the R8A7796 SoC;
+	    "renesas,pcie-r8a77980" for the R8A77980 SoC;
 	    "renesas,pcie-rcar-gen2" for a generic R-Car Gen2 or
 				     RZ/G1 compatible device.
 	    "renesas,pcie-rcar-gen3" for a generic R-Car Gen3 compatible device.
