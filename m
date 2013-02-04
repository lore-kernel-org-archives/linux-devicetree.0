From: Roger Quadros <rogerq@ti.com>
Subject: [PATCH 06/13] USB: ohci-omap3: Get platform resources by index rather than by name
Date: Mon, 4 Feb 2013 17:58:53 +0200
Message-ID: <1359993540-20780-7-git-send-email-rogerq@ti.com>
References: <1359993540-20780-1-git-send-email-rogerq@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1359993540-20780-1-git-send-email-rogerq@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: tony@atomide.com
Cc: b-cousson@ti.com, balbi@ti.com, stern@rowland.harvard.edu, linux@arm.linux.org.uk, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, rogerq@ti.com, devicetree-discuss@lists.ozlabs.org, rnayak@ti.com, paul@pwsan.com
List-Id: devicetree@vger.kernel.org

Since there is only one resource per type we don't really need
to use resource name to obtain it. This also also makes it easier
for device tree adaptation.

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 drivers/usb/host/ohci-omap3.c |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/ohci-omap3.c b/drivers/usb/host/ohci-omap3.c
index eb35d96..5ed28c5 100644
--- a/drivers/usb/host/ohci-omap3.c
+++ b/drivers/usb/host/ohci-omap3.c
@@ -141,14 +141,13 @@ static int ohci_hcd_omap3_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	irq = platform_get_irq_byname(pdev, "ohci-irq");
+	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		dev_err(dev, "OHCI irq failed\n");
 		return -ENODEV;
 	}
 
-	res = platform_get_resource_byname(pdev,
-				IORESOURCE_MEM, "ohci");
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
 		dev_err(dev, "UHH OHCI get resource failed\n");
 		return -ENOMEM;
-- 
1.7.4.1

