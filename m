From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v3 03/22] usb: add OTG feature options to gadget structure.
Date: Tue, 16 Jun 2015 14:51:53 +0800
Message-ID: <1434437532-23678-4-git-send-email-jun.li@freescale.com>
References: <1434437532-23678-1-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434437532-23678-1-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org, Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Macpaul Lin <macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Add ADP, HNP and SRP feature options and otg version to gadget structure.

Signed-off-by: Macpaul Lin <macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 include/linux/usb/gadget.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 4f3dfb7..814cb70 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -514,6 +514,12 @@ struct usb_gadget_ops {
  * @sg_supported: true if we can handle scatter-gather
  * @is_otg: True if the USB device port uses a Mini-AB jack, so that the
  *	gadget driver must provide a USB OTG descriptor.
+ * @adp_support: OTG device feature flag, indicating that the device
+	supports ADP at this port.
+ * @hnp_support: OTG device feature flag, indicating that the device
+	supports HNP at this port.
+ * @srp_support: OTG device feature flag, indicating that the device
+	supports SRP at this port.
  * @is_a_peripheral: False unless is_otg, the "A" end of a USB cable
  *	is in the Mini-AB jack, and HNP has been used to switch roles
  *	so that the "A" device currently acts as A-Peripheral, not A-Host.
@@ -526,6 +532,7 @@ struct usb_gadget_ops {
  * @quirk_ep_out_aligned_size: epout requires buffer size to be aligned to
  *	MaxPacketSize.
  * @is_selfpowered: if the gadget is self-powered.
+ * @otg_rev: The OTG reversion number the device is compliant to.
  *
  * Gadgets have a mostly-portable "gadget driver" implementing device
  * functions, handling all usb configurations and interfaces.  Gadget
@@ -562,12 +569,16 @@ struct usb_gadget {
 
 	unsigned			sg_supported:1;
 	unsigned			is_otg:1;
+	unsigned			adp_support:1;
+	unsigned			hnp_support:1;
+	unsigned			srp_support:1;
 	unsigned			is_a_peripheral:1;
 	unsigned			b_hnp_enable:1;
 	unsigned			a_hnp_support:1;
 	unsigned			a_alt_hnp_support:1;
 	unsigned			quirk_ep_out_aligned_size:1;
 	unsigned			is_selfpowered:1;
+	u16				otg_rev;
 };
 #define work_to_gadget(w)	(container_of((w), struct usb_gadget, work))
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
