From: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Subject: [Patch v2][ 08/37] video: mx3fb: Add device tree suport.
Date: Thu, 17 Oct 2013 17:02:06 +0200
Message-ID: <1382022155-21954-9-git-send-email-denis@eukrea.com>
References: <1382022155-21954-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1382022155-21954-1-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?q?Eric=20B=C3=A9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Cc: Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Eric B=C3=A9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/video/fsl,mx3-fb.txt       |   52 ++++++++
 drivers/video/Kconfig                              |    2 +
 drivers/video/mx3fb.c                              |  133 ++++++++++++=
+++++---
 3 files changed, 171 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/video/fsl,mx3-fb.=
txt

diff --git a/Documentation/devicetree/bindings/video/fsl,mx3-fb.txt b/D=
ocumentation/devicetree/bindings/video/fsl,mx3-fb.txt
new file mode 100644
index 0000000..ae0b343
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/fsl,mx3-fb.txt
@@ -0,0 +1,52 @@
+Freescale mx3 Framebuffer
+
+This framebuffer driver supports the imx31 and imx35 devices.
+
+Required properties:
+- compatible : Must be "fsl,mx3-fb".
+- reg : Should contain 1 register ranges(address and length).
+- dmas : Phandle to the ipu dma node as described in
+	Documentation/devicetree/bindings/dma/dma.txt
+- dma-names : Must be "tx".
+- clocks : Phandle to the ipu source clock.
+- display: Phandle to a display node as described in
+	Documentation/devicetree/bindings/video/display-timing.txt
+	Additional, the display node has to define properties:
+	- bits-per-pixel: lcd panel bit-depth.
+
+Optional properties:
+- ipu-disp-format: could be "rgb666", "rgb565", or "rgb888".
+  If not specified defaults to "rgb666".
+
+Example:
+
+	lcdc: mx3fb@53fc00b4 {
+		compatible =3D "fsl,mx3-fb";
+		reg =3D <0x53fc00b4 0x0b>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_lcdc_1>;
+		clocks =3D <&clks 55>;
+		dmas =3D <&ipu 14>;
+		dma-names =3D "tx";
+	};
+
+	...
+
+	cmo_qvga: display {
+		model =3D "CMO-QVGA";
+		bits-per-pixel =3D <16>;
+		native-mode =3D <&qvga_timings>;
+		display-timings {
+			qvga_timings: 320x240 {
+				clock-frequency =3D <6500000>;
+				hactive =3D <320>;
+				vactive =3D <240>;
+				hback-porch =3D <30>;
+				hfront-porch =3D <38>;
+				vback-porch =3D <20>;
+				vfront-porch =3D <3>;
+				hsync-len =3D <15>;
+				vsync-len =3D <4>;
+			};
+		};
+	};
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 14317b7..2a638df 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -2359,6 +2359,8 @@ config FB_MX3
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select VIDEOMODE_HELPERS
+	select FB_MODE_HELPERS
 	default y
 	help
 	  This is a framebuffer device for the i.MX31 LCD Controller. So
diff --git a/drivers/video/mx3fb.c b/drivers/video/mx3fb.c
index 37704da..8683dda 100644
--- a/drivers/video/mx3fb.c
+++ b/drivers/video/mx3fb.c
@@ -32,6 +32,8 @@
 #include <linux/platform_data/dma-imx.h>
 #include <linux/platform_data/video-mx3fb.h>
=20
+#include <video/of_display_timing.h>
+
 #include <asm/io.h>
 #include <asm/uaccess.h>
=20
@@ -759,11 +761,13 @@ static int __set_par(struct fb_info *fbi, bool lo=
ck)
 			sig_cfg.Hsync_pol =3D true;
 		if (fbi->var.sync & FB_SYNC_VERT_HIGH_ACT)
 			sig_cfg.Vsync_pol =3D true;
-		if (fbi->var.sync & FB_SYNC_CLK_INVERT)
+		if ((fbi->var.sync & FB_SYNC_CLK_INVERT) ||
+		    (fbi->var.sync & FB_SYNC_PIXDAT_HIGH_ACT))
 			sig_cfg.clk_pol =3D true;
 		if (fbi->var.sync & FB_SYNC_DATA_INVERT)
 			sig_cfg.data_pol =3D true;
