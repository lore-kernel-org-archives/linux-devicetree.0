From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: [RFC 03/18] omap3isp: Separate external link creation from platform data parsing
Date: Sat,  7 Mar 2015 23:41:00 +0200
Message-ID: <1425764475-27691-4-git-send-email-sakari.ailus@iki.fi>
References: <1425764475-27691-1-git-send-email-sakari.ailus@iki.fi>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425764475-27691-1-git-send-email-sakari.ailus-X3B1VOXEql0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Move the code which connects the external entity to an ISP entity into a
separate function. This disconnects it from parsing the platform data.

Signed-off-by: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
---
 drivers/media/platform/omap3isp/isp.c |  147 +++++++++++++++++----------------
 1 file changed, 74 insertions(+), 73 deletions(-)

diff --git a/drivers/media/platform/omap3isp/isp.c b/drivers/media/platform/omap3isp/isp.c
index 4ab674d..a607f26 100644
--- a/drivers/media/platform/omap3isp/isp.c
+++ b/drivers/media/platform/omap3isp/isp.c
@@ -1832,6 +1832,77 @@ isp_register_subdev_group(struct isp_device *isp,
 	return sensor;
 }
 
+static int isp_link_entity(
+	struct isp_device *isp, struct media_entity *entity,
+	enum isp_interface_type interface)
+{
+	struct media_entity *input;
+	unsigned int flags;
+	unsigned int pad;
+	unsigned int i;
+
+	/* Connect the sensor to the correct interface module.
+	 * Parallel sensors are connected directly to the CCDC, while
+	 * serial sensors are connected to the CSI2a, CCP2b or CSI2c
+	 * receiver through CSIPHY1 or CSIPHY2.
+	 */
+	switch (interface) {
+	case ISP_INTERFACE_PARALLEL:
+		input = &isp->isp_ccdc.subdev.entity;
+		pad = CCDC_PAD_SINK;
+		flags = 0;
+		break;
+
+	case ISP_INTERFACE_CSI2A_PHY2:
+		input = &isp->isp_csi2a.subdev.entity;
+		pad = CSI2_PAD_SINK;
+		flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED;
+		break;
+
+	case ISP_INTERFACE_CCP2B_PHY1:
+	case ISP_INTERFACE_CCP2B_PHY2:
+		input = &isp->isp_ccp2.subdev.entity;
+		pad = CCP2_PAD_SINK;
+		flags = 0;
+		break;
+
+	case ISP_INTERFACE_CSI2C_PHY1:
+		input = &isp->isp_csi2c.subdev.entity;
+		pad = CSI2_PAD_SINK;
+		flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED;
+		break;
+
+	default:
+		dev_err(isp->dev, "%s: invalid interface type %u\n", __func__,
+			interface);
+		return -EINVAL;
+	}
+
+	/*
+	 * Not all interfaces are available on all revisions of the
+	 * ISP. The sub-devices of those interfaces aren't initialised
+	 * in such a case. Check this by ensuring the num_pads is
+	 * non-zero.
+	 */
+	if (!input->num_pads) {
+		dev_err(isp->dev, "%s: invalid input %u\n", entity->name,
+			interface);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < entity->num_pads; i++) {
+		if (entity->pads[i].flags & MEDIA_PAD_FL_SOURCE)
+			break;
+	}
+	if (i == entity->num_pads) {
+		dev_err(isp->dev, "%s: no source pad in external entity\n",
+			__func__);
+		return -EINVAL;
+	}
+
+	return media_entity_create_link(entity, i, input, pad, flags);
+}
+
 static int isp_register_entities(struct isp_device *isp)
 {
 	struct isp_platform_data *pdata = isp->pdata;
@@ -1894,85 +1965,15 @@ static int isp_register_entities(struct isp_device *isp)
 
 	/* Register external entities */
 	for (subdevs = pdata->subdevs; subdevs && subdevs->subdevs; ++subdevs) {
-		struct v4l2_subdev *sensor;
-		struct media_entity *input;
-		unsigned int flags;
-		unsigned int pad;
-		unsigned int i;
+		struct v4l2_subdev *sensor =
+			isp_register_subdev_group(isp, subdevs->subdevs);
 
-		sensor = isp_register_subdev_group(isp, subdevs->subdevs);
 		if (sensor == NULL)
 			continue;
 
 		sensor->host_priv = subdevs;
 
-		/* Connect the sensor to the correct interface module. Parallel
-		 * sensors are connected directly to the CCDC, while serial
-		 * sensors are connected to the CSI2a, CCP2b or CSI2c receiver
-		 * through CSIPHY1 or CSIPHY2.
-		 */
-		switch (subdevs->interface) {
-		case ISP_INTERFACE_PARALLEL:
-			input = &isp->isp_ccdc.subdev.entity;
-			pad = CCDC_PAD_SINK;
-			flags = 0;
-			break;
-
-		case ISP_INTERFACE_CSI2A_PHY2:
-			input = &isp->isp_csi2a.subdev.entity;
-			pad = CSI2_PAD_SINK;
-			flags = MEDIA_LNK_FL_IMMUTABLE
-			      | MEDIA_LNK_FL_ENABLED;
-			break;
-
-		case ISP_INTERFACE_CCP2B_PHY1:
-		case ISP_INTERFACE_CCP2B_PHY2:
-			input = &isp->isp_ccp2.subdev.entity;
-			pad = CCP2_PAD_SINK;
-			flags = 0;
-			break;
-
-		case ISP_INTERFACE_CSI2C_PHY1:
-			input = &isp->isp_csi2c.subdev.entity;
-			pad = CSI2_PAD_SINK;
-			flags = MEDIA_LNK_FL_IMMUTABLE
-			      | MEDIA_LNK_FL_ENABLED;
-			break;
-
-		default:
-			dev_err(isp->dev, "%s: invalid interface type %u\n",
-				__func__, subdevs->interface);
-			ret = -EINVAL;
-			goto done;
-		}
-
-		/*
-		 * Not all interfaces are available on all revisions
-		 * of the ISP. The sub-devices of those interfaces
-		 * aren't initialised in such a case. Check this by
-		 * ensuring the num_pads is non-zero.
-		 */
-		if (!input->num_pads) {
-			dev_err(isp->dev, "%s: invalid input %u\n",
-				entity->name, subdevs->interface);
-			ret = -EINVAL;
-			goto done;
-		}
-
-		for (i = 0; i < sensor->entity.num_pads; i++) {
-			if (sensor->entity.pads[i].flags & MEDIA_PAD_FL_SOURCE)
-				break;
-		}
-		if (i == sensor->entity.num_pads) {
-			dev_err(isp->dev,
-				"%s: no source pad in external entity\n",
-				__func__);
-			ret = -EINVAL;
-			goto done;
-		}
-
-		ret = media_entity_create_link(&sensor->entity, i, input, pad,
-					       flags);
+		ret = isp_link_entity(isp, &sensor->entity, subdevs->interface);
 		if (ret < 0)
 			goto done;
 	}
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
