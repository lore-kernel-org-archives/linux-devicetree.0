From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] of/usb: fix build error due to of_node pointer move
Date: Wed, 02 Jun 2010 13:47:16 -0600
Message-ID: <20100602194022.6780.28819.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, John Linn <john.linn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Fix driver to use new location of of_node pointer (introduced by commit
use new location of of_node pointer (introduced by commit
61c7a080a5a061c976988fd4b844dfb468dda255; of: Always use 'struct
device.of_node' to get device node pointer)

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Reported-by: John Linn <john.linn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
CC: Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>
CC: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
CC: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
CC: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
---

I've applied this patch to my merge-devicetree branch

 drivers/usb/host/ehci-xilinx-of.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/host/ehci-xilinx-of.c b/drivers/usb/host/ehci-xilinx-of.c
index 013972b..4899f45 100644
--- a/drivers/usb/host/ehci-xilinx-of.c
+++ b/drivers/usb/host/ehci-xilinx-of.c
@@ -151,7 +151,7 @@ static const struct hc_driver ehci_xilinx_of_hc_driver = {
 static int __devinit
 ehci_hcd_xilinx_of_probe(struct of_device *op, const struct of_device_id *match)
 {
-	struct device_node *dn = op->node;
+	struct device_node *dn = op->dev.of_node;
 	struct usb_hcd *hcd;
 	struct ehci_hcd	*ehci;
 	struct resource res;

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
