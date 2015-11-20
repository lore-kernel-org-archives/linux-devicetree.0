From: Tim Bird <tim.bird@sonymobile.com>
Subject: [PATCH v4 3/3] usb: chipidea: register driver as a peripheral with the phy
Date: Fri, 20 Nov 2015 15:47:20 -0800
Message-ID: <1448063240-2739-3-git-send-email-tim.bird@sonymobile.com>
References: <1448063240-2739-1-git-send-email-tim.bird@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448063240-2739-1-git-send-email-tim.bird@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter.Chen@freescale.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, balbi@ti.com, Bjorn.Andersson@sonymobile.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, tbird20d@gmail.com, tim.bird@sonymobile.com
List-Id: devicetree@vger.kernel.org

Register the chipidea driver with the phy, so that the phy
driver can kick the gadget driver when it resumes from low power.
The phy-msm-usb (Qualcomm) driver requires this in order to
recover gadget operation after you disconnect the USB cable
and reconnect it.

Signed-off-by: Tim Bird <tim.bird@sonymobile.com>
---
 drivers/usb/chipidea/udc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 8223fe7..06234cd 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -1890,6 +1890,12 @@ static int udc_start(struct ci_hdrc *ci)
 
 	ci->gadget.ep0 = &ci->ep0in->ep;
 
+	if (ci->usb_phy) {
+		retval = otg_set_peripheral(ci->usb_phy->otg, &ci->gadget);
+		if (retval)
+			goto destroy_eps;
+	}
+
 	retval = usb_add_gadget_udc(dev, &ci->gadget);
 	if (retval)
 		goto destroy_eps;
-- 
1.8.2.2
