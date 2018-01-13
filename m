From: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 8/8] drm: xlnx: zynqmp_dp: Add drm properties
Date: Fri, 12 Jan 2018 18:03:28 -0800
Message-ID: <1515809008-14518-8-git-send-email-hyun.kwon@xilinx.com>
References: <1515809008-14518-1-git-send-email-hyun.kwon@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515809008-14518-1-git-send-email-hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add drm properties for DisplayPort synchronous mode and bpc
configurations.

Signed-off-by: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
v2
- Split from the original patch
---
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 116 +++++++++++++++++++++++++++++++++++=
+++-
 1 file changed, 114 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp=
_dp.c
index 9c9f4df..e1e8237 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -302,6 +302,8 @@ struct zynqmp_dp_config {
  * struct zynqmp_dp - Xilinx DisplayPort core
  * @encoder: the drm encoder structure
  * @connector: the drm connector structure
+ * @sync_prop: synchronous mode property
+ * @bpc_prop: bpc mode property
  * @dev: device structure
  * @dpsub: Display subsystem
  * @drm: DRM core
@@ -323,6 +325,8 @@ struct zynqmp_dp_config {
 struct zynqmp_dp {
        struct drm_encoder encoder;
        struct drm_connector connector;
+       struct drm_property *sync_prop;
+       struct drm_property *bpc_prop;
        struct device *dev;
        struct zynqmp_dpsub *dpsub;
        struct drm_device *drm;
@@ -1116,6 +1120,37 @@ static void zynqmp_dp_update_misc(struct zynqmp_dp *=
dp)
 }

 /**
+ * zynqmp_dp_set_sync_mode - Set the sync mode bit in the software misc st=
ate
+ * @dp: DisplayPort IP core structure
+ * @mode: flag if the sync mode should be on or off
+ *
+ * Set the bit in software misc state. To apply to hardware,
+ * zynqmp_dp_update_misc() should be called.
+ */
+static void zynqmp_dp_set_sync_mode(struct zynqmp_dp *dp, bool mode)
+{
+       struct zynqmp_dp_config *config =3D &dp->config;
+
+       if (mode)
+               config->misc0 |=3D ZYNQMP_DP_TX_MAIN_STREAM_MISC0_SYNC;
+       else
+               config->misc0 &=3D ~ZYNQMP_DP_TX_MAIN_STREAM_MISC0_SYNC;
+}
+
+/**
+ * zynqmp_dp_get_sync_mode - Get the sync mode state
+ * @dp: DisplayPort IP core structure
+ *
+ * Return: true if the sync mode is on, or false
+ */
+static bool zynqmp_dp_get_sync_mode(struct zynqmp_dp *dp)
+{
+       struct zynqmp_dp_config *config =3D &dp->config;
+
+       return !!(config->misc0 & ZYNQMP_DP_TX_MAIN_STREAM_MISC0_SYNC);
+}
+
+/**
  * zynqmp_dp_set_bpc - Set bpc value in software misc state
  * @dp: DisplayPort IP core structure
  * @bpc: bits per component
@@ -1165,6 +1200,17 @@ static u8 zynqmp_dp_set_bpc(struct zynqmp_dp *dp, u8=
 bpc)
 }

 /**
+ * zynqmp_dp_get_bpc - Set bpc value from software state
+ * @dp: DisplayPort IP core structure
+ *
+ * Return: current bpc value
+ */
+static u8 zynqmp_dp_get_bpc(struct zynqmp_dp *dp)
+{
+       return dp->config.bpc;
+}
+
+/**
  * zynqmp_dp_encoder_mode_set_transfer_unit - Set the transfer unit values
  * @dp: DisplayPort IP core structure
  * @mode: requested display mode
@@ -1368,6 +1414,51 @@ static void zynqmp_dp_connector_destroy(struct drm_c=
onnector *connector)
        drm_connector_cleanup(connector);
 }

+static int
+zynqmp_dp_connector_atomic_set_property(struct drm_connector *connector,
+                                       struct drm_connector_state *state,
+                                       struct drm_property *property,
+                                       uint64_t val)
+{
+       struct zynqmp_dp *dp =3D connector_to_dp(connector);
+       int ret;
+
+       if (property =3D=3D dp->sync_prop) {
+               zynqmp_dp_set_sync_mode(dp, val);
+       } else if (property =3D=3D dp->bpc_prop) {
+               u8 bpc;
+
+               bpc =3D zynqmp_dp_set_bpc(dp, val);
+               if (bpc) {
+                       drm_object_property_set_value(&connector->base,
+                                                     property, bpc);
+                       ret =3D -EINVAL;
+               }
+       } else {
+               return -EINVAL;
+       }
+
+       return 0;
+}
+
+static int
+zynqmp_dp_connector_atomic_get_property(struct drm_connector *connector,
+                                       const struct drm_connector_state *s=
tate,
+                                       struct drm_property *property,
+                                       uint64_t *val)
+{
+       struct zynqmp_dp *dp =3D connector_to_dp(connector);
+
+       if (property =3D=3D dp->sync_prop)
+               *val =3D zynqmp_dp_get_sync_mode(dp);
+       else if (property =3D=3D dp->bpc_prop)
+               *val =3D  zynqmp_dp_get_bpc(dp);
+       else
+               return -EINVAL;
+
+       return 0;
+}
+
 static const struct drm_connector_funcs zynqmp_dp_connector_funcs =3D {
        .detect                 =3D zynqmp_dp_connector_detect,
        .fill_modes             =3D drm_helper_probe_single_connector_modes=
,
@@ -1375,6 +1466,8 @@ static const struct drm_connector_funcs zynqmp_dp_con=
nector_funcs =3D {
        .atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_s=
tate,
        .atomic_destroy_state   =3D drm_atomic_helper_connector_destroy_sta=
te,
        .reset                  =3D drm_atomic_helper_connector_reset,
+       .atomic_set_property    =3D zynqmp_dp_connector_atomic_set_property=
,
+       .atomic_get_property    =3D zynqmp_dp_connector_atomic_get_property=
,
 };

 static struct drm_connector_helper_funcs zynqmp_dp_connector_helper_funcs =
=3D {
@@ -1520,6 +1613,13 @@ static void zynqmp_dp_hpd_work_func(struct work_stru=
ct *work)
                drm_helper_hpd_irq_event(dp->drm);
 }

+static struct drm_prop_enum_list zynqmp_dp_bpc_enum[] =3D {
+       { 6, "6BPC" },
+       { 8, "8BPC" },
+       { 10, "10BPC" },
+       { 12, "12BPC" },
+};
+
 int zynqmp_dp_bind(struct device *dev, struct device *master, void *data)
 {
        struct zynqmp_dpsub *dpsub =3D dev_get_drvdata(dev);
@@ -1556,21 +1656,31 @@ int zynqmp_dp_bind(struct device *dev, struct devic=
e *master, void *data)
        connector->dpms =3D DRM_MODE_DPMS_OFF;

        dp->drm =3D drm;
+       dp->sync_prop =3D drm_property_create_bool(drm, 0, "sync");
+       dp->bpc_prop =3D drm_property_create_enum(drm, 0, "bpc",
+                                               zynqmp_dp_bpc_enum,
+                                               ARRAY_SIZE(zynqmp_dp_bpc_en=
um));
+
        dp->config.misc0 &=3D ~ZYNQMP_DP_TX_MAIN_STREAM_MISC0_SYNC;
+       drm_object_attach_property(&connector->base, dp->sync_prop, false);
        ret =3D zynqmp_dp_set_bpc(dp, 8);
+       drm_object_attach_property(&connector->base, dp->bpc_prop,
+                                  ret ? ret : 8);
        zynqmp_dp_update_bpp(dp);

        /* This enables interrupts, so should be called after DRM init */
        ret =3D zynqmp_dp_init_aux(dp);
        if (ret) {
                dev_err(dp->dev, "failed to initialize DP aux");
-               goto error_connector;
+               goto error_prop;
        }
        INIT_DELAYED_WORK(&dp->hpd_work, zynqmp_dp_hpd_work_func);

        return 0;

-error_connector:
+error_prop:
+       drm_property_destroy(dp->drm, dp->bpc_prop);
+       drm_property_destroy(dp->drm, dp->sync_prop);
        zynqmp_dp_connector_destroy(&dp->connector);
 error_encoder:
        drm_encoder_cleanup(&dp->encoder);
@@ -1585,6 +1695,8 @@ void zynqmp_dp_unbind(struct device *dev, struct devi=
ce *master, void *data)
        cancel_delayed_work_sync(&dp->hpd_work);
        disable_irq(dp->irq);
        zynqmp_dp_exit_aux(dp);
+       drm_property_destroy(dp->drm, dp->bpc_prop);
+       drm_property_destroy(dp->drm, dp->sync_prop);
        zynqmp_dp_connector_destroy(&dp->connector);
        drm_encoder_cleanup(&dp->encoder);
 }
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
