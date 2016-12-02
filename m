From: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: [PATCH v2 2/3 pci/next] PCI: rcar: Use gen2 fallback compatibility last
Date: Fri,  2 Dec 2016 11:36:59 +0100
Message-ID: <1480675020-26346-3-git-send-email-horms+renesas@verge.net.au>
References: <1480675020-26346-1-git-send-email-horms+renesas@verge.net.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480675020-26346-1-git-send-email-horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Phil Edworthy <phil.edworthy-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Fallback compatibility strings should be used only if more specific ones
are matched and the order of compatibility strings in the corresponding
struct of_device_id should implement this.

This does not have a run-time effect as current all relevant compatibility
strings result in the same initialisation.

Signed-off-by: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
---
v2
* New patch
---
 drivers/pci/host/pcie-rcar.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/host/pcie-rcar.c b/drivers/pci/host/pcie-rcar.c
index 62700d1896f4..85971bc276c6 100644
--- a/drivers/pci/host/pcie-rcar.c
+++ b/drivers/pci/host/pcie-rcar.c
@@ -1071,12 +1071,12 @@ static int rcar_pcie_parse_map_dma_ranges(struct rcar_pcie *pcie,
 
 static const struct of_device_id rcar_pcie_of_match[] = {
 	{ .compatible = "renesas,pcie-r8a7779", .data = rcar_pcie_hw_init_h1 },
-	{ .compatible = "renesas,pcie-rcar-gen2",
-	  .data = rcar_pcie_hw_init_gen2 },
 	{ .compatible = "renesas,pcie-r8a7790",
 	  .data = rcar_pcie_hw_init_gen2 },
 	{ .compatible = "renesas,pcie-r8a7791",
 	  .data = rcar_pcie_hw_init_gen2 },
+	{ .compatible = "renesas,pcie-rcar-gen2",
+	  .data = rcar_pcie_hw_init_gen2 },
 	{ .compatible = "renesas,pcie-r8a7795", .data = rcar_pcie_hw_init },
 	{},
 };
-- 
2.7.0.rc3.207.g0ac5344

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
