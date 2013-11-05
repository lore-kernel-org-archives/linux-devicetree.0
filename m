From: Chris Ruehl <chris.ruehl-CR359r9tUDPXPF5Rlphj1Q@public.gmane.org>
Subject: Re: I2C add ov2640 ?
Date: Tue, 05 Nov 2013 18:04:36 +0800
Message-ID: <5278C2B4.802@gtsys.com.hk>
References: <52784785.1040406@gtsys.com.hk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52784785.1040406-CR359r9tUDPXPF5Rlphj1Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi

On Tuesday, November 05, 2013 09:19 AM, Chris Ruehl wrote:
> Hi,
>
> we continuing moving our board (imx27) to the devicetree implementation,
> and find nothing howto deal with the ov2640 connect via i2c(0x30) and
> CSI interface to the Freescale SoC.
>
> Here is what I did:
>
> &i2c1 {
> status = "okay";
> clock-frequency = <400000>;
>
> cmos@30 {
> compatible = "omni,ov2640";
> reg = <0x30>;
> };
> };
>
>
>
> but when I boot the kernel, ov2640 complains about missing platform data.
>

Seams I got it. Will try that patch tomorrow and send a proper patch-set when
done.
--- a/drivers/media/i2c/soc_camera/ov2640.c
+++ b/drivers/media/i2c/soc_camera/ov2640.c
@@ -15,6 +15,7 @@

  #include <linux/init.h>
  #include <linux/module.h>
+#include <linux/of.h>
  #include <linux/i2c.h>
  #include <linux/slab.h>
  #include <linux/delay.h>
@@ -1060,6 +1061,24 @@ static struct v4l2_subdev_ops ov2640_subdev_ops = {
         .video  = &ov2640_subdev_video_ops,
  };

+static struct soc_camera_subdev_desc *
+ov2640_get_pdata(struct i2c_client *client)
+{
+       struct soc_camera_subdev_desc *pdata;
+
+       if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
+               return soc_camera_i2c_to_desc(client);
+
+       pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
+
+       if (!pdata)
+               goto done;
+
+       /* TODO anything to prepare before return */
+done:
+       return pdata;
+}
+
  /*
   * i2c_driver functions
   */
@@ -1067,7 +1086,7 @@ static int ov2640_probe(struct i2c_client *client,
                         const struct i2c_device_id *did)
  {
         struct ov2640_priv      *priv;
-       struct soc_camera_subdev_desc *ssdd = soc_camera_i2c_to_desc(client);
+       struct soc_camera_subdev_desc *ssdd = ov2640_get_pdata(client);
         struct i2c_adapter      *adapter = to_i2c_adapter(client->dev.parent);
         int                     ret;

@@ -1128,6 +1147,14 @@ static int ov2640_remove(struct i2c_client *client)
         return 0;
  }

+#if IS_ENABLED(CONFIG_OF)
+static const struct of_device_id ov2640_of_match[] = {
+       { .compatible = "omnivision,ov2640" },
+       { /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ov2640_of_match);
+#endif
+

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
