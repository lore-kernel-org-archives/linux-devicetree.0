From: Daniel Drake <dsd@laptop.org>
Subject: [PATCH 2/3] mfd: link vx855 GPIO cell with device tree
Date: Wed, 21 Sep 2011 13:02:07 +0100 (BST)
Message-ID: <20110921120207.AD6719D401D__3936.54086296937$1316610138$gmane$org@zog.reactivated.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: grant.likely@secretlab.ca, sameo@linux.intel.com
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dilinger@queued.net
List-Id: devicetree@vger.kernel.org

The child driver will then pass the handle to gpiolib, which
enables device-tree-probed gpio-leds and more.

Signed-off-by: Daniel Drake <dsd@laptop.org>
---
 drivers/mfd/vx855.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/drivers/mfd/vx855.c b/drivers/mfd/vx855.c
index d698703..6466c21 100644
--- a/drivers/mfd/vx855.c
+++ b/drivers/mfd/vx855.c
@@ -101,6 +101,11 @@ static __devinit int vx855_probe(struct pci_dev *pdev,
 	vx855_gpio_resources[1].start = gpio_io_offset + VX855_PMIO_R_GPO;
 	vx855_gpio_resources[1].end = vx855_gpio_resources[1].start + 3;
 
+#ifdef CONFIG_OF_GPIO
+	vx855_cells[0].of_node = of_find_compatible_node(NULL, NULL,
+							 "via,vx855-gpio");
+#endif
+
 	ret = mfd_add_devices(&pdev->dev, -1, vx855_cells, ARRAY_SIZE(vx855_cells),
 			NULL, 0);
 
-- 
1.7.6.2
