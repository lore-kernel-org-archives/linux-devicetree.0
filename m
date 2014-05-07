From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH 1/3] devicetree: set bus type same as parent
Date: Tue, 06 May 2014 17:51:12 -0700
Message-ID: <53698380.1060006@gmail.com>
References: <536982E3.10303@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <536982E3.10303-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

This is a somewhat scary patch since it touches a path that is central to
device creation based on the device tree.  It should not be applied without
careful consideration.

I am not sure if this patch is a good idea, even if it does not break
anything.

An issue with the path of SPMI nodes under /sys/bus/... was reported in
https://lkml.org/lkml/2014/4/23/312.  The symptom is that two different
grandchild nodes of the spmi with the same node-name@unit-address will
result in attempting to create duplicate links at
/sys/bus/platform/devices/unit-address.node-name.  It turns out that the
specific example provided might not be an expected configuration for
current hardware, but the reported trap remains an issue.

The common pattern exposed is a driver probe function calling
of_platform_populate() to create child devices.  As the reporting
email noted, the devices are created with dev.bus set to
platform_bus_type.  Thus all devices created via this pattern will
result in a link in /sys/bus/platform/devices/, with the risk that
a name collision will occur.

This patch reduces the scope of possible name collisions to devices
on the same bus type.  This is still not ideal, because a legal
device tree source file can result in run time errors.  In the case
of SPMI nodes, the collisions will occur in /bus/spmi/devices/.

I have not investigated whether other drivers would be negatively impacted
by this change - there are 26 drivers in tree that call of_platform_populate().

Signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
---
 drivers/of/platform.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

Index: b/drivers/of/platform.c
===================================================================
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -217,7 +217,10 @@ static struct platform_device *of_platfo
 	dev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
 	if (!dev->dev.dma_mask)
 		dev->dev.dma_mask = &dev->dev.coherent_dma_mask;
-	dev->dev.bus = &platform_bus_type;
+	if (parent && parent->bus)
+		dev->dev.bus = parent->bus;
+	else
+		dev->dev.bus = &platform_bus_type;
 	dev->dev.platform_data = platform_data;
 
 	/* We do not fill the DMA ops for platform devices by default.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
