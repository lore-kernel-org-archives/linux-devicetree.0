From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/3] usb: gadget: udc: renesas_usb3: move pm_runtime_{en,dis}able()
Date: Fri, 29 Sep 2017 20:44:59 +0900
Message-ID: <1506685501-24988-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1506685501-24988-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1506685501-24988-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>

This patch moves pm_runtime_{en,dis}able() call timing to
renesas_usb3_{probe,remove}() for supporting PM_SLEEP feature in
the future.

Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
[shimoda: Revise the commit log]
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index df37c1e..7d99774 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -2228,7 +2228,6 @@ static int renesas_usb3_start(struct usb_gadget *gadget,
 	/* hook up the driver */
 	usb3->driver = driver;
 
-	pm_runtime_enable(usb3_to_dev(usb3));
 	pm_runtime_get_sync(usb3_to_dev(usb3));
 
 	renesas_usb3_init_controller(usb3);
@@ -2246,7 +2245,6 @@ static int renesas_usb3_stop(struct usb_gadget *gadget)
 	renesas_usb3_stop_controller(usb3);
 
 	pm_runtime_put(usb3_to_dev(usb3));
-	pm_runtime_disable(usb3_to_dev(usb3));
 
 	return 0;
 }
@@ -2394,6 +2392,7 @@ static int renesas_usb3_remove(struct platform_device *pdev)
 	renesas_usb3_dma_free_prd(usb3, &pdev->dev);
 
 	__renesas_usb3_ep_free_request(usb3->ep0_req);
+	pm_runtime_disable(usb3_to_dev(usb3));
 
 	return 0;
 }
@@ -2629,6 +2628,7 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 	renesas_usb3_debugfs_init(usb3, &pdev->dev);
 
 	dev_info(&pdev->dev, "probed\n");
+	pm_runtime_enable(usb3_to_dev(usb3));
 
 	return 0;
 
-- 
1.9.1
