From: Alexander Holler <holler@ahsoftware.de>
Subject: [PATCH 14/16] deps: WIP: kirkwood: annotate some initcalls
Date: Wed, 26 Aug 2015 14:28:26 +0200
Message-ID: <1440592108-3740-15-git-send-email-holler@ahsoftware.de>
References: <1440592108-3740-1-git-send-email-holler@ahsoftware.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440592108-3740-1-git-send-email-holler@ahsoftware.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>, Russel King <linux@arm.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Grant Likely <grant.likely@linaro.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Alexander Holler <holler@ahsoftware.de>
List-Id: devicetree@vger.kernel.org

WIP means Work In Progress.

Change some kirkwood drivers to offer annotated initcalls.

Signed-off-by: Alexander Holler <holler@ahsoftware.de>
---
 drivers/dma/mv_xor.c                       | 2 +-
 drivers/net/ethernet/marvell/mv643xx_eth.c | 3 ++-
 drivers/usb/host/ehci-orion.c              | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
index f1325f6..e766ab2 100644
--- a/drivers/dma/mv_xor.c
+++ b/drivers/dma/mv_xor.c
@@ -1295,7 +1295,7 @@ static int __init mv_xor_init(void)
 {
 	return platform_driver_register(&mv_xor_driver);
 }
-module_init(mv_xor_init);
+annotated_module_init(mv_xor_init, mv_xor_driver.driver);
 
 /* it's currently unsafe to unload this module */
 #if 0
diff --git a/drivers/net/ethernet/marvell/mv643xx_eth.c b/drivers/net/ethernet/marvell/mv643xx_eth.c
index d52639b..5eec4d8 100644
--- a/drivers/net/ethernet/marvell/mv643xx_eth.c
+++ b/drivers/net/ethernet/marvell/mv643xx_eth.c
@@ -3239,7 +3239,8 @@ static int __init mv643xx_eth_init_module(void)
 
 	return rc;
 }
-module_init(mv643xx_eth_init_module);
+annotated_module_init(mv643xx_eth_init_module,
+		      mv643xx_eth_shared_driver.driver);
 
 static void __exit mv643xx_eth_cleanup_module(void)
 {
diff --git a/drivers/usb/host/ehci-orion.c b/drivers/usb/host/ehci-orion.c
index bfcbb9a..28f8793 100644
--- a/drivers/usb/host/ehci-orion.c
+++ b/drivers/usb/host/ehci-orion.c
@@ -333,7 +333,7 @@ static int __init ehci_orion_init(void)
 	ehci_init_driver(&ehci_orion_hc_driver, &orion_overrides);
 	return platform_driver_register(&ehci_orion_driver);
 }
-module_init(ehci_orion_init);
+annotated_module_init(ehci_orion_init, ehci_orion_driver.driver);
 
 static void __exit ehci_orion_cleanup(void)
 {
-- 
2.1.0
