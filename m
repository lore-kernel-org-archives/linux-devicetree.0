From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/5] PCI: mvebu: Count number of lanes
Date: Sat, 20 Sep 2014 20:06:28 +0200
Message-ID: <1411236391-422-3-git-send-email-sebastian.hesselbarth@gmail.com>
References: <1411236391-422-1-git-send-email-sebastian.hesselbarth@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411236391-422-1-git-send-email-sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Some PCIe controllers found on Armada XP SoCs can be configured as
either four single-lane x1 or one quad-lane x4 PCIe. Although we are
not (yet) interested in the physical configuration of the PCIe
controller, we will need it when proper PHY support for PCIe is added.
Adapt the driver to the amended DT semantic and count the number of
PCIe lanes.

Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> 
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org> 
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> 
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org> 
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> 
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> 
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> 
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org 
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org 
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
---
 drivers/pci/host/pci-mvebu.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/host/pci-mvebu.c b/drivers/pci/host/pci-mvebu.c
index a8c6f1a92e0f..0feee6cd395c 100644
--- a/drivers/pci/host/pci-mvebu.c
+++ b/drivers/pci/host/pci-mvebu.c
@@ -115,6 +115,7 @@ struct mvebu_pcie_port {
 	void __iomem *base;
 	u32 port;
 	u32 lane;
+	int num_lanes;
 	int devfn;
 	unsigned int mem_target;
 	unsigned int mem_attr;
@@ -982,9 +983,17 @@ static int mvebu_pcie_probe(struct platform_device *pdev)
 			continue;
 		}
 
-		if (of_property_read_u32(child, "marvell,pcie-lane",
-					 &port->lane))
+		/*
+		 * If there are multiple lanes, we are only interested in the
+		 * number of the first lane and the lane count.
+		 */
+		if (of_property_read_u32_index(child, "marvell,pcie-lane",
+					       0, &port->lane))
 			port->lane = 0;
+		port->num_lanes = of_property_count_u32_elems(child,
+						      "marvell,pcie-lane");
+		if (!port->num_lanes)
+			port->num_lanes = 1;
 
 		port->name = kasprintf(GFP_KERNEL, "pcie%d.%d",
 				       port->port, port->lane);
-- 
2.0.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
