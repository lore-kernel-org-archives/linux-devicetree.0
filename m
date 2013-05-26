From: Prabhakar Lad <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4] media: i2c: tvp514x: add OF support
Date: Sun, 26 May 2013 18:10:37 +0530
Message-ID: <1369572037-10200-1-git-send-email-prabhakar.csengg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: LMML <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: DLOS <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, Mauro Carvalho Chehab <mchehab-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Lad, Prabhakar <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

add OF support for the tvp514x driver.

Signed-off-by: Lad, Prabhakar <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
Cc: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
---
 Tested on da850-evm.

 RFC v1: https://patchwork.kernel.org/patch/2030061/
 RFC v2: https://patchwork.kernel.org/patch/2061811/

 Changes for current version from RFC v2:
 1: Fixed review comments pointed by Sylwester.

 Changes for v2:
 1: Listed all the compatible property values in the documentation text file.
 2: Removed "-decoder" from compatible property values.
 3: Added a reference to the V4L2 DT bindings documentation to explain
    what the port and endpoint nodes are for.
 4: Fixed some Nits pointed by Laurent.
 5: Removed unnecessary header file includes and sort them alphabetically.

 Changes for v3:
 1: Rebased on patch https://patchwork.kernel.org/patch/2539411/
 
 Changes for v4:
 1: added missing call for of_node_put().
 2: Rebased the patch on v3.11.
 
 .../devicetree/bindings/media/i2c/tvp514x.txt      |   45 ++++++++++++++
 drivers/media/i2c/tvp514x.c                        |   62 ++++++++++++++++++--
 2 files changed, 101 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/tvp514x.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/tvp514x.txt b/Documentation/devicetree/bindings/media/i2c/tvp514x.txt
new file mode 100644
index 0000000..cc09424
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/tvp514x.txt
@@ -0,0 +1,45 @@
+* Texas Instruments TVP514x video decoder
+
+The TVP5146/TVP5146m2/TVP5147/TVP5147m1 device is high quality, single-chip
+digital video decoder that digitizes and decodes all popular baseband analog
+video formats into digital video component. The tvp514x decoder supports analog-
+to-digital (A/D) conversion of component RGB and YPbPr signals as well as A/D
+conversion and decoding of NTSC, PAL and SECAM composite and S-video into
+component YCbCr.
+
+Required Properties :
+- compatible : value should be either one among the following
+	(a) "ti,tvp5146" for tvp5146 decoder.
+	(b) "ti,tvp5146m2" for tvp5146m2 decoder.
+	(c) "ti,tvp5147" for tvp5147 decoder.
+	(d) "ti,tvp5147m1" for tvp5147m1 decoder.
+
+- hsync-active: HSYNC Polarity configuration for endpoint.
+
+- vsync-active: VSYNC Polarity configuration for endpoint.
+
+- pclk-sample: Clock polarity of the endpoint.
+
+
+For further reading of port node refer Documentation/devicetree/bindings/media/
+video-interfaces.txt.
+
+Example:
+
+	i2c0@1c22000 {
+		...
+		...
+		tvp514x@5c {
+			compatible = "ti,tvp5146";
+			reg = <0x5c>;
+
+			port {
+				tvp514x_1: endpoint {
+					hsync-active = <1>;
+					vsync-active = <1>;
+					pclk-sample = <0>;
+				};
+			};
+		};
+		...
+	};
diff --git a/drivers/media/i2c/tvp514x.c b/drivers/media/i2c/tvp514x.c
index 7438e01..803f3b8 100644
--- a/drivers/media/i2c/tvp514x.c
+++ b/drivers/media/i2c/tvp514x.c
@@ -38,6 +38,7 @@
 
 #include <media/v4l2-device.h>
 #include <media/v4l2-common.h>
+#include <media/v4l2-of.h>
 #include <media/v4l2-mediabus.h>
 #include <media/v4l2-chip-ident.h>
 #include <media/v4l2-ctrls.h>
@@ -1055,6 +1056,42 @@ static struct tvp514x_decoder tvp514x_dev = {
 
 };
 
+static struct tvp514x_platform_data *
+tvp514x_get_pdata(struct i2c_client *client)
+{
+	struct tvp514x_platform_data *pdata = NULL;
+	struct v4l2_of_endpoint bus_cfg;
+	struct device_node *endpoint;
+	unsigned int flags;
+
+	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
+		return client->dev.platform_data;
+
+	endpoint = v4l2_of_get_next_endpoint(client->dev.of_node, NULL);
+	if (!endpoint)
+		goto done;
+
+	pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		goto done;
+
+	v4l2_of_parse_endpoint(endpoint, &bus_cfg);
+	flags = bus_cfg.bus.parallel.flags;
+
+	if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
+		pdata->hs_polarity = 1;
+
+	if (flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH)
+		pdata->vs_polarity = 1;
+
+	if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
+		pdata->clk_polarity = 1;
+
+done:
+	of_node_put(endpoint);
+	return pdata;
+}
+
 /**
  * tvp514x_probe() - decoder driver i2c probe handler
  * @client: i2c driver client device structure
@@ -1066,19 +1103,20 @@ static struct tvp514x_decoder tvp514x_dev = {
 static int
 tvp514x_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
+	struct tvp514x_platform_data *pdata = tvp514x_get_pdata(client);
 	struct tvp514x_decoder *decoder;
 	struct v4l2_subdev *sd;
 	int ret;
 
+	if (pdata == NULL) {
+		dev_err(&client->dev, "No platform data\n");
+		return -EINVAL;
+	}
+
 	/* Check if the adapter supports the needed features */
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
 		return -EIO;
 
-	if (!client->dev.platform_data) {
-		v4l2_err(client, "No platform data!!\n");
-		return -ENODEV;
-	}
-
 	decoder = devm_kzalloc(&client->dev, sizeof(*decoder), GFP_KERNEL);
 	if (!decoder)
 		return -ENOMEM;
@@ -1090,7 +1128,7 @@ tvp514x_probe(struct i2c_client *client, const struct i2c_device_id *id)
 			sizeof(tvp514x_reg_list_default));
 
 	/* Copy board specific information here */
-	decoder->pdata = client->dev.platform_data;
+	decoder->pdata = pdata;
 
 	/**
 	 * Fetch platform specific data, and configure the
@@ -1230,8 +1268,20 @@ static const struct i2c_device_id tvp514x_id[] = {
 
 MODULE_DEVICE_TABLE(i2c, tvp514x_id);
 
+#if IS_ENABLED(CONFIG_OF)
+static const struct of_device_id tvp514x_of_match[] = {
+	{ .compatible = "ti,tvp5146", },
+	{ .compatible = "ti,tvp5146m2", },
+	{ .compatible = "ti,tvp5147", },
+	{ .compatible = "ti,tvp5147m1", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, tvp514x_of_match);
+#endif
+
 static struct i2c_driver tvp514x_driver = {
 	.driver = {
+		.of_match_table = of_match_ptr(tvp514x_of_match),
 		.owner = THIS_MODULE,
 		.name = TVP514X_MODULE_NAME,
 	},
-- 
1.7.0.4
