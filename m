From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH v2 10/18] usb: host: xhci-plat: Add support for the Armada 375
Date: Fri, 25 Apr 2014 16:07:08 +0200
Message-ID: <1398434836-18908-11-git-send-email-gregory.clement@free-electrons.com>
References: <1398434836-18908-1-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1398434836-18908-1-git-send-email-gregory.clement@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>, devicetree@vger.kernel.org, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

For the Armada 375 SoC which comes with an xhci controller. Currently
the quirk is the same that the Armada 380/385 one, but by introducing
a new compatible string it will allow to make the driver evolve
seamless.

Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 drivers/usb/host/xhci-plat.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index c0e835b49e0d..679b21f30458 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -152,6 +152,9 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	if (of_device_is_compatible(pdev->dev.of_node, "marvell,armada-380-xhci"))
 		xhci_mvebu_mbus_init_quirk(pdev);
 
+	if (of_device_is_compatible(pdev->dev.of_node, "marvell,armada-375-xhci"))
+		xhci_mvebu_mbus_init_quirk(pdev);
+
 	/* Initialize dma_mask and coherent_dma_mask to 32-bits */
 	ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
 	if (ret)
@@ -284,6 +287,7 @@ static const struct of_device_id usb_xhci_of_match[] = {
 	{ .compatible = "generic-xhci" },
 	{ .compatible = "xhci-platform" },
 	{ .compatible = "marvell,armada-380-xhci"},
+	{ .compatible = "marvell,armada-375-xhci"},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, usb_xhci_of_match);
-- 
1.8.1.2
