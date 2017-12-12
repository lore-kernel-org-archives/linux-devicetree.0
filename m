From: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 2/2] usb: host: xhci-plat: enable XHCI_MISSING_CAS if platform requested
Date: Tue, 12 Dec 2017 11:57:18 +0800
Message-ID: <1513051038-20311-2-git-send-email-jun.li@nxp.com>
References: <1513051038-20311-1-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513051038-20311-1-git-send-email-jun.li-3arQi8VN3Tc@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In case there is CAS missing if device plugged in S3, we can use
'usb3-resume-missing-cas' device property to enable quirk flag
XHCI_MISSING_CAS.

Signed-off-by: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
---
 drivers/usb/host/xhci-plat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 6f03830..4ec711c 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -269,6 +269,9 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	if (device_property_read_bool(&pdev->dev, "quirk-broken-port-ped"))
 		xhci->quirks |= XHCI_BROKEN_PORT_PED;
 
+	if (device_property_read_bool(sysdev, "usb3-resume-missing-cas"))
+		xhci->quirks |= XHCI_MISSING_CAS;
+
 	/* imod_interval is the interrupt moderation value in nanoseconds. */
 	xhci->imod_interval = 40000;
 	device_property_read_u32(sysdev, "imod-interval-ns",
-- 
2.6.6

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
