From: Cyrille Pitchen <cyrille.pitchen@free-electrons.com>
Subject: [PATCH v6 03/11] PCI: generic: fix missing call of pci_free_resource_list()
Date: Tue, 30 Jan 2018 21:56:51 +0100
Message-ID: <19fc2c448cf8f19c47225450a375af657bd2c61a.1517343502.git.cyrille.pitchen@free-electrons.com>
References: <cover.1517343502.git.cyrille.pitchen@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1517343502.git.cyrille.pitchen@free-electrons.com>
In-Reply-To: <cover.1517343502.git.cyrille.pitchen@free-electrons.com>
References: <cover.1517343502.git.cyrille.pitchen@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bhelgaas@google.com, kishon@ti.com, lorenzo.pieralisi@arm.com, linux-pci@vger.kernel.org
Cc: adouglas@cadence.com, stelford@cadence.com, dgary@cadence.com, kgopi@cadence.com, eandrews@cadence.com, thomas.petazzoni@free-electrons.com, sureshp@cadence.com, nsekhar@ti.com, linux-kernel@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, Cyrille Pitchen <cyrille.pitchen@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Call pci_free_resource_list() from pci_host_common_probe() when probing
fails, as done inside gen_pci_init() when this later function fails.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@free-electrons.com>
---
 drivers/pci/host/pci-host-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/host/pci-host-common.c b/drivers/pci/host/pci-host-common.c
index efd904d93562..10e3f5b39499 100644
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
