From: Cyrille Pitchen <cyrille.pitchen-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v5 03/11] PCI: generic: fix missing call of pci_free_resource_list()
Date: Sun, 28 Jan 2018 21:40:17 +0100
Message-ID: <de9098696bd2e9c1c78e5f3a6ffc20032f14d839.1517170521.git.cyrille.pitchen@free-electrons.com>
References: <cover.1517170521.git.cyrille.pitchen@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1517170521.git.cyrille.pitchen-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
In-Reply-To: <cover.1517170521.git.cyrille.pitchen-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
References: <cover.1517170521.git.cyrille.pitchen-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, stelford-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, dgary-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, kgopi-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, eandrews-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sureshp-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyrille Pitchen <cyrille.pitchen-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Call pci_free_resource_list() from pci_host_common_probe() when probing
fails, as done inside gen_pci_init() when this later function fails.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/pci/host/pci-host-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/host/pci-host-common.c b/drivers/pci/host/pci-host-common.c
index a613ea310e76..9f27e90f578c 100644
--- a/drivers/pci/host/pci-host-common.c
+++ b/drivers/pci/host/pci-host-common.c
@@ -110,6 +110,7 @@ int pci_host_common_probe(struct platform_device *pdev,
 	ret = pci_scan_root_bus_bridge(bridge);
 	if (ret < 0) {
 		dev_err(dev, "Scanning root bridge failed");
+		pci_free_resource_list(&resources);
 		return ret;
 	}
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
