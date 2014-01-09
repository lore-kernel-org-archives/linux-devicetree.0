From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: [PATCH v2 13/28] drm/i2c: tda998x: use irq for connection status
 and EDID read
Date: Thu, 9 Jan 2014 12:04:12 +0100
Message-ID: <20140109120412.7697d23c@armhf>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds the optional treatment of the tda998x IRQ.

The interrupt function is used to know the display connection status
without polling and to speedup reading the EDID.

Signed-off-by: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
---
 drivers/gpu/drm/i2c/tda998x_drv.c            | 116 +++++++++++++++++++=
--
 .../devicetree/bindings/drm/i2c/tda998x.txt  |   3 +++
 2 file changed, 108 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/drm/i2c/tda998x.txt b/Do=
cumentation/devicetree/bindings/drm/i2c/tda998x.txt
index f07339e1..83d7880 100644
--- a/Documentation/devicetree/bindings/drm/i2c/tda998x.txt
+++ b/Documentation/devicetree/bindings/drm/i2c/tda998x.txt
@@ -4,6 +4,7 @@ Required properties;
   - compatible: must be "nxp,tda998x"
=20
 Optional properties:
+  - interrupts: interrupt number for HDMI exchanges - default: by poll=
ing
   - video-ports: 24 bits value - default: <0x230145>
=20
 Example:
@@ -11,6 +12,8 @@ Example:
 	tda998x: hdmi-encoder {
 		compatible =3D "nxp,tda998x";
 		reg =3D <0x70>;
+		interrupt-parent =3D <&gpio0>;
+		interrupts =3D <27 2>;		/* falling edge */
 		pinctrl-0 =3D <&pmx_camera>;
 		pinctrl-names =3D "default";
 	};
diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/td=
a998x_drv.c
index b87802f..2187d63 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -19,6 +19,7 @@
=20
 #include <linux/hdmi.h>
 #include <linux/module.h>
+#include <linux/of_irq.h>
=20
 #include <drm/drmP.h>
 #include <drm/drm_crtc_helper.h>
@@ -44,6 +45,11 @@ struct tda998x_priv {
 	u8 audio_type;		/* audio type */
 	u8 audio_frame[6];
 	u32 audio_port;
+
+	int int_irq;
+	wait_queue_head_t wq_edid;
+	volatile int wq_edid_wait;
+	struct drm_encoder *encoder;
 };
=20
 #define to_tda998x_priv(x)  ((struct tda998x_priv *)to_encoder_slave(x=
)->slave_priv)
@@ -310,11 +316,16 @@ struct tda998x_priv {
=20
 /* CEC registers: (not paged)
  */
+#define REG_CEC_INTSTATUS         0xee                /* read */
+# define CEC_INTSTATUS_CEC        (1 << 0)
+# define CEC_INTSTATUS_HDMI       (1 << 1)
 #define REG_CEC_FRO_IM_CLK_CTRL   0xfb                /* read/write */
 # define CEC_FRO_IM_CLK_CTRL_GHOST_DIS (1 << 7)
 # define CEC_FRO_IM_CLK_CTRL_ENA_OTP   (1 << 6)
 # define CEC_FRO_IM_CLK_CTRL_IMCLK_SEL (1 << 1)
 # define CEC_FRO_IM_CLK_CTRL_FRO_DIV   (1 << 0)
+#define REG_CEC_RXSHPDINTENA      0xfc                /* read/write */
+#define REG_CEC_RXSHPDINT         0xfd                /* read */
 #define REG_CEC_RXSHPDLEV         0xfe                /* read */
 # define CEC_RXSHPDLEV_RXSENS     (1 << 0)
 # define CEC_RXSHPDLEV_HPD        (1 << 1)
@@ -520,6 +531,34 @@ tda998x_reset(struct tda998x_priv *priv)
 	reg_write(priv, REG_MUX_VP_VIP_OUT, 0x24);
 }
