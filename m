From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 2/2] vfio: platform: Add generic DT reset support
Date: Tue, 13 Feb 2018 17:36:55 +0100
Message-ID: <1518539815-13774-3-git-send-email-geert+renesas@glider.be>
References: <1518539815-13774-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518539815-13774-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baptiste Reynal <b.reynal-lrHrjnjw1UfHK3s98zE1ajGjJy/sRE9J@public.gmane.org>, Alex Williamson <alex.williamson-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, kvm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Vfio-platform requires reset support, provided either by ACPI, or, on DT
platforms, by a device-specific reset driver matching against the
device's compatible value.

On many SoCs, devices are connected to an SoC-internal reset controller,
and can be reset in a generic way.  Hence add support to reset such
devices using the reset controller subsystem, provided the reset
hierarchy is described correctly in DT using the "resets" property.

Devices that require a more complex reset procedure can still
provide a device-specific reset driver, as that takes precedence.

Note that this functionality depends on CONFIG_RESET_CONTROLLER=y, and
becomes a no-op if reset controller support is disabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
 drivers/vfio/platform/vfio_platform_common.c  | 23 +++++++++++++++++++++--
 drivers/vfio/platform/vfio_platform_private.h |  1 +
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/vfio/platform/vfio_platform_common.c b/drivers/vfio/platform/vfio_platform_common.c
index b60bb5326668498c..5d1e48f96e423508 100644
--- a/drivers/vfio/platform/vfio_platform_common.c
+++ b/drivers/vfio/platform/vfio_platform_common.c
@@ -17,6 +17,7 @@
 #include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
@@ -112,7 +113,13 @@ static bool vfio_platform_has_reset(struct vfio_platform_device *vdev)
 	if (VFIO_PLATFORM_IS_ACPI(vdev))
 		return vfio_platform_acpi_has_reset(vdev);
 
-	return vdev->of_reset ? true : false;
+	if (vdev->of_reset)
+		return true;
+
+	if (!IS_ERR_OR_NULL(vdev->reset_control))
+		return true;
+
+	return false;
 }
 
 static int vfio_platform_get_reset(struct vfio_platform_device *vdev)
@@ -127,8 +134,15 @@ static int vfio_platform_get_reset(struct vfio_platform_device *vdev)
 		vdev->of_reset = vfio_platform_lookup_reset(vdev->compat,
 							&vdev->reset_module);
 	}
+	if (vdev->of_reset)
+		return 0;
+
+	vdev->reset_control = __of_reset_control_get(vdev->device->of_node,
+						     NULL, 0, false, false);
+	if (!IS_ERR(vdev->reset_control))
+		return 0;
 
-	return vdev->of_reset ? 0 : -ENOENT;
+	return PTR_ERR(vdev->reset_control);
 }
 
 static void vfio_platform_put_reset(struct vfio_platform_device *vdev)
@@ -138,6 +152,8 @@ static void vfio_platform_put_reset(struct vfio_platform_device *vdev)
 
 	if (vdev->of_reset)
 		module_put(vdev->reset_module);
+
+	reset_control_put(vdev->reset_control);
 }
 
 static int vfio_platform_regions_init(struct vfio_platform_device *vdev)
@@ -217,6 +233,9 @@ static int vfio_platform_call_reset(struct vfio_platform_device *vdev,
 	} else if (vdev->of_reset) {
 		dev_info(vdev->device, "reset\n");
 		return vdev->of_reset(vdev);
+	} else if (!IS_ERR_OR_NULL(vdev->reset_control)) {
+		dev_info(vdev->device, "reset\n");
+		return reset_control_reset(vdev->reset_control);
 	}
 
 	dev_warn(vdev->device, "no reset function found!\n");
diff --git a/drivers/vfio/platform/vfio_platform_private.h b/drivers/vfio/platform/vfio_platform_private.h
index 85ffe5d9d1abd94e..a56e80ae5986540b 100644
--- a/drivers/vfio/platform/vfio_platform_private.h
+++ b/drivers/vfio/platform/vfio_platform_private.h
@@ -60,6 +60,7 @@ struct vfio_platform_device {
 	const char			*compat;
 	const char			*acpihid;
 	struct module			*reset_module;
+	struct reset_control		*reset_control;
 	struct device			*device;
 
 	/*
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
