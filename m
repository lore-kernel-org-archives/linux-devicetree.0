From: Adam Wallis <awallis-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 2/2] usb: host: xhci-plat: check relaxed timing quirk bit
Date: Tue, 21 Nov 2017 12:18:10 -0500
Message-ID: <1511284690-3878-3-git-send-email-awallis@codeaurora.org>
References: <1511284690-3878-1-git-send-email-awallis@codeaurora.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1511284690-3878-1-git-send-email-awallis-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Check sysdev to see if the relaxed timing quirk ("quirk-relaxed-timing")
is set.

Signed-off-by: Adam Wallis <awallis-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 drivers/usb/host/xhci-plat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 09f164f..ea221f3 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -266,6 +266,9 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	if (device_property_read_bool(sysdev, "usb3-lpm-capable"))
 		xhci->quirks |= XHCI_LPM_SUPPORT;
 
+	if (device_property_read_bool(sysdev, "quirk-relaxed-timing"))
+		xhci->quirks |= XHCI_RELAXED_TIMING_QUIRK;
+
 	if (device_property_read_bool(&pdev->dev, "quirk-broken-port-ped"))
 		xhci->quirks |= XHCI_BROKEN_PORT_PED;
 
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