=20
+/*
+ * only 2 interrupts may occur: screen plug/unplug and EDID read
+ */
+static irqreturn_t tda998x_irq_thread(int irq, void *data)
+{
+	struct tda998x_priv *priv =3D data;
+	u8 sta, cec, lvl, flag0, flag1, flag2;
+
+	if (!priv)
+		return IRQ_HANDLED;
+	sta =3D cec_read(priv, REG_CEC_INTSTATUS);
+	cec =3D cec_read(priv, REG_CEC_RXSHPDINT);
+	lvl =3D cec_read(priv, REG_CEC_RXSHPDLEV);
+	flag0 =3D reg_read(priv, REG_INT_FLAGS_0);
+	flag1 =3D reg_read(priv, REG_INT_FLAGS_1);
+	flag2 =3D reg_read(priv, REG_INT_FLAGS_2);
+	DRM_DEBUG("tda irq sta %02x cec %02x lvl %02x f0 %02x f1 %02x f2 %02x=
\n",
+			sta, cec, lvl, flag0, flag1, flag2);
+	if ((flag2 & INT_FLAGS_2_EDID_BLK_RD) && priv->wq_edid_wait) {
+		priv->wq_edid_wait =3D 0;
+		wake_up(&priv->wq_edid);
+	} else if (cec !=3D 0) {			/* level change */
+		if (priv->encoder && priv->encoder->dev)
+			drm_helper_hpd_irq_event(priv->encoder->dev);
+	}
+	return IRQ_HANDLED;
+}
+
 static uint8_t tda998x_cksum(uint8_t *buf, size_t bytes)
 {
 	uint8_t sum =3D 0;
@@ -982,7 +1021,8 @@ read_edid_block(struct drm_encoder *encoder, uint8=
_t *buf, int blk)
 	int ret, i;
=20
 	/* enable EDID read irq: */
-	reg_set(priv, REG_INT_FLAGS_2, INT_FLAGS_2_EDID_BLK_RD);
+	if (blk =3D=3D 0)
+		reg_set(priv, REG_INT_FLAGS_2, INT_FLAGS_2_EDID_BLK_RD);
=20
 	offset =3D (blk & 1) ? 128 : 0;
 	segptr =3D blk / 2;
@@ -999,17 +1039,30 @@ read_edid_block(struct drm_encoder *encoder, uin=
t8_t *buf, int blk)
 	reg_write(priv, REG_EDID_CTRL, 0x0);
=20
 	/* wait for block read to complete: */
-	for (i =3D 100; i > 0; i--) {
-		ret =3D reg_read(priv, REG_INT_FLAGS_2);
-		if (ret < 0)
-			return ret;
-		if (ret & INT_FLAGS_2_EDID_BLK_RD)
-			break;
-		msleep(1);
+	if (priv->int_irq !=3D NO_IRQ) {
+		priv->wq_edid_wait =3D 1;
+		i =3D wait_event_timeout(priv->wq_edid,
+					!priv->wq_edid_wait,
+					msecs_to_jiffies(100));
+		if (i < 0) {
+			dev_err(encoder->dev->dev, "read edid wait err %d\n", i);
+			return i;
+		}
+	} else {
+		for (i =3D 10; i > 0; i--) {
+			msleep(10);
+			ret =3D reg_read(priv, REG_INT_FLAGS_2);
+			if (ret < 0)
+				return ret;
+			if (ret & INT_FLAGS_2_EDID_BLK_RD)
+				break;
+		}
 	}
=20
-	if (i =3D=3D 0)
+	if (i =3D=3D 0) {
+		dev_err(encoder->dev->dev, "read edid timeout\n");
 		return -ETIMEDOUT;
+	}
=20
 	ret =3D reg_read_range(priv, REG_EDID_DATA_0, buf, EDID_LENGTH);
 	if (ret !=3D EDID_LENGTH) {
@@ -1018,8 +1071,6 @@ read_edid_block(struct drm_encoder *encoder, uint=
8_t *buf, int blk)
 		return ret;
 	}
=20
-	reg_clear(priv, REG_INT_FLAGS_2, INT_FLAGS_2_EDID_BLK_RD);
-
 	return 0;
 }
=20
@@ -1109,7 +1160,14 @@ static int
 tda998x_encoder_create_resources(struct drm_encoder *encoder,
 				struct drm_connector *connector)
 {
+	struct tda998x_priv *priv =3D to_tda998x_priv(encoder);
+
 	DBG("");
+	if (priv->int_irq !=3D NO_IRQ)
+		connector->polled =3D DRM_CONNECTOR_POLL_HPD;
+	else
+		connector->polled =3D DRM_CONNECTOR_POLL_CONNECT |
+			DRM_CONNECTOR_POLL_DISCONNECT;
 	return 0;
 }
=20
@@ -1128,6 +1186,8 @@ tda998x_encoder_destroy(struct drm_encoder *encod=
er)
 {
 	struct tda998x_priv *priv =3D to_tda998x_priv(encoder);
 	drm_i2c_encoder_destroy(encoder);
+	if (priv->int_irq !=3D NO_IRQ)
+		free_irq(priv->int_irq, priv);
 	if (priv->cec)
 		i2c_unregister_device(priv->cec);
 	kfree(priv);
@@ -1186,6 +1246,7 @@ tda998x_encoder_init(struct i2c_client *client,
 	priv->cec =3D i2c_new_dummy(client->adapter, 0x34);
 	if (!priv->cec)
 		return -ENODEV;
+	priv->encoder =3D &encoder_slave->base;
 	priv->dpms =3D DRM_MODE_DPMS_OFF;
=20
 	encoder_slave->slave_priv =3D priv;
@@ -1250,6 +1311,39 @@ tda998x_encoder_init(struct i2c_client *client,
 		priv->vip_cntrl_2 =3D video;
 	}
=20
+	/* install the optional HDMI connect IRQ */
+	priv->int_irq =3D irq_of_parse_and_map(np, 0);
+	if (priv->int_irq < 0)
+		priv->int_irq =3D NO_IRQ;
+	if (priv->int_irq !=3D NO_IRQ) {
+
+		/* init read EDID waitqueue */
+		init_waitqueue_head(&priv->wq_edid);
+/*		priv->wq_edid_wait =3D 0;	*/
+
+		/* clear pending interrupts */
+		reg_read(priv, REG_INT_FLAGS_0);
+		reg_read(priv, REG_INT_FLAGS_1);
+		reg_read(priv, REG_INT_FLAGS_2);
+
+		ret =3D request_threaded_irq(priv->int_irq, NULL,
+					   tda998x_irq_thread,
+					   IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+					   "tda998x-int", priv);
+		if (ret) {
+			dev_err(&client->dev, "failed to request IRQ#%u: %d\n",
+				priv->int_irq, ret);
+			goto fail;
+		}
+
+		/* enable HPD irq */
+		cec_write(priv, REG_CEC_RXSHPDINTENA,
+				CEC_RXSHPDLEV_HPD | CEC_RXSHPDLEV_RXSENS);
+
+		/* treat the first irq if any */
+		msleep(10);
+	}
+
 	return 0;
=20
 fail:
--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
