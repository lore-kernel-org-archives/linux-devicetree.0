From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: [PATCHv5 13/16] ov2640: add MC support
Date: Sat, 11 Mar 2017 12:23:25 +0100
Message-ID: <20170311112328.11802-14-hverkuil@xs4all.nl>
References: <20170311112328.11802-1-hverkuil@xs4all.nl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170311112328.11802-1-hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Guennadi Liakhovetski <guennadi.liakhovetski-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>

The MC support is needed by the em28xx driver.

Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
---
 drivers/media/i2c/ov2640.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2640.c b/drivers/media/i2c/ov2640.c
index 0445963c5fae..d1f04a4ca2ac 100644
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
@@ -1063,6 +1066,7 @@ static int ov2640_probe(struct i2c_client *client,
 		goto err_clk;
 
 	v4l2_i2c_subdev_init(&priv->subdev, client, &ov2640_subdev_ops);
+	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
 	v4l2_ctrl_handler_init(&priv->hdl, 2);
 	v4l2_ctrl_new_std(&priv->hdl, &ov2640_ctrl_ops,
 			V4L2_CID_VFLIP, 0, 1, 1, 0);
@@ -1073,19 +1077,28 @@ static int ov2640_probe(struct i2c_client *client,
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
+	media_entity_cleanup(&priv->subdev.entity);
 err_hdl:
 	v4l2_ctrl_handler_free(&priv->hdl);
 err_clk:
@@ -1099,6 +1112,7 @@ static int ov2640_remove(struct i2c_client *client)
 
 	v4l2_async_unregister_subdev(&priv->subdev);
 	v4l2_ctrl_handler_free(&priv->hdl);
+	media_entity_cleanup(&priv->subdev.entity);
 	v4l2_device_unregister_subdev(&priv->subdev);
 	clk_disable_unprepare(priv->clk);
 	return 0;
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
