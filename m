Return-Path: <SRS0=/m6R=G5=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: [PATCH v2 5/5] DT: pci: rcar-pci: document R8A77980 bindings
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
References: <26e803ca-06b6-28c5-b87c-fc639b322d6f@cogentembedded.com>
Message-ID: <461a6029-1e03-a292-62d2-aca7de274de6@cogentembedded.com>
Date: Sun, 8 Apr 2018 21:10:43 +0300
MIME-Version: 1.0
In-Reply-To: <26e803ca-06b6-28c5-b87c-fc639b322d6f@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: horms@verge.net.au, bhelgaas@google.com, linux-pci@vger.kernel.org, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
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
