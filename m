From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH_V2 2/3] usb: ohci: jz4740: add DT support
Date: Tue, 27 Jan 2015 14:02:35 +0000
Message-ID: <1422367356-38012-3-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1422367356-38012-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422367356-38012-1-git-send-email-Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

This is a simple matter of providing a match table, the probe code needs
no modification.

Signed-off-by: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/host/ohci-jz4740.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/host/ohci-jz4740.c b/drivers/usb/host/ohci-jz4740.c
index 8ddd8f5..bb69733 100644
--- a/drivers/usb/host/ohci-jz4740.c
+++ b/drivers/usb/host/ohci-jz4740.c
@@ -234,11 +234,20 @@ static int jz4740_ohci_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_OF
+static struct of_device_id jz4740_ohci_of_match[] = {
+	{ .compatible = "ingenic,jz4740-ohci", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, jz4740_ohci_of_match);
+#endif
+
 static struct platform_driver ohci_hcd_jz4740_driver = {
 	.probe = jz4740_ohci_probe,
 	.remove = jz4740_ohci_remove,
 	.driver = {
 		.name = "jz4740-ohci",
+		.of_match_table = of_match_ptr(jz4740_ohci_of_match),
 		.owner = THIS_MODULE,
 	},
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
