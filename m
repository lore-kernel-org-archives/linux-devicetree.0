From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH] of: amba: use of_dma_configure for AMBA devices
Date: Wed, 17 Sep 2014 12:56:07 +0100
Message-ID: <90bd1ff3c93b827c12e1b3dc9ad3f227632d0f6e.1410954967.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Commit 591c1e ("of: configure the platform device dma parameters)
introduced a common mechanism to configure DMA from DT properties.
AMBA devices created from DT can take advantage of this, too.

Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
---
 drivers/of/platform.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 0197725..3b64d0b 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -160,11 +160,10 @@ EXPORT_SYMBOL(of_device_alloc);
  * can use Platform bus notifier and handle BUS_NOTIFY_ADD_DEVICE event
  * to fix up DMA configuration.
  */
-static void of_dma_configure(struct platform_device *pdev)
+static void of_dma_configure(struct device *dev)
 {
 =09u64 dma_addr, paddr, size;
 =09int ret;
-=09struct device *dev =3D &pdev->dev;
=20
 =09/*
 =09 * Set default dma-mask to 32 bit. Drivers are expected to setup
@@ -229,7 +228,7 @@ static struct platform_device *of_platform_device_creat=
e_pdata(
 =09if (!dev)
 =09=09goto err_clear_flag;
=20
-=09of_dma_configure(dev);
+=09of_dma_configure(&dev->dev);
 =09dev->dev.bus =3D &platform_bus_type;
 =09dev->dev.platform_data =3D platform_data;
=20
@@ -291,7 +290,6 @@ static struct amba_device *of_amba_device_create(struct=
 device_node *node,
 =09}
=20
 =09/* setup generic device info */
-=09dev->dev.coherent_dma_mask =3D ~0;
 =09dev->dev.of_node =3D of_node_get(node);
 =09dev->dev.parent =3D parent;
 =09dev->dev.platform_data =3D platform_data;
@@ -299,6 +297,7 @@ static struct amba_device *of_amba_device_create(struct=
 device_node *node,
 =09=09dev_set_name(&dev->dev, "%s", bus_id);
 =09else
 =09=09of_device_make_bus_id(&dev->dev);
+=09of_dma_configure(&dev->dev);
=20
 =09/* Allow the HW Peripheral ID to be overridden */
 =09prop =3D of_get_property(node, "arm,primecell-periphid", NULL);
--=20
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
