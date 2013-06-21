From: Mauro Carvalho Chehab <mchehab-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [git:media_tree/master] [media] media: i2c: tvp514x: add OF support
Date: Fri, 21 Jun 2013 16:29:09 +0200
Message-ID: <E1Uq2PC-0002Pq-9a@www.linuxtv.org>
Reply-To: <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: linuxtv-commits-dJidKbW2IEtAfugRpC6u6w@public.gmane.org
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Lad-dJidKbW2IEtAfugRpC6u6w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an automatic generated email to let you know that the following patch were queued at the 
http://git.linuxtv.org/media_tree.git tree:

Subject: [media] media: i2c: tvp514x: add OF support
Author:  Lad, Prabhakar <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date:    Tue Jun 4 12:26:23 2013 -0300

add OF support for the tvp514x driver.

Signed-off-by: Lad, Prabhakar <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
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
Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

 .../devicetree/bindings/media/i2c/tvp514x.txt      |   44 ++++++++++++++
 drivers/media/i2c/tvp514x.c                        |   62 ++++++++++++++++++--
 2 files changed, 100 insertions(+), 6 deletions(-)

---

http://git.linuxtv.org/media_tree.git?a=commitdiff;h=b610b5928dc04095b9b24b83e4ddbb399d933611

diff --git a/Documentation/devicetree/bindings/media/i2c/tvp514x.txt b/Documentation/devicetree/bindings/media/i2c/tvp514x.txt
new file mode 100644
index 0000000..46752cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/tvp514x.txt
@@ -0,0 +1,44 @@
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
+For further reading on port node refer to Documentation/devicetree/bindings/
+media/video-interfaces.txt.
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
index b8061b5..864eb14 100644
--- a/drivers/media/i2c/tvp514x.c
+++ b/drivers/media/i2c/tvp514x.c
@@ -39,6 +39,7 @@
 #include <media/v4l2-device.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-mediabus.h>
+#include <media/v4l2-of.h>
 #include <media/v4l2-ctrls.h>
 #include <media/tvp514x.h>
 #include <media/media-entity.h>
@@ -1056,6 +1057,42 @@ static struct tvp514x_decoder tvp514x_dev = {
 
 };
 
+static struct tvp514x_platform_data *
+tvp514x_get_pdata(struct i2c_client *client)
+{
+	struct tvp514x_platform_data *pdata;
+	struct v4l2_of_endpoint bus_cfg;
+	struct device_node *endpoint;
+	unsigned int flags;
+
+	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
+		return client->dev.platform_data;
+
+	endpoint = v4l2_of_get_next_endpoint(client->dev.of_node, NULL);
+	if (!endpoint)
+		return NULL;
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
@@ -1067,19 +1104,20 @@ static struct tvp514x_decoder tvp514x_dev = {
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
@@ -1091,7 +1129,7 @@ tvp514x_probe(struct i2c_client *client, const struct i2c_device_id *id)
 			sizeof(tvp514x_reg_list_default));
 
 	/* Copy board specific information here */
-	decoder->pdata = client->dev.platform_data;
+	decoder->pdata = pdata;
 
 	/**
 	 * Fetch platform specific data, and configure the
@@ -1231,8 +1269,20 @@ static const struct i2c_device_id tvp514x_id[] = {
 
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