-		if (fbi->var.sync & FB_SYNC_OE_ACT_HIGH)
+		if ((fbi->var.sync & FB_SYNC_OE_ACT_HIGH) ||
+		    (fbi->var.sync & FB_SYNC_DE_HIGH_ACT))
 			sig_cfg.enable_pol =3D true;
 		if (fbi->var.sync & FB_SYNC_CLK_IDLE_EN)
 			sig_cfg.clkidle_en =3D true;
@@ -1392,21 +1396,63 @@ static struct fb_info *mx3fb_init_fbinfo(struct=
 device *dev, struct fb_ops *ops)
 	return fbi;
 }
=20
+static int match_dt_disp_data(const char *property)
+{
+	if (!strcmp("rgb666", property))
+		return IPU_DISP_DATA_MAPPING_RGB666;
+	else if (!strcmp("rgb565", property))
+		return IPU_DISP_DATA_MAPPING_RGB565;
+	else if (!strcmp("rgb888", property))
+		return IPU_DISP_DATA_MAPPING_RGB888;
+	else
+		return -EINVAL;
+}
+
 static int init_fb_chan(struct mx3fb_data *mx3fb, struct idmac_channel=
 *ichan)
 {
 	struct device *dev =3D mx3fb->dev;
 	struct mx3fb_platform_data *mx3fb_pdata =3D dev_get_platdata(dev);
-	const char *name =3D mx3fb_pdata->name;
+	struct device_node *np =3D dev->of_node;
+	const char *name;
+	const char *ipu_disp_format;
 	unsigned int irq;
 	struct fb_info *fbi;
 	struct mx3fb_info *mx3fbi;
 	const struct fb_videomode *mode;
 	int ret, num_modes;
+	struct fb_videomode of_mode;
+	enum disp_data_mapping	disp_data_fmt =3D IPU_DISP_DATA_MAPPING_RGB666=
;
+	struct device_node *display_np, *timings_np;
+
+	if (np) {
+		of_property_read_string(np, "ipu-disp-format",
+					&ipu_disp_format);
+		if (!ipu_disp_format) {
+			dev_err(dev, "Can't get ipu display data mapping.\n");
+			return -EINVAL;
+		}
+
+		mx3fb->disp_data_fmt =3D match_dt_disp_data(ipu_disp_format);
+		if (mx3fb->disp_data_fmt =3D=3D -EINVAL) {
+			dev_err(dev, "Illegal display data format \"%s\"\n",
+				ipu_disp_format);
+			return -EINVAL;
+		}
=20
-	if (mx3fb_pdata->disp_data_fmt >=3D ARRAY_SIZE(di_mappings)) {
-		dev_err(dev, "Illegal display data format %d\n",
+		display_np =3D of_parse_phandle(np, "display", 0);
+		if (!display_np) {
+			dev_err(dev, "failed to find display phandle\n");
+			return -ENOENT;
+		}
+
+		of_property_read_string(display_np, "model", &name);
+	} else {
+		name =3D mx3fb_pdata->name;
+		if (mx3fb_pdata->disp_data_fmt >=3D ARRAY_SIZE(di_mappings)) {
+			dev_err(dev, "Illegal display data format %d\n",
 				mx3fb_pdata->disp_data_fmt);
-		return -EINVAL;
+			return -EINVAL;
+		}
 	}
=20
 	ichan->client =3D mx3fb;
@@ -1427,12 +1473,39 @@ static int init_fb_chan(struct mx3fb_data *mx3f=
b, struct idmac_channel *ichan)
 		goto emode;
 	}
=20
-	if (mx3fb_pdata->mode && mx3fb_pdata->num_modes) {
-		mode =3D mx3fb_pdata->mode;
-		num_modes =3D mx3fb_pdata->num_modes;
+	if (np) {
+		of_property_read_string(np, "ipu-disp-format",
+					&ipu_disp_format);
+		if (!ipu_disp_format) {
+			dev_err(dev, "Can't get ipu display data mapping.\n");
+			return -EINVAL;
+		}
+
+		disp_data_fmt =3D match_dt_disp_data(ipu_disp_format);
+
+		if (disp_data_fmt =3D=3D -EINVAL) {
+			dev_err(dev, "Illegal display data format \"%s\" for "
+				"the node %s\n", ipu_disp_format, np->name);
+			return -EINVAL;
+		}
+
+		ret =3D of_get_fb_videomode(display_np, &of_mode,
+					  OF_USE_NATIVE_MODE);
+		if (!ret) {
+			mode =3D &of_mode;
+			num_modes =3D 1;
+		} else {
+			mode =3D mx3fb_modedb;
+			num_modes =3D ARRAY_SIZE(mx3fb_modedb);
+		}
 	} else {
-		mode =3D mx3fb_modedb;
-		num_modes =3D ARRAY_SIZE(mx3fb_modedb);
+		if (mx3fb_pdata->mode || !mx3fb_pdata->num_modes) {
+			mode =3D mx3fb_pdata->mode;
+			num_modes =3D mx3fb_pdata->num_modes;
+		} else {
+			mode =3D mx3fb_modedb;
+			num_modes =3D ARRAY_SIZE(mx3fb_modedb);
+		}
 	}
=20
 	if (!fb_find_mode(&fbi->var, fbi, fb_mode, mode,
@@ -1462,7 +1535,10 @@ static int init_fb_chan(struct mx3fb_data *mx3fb=
, struct idmac_channel *ichan)
 	mx3fbi->mx3fb		=3D mx3fb;
 	mx3fbi->blank		=3D FB_BLANK_NORMAL;
=20
-	mx3fb->disp_data_fmt	=3D mx3fb_pdata->disp_data_fmt;
+	if (!np)
+		mx3fb->disp_data_fmt =3D mx3fb_pdata->disp_data_fmt;
+	else
+		mx3fb->disp_data_fmt =3D disp_data_fmt;
=20
 	init_completion(&mx3fbi->flip_cmpl);
 	disable_irq(ichan->eof_irq);
@@ -1494,13 +1570,26 @@ emode:
 	return ret;
 }
=20
+static int imx_dma_is_dt_ipu(struct dma_chan *chan)
+{
+	/* Example: 53fc0000.ipu */
+	if (chan && chan->device && chan->device->dev) {
+		char *name =3D dev_name(chan->device->dev);
+		name =3D strchr(name, '.');
+		if (name)
+			return !strcmp(name, ".ipu");
+	}
+
+	return 0;
+}
+
 static bool chan_filter(struct dma_chan *chan, void *arg)
 {
 	struct dma_chan_request *rq =3D arg;
 	struct device *dev;
 	struct mx3fb_platform_data *mx3fb_pdata;
=20
-	if (!imx_dma_is_ipu(chan))
+	if (!imx_dma_is_ipu(chan) && !imx_dma_is_dt_ipu(chan))
 		return false;
=20
 	if (!rq)
@@ -1509,8 +1598,12 @@ static bool chan_filter(struct dma_chan *chan, v=
oid *arg)
 	dev =3D rq->mx3fb->dev;
 	mx3fb_pdata =3D dev_get_platdata(dev);
=20
-	return rq->id =3D=3D chan->chan_id &&
-		mx3fb_pdata->dma_dev =3D=3D chan->device->dev;
+	/* When using the devicetree, mx3fb_pdata is NULL */
+	if (imx_dma_is_dt_ipu(chan))
+		return rq->id =3D=3D chan->chan_id;
+	else
+		return rq->id =3D=3D chan->chan_id &&
+			mx3fb_pdata->dma_dev =3D=3D chan->device->dev;
 }
=20
 static void release_fbi(struct fb_info *fbi)
@@ -1567,7 +1660,8 @@ static int mx3fb_probe(struct platform_device *pd=
ev)
 	dma_cap_set(DMA_SLAVE, mask);
 	dma_cap_set(DMA_PRIVATE, mask);
 	rq.id =3D IDMAC_SDC_0;
-	chan =3D dma_request_channel(mask, chan_filter, &rq);
+	chan =3D dma_request_slave_channel_compat(mask, chan_filter, &rq, dev=
,
+						"tx");
 	if (!chan) {
 		ret =3D -EBUSY;
 		goto ersdc0;
@@ -1610,9 +1704,16 @@ static int mx3fb_remove(struct platform_device *=
dev)
 	return 0;
 }
=20
+static struct of_device_id mx3fb_of_dev_id[] =3D {
+	{ .compatible =3D "fsl,mx3-fb", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, mx3fb_of_dev_id);
+
 static struct platform_driver mx3fb_driver =3D {
 	.driver =3D {
 		.name =3D MX3FB_NAME,
+		.of_match_table =3D mx3fb_of_dev_id,
 		.owner =3D THIS_MODULE,
 	},
 	.probe =3D mx3fb_probe,
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
