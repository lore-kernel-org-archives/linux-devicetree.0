From: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch v2] nouveau: unwind on load errors
Date: Fri, 30 Jul 2010 17:04:32 +0200
Message-ID: <20100730150432.GC26313@bicker>
References: <20100729180231.GV26313@bicker> <20100729193948.GA4821@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20100729193948.GA4821-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>, Marcin =?utf-8?Q?Ko=C5=9Bcielnicki?= <koriakin-mP9o5jsk0RY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

nuveau_load() just returned directly if there was an error instead of                                                       
releasing resources.                                                                                                         

Signed-off-by: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
V2: updated to the nouveau git tree.

diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index ee3729e..cf16bfb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -739,8 +739,10 @@ int nouveau_load(struct drm_device *dev, unsigned long flags)
 	int ret;
 
 	dev_priv = kzalloc(sizeof(*dev_priv), GFP_KERNEL);
-	if (!dev_priv)
-		return -ENOMEM;
+	if (!dev_priv) {
+		ret = -ENOMEM;
+		goto err_out;
+	}
 	dev->dev_private = dev_priv;
 	dev_priv->dev = dev;
 
@@ -750,8 +752,10 @@ int nouveau_load(struct drm_device *dev, unsigned long flags)
 		 dev->pci_vendor, dev->pci_device, dev->pdev->class);
 
 	dev_priv->wq = create_workqueue("nouveau");
-	if (!dev_priv->wq)
-		return -EINVAL;
+	if (!dev_priv->wq) {
+		ret = -EINVAL;
+		goto err_priv;
+	}
 
 	/* resource 0 is mmio regs */
 	/* resource 1 is linear FB */
@@ -764,7 +768,8 @@ int nouveau_load(struct drm_device *dev, unsigned long flags)
 	if (!dev_priv->mmio) {
 		NV_ERROR(dev, "Unable to initialize the mmio mapping. "
 			 "Please report your setup to " DRIVER_EMAIL "\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_wq;
 	}
 	NV_DEBUG(dev, "regs mapped ok at 0x%llx\n",
 					(unsigned long long)mmio_start_offs);
@@ -812,7 +817,8 @@ int nouveau_load(struct drm_device *dev, unsigned long flags)
 		break;
 	default:
 		NV_INFO(dev, "Unsupported chipset 0x%08x\n", reg0);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_mmio;
 	}
 
 	NV_INFO(dev, "Detected an NV%2x generation card (0x%08x)\n",
@@ -820,7 +826,7 @@ int nouveau_load(struct drm_device *dev, unsigned long flags)
 
 	ret = nouveau_remove_conflicting_drivers(dev);
 	if (ret)
-		return ret;
+		goto err_mmio;
 
 	/* Map PRAMIN BAR, or on older cards, the aperture withing BAR0 */
 	if (dev_priv->card_type >= NV_40) {
@@ -834,7 +840,8 @@ int nouveau_load(struct drm_device *dev, unsigned long flags)
 				dev_priv->ramin_size);
 		if (!dev_priv->ramin) {
 			NV_ERROR(dev, "Failed to PRAMIN BAR");
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto err_mmio;
 		}
 	} else {
 		dev_priv->ramin_size = 1 * 1024 * 1024;
@@ -842,7 +849,8 @@ int nouveau_load(struct drm_device *dev, unsigned long flags)
 					  dev_priv->ramin_size);
 		if (!dev_priv->ramin) {
 			NV_ERROR(dev, "Failed to map BAR0 PRAMIN.\n");
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto err_mmio;
 		}
 	}
 
@@ -857,9 +865,21 @@ int nouveau_load(struct drm_device *dev, unsigned long flags)
 	/* For kernel modesetting, init card now and bring up fbcon */
 	ret = nouveau_card_init(dev);
 	if (ret)
-		return ret;
+		goto err_ramin;
 
 	return 0;
+
+err_ramin:
+	iounmap(dev_priv->ramin);
+err_mmio:
+	iounmap(dev_priv->mmio);
+err_wq:
+	destroy_workqueue(dev_priv->wq);
+err_priv:
+	kfree(dev_priv);
+	dev->dev_private = NULL;
+err_out:
+	return ret;
 }
 
 void nouveau_lastclose(struct drm_device *dev)
