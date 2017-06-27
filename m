From: Al Cooper <alcooperx@gmail.com>
Subject: [PATCH 7/8] usb: bdc: fix "xsf for ep not enabled" errror
Date: Tue, 27 Jun 2017 14:23:25 -0400
Message-ID: <1498587806-24781-8-git-send-email-alcooperx@gmail.com>
References: <1498587806-24781-1-git-send-email-alcooperx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1498587806-24781-1-git-send-email-alcooperx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Al Cooper <alcooperx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, yuan linyu <Linyu.Yuan@alcatel-sbell.com.cn>, Florian Fainelli <f.fainelli@gmail.com>, "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

This patch essentially clears the port status change bits at the
correct times. It is necessary because the driver was not handling
the change bits correctly for events during device
connection/disconnection and bus enumeration. So, one of them (PCC)
was left stuck sometimes causing the "xsf for ep not enabled"
error we get on first connection. This was found by the Android team.
This was debugged and fixed by Sasi Kumar.

Signed-off-by: Al Cooper <alcooperx@gmail.com>
---
 drivers/usb/gadget/udc/bdc/bdc_udc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc_udc.c b/drivers/usb/gadget/udc/bdc/bdc_udc.c
index aae7458..c843461 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_udc.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_udc.c
@@ -249,6 +249,7 @@ void bdc_sr_uspc(struct bdc *bdc, struct bdc_sr *sreport)
 			disconn = true;
 		else if ((uspc & BDC_PCS) && !BDC_PST(uspc))
 			connected = true;
+		clear_flags |= BDC_PCC;
 	}
 
 	/* Change in VBus and VBus is present */
@@ -259,16 +260,16 @@ void bdc_sr_uspc(struct bdc *bdc, struct bdc_sr *sreport)
 			bdc_softconn(bdc);
 			usb_gadget_set_state(&bdc->gadget, USB_STATE_POWERED);
 		}
-		clear_flags = BDC_VBC;
+		clear_flags |= BDC_VBC;
 	} else if ((uspc & BDC_PRS) || (uspc & BDC_PRC) || disconn) {
 		/* Hot reset, warm reset, 2.0 bus reset or disconn */
 		dev_dbg(bdc->dev, "Port reset or disconn\n");
 		bdc_uspc_disconnected(bdc, disconn);
-		clear_flags = BDC_PCC|BDC_PCS|BDC_PRS|BDC_PRC;
+		clear_flags |= BDC_PRC;
 	} else if ((uspc & BDC_PSC) && (uspc & BDC_PCS)) {
 		/* Change in Link state */
 		handle_link_state_change(bdc, uspc);
-		clear_flags = BDC_PSC|BDC_PCS;
+		clear_flags |= BDC_PSC;
 	}
 
 	/*
-- 
1.9.0.138.g2de3478
