From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v7 18/34] platform: video-mux: include temporary mmio-mux
 support
Date: Wed, 24 May 2017 17:29:33 -0700
Message-ID: <1495672189-29164-19-git-send-email-steve_longerbeam@mentor.com>
References: <1495672189-29164-1-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1495672189-29164-1-git-send-email-steve_longerbeam@mentor.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, linux@armlinux.org.uk, mchehab@kernel.org, hverkuil@xs4all.nl, nick@shmanahar.org, markus.heiser@darmarIT.de, p.zabel@pengutronix.de, laurent.pinchart+renesas@ideasonboard.com, bparrot@ti.com, geert@linux-m68k.org, arnd@arndb.de, sudipm.mukherjee@gmail.com, minghsiu.tsai@mediatek.com, tiffany.lin@mediatek.com, jean-christophe.trotin@st.com, horms+renesas@verge.net.au, niklas.soderlund+renesas@ragnatech.se, robert.jarzmik@free.fr, songjun.wu@microchip.com, andrew-ct.chen@mediatek.com, gregkh@linuxfoundation.org, shuah@kernel.org, sakari.ailus@linux.intel.com, pavel@ucw.cz
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Philipp Zabel <p.zabel@pengutronix.de>

As long as the mux framework is not merged, add temporary mmio-mux
support to the video-mux driver itself. This patch is to be reverted
once the "mux: minimal mux subsystem" and "mux: mmio-based syscon mux
controller" patches are merged.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/Kconfig     |  1 -
 drivers/media/platform/video-mux.c | 62 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index b98f755..fea1dc0 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -77,7 +77,6 @@ config VIDEO_M32R_AR_M64278
 config VIDEO_MUX
 	tristate "Video Multiplexer"
 	depends on OF && VIDEO_V4L2_SUBDEV_API && MEDIA_CONTROLLER
-	depends on MULTIPLEXER
 	help
 	  This driver provides support for N:1 video bus multiplexers.
 
diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
index 5ce2bd3..630dd9a 100644
--- a/drivers/media/platform/video-mux.c
+++ b/drivers/media/platform/video-mux.c
@@ -17,7 +17,12 @@
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#ifdef CONFIG_MULTIPLEXER
 #include <linux/mux/consumer.h>
+#else
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
+#endif
 #include <linux/of.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
@@ -29,7 +34,11 @@ struct video_mux {
 	struct v4l2_subdev subdev;
 	struct media_pad *pads;
 	struct v4l2_mbus_framefmt *format_mbus;
+#ifdef CONFIG_MULTIPLEXER
 	struct mux_control *mux;
+#else
+	struct regmap_field *field;
+#endif
 	struct mutex lock;
 	int active;
 };
@@ -70,7 +79,11 @@ static int video_mux_link_setup(struct media_entity *entity,
 		}
 
 		dev_dbg(sd->dev, "setting %d active\n", local->index);
+#ifdef CONFIG_MULTIPLEXER
 		ret = mux_control_try_select(vmux->mux, local->index);
+#else
+		ret = regmap_field_write(vmux->field, local->index);
+#endif
 		if (ret < 0)
 			goto out;
 		vmux->active = local->index;
@@ -79,7 +92,9 @@ static int video_mux_link_setup(struct media_entity *entity,
 			goto out;
 
 		dev_dbg(sd->dev, "going inactive\n");
+#ifdef CONFIG_MULTIPLEXER
 		mux_control_deselect(vmux->mux);
+#endif
 		vmux->active = -1;
 	}
 
@@ -193,6 +208,48 @@ static const struct v4l2_subdev_ops video_mux_subdev_ops = {
 	.video = &video_mux_subdev_video_ops,
 };
 
+#ifndef CONFIG_MULTIPLEXER
+static int video_mux_probe_mmio_mux(struct video_mux *vmux)
+{
+	struct device *dev = vmux->subdev.dev;
+	struct of_phandle_args args;
+	struct reg_field field;
+	struct regmap *regmap;
+	u32 reg, mask;
+	int ret;
+
+	ret = of_parse_phandle_with_args(dev->of_node, "mux-controls",
+					 "#mux-control-cells", 0, &args);
+	if (ret)
+		return ret;
+
+	if (!of_device_is_compatible(args.np, "mmio-mux"))
+		return -EINVAL;
+
+	regmap = syscon_node_to_regmap(args.np->parent);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	ret = of_property_read_u32_index(args.np, "mux-reg-masks",
+					 2 * args.args[0], &reg);
+	if (!ret)
+		ret = of_property_read_u32_index(args.np, "mux-reg-masks",
+						 2 * args.args[0] + 1, &mask);
+	if (ret < 0)
+		return ret;
+
+	field.reg = reg;
+	field.msb = fls(mask) - 1;
+	field.lsb = ffs(mask) - 1;
+
+	vmux->field = devm_regmap_field_alloc(dev, regmap, field);
+	if (IS_ERR(vmux->field))
+		return PTR_ERR(vmux->field);
+
+	return 0;
+}
+#endif
+
 static int video_mux_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -230,9 +287,14 @@ static int video_mux_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+#ifdef CONFIG_MULTIPLEXER
 	vmux->mux = devm_mux_control_get(dev, NULL);
 	if (IS_ERR(vmux->mux)) {
 		ret = PTR_ERR(vmux->mux);
+#else
+	ret = video_mux_probe_mmio_mux(vmux);
+	if (ret) {
+#endif
 		if (ret != -EPROBE_DEFER)
 			dev_err(dev, "Failed to get mux: %d\n", ret);
 		return ret;
-- 
2.7.4
