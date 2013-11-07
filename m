From: Chris Ruehl <chris.ruehl-CR359r9tUDPXPF5Rlphj1Q@public.gmane.org>
Subject: Re: I2C add ov2640 ?
Date: Thu, 07 Nov 2013 14:28:29 +0800
Message-ID: <527B330D.3040704@gtsys.com.hk>
References: <52784785.1040406@gtsys.com.hk>	<5278C2B4.802@gtsys.com.hk> <CAOMZO5DdUyvKAJdwYLpVR2+V5HBCt-AqgDxwgkh4AHQsE+evng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5DdUyvKAJdwYLpVR2+V5HBCt-AqgDxwgkh4AHQsE+evng-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio

On Tuesday, November 05, 2013 06:58 PM, Fabio Estevam wrote:
> Hi Chris,
>
> On Tue, Nov 5, 2013 at 8:04 AM, Chris Ruehl<chris.ruehl-CR359r9tUDPXPF5Rlphj1Q@public.gmane.org>  wrote:
>
>>
>> Seams I got it. Will try that patch tomorrow and send a proper patch-set
>> when
>> done.
>
> Don't you need to retrieve the regulators from dt as well?
>
> Regards,
>
> Fabio Estevam

Still try to make the ov2640 run with DT and imx27 good thing:
I see a i2c-0 in the /sys path for the 0x30 but the driver is not loaded

I did
a)  add a pw_gpios = <&gpio1 13 0> and mentioned regulator
b)  add some code to fill the pdata allocate at runtime
c) find out that mclk seams missing and this is why the driver was not loaded

a)
&i2c1 {
         status = "okay";
         clock-frequency = <400000>;

         ov2640@30 {
                 compatible = "omnivision,ov2640";
                 vcc-supply = <&reg_3v3>;
                 reg = <0x30>;
                 pw_gpios = <&gpio1 13 0>;
         };
};

b)
--- a/drivers/media/i2c/soc_camera/ov2640.c
+++ b/drivers/media/i2c/soc_camera/ov2640.c
@@ -15,6 +15,9 @@

  #include <linux/init.h>
  #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_gpio.h>
  #include <linux/i2c.h>
  #include <linux/slab.h>
  #include <linux/delay.h>
@@ -983,8 +986,10 @@ static int ov2640_video_probe(struct i2c_client *client)
         int ret;

         ret = ov2640_s_power(&priv->subdev, 1);
-       if (ret < 0)
+       if (ret < 0) {
+               dev_err(&client->dev,"PowerON failed");
                 return ret;
+       }

         /*
          * check and show product ID and manufacturer ID
@@ -1059,6 +1064,49 @@ static struct v4l2_subdev_ops ov2640_subdev_ops = {
         .core   = &ov2640_subdev_core_ops,
         .video  = &ov2640_subdev_video_ops,
  };
+#ifdef CONFIG_OF
+static int camera_power_of(struct device *dev, int on)
+{
+       int pwgpio;
+       struct device_node *np = dev->of_node;
+       if (!np)
+               goto power_done;
+
+       pwgpio = of_get_named_gpio(np, "pw-gpios", 0);
+       if (gpio_is_valid(pwgpio))
+               gpio_set_value(pwgpio, on);
+
+power_done:
+       return 0;
+}
+
+static struct soc_camera_subdev_desc *
+ov2640_get_pdata(struct i2c_client *client)
+{
+       struct soc_camera_subdev_desc *pdata;
+
+       if (!client->dev.of_node)
+               return soc_camera_i2c_to_desc(client);
+
+       pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
+
+       if (!pdata)
+               goto get_done;
+
+       /* TODO anything to prepare before return */
+       pdata->power =  camera_power_of;
+       client->dev.platform_data = pdata;
+
+get_done:
+       return pdata;
+}
+#else
+static struct soc_camera_subdev_desc *
+ov2640_get_pdata(struct i2c_client *client)
+{
+       return soc_camera_i2c_to_desc(client);
+}
+#endif /* CONFIG_OF */

  /*
   * i2c_driver functions
@@ -1067,7 +1115,7 @@ static int ov2640_probe(struct i2c_client *client,
                         const struct i2c_device_id *did)
  {
         struct ov2640_priv      *priv;
-       struct soc_camera_subdev_desc *ssdd = soc_camera_i2c_to_desc(client);
+       struct soc_camera_subdev_desc *ssdd = ov2640_get_pdata(client);
         struct i2c_adapter      *adapter = to_i2c_adapter(client->dev.parent);
         int                     ret;

@@ -1083,7 +1131,8 @@ static int ov2640_probe(struct i2c_client *client,
                 return -EIO;
         }

-       priv = devm_kzalloc(&client->dev, sizeof(struct ov2640_priv), GFP_KERNEL);
+       priv = devm_kzalloc(&client->dev, sizeof(struct ov2640_priv)
+                       , GFP_KERNEL);
         if (!priv) {
                 dev_err(&adapter->dev,
                         "Failed to allocate memory for private data!\n");
@@ -1102,6 +1151,7 @@ static int ov2640_probe(struct i2c_client *client,

         priv->clk = v4l2_clk_get(&client->dev, "mclk");
         if (IS_ERR(priv->clk)) {
+               dev_err(&adapter->dev, "OV2640 Not probed mclk missing\n");
                 ret = PTR_ERR(priv->clk);
                 goto eclkget;
         }
@@ -1128,6 +1178,14 @@ static int ov2640_remove(struct i2c_client *client)
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

c) in the patch dev_err(&adapter->dev, "OV2640 Not probed mclk missing\n");
give me the hint was wrong.

from your conversation with Sascha Hauer
http://www.spinics.net/lists/linux-i2c/msg09099.html

I see that's other ways to get a clock, thats works for
  v4l2_clk_get(&client->dev, "mclk")
  v4l2_clk_get(&client->dev, NULL)
as well?


Regards
Chris

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
