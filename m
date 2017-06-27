From: Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/8] usb: gadget: bdc: Fix misleading register names
Date: Tue, 27 Jun 2017 14:23:19 -0400
Message-ID: <1498587806-24781-2-git-send-email-alcooperx@gmail.com>
References: <1498587806-24781-1-git-send-email-alcooperx@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1498587806-24781-1-git-send-email-alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, yuan linyu <Linyu.Yuan-cfy2TCaE7SHLM0G2K2Xlo2/U75nxZMCp@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:USB SUBSYSTEM" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

The BDC endpoint status registers 0-7 were originally each going
to be an array of regsiters. This was later changed to being a
single register. The register definitions are being changed from:
"#define BDC_EPSTS0(n)  (0x60 + (n * 0x10))"
to
"#define BDC_EPSTS0	0x60"
to reflect this change and to avoid future coding mistakes.

Signed-off-by: Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/usb/gadget/udc/bdc/bdc.h     | 16 ++++++++--------
 drivers/usb/gadget/udc/bdc/bdc_dbg.c | 16 ++++++++--------
 drivers/usb/gadget/udc/bdc/bdc_ep.c  |  4 ++--
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc.h b/drivers/usb/gadget/udc/bdc/bdc.h
index 916d471..3664808 100644
--- a/drivers/usb/gadget/udc/bdc/bdc.h
+++ b/drivers/usb/gadget/udc/bdc/bdc.h
@@ -83,14 +83,14 @@
 
 #define BDC_DVCSA	0x50
 #define BDC_DVCSB	0x54
-#define BDC_EPSTS0(n)	(0x60 + (n * 0x10))
-#define BDC_EPSTS1(n)	(0x64 + (n * 0x10))
-#define BDC_EPSTS2(n)	(0x68 + (n * 0x10))
-#define BDC_EPSTS3(n)	(0x6c + (n * 0x10))
-#define BDC_EPSTS4(n)	(0x70 + (n * 0x10))
-#define BDC_EPSTS5(n)	(0x74 + (n * 0x10))
-#define BDC_EPSTS6(n)	(0x78 + (n * 0x10))
-#define BDC_EPSTS7(n)	(0x7c + (n * 0x10))
+#define BDC_EPSTS0	0x60
+#define BDC_EPSTS1	0x64
+#define BDC_EPSTS2	0x68
+#define BDC_EPSTS3	0x6c
+#define BDC_EPSTS4	0x70
+#define BDC_EPSTS5	0x74
+#define BDC_EPSTS6	0x78
+#define BDC_EPSTS7	0x7c
 #define BDC_SRRBAL(n)	(0x200 + (n * 0x10))
 #define BDC_SRRBAH(n)	(0x204 + (n * 0x10))
 #define BDC_SRRINT(n)	(0x208 + (n * 0x10))
diff --git a/drivers/usb/gadget/udc/bdc/bdc_dbg.c b/drivers/usb/gadget/udc/bdc/bdc_dbg.c
index 5945dbc..ac98f6f 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_dbg.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_dbg.c
@@ -40,28 +40,28 @@ void bdc_dump_epsts(struct bdc *bdc)
 {
 	u32 temp;
 
-	temp = bdc_readl(bdc->regs, BDC_EPSTS0(0));
+	temp = bdc_readl(bdc->regs, BDC_EPSTS0);
 	dev_vdbg(bdc->dev, "BDC_EPSTS0:0x%08x\n", temp);
 
-	temp = bdc_readl(bdc->regs, BDC_EPSTS1(0));
+	temp = bdc_readl(bdc->regs, BDC_EPSTS1);
 	dev_vdbg(bdc->dev, "BDC_EPSTS1:0x%x\n", temp);
 
-	temp = bdc_readl(bdc->regs, BDC_EPSTS2(0));
+	temp = bdc_readl(bdc->regs, BDC_EPSTS2);
 	dev_vdbg(bdc->dev, "BDC_EPSTS2:0x%08x\n", temp);
 
-	temp = bdc_readl(bdc->regs, BDC_EPSTS3(0));
+	temp = bdc_readl(bdc->regs, BDC_EPSTS3);
 	dev_vdbg(bdc->dev, "BDC_EPSTS3:0x%08x\n", temp);
 
-	temp = bdc_readl(bdc->regs, BDC_EPSTS4(0));
+	temp = bdc_readl(bdc->regs, BDC_EPSTS4);
 	dev_vdbg(bdc->dev, "BDC_EPSTS4:0x%08x\n", temp);
 
-	temp = bdc_readl(bdc->regs, BDC_EPSTS5(0));
+	temp = bdc_readl(bdc->regs, BDC_EPSTS5);
 	dev_vdbg(bdc->dev, "BDC_EPSTS5:0x%08x\n", temp);
 
-	temp = bdc_readl(bdc->regs, BDC_EPSTS6(0));
+	temp = bdc_readl(bdc->regs, BDC_EPSTS6);
 	dev_vdbg(bdc->dev, "BDC_EPSTS6:0x%08x\n", temp);
 
-	temp = bdc_readl(bdc->regs, BDC_EPSTS7(0));
+	temp = bdc_readl(bdc->regs, BDC_EPSTS7);
 	dev_vdbg(bdc->dev, "BDC_EPSTS7:0x%08x\n", temp);
 }
 
diff --git a/drivers/usb/gadget/udc/bdc/bdc_ep.c b/drivers/usb/gadget/udc/bdc/bdc_ep.c
index ff1ef24..bfd8f7a 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_ep.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_ep.c
@@ -777,9 +777,9 @@ static int ep_dequeue(struct bdc_ep *ep, struct bdc_req *req)
 	 */
 
 	/* The current hw dequeue pointer */
-	tmp_32 = bdc_readl(bdc->regs, BDC_EPSTS0(0));
+	tmp_32 = bdc_readl(bdc->regs, BDC_EPSTS0);
 	deq_ptr_64 = tmp_32;
-	tmp_32 = bdc_readl(bdc->regs, BDC_EPSTS1(0));
+	tmp_32 = bdc_readl(bdc->regs, BDC_EPSTS1);
 	deq_ptr_64 |= ((u64)tmp_32 << 32);
 
 	/* we have the dma addr of next bd that will be fetched by hardware */
-- 
1.9.0.138.g2de3478

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
