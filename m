From: Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v3 4/7] v4l2-ctrls: Support dimensions override for standard
 controls
Date: Wed, 22 Aug 2018 13:59:34 -0300
Message-ID: <20180822165937.8700-5-ezequiel@collabora.com>
References: <20180822165937.8700-1-ezequiel@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180822165937.8700-1-ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Nicolas Dufresne <nicolas.dufresne-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Miouyouyou <myy-tmjzNUIc0P1+EYZtW95mkQ@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Pass the v4l2_ctrl_config->dims array to v4l2_ctrl_fill, so the
dimensions can be overridden for standard controls. This will
be used to fill V4L2_CID_JPEG_LUMA_QUANTIZATION and
V4L2_CID_JPEG_CHROMA_QUANTIZATION.

Signed-off-by: Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
 drivers/media/v4l2-core/v4l2-common.c |  2 +-
 drivers/media/v4l2-core/v4l2-ctrls.c  | 17 ++++++++++-------
 include/media/v4l2-ctrls.h            |  2 +-
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index b518b92d6d96..7b6353dab8a5 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -90,7 +90,7 @@ int v4l2_ctrl_query_fill(struct v4l2_queryctrl *qctrl, s32 _min, s32 _max, s32 _
 	s64 def = _def;
 
 	v4l2_ctrl_fill(qctrl->id, &name, &qctrl->type,
-		       &min, &max, &step, &def, &qctrl->flags);
+		       &min, &max, &step, &def, NULL, &qctrl->flags);
 
 	if (name == NULL)
 		return -EINVAL;
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 599c1cbff3b9..6ab15f4a0fea 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1068,7 +1068,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 EXPORT_SYMBOL(v4l2_ctrl_get_name);
 
 void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
-		    s64 *min, s64 *max, u64 *step, s64 *def, u32 *flags)
+		    s64 *min, s64 *max, u64 *step, s64 *def, u32 *dims, u32 *flags)
 {
 	*name = v4l2_ctrl_get_name(id);
 	*flags = 0;
@@ -2244,10 +2244,13 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v4l2_ctrl_handler *hdl,
 	s64 max = cfg->max;
 	u64 step = cfg->step;
 	s64 def = cfg->def;
+	u32 dims[V4L2_CTRL_MAX_DIMS];
+
+	memcpy(dims, cfg->dims, sizeof(dims));
 
 	if (name == NULL)
 		v4l2_ctrl_fill(cfg->id, &name, &type, &min, &max, &step,
-								&def, &flags);
+			       &def, dims, &flags);
 
 	is_menu = (cfg->type == V4L2_CTRL_TYPE_MENU ||
 		   cfg->type == V4L2_CTRL_TYPE_INTEGER_MENU);
@@ -2266,7 +2269,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v4l2_ctrl_handler *hdl,
 	ctrl = v4l2_ctrl_new(hdl, cfg->ops, cfg->type_ops, cfg->id, name,
 			type, min, max,
 			is_menu ? cfg->menu_skip_mask : step, def,
-			cfg->dims, cfg->elem_size,
+			dims, cfg->elem_size,
 			flags, qmenu, qmenu_int, priv);
 	if (ctrl)
 		ctrl->is_private = cfg->is_private;
@@ -2283,7 +2286,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std(struct v4l2_ctrl_handler *hdl,
 	enum v4l2_ctrl_type type;
 	u32 flags;
 
-	v4l2_ctrl_fill(id, &name, &type, &min, &max, &step, &def, &flags);
+	v4l2_ctrl_fill(id, &name, &type, &min, &max, &step, &def, NULL, &flags);
 	if (type == V4L2_CTRL_TYPE_MENU ||
 	    type == V4L2_CTRL_TYPE_INTEGER_MENU ||
 	    type >= V4L2_CTRL_COMPOUND_TYPES) {
@@ -2312,7 +2315,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu(struct v4l2_ctrl_handler *hdl,
 	u64 step;
 	u32 flags;
 
-	v4l2_ctrl_fill(id, &name, &type, &min, &max, &step, &def, &flags);
+	v4l2_ctrl_fill(id, &name, &type, &min, &max, &step, &def, NULL, &flags);
 
 	if (type == V4L2_CTRL_TYPE_MENU)
 		qmenu = v4l2_ctrl_get_menu(id);
@@ -2350,7 +2353,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
 		return NULL;
 	}
 
-	v4l2_ctrl_fill(id, &name, &type, &min, &max, &step, &def, &flags);
+	v4l2_ctrl_fill(id, &name, &type, &min, &max, &step, &def, NULL, &flags);
 	if (type != V4L2_CTRL_TYPE_MENU || qmenu == NULL) {
 		handler_set_err(hdl, -EINVAL);
 		return NULL;
@@ -2375,7 +2378,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
 	s64 def = _def;
 	u32 flags;
 
-	v4l2_ctrl_fill(id, &name, &type, &min, &max, &step, &def, &flags);
+	v4l2_ctrl_fill(id, &name, &type, &min, &max, &step, &def, NULL, &flags);
 	if (type != V4L2_CTRL_TYPE_INTEGER_MENU) {
 		handler_set_err(hdl, -EINVAL);
 		return NULL;
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index f615ba1b29dd..55ab01d97c12 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -370,7 +370,7 @@ struct v4l2_ctrl_config {
  *    control framework this function will no longer be exported.
  */
 void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
-		    s64 *min, s64 *max, u64 *step, s64 *def, u32 *flags);
+		    s64 *min, s64 *max, u64 *step, s64 *def, u32 *dims, u32 *flags);
 
 
 /**
-- 
2.18.0
