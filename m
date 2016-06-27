From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/3] usb: renesas_usbhs: show error code when probe failed
Date: Mon, 27 Jun 2016 21:09:18 +0900
Message-ID: <1467029359-6812-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1467029359-6812-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1467029359-6812-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

To know why the driver probing failed, this patch shows error code.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index baeb7d2..8fbbc2d 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -697,7 +697,7 @@ probe_end_fifo_exit:
 probe_end_pipe_exit:
 	usbhs_pipe_remove(priv);
 
-	dev_info(&pdev->dev, "probe failed\n");
+	dev_info(&pdev->dev, "probe failed (%d)\n", ret);
 
 	return ret;
 }
-- 
1.9.1
