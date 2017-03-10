From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: [PATCHv4 12/15] ov2640: add MC support
Date: Fri, 10 Mar 2017 11:26:11 +0100
Message-ID: <20170310102614.20922-13-hverkuil@xs4all.nl>
References: <20170310102614.20922-1-hverkuil@xs4all.nl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170310102614.20922-1-hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Guennadi Liakhovetski <guennadi.liakhovetski-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>

The MC support is needed by the em28xx driver.

Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
---
 drivers/media/i2c/ov2640.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2640.c b/drivers/media/i2c/ov2640.c
index 0445963c5fae..00df042fd6f1 100644
--- a/drivers/media/i2c/ov2640.c
+++ b/drivers/media/i2c/ov2640.c
@@ -282,6 +282,9 @@ struct ov2640_win_size {
 
 struct ov2640_priv {
 	struct v4l2_subdev		subdev;
+#if defined(CONFIG_MEDIA_CONTROLLER)
+	struct media_pad pad;
+#endif
 	struct v4l2_ctrl_handler	hdl;
 	u32	cfmt_code;
 	struct clk			*clk;
@@ -1073,19 +1076,30 @@ static int ov2640_probe(struct i2c_client *client,
 		ret = priv->hdl.error;
 		goto err_hdl;
 	}
+#if defined(CONFIG_MEDIA_CONTROLLER)
+	priv->pad.flags = MEDIA_PAD_FL_SOURCE;
+	priv->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	ret = media_entity_pads_init(&priv->subdev.entity, 1, &priv->pad);
+	if (ret < 0)
+		goto err_hdl;
+#endif
 
 	ret = ov2640_video_probe(client);
 	if (ret < 0)
-		goto err_hdl;
+		goto err_videoprobe;
 
 	ret = v4l2_async_register_subdev(&priv->subdev);
 	if (ret < 0)
-		goto err_hdl;
+		goto err_videoprobe;
 
 	dev_info(&adapter->dev, "OV2640 Probed\n");
 
 	return 0;
 
+err_videoprobe:
+#if defined(CONFIG_MEDIA_CONTROLLER)
+	media_entity_cleanup(&priv->subdev.entity);
+#endif
 err_hdl:
 	v4l2_ctrl_handler_free(&priv->hdl);
 err_clk:
@@ -1099,6 +1113,9 @@ static int ov2640_remove(struct i2c_client *client)
 
 	v4l2_async_unregister_subdev(&priv->subdev);
 	v4l2_ctrl_handler_free(&priv->hdl);
+#if defined(CONFIG_MEDIA_CONTROLLER)
+	media_entity_cleanup(&priv->subdev.entity);
+#endif
 	v4l2_device_unregister_subdev(&priv->subdev);
 	clk_disable_unprepare(priv->clk);
 	return 0;
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
