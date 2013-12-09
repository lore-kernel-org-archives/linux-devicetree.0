From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 1/3] mfd: always assign of_node in mfd_add_device()
Date: Mon,  9 Dec 2013 15:06:47 -0700
Message-ID: <1386626809-6251-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

mfd_add_device() assigns .of_node in the device objects it creates only
if the mfd_cell for the device has the .of_compatible field set and the
DT node for the top-level MFD device contains a child whose compatible
property matches the cell's .of_compatible field.

This leaves .of_node unset in many cases. When this happens, entries in
the DT /aliases property which refer to the top-level MFD DT node will
never match the MFD child devices, hence causing the requested alias not
to be honored.

Solve this by setting each MFD child device's .of_node equal to the top-
level MFD device's .of_node field in the cases where it would otherwise
remain unset.

The first use-case for this will be aliases for the TPS6586x's RTC
device.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
The 3 patches in this series are all independent; they can be applied
to their respective subsystems in any order. I'm simply posting them as
a series to make the use-case more obvious.
---
 drivers/mfd/mfd-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
index 267649244737..32e8d47d9002 100644
--- a/drivers/mfd/mfd-core.c
+++ b/drivers/mfd/mfd-core.c
@@ -117,6 +117,8 @@ static int mfd_add_device(struct device *parent, int id,
 			}
 		}
 	}
+	if (!pdev->dev.of_node)
+		pdev->dev.of_node = parent->of_node;
 
 	if (cell->pdata_size) {
 		ret = platform_device_add_data(pdev,
-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
