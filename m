From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH] of: address.c header comment typo
Date: Tue, 20 Jun 2017 16:50:11 -0700
Message-ID: <1498002611-13011-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

Fix typo in header comment for of_address_to_resource()

Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
---
 drivers/of/address.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 72914cdfce2a..580bbf6ca2b1 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -710,7 +710,7 @@ static int __of_address_to_resource(struct device_node *dev,
  *
  * Note that if your address is a PIO address, the conversion will fail if
  * the physical address can't be internally converted to an IO token with
- * pci_address_to_pio(), that is because it's either called to early or it
+ * pci_address_to_pio(), that is because it's either called too early or it
  * can't be matched to any host bridge IO space
  */
 int of_address_to_resource(struct device_node *dev, int index,
-- 
Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
