From: drinkcat <drinkcat@chromium.org>
Subject: Re: [PATCHv4 3/3] drm: bridge: anx78xx: Add anx78xx driver support
 by analogix.
Date: Mon, 28 Sep 2015 17:10:23 -0700
Message-ID: <20150929001021.GA602@localhost>
References: <1443209368-7135-1-git-send-email-enric.balletbo@collabora.com>
 <1443209368-7135-4-git-send-email-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1443209368-7135-4-git-send-email-enric.balletbo@collabora.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Enric Balletbo i Serra <eballetbo@gmail.com>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, djkurtz@chromium.org, laurent.pinchart@ideasonboard.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, airlied@linux.ie, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, sjoerd.simons@collabora.co.uk, robh+dt@kernel.org, span@analogixsemi.com, galak@codeaurora.org, mark.rutland@arm.com, javier@dowhile0.org, dan.carpenter@oracle.com, nathan.chung@mediatek.com
List-Id: devicetree@vger.kernel.org

Hi Enric,

On Fri, Sep 25, 2015 at 09:29:28PM +0200, Enric Balletbo i Serra wrote:
> At the moment it only supports ANX7814.
> 
> The ANX7814 is an ultra-low power Full-HD (1080p60) SlimPort transmitter
> designed for portable devices.
> 
> This driver adds initial support and supports HDMI to DP pass-through mode.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

More comments. Please look at patterns (u8->bool, use bit_ctl, etc.):
I did not comment on every single instance of these.

Best,

> ---
>  drivers/gpu/drm/bridge/Kconfig                   |    2 +
>  drivers/gpu/drm/bridge/Makefile                  |    1 +
>  drivers/gpu/drm/bridge/anx78xx/Kconfig           |    7 +
>  drivers/gpu/drm/bridge/anx78xx/Makefile          |    4 +
>  drivers/gpu/drm/bridge/anx78xx/anx78xx.h         |   41 +
>  drivers/gpu/drm/bridge/anx78xx/anx78xx_main.c    |  228 ++
>  drivers/gpu/drm/bridge/anx78xx/slimport_tx_drv.c | 3148 ++++++++++++++++++++++
>  drivers/gpu/drm/bridge/anx78xx/slimport_tx_drv.h |  214 ++
>  drivers/gpu/drm/bridge/anx78xx/slimport_tx_reg.h |  807 ++++++
>  9 files changed, 4452 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/anx78xx/Kconfig
>  create mode 100644 drivers/gpu/drm/bridge/anx78xx/Makefile
>  create mode 100644 drivers/gpu/drm/bridge/anx78xx/anx78xx.h
>  create mode 100644 drivers/gpu/drm/bridge/anx78xx/anx78xx_main.c
>  create mode 100644 drivers/gpu/drm/bridge/anx78xx/slimport_tx_drv.c
>  create mode 100644 drivers/gpu/drm/bridge/anx78xx/slimport_tx_drv.h
>  create mode 100644 drivers/gpu/drm/bridge/anx78xx/slimport_tx_reg.h
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 2de52a5..aa6fe12 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -29,4 +29,6 @@ config DRM_PARADE_PS8622
>  	---help---
>  	  Parade eDP-LVDS bridge chip driver.
>  
> +source "drivers/gpu/drm/bridge/anx78xx/Kconfig"
> +
>  endmenu
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index e2eef1c..e5bd38b 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -3,3 +3,4 @@ ccflags-y := -Iinclude/drm
>  obj-$(CONFIG_DRM_DW_HDMI) += dw_hdmi.o
>  obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
>  obj-$(CONFIG_DRM_PARADE_PS8622) += parade-ps8622.o
> +obj-$(CONFIG_DRM_ANX78XX) += anx78xx/
> diff --git a/drivers/gpu/drm/bridge/anx78xx/Kconfig b/drivers/gpu/drm/bridge/anx78xx/Kconfig
> new file mode 100644
> index 0000000..08f9c08
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/anx78xx/Kconfig
> @@ -0,0 +1,7 @@
> +config DRM_ANX78XX
> +	tristate "Analogix ANX78XX bridge"
> +	help
> +        	ANX78XX is a HD video transmitter chip over micro-USB
> +		connector for smartphone device.
> +
> +
> diff --git a/drivers/gpu/drm/bridge/anx78xx/Makefile b/drivers/gpu/drm/bridge/anx78xx/Makefile
> new file mode 100644
> index 0000000..a843733
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/anx78xx/Makefile
> @@ -0,0 +1,4 @@
> +obj-${CONFIG_DRM_ANX78XX} :=  anx78xx.o
> +
> +anx78xx-y += anx78xx_main.o
> +anx78xx-y += slimport_tx_drv.o
> diff --git a/drivers/gpu/drm/bridge/anx78xx/anx78xx.h b/drivers/gpu/drm/bridge/anx78xx/anx78xx.h
> new file mode 100644
> index 0000000..f62c8e7
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/anx78xx/anx78xx.h
> @@ -0,0 +1,41 @@
> +/*
> + * Copyright(c) 2015, Analogix Semiconductor. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#ifndef __ANX78xx_H
> +#define __ANX78xx_H
> +
> +#include <linux/i2c.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/workqueue.h>
> +#include <linux/gpio/consumer.h>
> +
> +struct anx78xx_platform_data {
> +	struct gpio_desc *gpiod_pd;
> +	struct gpio_desc *gpiod_reset;
> +	spinlock_t lock;
> +};
> +
> +struct anx78xx {
> +	struct i2c_client *client;
> +	struct anx78xx_platform_data *pdata;
> +	struct delayed_work work;
> +	struct workqueue_struct *workqueue;
> +	struct mutex lock;
> +};
> +
> +void anx78xx_poweron(struct anx78xx *data);
> +void anx78xx_poweroff(struct anx78xx *data);
> +
> +#endif
> diff --git a/drivers/gpu/drm/bridge/anx78xx/anx78xx_main.c b/drivers/gpu/drm/bridge/anx78xx/anx78xx_main.c
> new file mode 100644
> index 0000000..1e4a87e
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/anx78xx/anx78xx_main.c
> @@ -0,0 +1,228 @@
> +/*
> + * Copyright(c) 2015, Analogix Semiconductor. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/types.h>
> +#include <linux/err.h>
> +#include <linux/async.h>
> +#include <linux/of_gpio.h>
> +#include <linux/of_platform.h>
> +#include <linux/delay.h>
> +
> +#include "anx78xx.h"
> +#include "slimport_tx_drv.h"
> +
> +void anx78xx_poweron(struct anx78xx *anx78xx)
> +{
> +	struct anx78xx_platform_data *pdata = anx78xx->pdata;
> +
> +	gpiod_set_value_cansleep(pdata->gpiod_reset, 0);
> +	usleep_range(1000, 2000);
> +
> +	gpiod_set_value_cansleep(pdata->gpiod_pd, 0);
> +	usleep_range(1000, 2000);
> +
> +	gpiod_set_value_cansleep(pdata->gpiod_reset, 1);
> +}
> +
> +void anx78xx_poweroff(struct anx78xx *anx78xx)
> +{
> +	struct anx78xx_platform_data *pdata = anx78xx->pdata;
> +
> +	gpiod_set_value_cansleep(pdata->gpiod_reset, 0);
> +	usleep_range(1000, 2000);
> +
> +	gpiod_set_value_cansleep(pdata->gpiod_pd, 1);
> +	usleep_range(1000, 2000);
> +}
> +
> +static int anx78xx_init_gpio(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	struct anx78xx_platform_data *pdata = anx78xx->pdata;
> +
> +	/* gpio for chip power down */
> +	pdata->gpiod_pd = devm_gpiod_get(dev, "pd", GPIOD_OUT_HIGH);
> +	if (IS_ERR(pdata->gpiod_pd)) {
> +		dev_err(dev, "unable to claim pd gpio\n");
> +		return PTR_ERR(pdata->gpiod_pd);
> +	}
> +
> +	/* gpio for chip reset */
> +	pdata->gpiod_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(pdata->gpiod_reset)) {
> +		dev_err(dev, "unable to claim reset gpio\n");
> +		return PTR_ERR(pdata->gpiod_reset);
> +	}
> +
> +	return 0;
> +}
> +
> +static int anx78xx_system_init(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +
> +	if (!sp_chip_detect(anx78xx)) {
> +		anx78xx_poweroff(anx78xx);
> +		dev_err(dev, "failed to detect anx78xx\n");
> +		return -ENODEV;
> +	}
> +
> +	sp_tx_variable_init();
> +	return 0;
> +}

I think this function might be better off as "sp_system_init" in
tx_drv.c, since sp_chip_detect and sp_tx_variable_init are only
called from here anyway.

> +
> +static void anx78xx_work_func(struct work_struct *work)
> +{
> +	struct anx78xx *anx78xx = container_of(work, struct anx78xx,
> +					       work.work);
> +	int workqueue_timer = 0;
> +
> +	if (sp_tx_current_state() >= STATE_PLAY_BACK)
> +		workqueue_timer = 500;
> +	else
> +		workqueue_timer = 100;

So whenever the bridge is not outputing anything, the workqueue will
be exectuted every 100ms? That seems like a lot...

> +	mutex_lock(&anx78xx->lock);
> +	sp_main_process(anx78xx);
> +	mutex_unlock(&anx78xx->lock);
> +	queue_delayed_work(anx78xx->workqueue, &anx78xx->work,
> +			   msecs_to_jiffies(workqueue_timer));
> +}
> +
> +static int anx78xx_i2c_probe(struct i2c_client *client,
> +			     const struct i2c_device_id *id)
> +{
> +	struct anx78xx *anx78xx;
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_I2C_BLOCK)) {
> +		dev_err(&client->dev, "i2c bus does not support the device\n");
> +		return -ENODEV;
> +	}
> +
> +	anx78xx = devm_kzalloc(&client->dev, sizeof(*anx78xx), GFP_KERNEL);
> +	if (!anx78xx)
> +		return -ENOMEM;
> +
> +	anx78xx->pdata = devm_kzalloc(&client->dev,
> +				      sizeof(struct anx78xx_platform_data),
> +				      GFP_KERNEL);
> +	if (!anx78xx->pdata)
> +		return -ENOMEM;
> +
> +	anx78xx->client = client;
> +
> +	i2c_set_clientdata(client, anx78xx);
> +
> +	mutex_init(&anx78xx->lock);
> +
> +	ret = anx78xx_init_gpio(anx78xx);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to initialize gpios\n");
> +		return ret;
> +	}
> +
> +	INIT_DELAYED_WORK(&anx78xx->work, anx78xx_work_func);
> +
> +	anx78xx->workqueue = create_singlethread_workqueue("anx78xx_work");
> +	if (!anx78xx->workqueue) {
> +		dev_err(&client->dev, "failed to create work queue\n");
> +		return -ENOMEM;
> +	}
> +
> +	ret = anx78xx_system_init(anx78xx);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to initialize anx78xx\n");
> +		goto cleanup;
> +	}
> +
> +	/* enable driver */
> +	queue_delayed_work(anx78xx->workqueue, &anx78xx->work, 0);
> +
> +	return 0;
> +
> +cleanup:
> +	destroy_workqueue(anx78xx->workqueue);
> +	return ret;
> +}
> +
> +static int anx78xx_i2c_remove(struct i2c_client *client)
> +{
> +	struct anx78xx *anx78xx = i2c_get_clientdata(client);
> +
> +	destroy_workqueue(anx78xx->workqueue);
> +
> +	return 0;
> +}
> +
> +static int anx78xx_i2c_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
> +	struct anx78xx *anx78xx = i2c_get_clientdata(client);
> +
> +	cancel_delayed_work_sync(&anx78xx->work);
> +	flush_workqueue(anx78xx->workqueue);
> +	anx78xx_poweroff(anx78xx);
> +	sp_tx_clean_state_machine();
> +
> +	return 0;
> +}
> +
> +static int anx78xx_i2c_resume(struct device *dev)
> +{
> +	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
> +	struct anx78xx *anx78xx = i2c_get_clientdata(client);
> +
> +	queue_delayed_work(anx78xx->workqueue, &anx78xx->work, 0);
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(anx78xx_i2c_pm_ops,
> +			anx78xx_i2c_suspend, anx78xx_i2c_resume);
> +
> +static const struct i2c_device_id anx78xx_id[] = {
> +	{"anx7814", 0},
> +	{ /* sentinel */ }
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, anx78xx_id);
> +
> +static const struct of_device_id anx78xx_match_table[] = {
> +	{.compatible = "analogix,anx7814",},
> +	{ /* sentinel */ },
> +};
> +
> +MODULE_DEVICE_TABLE(of, anx78xx_match_table);

This should be protected by CONFIG_OF.

> +
> +static struct i2c_driver anx78xx_driver = {
> +	.driver = {
> +		   .name = "anx7814",
> +		   .pm = &anx78xx_i2c_pm_ops,
> +		   .of_match_table = of_match_ptr(anx78xx_match_table),
> +		   },
> +	.probe = anx78xx_i2c_probe,
> +	.remove = anx78xx_i2c_remove,
> +	.id_table = anx78xx_id,
> +};
> +
> +module_i2c_driver(anx78xx_driver);
> +
> +MODULE_DESCRIPTION("Slimport transmitter ANX78XX driver");
> +MODULE_AUTHOR("Junhua Xia <jxia@analogixsemi.com>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_VERSION("1.1");
> diff --git a/drivers/gpu/drm/bridge/anx78xx/slimport_tx_drv.c b/drivers/gpu/drm/bridge/anx78xx/slimport_tx_drv.c
> new file mode 100644
> index 0000000..7721326
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/anx78xx/slimport_tx_drv.c
> @@ -0,0 +1,3148 @@
> +/*
> + * Copyright(c) 2015, Analogix Semiconductor. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +#include <linux/delay.h>
> +#include <linux/types.h>
> +
> +#include "anx78xx.h"
> +#include "slimport_tx_drv.h"
> +
> +struct slimport {
> +	int	block_en;	/* HDCP control enable/ disable from AP */
> +
> +	u8	tx_test_bw;
> +	bool	tx_test_lt;
> +	bool	tx_test_edid;

I think these variables, and the ones below, could do we more descriptive,
or at least more systematic names. E.g. the last 2 tx_test variables above
are bool, but the first one is u8, this is a little confusing.

> +	u8	changed_bandwidth;
> +
> +	u8	hdmi_dvi_status;
> +	u8	need_clean_status;

bool

> +
> +	u8	ds_vid_stb_cntr;

Only set to 0, once, then never used.

> +	u8	hdcp_fail_count;
> +
> +	u8	edid_break;
> +	u8	edid_checksum;
> +	u8	edid_blocks[256];

This variable is only used in sp_edid_process: allocate the buffer there.

> +
> +	u8	read_edid_flag;
> +
> +	u8	down_sample_en;
> +
> +	struct packet_avi	tx_packet_avi;
> +	struct packet_spd	tx_packet_spd;
> +	struct packet_mpeg	tx_packet_mpeg;
> +	struct audio_info_frame	tx_audioinfoframe;
> +
> +	struct common_int	common_int_status;
> +	struct hdmi_rx_int	hdmi_rx_int_status;
> +
> +	enum sp_tx_state		tx_system_state;
> +	enum sp_tx_state		tx_system_state_bak;
> +	enum audio_output_status	tx_ao_state;
> +	enum video_output_status	tx_vo_state;
> +	enum sink_connection_status	tx_sc_state;
> +	enum sp_tx_lt_status		tx_lt_state;
> +	enum hdcp_status		hcdp_state;
> +};
> +
> +static struct slimport sp;
> +
> +static const u16 chipid_list[] = {
> +	0x7818,
> +	0x7816,
> +	0x7814,
> +	0x7812,
> +	0x7810,
> +	0x7806,
> +	0x7802

Add a comma after the last entry, and reverse the order.

> +};
> +
> +static void sp_hdmi_rx_new_vsi_int(struct anx78xx *anx78xx);
> +static u8 sp_hdcp_cap_check(struct anx78xx *anx78xx);
> +static void sp_tx_show_information(struct anx78xx *anx78xx);
> +static void sp_print_system_state(struct anx78xx *anx78xx, u8 ss);
> +
> +static int sp_read_reg(struct anx78xx *anx78xx, u8 slave_addr,
> +		       u8 offset, u8 *buf)
> +{
> +	int ret;
> +	struct i2c_client *client = anx78xx->client;
> +
> +	client->addr = slave_addr >> 1;
> +
> +	ret = i2c_smbus_read_byte_data(client, offset);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to read i2c addr=%x\n",
> +			slave_addr);
> +		return ret;
> +	}
> +
> +	*buf = ret;
> +
> +	return 0;
> +}

This function, and write_reg below, returns error values, but those
are ignored by all callers... I think callers should propagate errors.

> +
> +static int sp_write_reg(struct anx78xx *anx78xx, u8 slave_addr,
> +			u8 offset, u8 value)
> +{
> +	int ret;
> +	struct i2c_client *client = anx78xx->client;
> +
> +	client->addr = slave_addr >> 1;
> +
> +	ret = i2c_smbus_write_byte_data(client, offset, value);
> +	if (ret < 0)
> +		dev_err(&client->dev, "failed to write i2c addr=%x\n",
> +			slave_addr);
> +
> +	return ret;
> +}
> +
> +static u8 sp_i2c_read_byte(struct anx78xx *anx78xx,
> +			   u8 dev, u8 offset)
> +{
> +	u8 ret;
> +
> +	sp_read_reg(anx78xx, dev, offset, &ret);
> +	return ret;
> +}

I don't think this function should exist: it is a simple wrapper that ignores
errors (and returns random values on error).

> +
> +static void sp_reg_bit_ctl(struct anx78xx *anx78xx, u8 addr, u8 offset,
> +			   u8 data, bool enable)
> +{
> +	u8 regval;
> +
> +	sp_read_reg(anx78xx, addr, offset, &regval);
> +	if (enable) {
> +		if ((regval & data) != data) {
> +			regval |= data;
> +			sp_write_reg(anx78xx, addr, offset, regval);
> +		}
> +	} else {
> +		if ((regval & data) == data) {
> +			regval &= ~data;
> +			sp_write_reg(anx78xx, addr, offset, regval);
> +		}
> +	}
> +}
> +
> +static inline void sp_write_reg_or(struct anx78xx *anx78xx, u8 address,
> +				   u8 offset, u8 mask)
> +{
> +	sp_write_reg(anx78xx, address, offset,
> +		     sp_i2c_read_byte(anx78xx, address, offset) | mask);
> +}
> +
> +static inline void sp_write_reg_and(struct anx78xx *anx78xx, u8 address,
> +				    u8 offset, u8 mask)
> +{
> +	sp_write_reg(anx78xx, address, offset,
> +		     sp_i2c_read_byte(anx78xx, address, offset) & mask);
> +}
> +
> +static inline void sp_write_reg_and_or(struct anx78xx *anx78xx, u8 address,
> +				       u8 offset, u8 and_mask, u8 or_mask)
> +{
> +	sp_write_reg(anx78xx, address, offset,
> +		     (sp_i2c_read_byte(anx78xx, address, offset) & and_mask)
> +		     | or_mask);
> +}
> +
> +static inline void sp_write_reg_or_and(struct anx78xx *anx78xx, u8 address,
> +				       u8 offset, u8 or_mask, u8 and_mask)
> +{
> +	sp_write_reg(anx78xx, address, offset,
> +		     (sp_i2c_read_byte(anx78xx, address, offset) | or_mask)
> +		     & and_mask);
> +}
> +
> +static inline void sp_tx_video_mute(struct anx78xx *anx78xx, bool enable)
> +{
> +	sp_reg_bit_ctl(anx78xx, TX_P2, VID_CTRL1, VIDEO_MUTE, enable);
> +}
> +
> +static inline void hdmi_rx_mute_audio(struct anx78xx *anx78xx, bool enable)
> +{
> +	sp_reg_bit_ctl(anx78xx, RX_P0, RX_MUTE_CTRL, AUD_MUTE, enable);
> +}
> +
> +static inline void hdmi_rx_mute_video(struct anx78xx *anx78xx, bool enable)
> +{
> +	sp_reg_bit_ctl(anx78xx, RX_P0, RX_MUTE_CTRL, VID_MUTE, enable);
> +}
> +
> +static inline void sp_tx_addronly_set(struct anx78xx *anx78xx, bool enable)
> +{
> +	sp_reg_bit_ctl(anx78xx, TX_P0, AUX_CTRL2, ADDR_ONLY_BIT, enable);
> +}
> +
> +static inline void sp_tx_set_link_bw(struct anx78xx *anx78xx, u8 bw)
> +{
> +	sp_write_reg(anx78xx, TX_P0, SP_TX_LINK_BW_SET_REG, bw);
> +}
> +
> +static inline u8 sp_tx_get_link_bw(struct anx78xx *anx78xx)
> +{
> +	return (sp_i2c_read_byte(anx78xx, TX_P0, SP_TX_LINK_BW_SET_REG) &
> +		LINK_BW_SET_MASK);
> +}
> +
> +static inline bool sp_tx_get_pll_lock_status(struct anx78xx *anx78xx)
> +{
> +	u8 byte;
> +
> +	byte = sp_i2c_read_byte(anx78xx, TX_P0, TX_DEBUG1);
> +
> +	return (byte & DEBUG_PLL_LOCK) != 0;
> +}
> +
> +static inline void gen_m_clk_with_downspeading(struct anx78xx *anx78xx)

downspeeding? downspreading?

> +{
> +	sp_write_reg_or(anx78xx, TX_P0, SP_TX_M_CALCU_CTRL, M_GEN_CLK_SEL);
> +}
> +
> +static inline void gen_m_clk_without_downspeading(struct anx78xx *anx78xx)
> +{
> +	sp_write_reg_and(anx78xx, TX_P0, SP_TX_M_CALCU_CTRL, (~M_GEN_CLK_SEL));
> +}

Can't you use bit_ctl for these 2?

> +
> +static inline void hdmi_rx_set_hpd(struct anx78xx *anx78xx, bool enable)
> +{
> +	if (enable)
> +		sp_write_reg_or(anx78xx, TX_P2, SP_TX_VID_CTRL3_REG, HPD_OUT);
> +	else
> +		sp_write_reg_and(anx78xx, TX_P2, SP_TX_VID_CTRL3_REG,
> +				 ~HPD_OUT);
> +}
> +
> +static inline void hdmi_rx_set_termination(struct anx78xx *anx78xx,
> +					   bool enable)
> +{
> +	if (enable)
> +		sp_write_reg_and(anx78xx, RX_P0, HDMI_RX_TMDS_CTRL_REG7,
> +				 ~TERM_PD);
> +	else
> +		sp_write_reg_or(anx78xx, RX_P0, HDMI_RX_TMDS_CTRL_REG7,
> +				TERM_PD);
> +}

bit_ctl for these 2 as well, and please check the rest of the code too.

> +
> +static inline void sp_tx_clean_hdcp_status(struct anx78xx *anx78xx)
> +{
> +	sp_write_reg(anx78xx, TX_P0, TX_HDCP_CTRL0, 0x03);
> +	sp_write_reg_or(anx78xx, TX_P0, TX_HDCP_CTRL0, RE_AUTH);
> +	usleep_range(2000, 4000);
> +}
> +
> +static inline void sp_tx_link_phy_initialization(struct anx78xx *anx78xx)

Please do not force inline, especially for these long-ish functions, the
compiler will do the right thing.

> +{
> +	sp_write_reg(anx78xx, TX_P2, SP_TX_ANALOG_CTRL0, 0x02);
> +	sp_write_reg(anx78xx, TX_P1, SP_TX_LT_CTRL_REG0, 0x01);
> +	sp_write_reg(anx78xx, TX_P1, SP_TX_LT_CTRL_REG10, 0x00);
> +	sp_write_reg(anx78xx, TX_P1, SP_TX_LT_CTRL_REG1, 0x03);
> +	sp_write_reg(anx78xx, TX_P1, SP_TX_LT_CTRL_REG11, 0x00);
> +	sp_write_reg(anx78xx, TX_P1, SP_TX_LT_CTRL_REG2, 0x07);
> +	sp_write_reg(anx78xx, TX_P1, SP_TX_LT_CTRL_REG12, 0x00);
> +	sp_write_reg(anx78xx, TX_P1, SP_TX_LT_CTRL_REG3, 0x7f);
> +	sp_write_reg(anx78xx, TX_P1, SP_TX_LT_CTRL_REG13, 0x00);
> +	sp_write_reg(anx78xx, TX_P1, SP_TX_LT_CTRL_REG4, 0x71);
> +	sp_write_reg(anx78xx, TX_P1, SP_TX_LT_CTRL_REG14, 0x0c);
> +	sp_write_reg(anx78xx, TX_P1, SP_TX_LT_CTRL_REG5, 0x6b);
> +	sp_write_reg(anx78xx, TX_P1, SP_TX_LT_CTRL_REG15, 0x42);
> +	sp_write_reg(anx78xx, TX_P1, SP_TX_LT_CTRL_REG6, 0x7f);
> +	sp_write_reg(anx78xx, TX_P1, SP_TX_LT_CTRL_REG16, 0x1e);
> +	sp_write_reg(anx78xx, TX_P1, SP_TX_LT_CTRL_REG7, 0x73);
> +	sp_write_reg(anx78xx, TX_P1, SP_TX_LT_CTRL_REG17, 0x3e);
> +	sp_write_reg(anx78xx, TX_P1, SP_TX_LT_CTRL_REG8, 0x7f);
> +	sp_write_reg(anx78xx, TX_P1, SP_TX_LT_CTRL_REG18, 0x72);
> +	sp_write_reg(anx78xx, TX_P1, SP_TX_LT_CTRL_REG9, 0x7f);
> +	sp_write_reg(anx78xx, TX_P1, SP_TX_LT_CTRL_REG19, 0x7e);

Weird order, any reason not to write those from 1 to 19?

> +}
> +
> +static inline void sp_tx_set_sys_state(struct anx78xx *anx78xx, u8 ss)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +
> +	dev_dbg(dev, "set: clean_status: %x,\n", sp.need_clean_status);
> +
> +	if ((sp.tx_system_state >= STATE_LINK_TRAINING) &&
> +	    (ss < STATE_LINK_TRAINING))
> +		sp_write_reg_or(anx78xx, TX_P0, SP_TX_ANALOG_PD_REG, CH0_PD);
> +
> +	sp.tx_system_state_bak = sp.tx_system_state;
> +	sp.tx_system_state = ss;
> +	sp.need_clean_status = 1;
> +	sp_print_system_state(anx78xx, sp.tx_system_state);
> +}
> +
> +static inline void reg_hardware_reset(struct anx78xx *anx78xx)
> +{
> +	sp_write_reg_or(anx78xx, TX_P2, SP_TX_RST_CTRL_REG, HW_RST);
> +	sp_tx_clean_state_machine();
> +	sp_tx_set_sys_state(anx78xx, STATE_SP_INITIALIZED);
> +	msleep(500);
> +}
> +
> +static inline void write_dpcd_addr(struct anx78xx *anx78xx, u8 addrh,
> +				   u8 addrm, u8 addrl)
> +{
> +	u8 regval;
> +
> +	if (sp_i2c_read_byte(anx78xx, TX_P0, AUX_ADDR_7_0) != addrl)
> +		sp_write_reg(anx78xx, TX_P0, AUX_ADDR_7_0, addrl);
> +
> +	if (sp_i2c_read_byte(anx78xx, TX_P0, AUX_ADDR_15_8) != addrm)
> +		sp_write_reg(anx78xx, TX_P0, AUX_ADDR_15_8, addrm);
> +
> +	sp_read_reg(anx78xx, TX_P0, AUX_ADDR_19_16, &regval);

This is confusing, both sp_i2c_read_byte and sp_read_reg are used in
the same function. Pick one.

> +
> +	if ((regval & 0x0f) != (addrh & 0x0f))
> +		sp_write_reg(anx78xx, TX_P0, AUX_ADDR_19_16,
> +			     (regval  & 0xf0) | addrh);

1 space before &

> +}
> +
> +static inline void goto_next_system_state(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +
> +	dev_dbg(dev, "next: clean_status: %x,\n", sp.need_clean_status);
> +
> +	sp.tx_system_state_bak = sp.tx_system_state;
> +	sp.tx_system_state++;
> +	sp_print_system_state(anx78xx, sp.tx_system_state);
> +}
> +
> +static inline void redo_cur_system_state(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +
> +	dev_dbg(dev, "redo: clean_status: %x,\n", sp.need_clean_status);
> +
> +	sp.need_clean_status = 1;
> +	sp.tx_system_state_bak = sp.tx_system_state;
> +	sp_print_system_state(anx78xx, sp.tx_system_state);
> +}
> +
> +static inline void system_state_change_with_case(struct anx78xx *anx78xx,
> +						 u8 status)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +
> +	if (sp.tx_system_state < status)
> +		return;
> +
> +	dev_dbg(dev, "change_case: clean_status: %xm,\n",
> +		sp.need_clean_status);
> +
> +	if (sp.tx_system_state >= STATE_LINK_TRAINING &&
> +	    status < STATE_LINK_TRAINING)
> +		sp_write_reg_or(anx78xx, TX_P0, SP_TX_ANALOG_PD_REG,
> +				CH0_PD);
> +
> +	sp.need_clean_status = 1;
> +	sp.tx_system_state_bak = sp.tx_system_state;
> +	sp.tx_system_state = status;
> +	sp_print_system_state(anx78xx, sp.tx_system_state);
> +}
> +
> +static void sp_wait_aux_op_finish(struct anx78xx *anx78xx, u8 *err_flag)

Return an int and use that as error flag.

> +{
> +	u8 cnt;
> +	u8 regval;
> +	struct device *dev = &anx78xx->client->dev;
> +
> +	*err_flag = 0;
> +	cnt = 150;
> +	while (sp_i2c_read_byte(anx78xx, TX_P0, AUX_CTRL2) & AUX_OP_EN) {
> +		usleep_range(2000, 4000);
> +		if (cnt-- == 0) {
> +			dev_err(dev, "aux operate failed!\n");
> +			*err_flag = 1;
> +			break;
> +		}
> +	}
> +
> +	sp_read_reg(anx78xx, TX_P0, SP_TX_AUX_STATUS, &regval);
> +	if (regval & 0x0f) {
> +		dev_err(dev, "wait aux operation status %.2x\n", regval);
> +		*err_flag = 1;
> +	}
> +}
> +
> +static void sp_print_system_state(struct anx78xx *anx78xx, u8 ss)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +
> +	switch (ss) {
> +	case STATE_WAITTING_CABLE_PLUG:
> +		dev_dbg(dev, "-STATE_WAITTING_CABLE_PLUG-\n");
> +		break;
> +	case STATE_SP_INITIALIZED:
> +		dev_dbg(dev, "-STATE_SP_INITIALIZED-\n");
> +		break;
> +	case STATE_SINK_CONNECTION:
> +		dev_dbg(dev, "-STATE_SINK_CONNECTION-\n");
> +		break;
> +	case STATE_PARSE_EDID:
> +		dev_dbg(dev, "-STATE_PARSE_EDID-\n");
> +		break;
> +	case STATE_LINK_TRAINING:
> +		dev_dbg(dev, "-STATE_LINK_TRAINING-\n");
> +		break;
> +	case STATE_VIDEO_OUTPUT:
> +		dev_dbg(dev, "-STATE_VIDEO_OUTPUT-\n");
> +		break;
> +	case STATE_HDCP_AUTH:
> +		dev_dbg(dev, "-STATE_HDCP_AUTH-\n");
> +		break;
> +	case STATE_AUDIO_OUTPUT:
> +		dev_dbg(dev, "-STATE_AUDIO_OUTPUT-\n");
> +		break;
> +	case STATE_PLAY_BACK:
> +		dev_dbg(dev, "-STATE_PLAY_BACK-\n");
> +		break;
> +	default:
> +		dev_err(dev, "unknown system state\n");
> +		break;
> +	}
> +}
> +
> +static void sp_tx_rst_aux(struct anx78xx *anx78xx)
> +{
> +	sp_write_reg_or(anx78xx, TX_P2, RST_CTRL2, AUX_RST);
> +	sp_write_reg_and(anx78xx, TX_P2, RST_CTRL2, ~AUX_RST);

bit_ctl?

> +}
> +
> +static u8 sp_tx_aux_dpcdread_bytes(struct anx78xx *anx78xx, u8 addrh,
> +				   u8 addrm, u8 addrl, u8 ccount, u8 *pbuf)
> +{
> +	u8 regval, regval1, i;
> +	u8 bok;
> +	struct device *dev = &anx78xx->client->dev;
> +
> +	sp_write_reg(anx78xx, TX_P0, BUF_DATA_COUNT, 0x80);
> +	sp_write_reg(anx78xx, TX_P0, AUX_CTRL, ((ccount - 1) << 4) | 0x09);
> +	write_dpcd_addr(anx78xx, addrh, addrm, addrl);
> +	sp_write_reg_or(anx78xx, TX_P0, AUX_CTRL2, AUX_OP_EN);
> +	usleep_range(2000, 4000);
> +
> +	sp_wait_aux_op_finish(anx78xx, &bok);
> +	if (bok) {
> +		dev_err(dev, "aux read failed\n");
> +		sp_read_reg(anx78xx, TX_P2, SP_TX_INT_STATUS1, &regval);
> +		sp_read_reg(anx78xx, TX_P0, TX_DEBUG1, &regval1);
> +		if (!(regval1 & POLLING_EN) || (regval & POLLING_ERR))
> +			sp_tx_rst_aux(anx78xx);
> +		return 1;
> +	}
> +
> +	for (i = 0; i < ccount; i++) {
> +		sp_read_reg(anx78xx, TX_P0, BUF_DATA_0 + i, &regval);
> +		*(pbuf + i) = regval;
> +		if (i >= MAX_BUF_CNT)
> +			break;
> +	}
> +	return 0;
> +}
> +
> +static u8 sp_tx_aux_dpcdwrite_bytes(struct anx78xx *anx78xx, u8 addrh,
> +				    u8 addrm, u8 addrl, u8 ccount, u8 *pbuf)
> +{
> +	u8 regval, i, ret;
> +
> +	sp_write_reg(anx78xx, TX_P0, AUX_CTRL, ((ccount - 1) << 4) | 0x08);
> +	write_dpcd_addr(anx78xx, addrh, addrm, addrl);
> +	for (i = 0; i < ccount; i++) {

&& i < 16

> +		regval = *pbuf;
> +		pbuf++;
> +		sp_write_reg(anx78xx, TX_P0, BUF_DATA_0 + i, regval);

, pbuf[i]);
and drop regval.

> +
> +		if (i >= 15)
> +			break;
> +	}
> +	sp_write_reg_or(anx78xx, TX_P0, AUX_CTRL2, AUX_OP_EN);
> +	sp_wait_aux_op_finish(anx78xx, &ret);
> +	return ret;
> +}
> +
> +static u8 sp_tx_aux_dpcdwrite_byte(struct anx78xx *anx78xx, u8 addrh,
> +				   u8 addrm, u8 addrl, u8 data1)
> +{
> +	u8 ret;
> +
> +	sp_write_reg(anx78xx, TX_P0, AUX_CTRL, 0x08);
> +	write_dpcd_addr(anx78xx, addrh, addrm, addrl);
> +	sp_write_reg(anx78xx, TX_P0, BUF_DATA_0, data1);
> +	sp_write_reg_or(anx78xx, TX_P0, AUX_CTRL2, AUX_OP_EN);
> +	sp_wait_aux_op_finish(anx78xx, &ret);
> +	return ret;
> +}
> +
> +static void sp_block_power_ctrl(struct anx78xx *anx78xx,
> +				enum sp_tx_power_block sp_tx_pd_block,
> +				u8 power)

AFAICS, power is only ON or OFF. Use a bool.

> +{
> +	struct device *dev = &anx78xx->client->dev;
> +
> +	if (power == SP_POWER_ON)
> +		sp_write_reg_and(anx78xx, TX_P2, SP_POWERD_CTRL_REG,
> +				 ~sp_tx_pd_block);
> +	else
> +		sp_write_reg_or(anx78xx, TX_P2, SP_POWERD_CTRL_REG,
> +				sp_tx_pd_block);

Again, would be simple with bit_ctl.

> +
> +	dev_dbg(dev, "sp_tx_power_on: %.2x\n", sp_tx_pd_block);
> +}
> +
> +static void sp_vbus_power_off(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	int i;
> +
> +	for (i = 0; i < 5; i++) {
> +		sp_write_reg_and(anx78xx, TX_P2, TX_PLL_FILTER5,
> +				 ~P5V_PROTECT_PD & ~SHORT_PROTECT_PD);
> +		sp_write_reg_or(anx78xx, TX_P2, TX_PLL_FILTER, V33_SWITCH_ON);
> +		if (!(sp_i2c_read_byte(anx78xx, TX_P2, TX_PLL_FILTER5)
> +		    & 0xc0)) {
> +			dev_dbg(dev, "3.3V output enabled\n");
> +			break;
> +		}
> +	}
> +}
> +
> +void sp_tx_clean_state_machine(void)
> +{
> +	sp.tx_system_state = STATE_WAITTING_CABLE_PLUG;
> +	sp.tx_system_state_bak = STATE_WAITTING_CABLE_PLUG;
> +	sp.tx_sc_state = SC_INIT;
> +	sp.tx_lt_state = LT_INIT;
> +	sp.hcdp_state = HDCP_CAPABLE_CHECK;
> +	sp.tx_vo_state = VO_WAIT_VIDEO_STABLE;
> +	sp.tx_ao_state = AO_INIT;
> +}
> +
> +enum sp_tx_state sp_tx_current_state(void)
> +{
> +	return sp.tx_system_state;
> +}
> +
> +void sp_tx_variable_init(void)
> +{
> +	sp.block_en = 1;
> +
> +	sp.tx_system_state = STATE_WAITTING_CABLE_PLUG;
> +	sp.tx_system_state_bak = STATE_WAITTING_CABLE_PLUG;
> +
> +	sp.edid_break = 0;
> +	sp.read_edid_flag = 0;
> +	sp.edid_checksum = 0;
> +
> +	memset(sp.edid_blocks, 0, 256);
> +
> +	sp.tx_lt_state = LT_INIT;
> +	sp.hcdp_state = HDCP_CAPABLE_CHECK;
> +	sp.need_clean_status = 0;
> +	sp.tx_sc_state = SC_INIT;
> +	sp.tx_vo_state = VO_WAIT_VIDEO_STABLE;
> +	sp.tx_ao_state = AO_INIT;
> +	sp.changed_bandwidth = LINK_5P4G;
> +	sp.hdmi_dvi_status = HDMI_MODE;
> +
> +	sp.tx_test_lt = 0;
> +	sp.tx_test_bw = 0;
> +	sp.tx_test_edid = 0;
> +
> +	sp.ds_vid_stb_cntr = 0;
> +	sp.hdcp_fail_count = 0;
> +}
> +
> +static void hdmi_rx_tmds_phy_initialization(struct anx78xx *anx78xx)
> +{
> +	sp_write_reg(anx78xx, RX_P0, HDMI_RX_TMDS_CTRL_REG2, 0xa9);
> +	sp_write_reg(anx78xx, RX_P0, HDMI_RX_TMDS_CTRL_REG7, 0x80);
> +
> +	sp_write_reg(anx78xx, RX_P0, HDMI_RX_TMDS_CTRL_REG1, 0x90);
> +	sp_write_reg(anx78xx, RX_P0, HDMI_RX_TMDS_CTRL_REG6, 0x92);
> +	sp_write_reg(anx78xx, RX_P0, HDMI_RX_TMDS_CTRL_REG20, 0xf2);
> +}
> +
> +static void hdmi_rx_initialization(struct anx78xx *anx78xx)
> +{
> +	sp_write_reg(anx78xx, RX_P0, RX_MUTE_CTRL, AUD_MUTE | VID_MUTE);
> +	sp_write_reg_or(anx78xx, RX_P0, RX_CHIP_CTRL,
> +			MAN_HDMI5V_DET | PLLLOCK_CKDT_EN | DIGITAL_CKDT_EN);
> +
> +	sp_write_reg_or(anx78xx, RX_P0, RX_SRST, HDCP_MAN_RST | SW_MAN_RST |
> +			TMDS_RST | VIDEO_RST);
> +	sp_write_reg_and(anx78xx, RX_P0, RX_SRST, ~HDCP_MAN_RST &
> +			 ~SW_MAN_RST & ~TMDS_RST & ~VIDEO_RST);
> +
> +	sp_write_reg_or(anx78xx, RX_P0, RX_AEC_EN0, AEC_EN06 | AEC_EN05);
> +	sp_write_reg_or(anx78xx, RX_P0, RX_AEC_EN2, AEC_EN21);
> +	sp_write_reg_or(anx78xx, RX_P0, RX_AEC_CTRL, AVC_EN | AAC_OE | AAC_EN);
> +
> +	sp_write_reg_and(anx78xx, RX_P0, RX_SYS_PWDN1, ~PWDN_CTRL);
> +
> +	sp_write_reg_or(anx78xx, RX_P0, RX_VID_DATA_RNG, R2Y_INPUT_LIMIT);
> +	sp_write_reg(anx78xx, RX_P0, 0x65, 0xc4);
> +	sp_write_reg(anx78xx, RX_P0, 0x66, 0x18);
> +
> +	/* enable DDC stretch */
> +	sp_write_reg(anx78xx, TX_P0, TX_EXTRA_ADDR, 0x50);
> +
> +	hdmi_rx_tmds_phy_initialization(anx78xx);
> +	hdmi_rx_set_hpd(anx78xx, 0);
> +	hdmi_rx_set_termination(anx78xx, 0);
> +}
> +
> +struct anx78xx_clock_data const pxtal_data[XTAL_CLK_NUM] = {
> +	{19, 192},
> +	{24, 240},
> +	{25, 250},
> +	{26, 260},
> +	{27, 270},
> +	{38, 384},
> +	{52, 520},
> +	{27, 270},
> +};
> +
> +static void xtal_clk_sel(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +
> +	dev_dbg(dev, "define XTAL_CLK:  %x\n", XTAL_27M);
> +	sp_write_reg_and_or(anx78xx, TX_P2,
> +			    TX_ANALOG_DEBUG2, ~0x3c, 0x3c & (XTAL_27M << 2));
> +	sp_write_reg(anx78xx, TX_P0, 0xec, pxtal_data[XTAL_27M].xtal_clk_m10);
> +	sp_write_reg(anx78xx, TX_P0, 0xed,

0xec, 0xed, etc: Please define these magic numbers.

> +		     ((pxtal_data[XTAL_27M].xtal_clk_m10 & 0xff00) >> 2)
> +		     | pxtal_data[XTAL_27M].xtal_clk);
> +
> +	sp_write_reg(anx78xx, TX_P0, I2C_GEN_10US_TIMER0,
> +		     pxtal_data[XTAL_27M].xtal_clk_m10);
> +	sp_write_reg(anx78xx, TX_P0, I2C_GEN_10US_TIMER1,
> +		     (pxtal_data[XTAL_27M].xtal_clk_m10 & 0xff00) >> 8);
> +	sp_write_reg(anx78xx, TX_P0, 0xbf, pxtal_data[XTAL_27M].xtal_clk - 1);
> +
> +	sp_write_reg_and_or(anx78xx, RX_P0, 0x49, 0x07,
> +			    ((pxtal_data[XTAL_27M].xtal_clk >> 1) - 2) << 3);
> +}
> +
> +void sp_tx_initialization(struct anx78xx *anx78xx)
> +{
> +	sp_write_reg(anx78xx, TX_P0, AUX_CTRL2, 0x30);
> +	sp_write_reg_or(anx78xx, TX_P0, AUX_CTRL2, 0x08);
> +
> +	sp_write_reg_and(anx78xx, TX_P0, TX_HDCP_CTRL,
> +			 (u8)~AUTO_EN & ~AUTO_START);
> +	sp_write_reg(anx78xx, TX_P0, OTP_KEY_PROTECT1, OTP_PSW1);
> +	sp_write_reg(anx78xx, TX_P0, OTP_KEY_PROTECT2, OTP_PSW2);
> +	sp_write_reg(anx78xx, TX_P0, OTP_KEY_PROTECT3, OTP_PSW3);
> +	sp_write_reg_or(anx78xx, TX_P0, HDCP_KEY_CMD, DISABLE_SYNC_HDCP);
> +	sp_write_reg(anx78xx, TX_P2, SP_TX_VID_CTRL8_REG, VID_VRES_TH);
> +
> +	sp_write_reg(anx78xx, TX_P0, HDCP_AUTO_TIMER, HDCP_AUTO_TIMER_VAL);
> +	sp_write_reg_or(anx78xx, TX_P0, TX_HDCP_CTRL, LINK_POLLING);
> +
> +	sp_write_reg_or(anx78xx, TX_P0, TX_LINK_DEBUG, M_VID_DEBUG);
> +	sp_write_reg_or(anx78xx, TX_P2, TX_ANALOG_DEBUG2, POWERON_TIME_1P5MS);
> +
> +	xtal_clk_sel(anx78xx);
> +	sp_write_reg(anx78xx, TX_P0, AUX_DEFER_CTRL, 0x8c);
> +
> +	sp_write_reg_or(anx78xx, TX_P0, TX_DP_POLLING, AUTO_POLLING_DISABLE);
> +	/*
> +	 * Short the link intergrity check timer to speed up bstatus
> +	 * polling for HDCP CTS item 1A-07
> +	 */
> +	sp_write_reg(anx78xx, TX_P0, SP_TX_LINK_CHK_TIMER, 0x1d);
> +	sp_write_reg_or(anx78xx, TX_P0, TX_MISC, EQ_TRAINING_LOOP);
> +
> +	sp_write_reg_or(anx78xx, TX_P0, SP_TX_ANALOG_PD_REG, CH0_PD);
> +
> +	sp_write_reg(anx78xx, TX_P2, SP_TX_INT_CTRL_REG, 0x01);
> +	/* disable HDCP mismatch function for VGA dongle */
> +	sp_tx_link_phy_initialization(anx78xx);
> +	gen_m_clk_with_downspeading(anx78xx);
> +
> +	sp.down_sample_en = 0;
> +}
> +
> +bool sp_chip_detect(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	u16 id;
> +	u8 idh = 0, idl = 0;
> +	int i;
> +
> +	anx78xx_poweron(anx78xx);
> +
> +	/* check chip id */
> +	sp_read_reg(anx78xx, TX_P2, SP_TX_DEV_IDL_REG, &idl);
> +	sp_read_reg(anx78xx, TX_P2, SP_TX_DEV_IDH_REG, &idh);
> +	id = idl | (idh << 8);
> +
> +	dev_dbg(dev, "CHIPID: ANX%x\n", id & 0xffff);
> +
> +	for (i = 0; i < ARRAY_SIZE(chipid_list); i++) {
> +		if (id == chipid_list[i])
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static void sp_waiting_cable_plug_process(struct anx78xx *anx78xx)
> +{
> +	sp_tx_variable_init();
> +	anx78xx_poweron(anx78xx);
> +	goto_next_system_state(anx78xx);
> +}
> +
> +/*
> + * Check if it is ANALOGIX dongle.
> + */
> +static const u8 ANX_OUI[3] = {0x00, 0x22, 0xb9};
> +
> +static u8 is_anx_dongle(struct anx78xx *anx78xx)

Return a bool.

> +{
> +	u8 buf[3];
> +
> +	/* 0x0500~0x0502: BRANCH_IEEE_OUI */
> +	sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x05, 0x00, 3, buf);
> +
> +	if (!memcmp(buf, ANX_OUI, 3))
> +		return 1;
> +
> +	return 0;
> +}
> +
> +static void sp_tx_get_rx_bw(struct anx78xx *anx78xx, u8 *bw)
> +{
> +	if (is_anx_dongle(anx78xx))
> +		*bw = LINK_6P75G;	/* just for debug */
> +	else
> +		sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x00,
> +					 DPCD_MAX_LINK_RATE, 1, bw);

I don't understand what this does, and what is the "just for debug" part.

Also, if nothing can fail, return the bandwidth directly.

> +}
> +
> +static u8 sp_tx_get_cable_type(struct anx78xx *anx78xx,
> +			       enum cable_type_status det_cable_type_state)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +
> +	u8 ds_port_preset;
> +	u8 aux_status;
> +	u8 data_buf[16];
> +	u8 cur_cable_type;
> +
> +	ds_port_preset = 0;
> +	cur_cable_type = DWN_STRM_IS_NULL;
> +
> +	aux_status = sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x00, 0x05, 1,
> +					      &ds_port_preset);
> +
> +	dev_dbg(dev, "DPCD 0x005: %x\n", (int)ds_port_preset);

Cast is not necessary.

> +
> +	switch (det_cable_type_state) {
> +	case CHECK_AUXCH:
> +		if (aux_status == 0) {
> +			sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x00, 0, 0x0c,
> +						 data_buf);
> +			det_cable_type_state = GETTED_CABLE_TYPE;
> +		} else {
> +			dev_err(dev, "AUX access error\n");
> +			break;
> +		}
> +	case GETTED_CABLE_TYPE:
> +		switch ((ds_port_preset & (BIT(1) | BIT(2))) >> 1) {
> +		case 0x00:
> +			cur_cable_type = DWN_STRM_IS_DIGITAL;
> +			dev_dbg(dev, "Downstream is DP dongle.\n");
> +			break;
> +		case 0x01:
> +		case 0x03:
> +			cur_cable_type = DWN_STRM_IS_ANALOG;
> +			dev_dbg(dev, "Downstream is VGA dongle.\n");
> +			break;
> +		case 0x02:
> +			cur_cable_type = DWN_STRM_IS_HDMI;
> +			dev_dbg(dev, "Downstream is HDMI dongle.\n");
> +			break;
> +		default:
> +			cur_cable_type = DWN_STRM_IS_NULL;
> +			dev_err(dev, "Downstream can not recognized.\n");
> +			break;
> +		}
> +	default:
> +		break;
> +	}
> +	return cur_cable_type;
> +}
> +
> +static u8 sp_tx_get_dp_connection(struct anx78xx *anx78xx)

bool?

> +{
> +	u8 regval;
> +
> +	if (sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x02,
> +				     DPCD_SINK_COUNT, 1, &regval))
> +		return 0;
> +
> +	if (regval & 0x1f) {

if (!(regval & 0x1f))
   return 0;

> +		sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x00, 0x04, 1, &regval);
> +		if (regval & 0x20) {
> +			sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x06, 0x00, 1,
> +						 &regval);
> +			/*
> +			 * Bit 5 = SET_DN_DEVICE_DP_PWR_5V
> +			 * Bit 6 = SET_DN_DEVICE_DP_PWR_12V
> +			 * Bit 7 = SET_DN_DEVICE_DP_PWR_18V
> +			 */
> +			regval = regval & 0x1f;
> +			sp_tx_aux_dpcdwrite_byte(anx78xx, 0x00, 0x06, 0x00,
> +						 regval | 0x20);
> +		}
> +		return 1;
> +	} else {
> +		return 0;
> +	}
> +}
> +
> +static void sp_sink_connection(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +
> +	switch (sp.tx_sc_state) {
> +	case SC_INIT:
> +		sp.tx_sc_state++;
> +	case SC_CHECK_CABLE_TYPE:
> +	case SC_WAITTING_CABLE_TYPE:
> +	default:
> +		if (sp_tx_get_cable_type(anx78xx, CHECK_AUXCH) ==
> +		   DWN_STRM_IS_NULL) {
> +			sp.tx_sc_state++;
> +			if (sp.tx_sc_state >= SC_WAITTING_CABLE_TYPE) {

WAITING. +. Also, you are hiding the logic in the enum definition: you are doing
5 attempts before giving up. Please find another way.

> +				sp.tx_sc_state = SC_NOT_CABLE;
> +				dev_dbg(dev, "Can not get cable type!\n");
> +			}
> +			break;
> +		}
> +
> +		sp.tx_sc_state = SC_SINK_CONNECTED;
> +	case SC_SINK_CONNECTED:
> +		if (sp_tx_get_dp_connection(anx78xx))
> +			goto_next_system_state(anx78xx);
> +		break;
> +	case SC_NOT_CABLE:
> +		sp_vbus_power_off(anx78xx);
> +		reg_hardware_reset(anx78xx);
> +		break;
> +	}
> +}
> +
> +/******************start EDID process********************/
> +static void sp_tx_enable_video_input(struct anx78xx *anx78xx, u8 enable)

bool enable (please replace all u8 by bool where appropriate, I'll ignore
them from now on)

> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	u8 regval;
> +
> +	sp_read_reg(anx78xx, TX_P2, VID_CTRL1, &regval);
> +	if (enable) {
> +		sp_write_reg(anx78xx, TX_P2, VID_CTRL1,
> +			     (regval & 0xf7) | VIDEO_EN);
> +		dev_dbg(dev, "Slimport Video is enabled!\n");
> +
> +	} else {
> +		sp_write_reg(anx78xx, TX_P2, VID_CTRL1, regval & ~VIDEO_EN);
> +		dev_dbg(dev, "Slimport Video is disabled!\n");
> +	}
> +}
> +
> +static u8 sp_get_edid_detail(u8 *data_buf)

get_edid_bandwidth

> +{
> +	u16 pixclock_edid;
> +
> +	pixclock_edid = (((u16)data_buf[1] << 8) | ((u16)data_buf[0] & 0xff));
> +	if (pixclock_edid <= 5300)
> +		return LINK_1P62G;
> +	else if ((pixclock_edid > 5300) && (pixclock_edid <= 8900))

> 5300 already covered in previous test.

> +		return LINK_2P7G;
> +	else if ((pixclock_edid > 8900) && (pixclock_edid <= 18000))
> +		return LINK_5P4G;
> +	else
> +		return LINK_6P75G;
> +}
> +
> +static u8 sp_parse_edid_to_get_bandwidth(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	u8 i, bandwidth, temp;
> +
> +	bandwidth = LINK_1P62G;
> +	for (i = 0; i < 4; i++) {
> +		if (sp.edid_blocks[0x36 + 0x12 * i] == 0)
> +			break;
> +		temp = sp_get_edid_detail(sp.edid_blocks + 0x36 + 0x12 * i);
> +		dev_dbg(dev, "bandwidth via EDID : %x\n", temp);
> +		if (bandwidth < temp)
> +			bandwidth = temp;
> +		if (bandwidth >= LINK_6P75G)
> +			break;
> +	}
> +
> +	return bandwidth;
> +}
> +
> +static void sp_tx_aux_wr(struct anx78xx *anx78xx, u8 offset)
> +{
> +	sp_write_reg(anx78xx, TX_P0, BUF_DATA_0, offset);
> +	sp_write_reg(anx78xx, TX_P0, AUX_CTRL, 0x04);
> +	sp_write_reg_or(anx78xx, TX_P0, AUX_CTRL2, AUX_OP_EN);
> +	sp_wait_aux_op_finish(anx78xx, &sp.edid_break);
> +}
> +
> +static void sp_tx_aux_rd(struct anx78xx *anx78xx, u8 len_cmd)
> +{
> +	sp_write_reg(anx78xx, TX_P0, AUX_CTRL, len_cmd);
> +	sp_write_reg_or(anx78xx, TX_P0, AUX_CTRL2, AUX_OP_EN);
> +	sp_wait_aux_op_finish(anx78xx, &sp.edid_break);
> +}
> +
> +static u8 sp_tx_get_edid_block(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	u8 regval;
> +
> +	sp_tx_aux_wr(anx78xx, 0x7e);
> +	sp_tx_aux_rd(anx78xx, 0x01);
> +	sp_read_reg(anx78xx, TX_P0, BUF_DATA_0, &regval);
> +	dev_dbg(dev, "EDID Block = %d\n", regval + 1);
> +
> +	if (regval > 3)
> +		regval = 1;
> +	return regval;
> +}
> +
> +static void sp_edid_read(struct anx78xx *anx78xx, u8 offset,
> +			 u8 *pblock_buf)
> +{
> +	u8 data_cnt, error_cnt;
> +	u8 regval;
> +
> +	sp_tx_aux_wr(anx78xx, offset);
> +	sp_tx_aux_rd(anx78xx, 0xf5);
> +	data_cnt = 0;
> +	error_cnt = 0;
> +
> +	while ((data_cnt) < 16)	{

data_cnt < 16

> +		sp_read_reg(anx78xx, TX_P0, BUF_DATA_COUNT, &regval);
> +
> +		if (regval & 0x1f) {
> +			data_cnt = data_cnt + (regval & 0x1f);
> +			do {
> +				sp_read_reg(anx78xx, TX_P0,
> +					    BUF_DATA_0 + regval - 1,
> +					    &pblock_buf[regval - 1]);
> +			} while (--regval);

I think this would gain in clarity if you used a for loop.

> +		} else {
> +			if (error_cnt++ <= 2) {
> +				sp_tx_rst_aux(anx78xx);
> +				regval = 0x05 | ((0x0f - data_cnt) << 4);
> +				sp_tx_aux_rd(anx78xx, regval);
> +			} else {
> +				 sp.edid_break = 1;
> +				 break;
> +			}
> +		}
> +	}
> +	sp_write_reg(anx78xx, TX_P0, AUX_CTRL, 0x01);
> +	sp_write_reg_or(anx78xx, TX_P0, AUX_CTRL2, ADDR_ONLY_BIT | AUX_OP_EN);
> +	sp_wait_aux_op_finish(anx78xx, &sp.edid_break);
> +	sp_tx_addronly_set(anx78xx, 0);
> +}
> +
> +static void sp_tx_edid_read_initial(struct anx78xx *anx78xx)
> +{
> +	sp_write_reg(anx78xx, TX_P0, AUX_ADDR_7_0, 0x50);
> +	sp_write_reg(anx78xx, TX_P0, AUX_ADDR_15_8, 0);
> +	sp_write_reg_and(anx78xx, TX_P0, AUX_ADDR_19_16, 0xf0);
> +}
> +
> +static void sp_seg_edid_read(struct anx78xx *anx78xx,
> +			     u8 segment, u8 offset)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	u8 regval, cnt;
> +	int i;
> +
> +	sp_write_reg(anx78xx, TX_P0, AUX_CTRL, 0x04);
> +
> +	sp_write_reg(anx78xx, TX_P0, AUX_ADDR_7_0, 0x30);
> +
> +	sp_write_reg_or(anx78xx, TX_P0, AUX_CTRL2, ADDR_ONLY_BIT | AUX_OP_EN);
> +
> +	sp_read_reg(anx78xx, TX_P0, AUX_CTRL2, &regval);
> +
> +	sp_wait_aux_op_finish(anx78xx, &sp.edid_break);
> +	sp_read_reg(anx78xx, TX_P0, AUX_CTRL, &regval);
> +
> +	sp_write_reg(anx78xx, TX_P0, BUF_DATA_0, segment);
> +
> +	sp_write_reg(anx78xx, TX_P0, AUX_CTRL, 0x04);
> +
> +	sp_write_reg_and_or(anx78xx, TX_P0, AUX_CTRL2, ~ADDR_ONLY_BIT,
> +			    AUX_OP_EN);
> +	cnt = 0;
> +	sp_read_reg(anx78xx, TX_P0, AUX_CTRL2, &regval);
> +	while (regval & AUX_OP_EN) {
> +		usleep_range(1000, 2000);
> +		cnt++;
> +		if (cnt == 10) {
> +			dev_err(dev, "read AUX_CTRL2 failed.\n");
> +			sp_tx_rst_aux(anx78xx);
> +			cnt = 0;

That does not seem necessary...

> +			sp.edid_break = 1;

You are using sp.edid_break as a return value, please return an int and drop
that variable.

> +			return;
> +		}
> +		sp_read_reg(anx78xx, TX_P0, AUX_CTRL2, &regval);
> +	}
> +
> +	sp_write_reg(anx78xx, TX_P0, AUX_ADDR_7_0, 0x50);
> +
> +	sp_tx_aux_wr(anx78xx, offset);
> +
> +	sp_tx_aux_rd(anx78xx, 0xf5);
> +	cnt = 0;
> +	for (i = 0; i < 16; i++) {
> +		sp_read_reg(anx78xx, TX_P0, BUF_DATA_COUNT, &regval);
> +		while ((regval & 0x1f) == 0) {
> +			usleep_range(2000, 4000);
> +			cnt++;
> +			sp_read_reg(anx78xx, TX_P0, BUF_DATA_COUNT, &regval);
> +			if (cnt == 10) {
> +				dev_err(dev,
> +					"read BUF_DATA_COUNT failed.\n");
> +				dev_dbg(dev, "read break");
> +				sp_tx_rst_aux(anx78xx);
> +				sp.edid_break = 1;
> +				return;
> +			}
> +		}
> +
> +		sp_read_reg(anx78xx, TX_P0, BUF_DATA_0 + i, &regval);
> +	}
> +
> +	sp_write_reg(anx78xx, TX_P0, AUX_CTRL, 0x01);
> +	sp_write_reg_or(anx78xx, TX_P0, AUX_CTRL2, ADDR_ONLY_BIT | AUX_OP_EN);
> +	sp_write_reg_and(anx78xx, TX_P0, AUX_CTRL2, ~ADDR_ONLY_BIT);
> +	sp_read_reg(anx78xx, TX_P0, AUX_CTRL2, &regval);
> +
> +	cnt = 0;
> +	while (regval & AUX_OP_EN) {
> +		usleep_range(1000, 2000);
> +		cnt++;
> +		if (cnt == 10) {
> +			dev_err(dev, "read AUX_CTRL2 failed.\n");
> +			sp_tx_rst_aux(anx78xx);
> +			cnt = 0;
> +			sp.edid_break = 1;
> +			return;
> +		}
> +		sp_read_reg(anx78xx, TX_P0, AUX_CTRL2, &regval);
> +	}
> +}
> +
> +static bool sp_edid_checksum_result(u8 *pbuf)
> +{
> +	u8 cnt, checksum;
> +
> +	checksum = 0;
> +
> +	for (cnt = 0; cnt < 0x80; cnt++)
> +		checksum = checksum + pbuf[cnt];
> +
> +	sp.edid_checksum = checksum - pbuf[0x7f];
> +	sp.edid_checksum = ~sp.edid_checksum + 1;
> +
> +	return checksum == 0 ? 1 : 0;

return checksum == 0;

> +}
> +
> +static void sp_check_edid_data(struct anx78xx *anx78xx, u8 *pbuf)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	u8 i;
> +
> +	if ((pbuf[0] == 0x00) && (pbuf[1] == 0xff) &&
> +	    (pbuf[2] == 0xff) && (pbuf[3] == 0xff) &&
> +	    (pbuf[4] == 0xff) && (pbuf[5] == 0xff) &&
> +	    (pbuf[6] == 0xff) && (pbuf[7] == 0x00))
> +		dev_dbg(dev, "Good EDID header!\n");
> +	else
> +		dev_err(dev, "Bad EDID header!\n");
> +
> +	for (i = 0; i <= (pbuf[0x7e] > 1 ? 1 : pbuf[0x7e]); i++) {
> +		if (!sp_edid_checksum_result(pbuf + i * 128))
> +			dev_err(dev, "Block %x edid checksum error\n", i);
> +		else
> +			dev_dbg(dev, "Block %x edid checksum OK\n", i);
> +	}
> +}
> +
> +static void sp_tx_edid_read(struct anx78xx *anx78xx, u8 *pedid_blocks_buf)

pedid_blocks_buf is always sp.edid_blocks.

> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	u8 offset = 0;
> +	u8 count, blocks_num;
> +	u8 pblock_buf[16];
> +	u8 i, j, regval;
> +
> +	sp.edid_break = 0;
> +	sp_tx_edid_read_initial(anx78xx);
> +	sp_write_reg(anx78xx, TX_P0, AUX_CTRL, 0x04);
> +	sp_write_reg_or(anx78xx, TX_P0, AUX_CTRL2, 0x03);
> +	sp_wait_aux_op_finish(anx78xx, &sp.edid_break);
> +	sp_tx_addronly_set(anx78xx, 0);
> +
> +	blocks_num = sp_tx_get_edid_block(anx78xx);
> +
> +	count = 0;
> +	do {
> +		switch (count) {
> +		case 0:
> +		case 1:
> +			for (i = 0; i < 8; i++) {
> +				offset = (i + count * 8) * 16;
> +				sp_edid_read(anx78xx, offset, pblock_buf);
> +				if (sp.edid_break == 1)
> +					break;
> +				for (j = 0; j < 16; j++) {
> +					pedid_blocks_buf[offset + j]
> +						= pblock_buf[j];
> +				}
> +			}
> +			break;
> +		case 2:
> +		case 3:
> +			if (count == 2)
> +				offset = 0x00;
> +			else	/* count == 3 */
> +				offset = 0x80;
> +			for (j = 0; j < 8; j++) {
> +				if (sp.edid_break == 1)
> +					break;
> +				sp_seg_edid_read(anx78xx, count / 2, offset);
> +				offset = offset + 0x10;
> +			}
> +			break;
> +		default:
> +			break;
> +		}
> +		count++;
> +		if (sp.edid_break == 1)
> +			break;
> +	} while (blocks_num >= count);
> +
> +	sp_tx_rst_aux(anx78xx);
> +	if (sp.read_edid_flag == 0) {
> +		sp_check_edid_data(anx78xx, pedid_blocks_buf);
> +		sp.read_edid_flag = 1;
> +	}
> +	sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x02, 0x18, 1, &regval);
> +	if (regval & 0x04) {
> +		dev_dbg(dev, "check sum = %.2x\n", sp.edid_checksum);
> +		regval = sp.edid_checksum;
> +		sp_tx_aux_dpcdwrite_bytes(anx78xx, 0x00, 0x02, 0x61, 1,
> +					  &regval);
> +		sp.tx_test_edid = 1;
> +		regval = 0x04;
> +		sp_tx_aux_dpcdwrite_bytes(anx78xx, 0x00, 0x02, 0x60, 1,
> +					  &regval);
> +		dev_dbg(dev, "Test EDID done\n");
> +	}
> +}
> +
> +static bool sp_check_with_pre_edid(struct anx78xx *anx78xx, u8 *org_buf)

org_buf is always sp.edid_blocks, so I'm not sure what's the point of the
parameter.

> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	u8 i;
> +	u8 buf[16];
> +	bool ret = false;
> +
> +	sp.edid_break = 0;
> +	sp_tx_edid_read_initial(anx78xx);
> +	sp_write_reg(anx78xx, TX_P0, AUX_CTRL, 0x04);
> +	sp_write_reg_or(anx78xx, TX_P0, AUX_CTRL2, 0x03);
> +	sp_wait_aux_op_finish(anx78xx, &sp.edid_break);
> +	sp_tx_addronly_set(anx78xx, 0);
> +
> +	sp_edid_read(anx78xx, 0x70, buf);
> +
> +	if (sp.edid_break == 0) {
> +		for (i = 0; i < 16; i++) {
> +			if (org_buf[0x70 + i] != buf[i]) {
> +				dev_dbg(dev, "%s\n",
> +					"different checksum and blocks num\n");
> +				goto return_point;
> +			}
> +		}
> +	} else {
> +		goto return_point;
> +	}
> +
> +	sp_edid_read(anx78xx, 0x08, buf);
> +	if (sp.edid_break == 0) {
> +		for (i = 0; i < 16; i++) {
> +			if (org_buf[i + 8] != buf[i]) {
> +				dev_dbg(dev, "different edid information\n");
> +				goto return_point;
> +			}
> +		}
> +	} else {
> +		goto return_point;
> +	}
> +
> +	ret = true;
> +return_point:
> +	sp_tx_rst_aux(anx78xx);
> +
> +	return ret;
> +}
> +
> +static void sp_edid_process(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	u8 temp_value, temp_value1;
> +	u8 i;
> +
> +	dev_dbg(dev, "edid_process\n");
> +
> +	if (sp.read_edid_flag == 1)
> +		if (!sp_check_with_pre_edid(anx78xx, sp.edid_blocks))
> +			sp.read_edid_flag = 0;
> +
> +	if (sp.read_edid_flag == 0) {

boolean: !sp.read_edid_flag

> +		sp_tx_edid_read(anx78xx, sp.edid_blocks);
> +		if (sp.edid_break)
> +			dev_err(dev, "ERR:EDID corruption!\n");
> +	}
> +
> +	/* Release the HPD after the OTP loaddown */
> +	for (i = 0; i < 10; i++) {
> +		if (sp_i2c_read_byte(anx78xx, TX_P0, HDCP_KEY_STATUS) & 0x01)
> +			break;
> +
> +		dev_dbg(dev, "waiting HDCP KEY loaddown\n");
> +		usleep_range(1000, 2000);
> +	}
> +
> +	sp_write_reg(anx78xx, RX_P0, HDMI_RX_INT_MASK1_REG, 0xe2);
> +	hdmi_rx_set_hpd(anx78xx, 1);
> +	dev_dbg(dev, "hdmi_rx_set_hpd 1 !\n");
> +
> +	hdmi_rx_set_termination(anx78xx, 1);
> +
> +	sp_tx_get_rx_bw(anx78xx, &temp_value);
> +	dev_dbg(dev, "RX BW %x\n", temp_value);
> +
> +	temp_value1 = sp_parse_edid_to_get_bandwidth(anx78xx);
> +	if (temp_value <= temp_value1)
> +		temp_value1 = temp_value;
> +
> +	dev_dbg(dev, "set link bw in edid %x\n", temp_value1);
> +	sp.changed_bandwidth = temp_value1;
> +	goto_next_system_state(anx78xx);
> +}
> +
> +/******************End EDID process********************/
> +
> +/******************start Link training process********************/
> +static void sp_tx_lvttl_bit_mapping(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	u8 regval, colorspace;
> +	u8 vid_bit;
> +
> +	vid_bit = 0;
> +	sp_read_reg(anx78xx, RX_P1, HDMI_RX_AVI_DATA00_REG, &colorspace);
> +	colorspace &= 0x60;
> +
> +	switch (((sp_i2c_read_byte(anx78xx, RX_P0, HDMI_RX_VIDEO_STATUS_REG1)
> +		& COLOR_DEPTH) >> 4)) {
> +	default:
> +	case HDMI_LEGACY:
> +		regval = IN_BPC_8BIT;
> +		vid_bit = 0;
> +		break;
> +	case HDMI_24BIT:
> +		regval = IN_BPC_8BIT;
> +		if (colorspace == 0x20)
> +			vid_bit = 5;
> +		else
> +			vid_bit = 1;
> +		break;
> +	case HDMI_30BIT:
> +		regval = IN_BPC_10BIT;
> +		if (colorspace == 0x20)
> +			vid_bit = 6;
> +		else
> +			vid_bit = 2;
> +		break;
> +	case HDMI_36BIT:
> +		regval = IN_BPC_12BIT;
> +		if (colorspace == 0x20)
> +			vid_bit = 6;
> +		else
> +			vid_bit = 3;
> +		break;
> +	}
> +
> +	/*
> +	 * For down sample video (12bit, 10bit ---> 8bit),
> +	 * this register doesn't change
> +	 */
> +	if (sp.down_sample_en == 0)
> +		sp_write_reg_and_or(anx78xx, TX_P2,
> +				    SP_TX_VID_CTRL2_REG, 0x8c,
> +				    colorspace >> 5 | regval);
> +
> +	/* Patch: for 10bit video must be set this value to 12bit by someone */
> +	if (sp.down_sample_en == 1 && regval == IN_BPC_10BIT)
> +		vid_bit = 3;
> +
> +	sp_write_reg_and_or(anx78xx, TX_P2,
> +			    BIT_CTRL_SPECIFIC, 0x00,
> +			    ENABLE_BIT_CTRL | vid_bit << 1);
> +
> +	if (sp.tx_test_edid) {
> +		sp_write_reg_and(anx78xx, TX_P2, SP_TX_VID_CTRL2_REG, 0x8f);
> +		dev_dbg(dev, "***color space is set to 18bit***\n");
> +	}
> +
> +	if (colorspace) {
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_VID_BLANK_SET1, 0x80);
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_VID_BLANK_SET2, 0x00);
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_VID_BLANK_SET3, 0x80);
> +	} else {
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_VID_BLANK_SET1, 0x0);
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_VID_BLANK_SET2, 0x0);
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_VID_BLANK_SET3, 0x0);
> +	}
> +}
> +
> +static unsigned long sp_tx_pclk_calc(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	unsigned long str_plck;
> +	u16 vid_counter;
> +	u8 regval;
> +
> +	sp_read_reg(anx78xx, RX_P0, PCLK_HR_CNT2, &regval);
> +	vid_counter = regval << 8;
> +	sp_read_reg(anx78xx, RX_P0, PCLK_HR_CNT1, &regval);
> +	vid_counter |= regval;
> +	str_plck = (vid_counter * pxtal_data[XTAL_27M].xtal_clk_m10)  >> 12;

Single space before >>

> +	dev_dbg(dev, "PCLK = %d.%d\n", (u16)str_plck / 10,
> +		(u16)(str_plck - ((str_plck / 10) * 10)));

str_pclk % 10, and no cast.

> +	return str_plck;
> +}
> +
> +static u8 sp_tx_bw_lc_sel(struct anx78xx *anx78xx, unsigned long pclk)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	unsigned long pixel_clk;
> +	u8 link;
> +
> +	switch (((sp_i2c_read_byte(anx78xx, RX_P0, HDMI_RX_VIDEO_STATUS_REG1)
> +		& COLOR_DEPTH) >> 4)) {
> +	case HDMI_LEGACY:
> +	case HDMI_24BIT:
> +	default:
> +		pixel_clk = pclk;
> +		break;
> +	case HDMI_30BIT:
> +		pixel_clk = (pclk * 5) >> 2;
> +		break;
> +	case HDMI_36BIT:
> +		pixel_clk = (pclk * 3) >> 1;
> +		break;
> +	}
> +
> +	dev_dbg(dev, "pixel_clk = %d.%d\n", (u16)pixel_clk / 10,
> +		(u16)(pixel_clk - ((pixel_clk / 10) * 10)));

See above

> +
> +	sp.down_sample_en = 0;
> +	if (pixel_clk <= 530) {
> +		link = LINK_1P62G;
> +	} else if ((530 < pixel_clk) && (pixel_clk <= 890)) {

(530 < pixel_clk) is not necessary: you checked that just
before.

> +		link = LINK_2P7G;
> +	} else if ((890 < pixel_clk) && (pixel_clk <= 1800)) {
> +		link = LINK_5P4G;
> +	} else {
> +		link = LINK_6P75G;
> +		if (pixel_clk > 2240)
> +			sp.down_sample_en = 1;
> +	}
> +
> +	if (sp_tx_get_link_bw(anx78xx) != link) {
> +		sp.changed_bandwidth = link;
> +		dev_dbg(dev,
> +			"different bandwidth between sink and video %.2x",
> +			link);
> +		return 1;
> +	}
> +	return 0;
> +}
> +
> +static void sp_tx_spread_enable(struct anx78xx *anx78xx, u8 benable)
> +{
> +	u8 regval;
> +
> +	sp_read_reg(anx78xx, TX_P0, SP_TX_DOWN_SPREADING_CTRL1, &regval);
> +
> +	if (benable) {
> +		regval |= SP_TX_SSC_DWSPREAD;
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_DOWN_SPREADING_CTRL1,
> +			     regval);
> +
> +		sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x01,
> +					 DPCD_DOWNSPREAD_CTRL, 1, &regval);
> +		regval |= SPREAD_AMPLITUDE;
> +		sp_tx_aux_dpcdwrite_byte(anx78xx, 0x00, 0x01,
> +					 DPCD_DOWNSPREAD_CTRL, regval);
> +	} else {
> +		regval &= ~SP_TX_SSC_DISABLE;
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_DOWN_SPREADING_CTRL1,
> +			     regval);
> +
> +		sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x01,
> +					 DPCD_DOWNSPREAD_CTRL, 1, &regval);
> +		regval &= ~SPREAD_AMPLITUDE;
> +		sp_tx_aux_dpcdwrite_byte(anx78xx, 0x00, 0x01,
> +					 DPCD_DOWNSPREAD_CTRL, regval);
> +	}
> +}
> +
> +static void sp_tx_config_ssc(struct anx78xx *anx78xx,
> +			     enum sp_ssc_dep sscdep)
> +{
> +	sp_write_reg(anx78xx, TX_P0, SP_TX_DOWN_SPREADING_CTRL1, 0x0);
> +	sp_write_reg(anx78xx, TX_P0, SP_TX_DOWN_SPREADING_CTRL1, sscdep);
> +	sp_tx_spread_enable(anx78xx, 1);
> +}
> +
> +static void sp_tx_enhancemode_set(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	u8 regval;
> +
> +	sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x00, DPCD_MAX_LANE_COUNT,
> +				 1, &regval);
> +	if (regval & ENHANCED_FRAME_CAP) {
> +		sp_write_reg_or(anx78xx, TX_P0, SP_TX_SYS_CTRL4_REG,
> +				ENHANCED_MODE);
> +
> +		sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x01,
> +					 DPCD_LANE_COUNT_SET, 1, &regval);
> +		regval |= ENHANCED_FRAME_EN;
> +		sp_tx_aux_dpcdwrite_byte(anx78xx, 0x00, 0x01,
> +					 DPCD_LANE_COUNT_SET, regval);
> +
> +		dev_dbg(dev, "Enhance mode enabled\n");
> +	} else {
> +		sp_write_reg_and(anx78xx, TX_P0, SP_TX_SYS_CTRL4_REG,
> +				 ~ENHANCED_MODE);
> +
> +		sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x01,
> +					 DPCD_LANE_COUNT_SET, 1, &regval);
> +
> +		regval &= ~ENHANCED_FRAME_EN;
> +		sp_tx_aux_dpcdwrite_byte(anx78xx, 0x00, 0x01,
> +					 DPCD_LANE_COUNT_SET, regval);
> +
> +		dev_dbg(dev, "Enhance mode disabled\n");
> +	}

This could be massively simplfied if you used your bit_ctl wrapper.

> +}
> +
> +static u16 sp_tx_link_err_check(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	u16 errl = 0, errh = 0;
> +	u8 bytebuf[2];
> +
> +	sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x02, 0x10, 2, bytebuf);
> +	usleep_range(5000, 10000);
> +	sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x02, 0x10, 2, bytebuf);
> +	errh = bytebuf[1];
> +
> +	if (errh & 0x80) {
> +		errl = bytebuf[0];
> +		errh = (errh & 0x7f) << 8;
> +		errl = errh + errl;

return errl;

Then I think you don't need errh/errl intermediate variables.

> +	}
> +
> +	dev_err(dev, " Err of Lane = %d\n", errl);
> +	return errl;

return 0;

> +}
> +
> +static void sp_lt_finish(struct anx78xx *anx78xx, u8 temp_value)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +
> +	sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x02, 0x02, 1, &temp_value);
> +	if ((temp_value & 0x07) == 0x07) {
> +		/*
> +		 * if there is link error,
> +		 * adjust pre-emphsis to check error again.
> +		 * If there is no error,keep the setting,
> +		 * otherwise use 400mv0db
> +		 */
> +		if (!sp.tx_test_lt) {
> +			if (sp_tx_link_err_check(anx78xx)) {
> +				sp_read_reg(anx78xx, TX_P0,
> +					    SP_TX_LT_SET_REG, &temp_value);
> +				if (!(temp_value & MAX_PRE_REACH)) {
> +					sp_write_reg(anx78xx, TX_P0,
> +						     SP_TX_LT_SET_REG,
> +						     temp_value + 0x08);
> +					if (sp_tx_link_err_check(anx78xx))
> +						sp_write_reg(anx78xx, TX_P0,
> +							     SP_TX_LT_SET_REG,
> +							     temp_value);
> +				}
> +			}
> +
> +			temp_value = sp_tx_get_link_bw(anx78xx);
> +			if (temp_value == sp.changed_bandwidth) {
> +				dev_dbg(dev, "LT succeed, bw: %.2x",
> +					temp_value);
> +				dev_dbg(dev, "Lane0 Set: %.2x\n",
> +					sp_i2c_read_byte(anx78xx, TX_P0,
> +							 SP_TX_LT_SET_REG));
> +				sp.tx_lt_state = LT_INIT;
> +				goto_next_system_state(anx78xx);
> +			} else {
> +				dev_dbg(dev, "cur:%.2x, per:%.2x\n",
> +					temp_value,
> +					sp.changed_bandwidth);
> +				sp.tx_lt_state = LT_ERROR;
> +			}
> +		} else {
> +			sp.tx_test_lt = 0;
> +			sp.tx_lt_state = LT_INIT;
> +			goto_next_system_state(anx78xx);
> +		}
> +	} else {
> +		dev_dbg(dev, "LANE0 Status error: %.2x\n",
> +			temp_value & 0x07);
> +		sp.tx_lt_state = LT_ERROR;
> +	}
> +}
> +
> +static void sp_link_training(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	u8 value, regval;
> +
> +	dev_dbg(dev, "sp.tx_lt_state : %x\n", (int)sp.tx_lt_state);
> +
> +	switch (sp.tx_lt_state) {
> +	case LT_INIT:
> +		sp_block_power_ctrl(anx78xx, SP_TX_PWR_VIDEO, SP_POWER_ON);
> +		sp_tx_video_mute(anx78xx, 1);
> +		sp_tx_enable_video_input(anx78xx, 0);
> +		sp.tx_lt_state++;
> +	/* fallthrough */
> +	case LT_WAIT_PLL_LOCK:
> +		if (!sp_tx_get_pll_lock_status(anx78xx)) {
> +			sp_read_reg(anx78xx, TX_P0, SP_TX_PLL_CTRL_REG,
> +				    &value);
> +
> +			value |= PLL_RST;
> +			sp_write_reg(anx78xx, TX_P0, SP_TX_PLL_CTRL_REG,
> +				     value);
> +
> +			value &= ~PLL_RST;
> +			sp_write_reg(anx78xx, TX_P0, SP_TX_PLL_CTRL_REG,
> +				     value);
> +
> +			dev_dbg(dev, "PLL not lock!\n");
> +		} else {
> +			sp.tx_lt_state = LT_CHECK_LINK_BW;
> +		}
> +		SP_BREAK(LT_WAIT_PLL_LOCK, sp.tx_lt_state);

These control-flow modifying macros make the code very hard to read, please remove.

> +	/* fallthrough */
> +	case LT_CHECK_LINK_BW:
> +		sp_tx_get_rx_bw(anx78xx, &value);
> +		if (value < sp.changed_bandwidth) {
> +			dev_dbg(dev, "****Over bandwidth****\n");
> +			sp.changed_bandwidth = value;
> +		} else {
> +			sp.tx_lt_state++;
> +		}
> +	/* fallthrough */
> +	case LT_START:
> +		if (sp.tx_test_lt) {
> +			sp.changed_bandwidth = sp.tx_test_bw;
> +			sp_write_reg_and(anx78xx, TX_P2, SP_TX_VID_CTRL2_REG,
> +					 0x8f);
> +		} else {
> +			sp_write_reg(anx78xx, TX_P0, SP_TX_LT_SET_REG, 0x00);
> +		}
> +
> +		sp_write_reg_and(anx78xx, TX_P0, SP_TX_ANALOG_PD_REG,
> +				 ~CH0_PD);
> +
> +		sp_tx_config_ssc(anx78xx, SSC_DEP_4000PPM);
> +		sp_tx_set_link_bw(anx78xx, sp.changed_bandwidth);
> +		sp_tx_enhancemode_set(anx78xx);
> +
> +		sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x00, 0x00, 0x01,
> +					 &regval);
> +		sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x06, 0x00, 0x01,
> +					 &value);
> +		if (regval >= 0x12)
> +			value &= 0xf8;
> +		else
> +			value &= 0xfc;
> +		value |= 0x01;
> +		sp_tx_aux_dpcdwrite_byte(anx78xx, 0x00, 0x06, 0x00, value);
> +
> +		sp_write_reg(anx78xx, TX_P0, LT_CTRL, SP_TX_LT_EN);
> +		sp.tx_lt_state = LT_WAITTING_FINISH;
> +	/* fallthrough */
> +	case LT_WAITTING_FINISH:
> +		/* here : waiting interrupt to change training state. */
> +		break;
> +	case LT_ERROR:
> +		sp_write_reg_or(anx78xx, TX_P2, RST_CTRL2, SERDES_FIFO_RST);
> +		msleep(20);
> +		sp_write_reg_and(anx78xx, TX_P2, RST_CTRL2, ~SERDES_FIFO_RST);
> +		dev_err(dev, "LT ERROR Status: SERDES FIFO reset.");
> +		redo_cur_system_state(anx78xx);
> +		sp.tx_lt_state = LT_INIT;
> +		break;
> +	case LT_FINISH:
> +		sp_lt_finish(anx78xx, value);
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
> +/******************End Link training process********************/
> +
> +/******************Start Output video process********************/
> +static void sp_tx_set_colorspace(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	u8 color_space;
> +
> +	if (sp.down_sample_en) {
> +		sp_read_reg(anx78xx, RX_P1, HDMI_RX_AVI_DATA00_REG,
> +			    &color_space);
> +		color_space &= 0x60;
> +		if (color_space == 0x20) {
> +			dev_dbg(dev, "YCbCr4:2:2 ---> PASS THROUGH.\n");
> +			sp_write_reg(anx78xx, TX_P2, SP_TX_VID_CTRL6_REG,
> +				     0x00);
> +			sp_write_reg(anx78xx, TX_P2, SP_TX_VID_CTRL5_REG,
> +				     0x00);
> +			sp_write_reg(anx78xx, TX_P2, SP_TX_VID_CTRL2_REG,
> +				     0x11);
> +		} else if (color_space == 0x40) {
> +			dev_dbg(dev, "YCbCr4:4:4 ---> YCbCr4:2:2\n");
> +			sp_write_reg(anx78xx, TX_P2, SP_TX_VID_CTRL6_REG,
> +				     0x41);
> +			sp_write_reg(anx78xx, TX_P2, SP_TX_VID_CTRL5_REG,
> +				     0x00);
> +			sp_write_reg(anx78xx, TX_P2, SP_TX_VID_CTRL2_REG,
> +				     0x12);
> +		} else if (color_space == 0x00) {
> +			dev_dbg(dev, "RGB4:4:4 ---> YCbCr4:2:2\n");
> +			sp_write_reg(anx78xx, TX_P2, SP_TX_VID_CTRL6_REG,
> +				     0x41);
> +			sp_write_reg(anx78xx, TX_P2, SP_TX_VID_CTRL5_REG,
> +				     0x83);
> +			sp_write_reg(anx78xx, TX_P2, SP_TX_VID_CTRL2_REG,
> +				     0x10);
> +		}
> +	} else {
> +		sp_write_reg(anx78xx, TX_P2, SP_TX_VID_CTRL6_REG, 0x00);
> +		sp_write_reg(anx78xx, TX_P2, SP_TX_VID_CTRL5_REG, 0x00);
> +	}
> +}
> +
> +static void sp_tx_avi_setup(struct anx78xx *anx78xx)
> +{
> +	u8 regval;
> +	int i;
> +
> +	for (i = 0; i < 13; i++) {
> +		sp_read_reg(anx78xx, RX_P1, (HDMI_RX_AVI_DATA00_REG + i),
> +			    &regval);
> +		sp.tx_packet_avi.avi_data[i] = regval;
> +	}
> +}
> +
> +static void sp_tx_load_packet(struct anx78xx *anx78xx,
> +			      enum packets_type type)
> +{
> +	int i;
> +	u8 regval;
> +
> +	switch (type) {
> +	case AVI_PACKETS:
> +		sp_write_reg(anx78xx, TX_P2, SP_TX_AVI_TYPE, 0x82);
> +		sp_write_reg(anx78xx, TX_P2, SP_TX_AVI_VER, 0x02);
> +		sp_write_reg(anx78xx, TX_P2, SP_TX_AVI_LEN, 0x0d);
> +
> +		for (i = 0; i < 13; i++) {
> +			sp_write_reg(anx78xx, TX_P2, SP_TX_AVI_DB0 + i,
> +				     sp.tx_packet_avi.avi_data[i]);
> +		}
> +
> +		break;
> +
> +	case SPD_PACKETS:
> +		sp_write_reg(anx78xx, TX_P2, SP_TX_SPD_TYPE, 0x83);
> +		sp_write_reg(anx78xx, TX_P2, SP_TX_SPD_VER, 0x01);
> +		sp_write_reg(anx78xx, TX_P2, SP_TX_SPD_LEN, 0x19);
> +
> +		for (i = 0; i < 25; i++) {
> +			sp_write_reg(anx78xx, TX_P2, SP_TX_SPD_DB0 + i,
> +				     sp.tx_packet_spd.spd_data[i]);
> +		}
> +
> +		break;
> +
> +	case VSI_PACKETS:
> +		sp_write_reg(anx78xx, TX_P2, SP_TX_MPEG_TYPE, 0x81);
> +		sp_write_reg(anx78xx, TX_P2, SP_TX_MPEG_VER, 0x01);
> +		sp_read_reg(anx78xx, RX_P1, HDMI_RX_MPEG_LEN_REG, &regval);
> +		sp_write_reg(anx78xx, TX_P2, SP_TX_MPEG_LEN, regval);
> +
> +		for (i = 0; i < 10; i++) {
> +			sp_write_reg(anx78xx, TX_P2, SP_TX_MPEG_DB0 + i,
> +				     sp.tx_packet_mpeg.mpeg_data[i]);
> +		}
> +
> +		break;
> +	case MPEG_PACKETS:
> +		sp_write_reg(anx78xx, TX_P2, SP_TX_MPEG_TYPE, 0x85);
> +		sp_write_reg(anx78xx, TX_P2, SP_TX_MPEG_VER, 0x01);
> +		sp_write_reg(anx78xx, TX_P2, SP_TX_MPEG_LEN, 0x0d);
> +
> +		for (i = 0; i < 10; i++) {
> +			sp_write_reg(anx78xx, TX_P2, SP_TX_MPEG_DB0 + i,
> +				     sp.tx_packet_mpeg.mpeg_data[i]);
> +		}
> +
> +		break;
> +	case AUDIF_PACKETS:
> +		sp_write_reg(anx78xx, TX_P2, SP_TX_AUD_TYPE, 0x84);
> +		sp_write_reg(anx78xx, TX_P2, SP_TX_AUD_VER, 0x01);
> +		sp_write_reg(anx78xx, TX_P2, SP_TX_AUD_LEN, 0x0a);
> +		for (i = 0; i < 10; i++) {
> +			sp_write_reg(anx78xx, TX_P2, SP_TX_AUD_DB0 + i,
> +				     sp.tx_audioinfoframe.pb_byte[i]);
> +		}
> +
> +		break;
> +
> +	default:
> +		break;
> +	}
> +}
> +
> +static void sp_tx_config_packets(struct anx78xx *anx78xx,
> +				 enum packets_type type)
> +{
> +	u8 regval;
> +
> +	switch (type) {
> +	case AVI_PACKETS:
> +		sp_read_reg(anx78xx, TX_P0, SP_TX_PKT_EN_REG, &regval);
> +		regval &= ~AVI_IF_EN;
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_PKT_EN_REG, regval);
> +		sp_tx_load_packet(anx78xx, AVI_PACKETS);
> +
> +		sp_read_reg(anx78xx, TX_P0, SP_TX_PKT_EN_REG, &regval);
> +		regval |= AVI_IF_UD;
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_PKT_EN_REG, regval);
> +
> +		sp_read_reg(anx78xx, TX_P0, SP_TX_PKT_EN_REG, &regval);
> +		regval |= AVI_IF_EN;
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_PKT_EN_REG, regval);
> +		break;
> +	case SPD_PACKETS:
> +		sp_read_reg(anx78xx, TX_P0, SP_TX_PKT_EN_REG, &regval);
> +		regval &= ~SPD_IF_EN;
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_PKT_EN_REG, regval);
> +		sp_tx_load_packet(anx78xx, SPD_PACKETS);
> +
> +		sp_read_reg(anx78xx, TX_P0, SP_TX_PKT_EN_REG, &regval);
> +		regval |= SPD_IF_UD;
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_PKT_EN_REG, regval);
> +
> +		sp_read_reg(anx78xx, TX_P0, SP_TX_PKT_EN_REG, &regval);
> +		regval |=  SPD_IF_EN;
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_PKT_EN_REG, regval);
> +		break;
> +	case VSI_PACKETS:
> +		sp_read_reg(anx78xx, TX_P0, SP_TX_PKT_EN_REG, &regval);
> +		regval &= ~MPEG_IF_EN;
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_PKT_EN_REG, regval);
> +
> +		sp_tx_load_packet(anx78xx, VSI_PACKETS);
> +
> +		sp_read_reg(anx78xx, TX_P0, SP_TX_PKT_EN_REG, &regval);
> +		regval |= MPEG_IF_UD;
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_PKT_EN_REG, regval);
> +
> +		sp_read_reg(anx78xx, TX_P0, SP_TX_PKT_EN_REG, &regval);
> +		regval |= MPEG_IF_EN;
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_PKT_EN_REG, regval);
> +		break;
> +	case MPEG_PACKETS:
> +		sp_read_reg(anx78xx, TX_P0, SP_TX_PKT_EN_REG, &regval);
> +		regval &= ~MPEG_IF_EN;
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_PKT_EN_REG, regval);
> +
> +		sp_tx_load_packet(anx78xx, MPEG_PACKETS);
> +
> +		sp_read_reg(anx78xx, TX_P0, SP_TX_PKT_EN_REG, &regval);
> +		regval |= MPEG_IF_UD;
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_PKT_EN_REG, regval);
> +
> +		sp_read_reg(anx78xx, TX_P0, SP_TX_PKT_EN_REG, &regval);
> +		regval |= MPEG_IF_EN;
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_PKT_EN_REG, regval);
> +		break;
> +	case AUDIF_PACKETS:
> +		sp_read_reg(anx78xx, TX_P0, SP_TX_PKT_EN_REG, &regval);
> +		regval &= ~AUD_IF_EN;
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_PKT_EN_REG, regval);
> +
> +		sp_tx_load_packet(anx78xx, AUDIF_PACKETS);
> +
> +		sp_read_reg(anx78xx, TX_P0, SP_TX_PKT_EN_REG, &regval);
> +		regval |= AUD_IF_UP;
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_PKT_EN_REG, regval);
> +
> +		sp_read_reg(anx78xx, TX_P0, SP_TX_PKT_EN_REG, &regval);
> +		regval |= AUD_IF_EN;
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_PKT_EN_REG, regval);
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
> +static void sp_config_video_output(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	u8 regval;
> +
> +	switch (sp.tx_vo_state) {
> +	default:
> +	case VO_WAIT_VIDEO_STABLE:
> +		sp_read_reg(anx78xx, RX_P0, HDMI_RX_SYS_STATUS_REG, &regval);
> +		if ((regval & (TMDS_DE_DET | TMDS_CLOCK_DET)) == 0x03) {

0x03? Is that the same as (TMDS_DE_DET | TMDS_CLOCK_DET)?

> +			sp_tx_bw_lc_sel(anx78xx, sp_tx_pclk_calc(anx78xx));
> +			sp_tx_enable_video_input(anx78xx, 0);
> +			sp_tx_avi_setup(anx78xx);
> +			sp_tx_config_packets(anx78xx, AVI_PACKETS);
> +			sp_tx_set_colorspace(anx78xx);
> +			sp_tx_lvttl_bit_mapping(anx78xx);
> +			if (sp_i2c_read_byte(anx78xx, RX_P0, RX_PACKET_REV_STA)
> +			    & VSI_RCVD)
> +				sp_hdmi_rx_new_vsi_int(anx78xx);
> +			sp_tx_enable_video_input(anx78xx, 1);
> +			sp.tx_vo_state = VO_WAIT_TX_VIDEO_STABLE;
> +		} else {
> +			dev_dbg(dev, "HDMI input video not stable!\n");
> +		}
> +		SP_BREAK(VO_WAIT_VIDEO_STABLE, sp.tx_vo_state);
> +	/* fallthrough */
> +	case VO_WAIT_TX_VIDEO_STABLE:
> +		sp_read_reg(anx78xx, TX_P0, SP_TX_SYS_CTRL2_REG, &regval);
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_SYS_CTRL2_REG, regval);
> +		sp_read_reg(anx78xx, TX_P0, SP_TX_SYS_CTRL2_REG, &regval);
> +		if (regval & CHA_STA) {
> +			dev_dbg(dev, "Stream clock not stable!\n");
> +		} else {
> +			sp_read_reg(anx78xx, TX_P0, SP_TX_SYS_CTRL3_REG,
> +				    &regval);
> +			sp_write_reg(anx78xx, TX_P0, SP_TX_SYS_CTRL3_REG,
> +				     regval);
> +			sp_read_reg(anx78xx, TX_P0, SP_TX_SYS_CTRL3_REG,
> +				    &regval);
> +			if (!(regval & STRM_VALID))
> +				dev_err(dev, "video stream not valid!\n");
> +			else
> +				sp.tx_vo_state = VO_CHECK_VIDEO_INFO;
> +		}
> +		SP_BREAK(VO_WAIT_TX_VIDEO_STABLE, sp.tx_vo_state);
> +	/* fallthrough */
> +	case VO_CHECK_VIDEO_INFO:
> +		if (!sp_tx_bw_lc_sel(anx78xx, sp_tx_pclk_calc(anx78xx)))
> +			sp.tx_vo_state++;
> +		else
> +			sp_tx_set_sys_state(anx78xx, STATE_LINK_TRAINING);
> +		SP_BREAK(VO_CHECK_VIDEO_INFO, sp.tx_vo_state);
> +	/* fallthrough */
> +	case VO_FINISH:
> +		sp_block_power_ctrl(anx78xx, SP_TX_PWR_AUDIO, SP_POWER_DOWN);
> +		hdmi_rx_mute_video(anx78xx, 0);
> +		sp_tx_video_mute(anx78xx, 0);
> +		sp_tx_show_information(anx78xx);
> +		goto_next_system_state(anx78xx);
> +		break;
> +	}
> +}
> +
> +/******************End Output video process********************/
> +
> +/******************Start HDCP process********************/
> +static inline void sp_tx_hdcp_encryption_disable(struct anx78xx *anx78xx)
> +{
> +	sp_write_reg_and(anx78xx, TX_P0, TX_HDCP_CTRL0, ~ENC_EN);
> +}
> +
> +static inline void sp_tx_hdcp_encryption_enable(struct anx78xx *anx78xx)
> +{
> +	sp_write_reg_or(anx78xx, TX_P0, TX_HDCP_CTRL0, ENC_EN);
> +}
> +
> +static void sp_tx_hw_hdcp_enable(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	u8 regval;
> +
> +	sp_write_reg_and(anx78xx, TX_P0, TX_HDCP_CTRL0,
> +			 ~ENC_EN & ~HARD_AUTH_EN);
> +	sp_write_reg_or(anx78xx, TX_P0, TX_HDCP_CTRL0,
> +			HARD_AUTH_EN | BKSV_SRM_PASS | KSVLIST_VLD | ENC_EN);
> +
> +	sp_read_reg(anx78xx, TX_P0, TX_HDCP_CTRL0, &regval);
> +	dev_dbg(dev, "TX_HDCP_CTRL0 = %.2x\n", regval);
> +	sp_write_reg(anx78xx, TX_P0, SP_TX_WAIT_R0_TIME, 0xb0);
> +	sp_write_reg(anx78xx, TX_P0, SP_TX_WAIT_KSVR_TIME, 0xc8);
> +
> +	dev_dbg(dev, "Hardware HDCP is enabled.\n");
> +}
> +
> +static void sp_hdcp_process(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +
> +	switch (sp.hcdp_state) {
> +	case HDCP_CAPABLE_CHECK:
> +		sp.ds_vid_stb_cntr = 0;
> +		sp.hdcp_fail_count = 0;
> +		if (is_anx_dongle(anx78xx))
> +			sp.hcdp_state = HDCP_WAITTING_VID_STB;
> +		else
> +			sp.hcdp_state = HDCP_HW_ENABLE;
> +		if (sp.block_en == 0) {
> +			if (sp_hdcp_cap_check(anx78xx) == 0)
> +				sp.hcdp_state = HDCP_NOT_SUPPORT;
> +		}
> +		/*
> +		 * Just for debug, pin: P2-2
> +		 * There is a switch to disable/enable HDCP.
> +		 */
> +		sp.hcdp_state = HDCP_NOT_SUPPORT;
> +		/*****************************************/
> +		SP_BREAK(HDCP_CAPABLE_CHECK, sp.hcdp_state);
> +	/* fallthrough */
> +	case HDCP_WAITTING_VID_STB:
> +		msleep(100);
> +		sp.hcdp_state = HDCP_HW_ENABLE;
> +		SP_BREAK(HDCP_WAITTING_VID_STB, sp.hcdp_state);
> +	/* fallthrough */
> +	case HDCP_HW_ENABLE:
> +		sp_tx_video_mute(anx78xx, 1);
> +		sp_tx_clean_hdcp_status(anx78xx);
> +		sp_block_power_ctrl(anx78xx, SP_TX_PWR_HDCP, SP_POWER_DOWN);
> +		msleep(20);
> +		sp_block_power_ctrl(anx78xx, SP_TX_PWR_HDCP, SP_POWER_ON);
> +		sp_write_reg(anx78xx, TX_P2, SP_COMMON_INT_MASK2, 0x01);
> +		msleep(50);
> +		sp_tx_hw_hdcp_enable(anx78xx);
> +		sp.hcdp_state = HDCP_WAITTING_FINISH;
> +	/* fallthrough */
> +	case HDCP_WAITTING_FINISH:
> +		break;
> +	case HDCP_FINISH:
> +		sp_tx_hdcp_encryption_enable(anx78xx);
> +		hdmi_rx_mute_video(anx78xx, 0);
> +		sp_tx_video_mute(anx78xx, 0);
> +		goto_next_system_state(anx78xx);
> +		sp.hcdp_state = HDCP_CAPABLE_CHECK;
> +		dev_dbg(dev, "@@@@@@@hdcp_auth_pass@@@@@@\n");
> +		break;
> +	case HDCP_FAILED:
> +		if (sp.hdcp_fail_count > 5) {
> +			sp_vbus_power_off(anx78xx);
> +			reg_hardware_reset(anx78xx);
> +			sp.hcdp_state = HDCP_CAPABLE_CHECK;
> +			sp.hdcp_fail_count = 0;
> +			dev_dbg(dev, "*********hdcp_auth_failed*********\n");
> +		} else {
> +			sp.hdcp_fail_count++;
> +			sp.hcdp_state = HDCP_WAITTING_VID_STB;
> +		}
> +		break;
> +	default:
> +	case HDCP_NOT_SUPPORT:
> +		dev_dbg(dev, "Sink is not capable HDCP\n");
> +		sp_block_power_ctrl(anx78xx, SP_TX_PWR_HDCP,
> +				    SP_POWER_DOWN);
> +		sp_tx_video_mute(anx78xx, 0);
> +		goto_next_system_state(anx78xx);
> +		sp.hcdp_state = HDCP_CAPABLE_CHECK;
> +		break;
> +	}
> +}
> +
> +/******************End HDCP process********************/
> +
> +/******************Start Audio process********************/
> +static void sp_tx_audioinfoframe_setup(struct anx78xx *anx78xx)
> +{
> +	int i;
> +	u8 regval;
> +
> +	sp_read_reg(anx78xx, RX_P1, HDMI_RX_AUDIO_TYPE_REG, &regval);
> +	sp.tx_audioinfoframe.type = regval;
> +	sp_read_reg(anx78xx, RX_P1, HDMI_RX_AUDIO_VER_REG, &regval);
> +	sp.tx_audioinfoframe.version = regval;
> +	sp_read_reg(anx78xx, RX_P1, HDMI_RX_AUDIO_LEN_REG, &regval);
> +	sp.tx_audioinfoframe.length = regval;
> +
> +	for (i = 0; i < 11; i++) {
> +		sp_read_reg(anx78xx, RX_P1, HDMI_RX_AUDIO_DATA00_REG + i,
> +			    &regval);
> +		sp.tx_audioinfoframe.pb_byte[i] = regval;
> +	}
> +}
> +
> +static void sp_tx_enable_audio_output(struct anx78xx *anx78xx, u8 enable)
> +{
> +	u8 regval;
> +
> +	sp_read_reg(anx78xx, TX_P0, SP_TX_AUD_CTRL, &regval);
> +	if (enable) {
> +		if (regval & AUD_EN) {
> +			regval &= ~AUD_EN;
> +			sp_write_reg(anx78xx, TX_P0, SP_TX_AUD_CTRL, regval);
> +		}
> +		sp_tx_audioinfoframe_setup(anx78xx);
> +		sp_tx_config_packets(anx78xx, AUDIF_PACKETS);
> +
> +		regval |= AUD_EN;
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_AUD_CTRL, regval);
> +	} else {
> +		regval &= ~AUD_EN;
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_AUD_CTRL, regval);
> +		sp_write_reg_and(anx78xx, TX_P0, SP_TX_PKT_EN_REG, ~AUD_IF_EN);
> +	}
> +}
> +
> +static void sp_tx_config_audio(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	u8 regval;
> +	int i;
> +	unsigned long m_aud, ls_clk = 0;
> +	unsigned long aud_freq = 0;
> +
> +	sp_block_power_ctrl(anx78xx, SP_TX_PWR_AUDIO, SP_POWER_ON);
> +	sp_read_reg(anx78xx, RX_P0, AUD_SPDIF_CHST4, &regval);
> +
> +	switch (regval & 0x0f) {
> +	case FS_FREQ_44100HZ:
> +		aud_freq = 44100;
> +		break;
> +	case FS_FREQ_48000HZ:
> +		aud_freq = 48000;
> +		break;
> +	case FS_FREQ_32000HZ:
> +		aud_freq = 32000;
> +		break;
> +	case FS_FREQ_88200HZ:
> +		aud_freq = 88200;
> +		break;
> +	case FS_FREQ_96000HZ:
> +		aud_freq = 96000;
> +		break;
> +	case FS_FREQ_176400HZ:
> +		aud_freq = 176400;
> +		break;
> +	case FS_FREQ_192000HZ:
> +		aud_freq = 192000;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	switch (sp_tx_get_link_bw(anx78xx)) {
> +	case LINK_1P62G:
> +		ls_clk = 162000;
> +		break;
> +	case LINK_2P7G:
> +		ls_clk = 270000;
> +		break;
> +	case LINK_5P4G:
> +		ls_clk = 540000;
> +		break;
> +	case LINK_6P75G:
> +		ls_clk = 675000;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	dev_dbg(dev, "aud_freq = %ld , LS_CLK = %ld\n", aud_freq, ls_clk);
> +
> +	m_aud = ((512 * aud_freq) / ls_clk) * 32768;
> +	m_aud = m_aud + 0x05;
> +	sp_write_reg(anx78xx, TX_P1, SP_TX_AUD_INTERFACE_CTRL4, m_aud & 0xff);
> +	m_aud = m_aud >> 8;
> +	sp_write_reg(anx78xx, TX_P1, SP_TX_AUD_INTERFACE_CTRL5, m_aud & 0xff);
> +	sp_write_reg(anx78xx, TX_P1, SP_TX_AUD_INTERFACE_CTRL6, 0x00);
> +
> +	sp_write_reg_and(anx78xx, TX_P1, SP_TX_AUD_INTERFACE_CTRL0,
> +			 (u8)~AUD_INTERFACE_DISABLE);
> +
> +	sp_write_reg_or(anx78xx, TX_P1, SP_TX_AUD_INTERFACE_CTRL2,
> +			M_AUD_ADJUST_ST);
> +
> +	sp_read_reg(anx78xx, RX_P0, HDMI_STATUS, &regval);
> +	if (regval & HDMI_AUD_LAYOUT)
> +		sp_write_reg_or(anx78xx, TX_P2, SP_TX_AUD_CH_NUM_REG5,
> +				CH_NUM_8 | AUD_LAYOUT);
> +	else
> +		sp_write_reg_and(anx78xx, TX_P2, SP_TX_AUD_CH_NUM_REG5,
> +				 (u8)~CH_NUM_8 & ~AUD_LAYOUT);
> +
> +	/* transfer audio chaneel status from HDMI Rx to Slinmport Tx */
> +	for (i = 0; i < 5; i++) {
> +		sp_read_reg(anx78xx, RX_P0, HDMI_RX_AUD_IN_CH_STATUS1_REG + i,
> +			    &regval);
> +		sp_write_reg(anx78xx, TX_P2, SP_TX_AUD_CH_STATUS_REG1 + i,
> +			     regval);
> +	}
> +
> +	/* enable audio */
> +	sp_tx_enable_audio_output(anx78xx, 1);
> +}
> +
> +static void sp_config_audio_output(struct anx78xx *anx78xx)
> +{
> +	static u8 count;
> +
> +	switch (sp.tx_ao_state) {
> +	default:
> +	case AO_INIT:
> +	case AO_CTS_RCV_INT:
> +	case AO_AUDIO_RCV_INT:
> +		if (!(sp_i2c_read_byte(anx78xx, RX_P0, HDMI_STATUS)
> +		    & HDMI_MODE)) {
> +			sp.tx_ao_state = AO_INIT;
> +			goto_next_system_state(anx78xx);
> +		}
> +		break;
> +	case AO_RCV_INT_FINISH:
> +		if (count++ > 2)
> +			sp.tx_ao_state = AO_OUTPUT;
> +		else
> +			sp.tx_ao_state = AO_INIT;
> +		SP_BREAK(AO_INIT, sp.tx_ao_state);
> +	/* fallthrough */
> +	case AO_OUTPUT:
> +		count = 0;
> +		sp.tx_ao_state = AO_INIT;
> +		 hdmi_rx_mute_audio(anx78xx, 0);
> +		sp_tx_config_audio(anx78xx);
> +		goto_next_system_state(anx78xx);
> +		break;
> +	}
> +}
> +
> +/******************End Audio process********************/
> +
> +void sp_initialization(struct anx78xx *anx78xx)
> +{
> +	/* Waitting Hot plug event! */
> +	if (!(sp.common_int_status.common_int[3] & PLUG))
> +		return;
> +
> +	sp.read_edid_flag = 0;
> +
> +	/* Power on all modules */
> +	sp_write_reg(anx78xx, TX_P2, SP_POWERD_CTRL_REG, 0x00);
> +	/* Driver Version */
> +	sp_write_reg(anx78xx, TX_P1, FW_VER_REG, FW_VERSION);
> +	hdmi_rx_initialization(anx78xx);
> +	sp_tx_initialization(anx78xx);
> +	msleep(200);
> +	goto_next_system_state(anx78xx);
> +}
> +
> +static void sp_hdcp_external_ctrl_flag_monitor(struct anx78xx *anx78xx)
> +{
> +	static u8 cur_flag;
> +
> +	if (sp.block_en != cur_flag) {
> +		cur_flag = sp.block_en;
> +		system_state_change_with_case(anx78xx, STATE_HDCP_AUTH);
> +	}
> +}
> +
> +static void sp_state_process(struct anx78xx *anx78xx)
> +{
> +	switch (sp.tx_system_state) {
> +	case STATE_WAITTING_CABLE_PLUG:
> +		sp_waiting_cable_plug_process(anx78xx);
> +		SP_BREAK(STATE_WAITTING_CABLE_PLUG, sp.tx_system_state);
> +	/* fallthrough */
> +	case STATE_SP_INITIALIZED:
> +		sp_initialization(anx78xx);
> +		SP_BREAK(STATE_SP_INITIALIZED, sp.tx_system_state);
> +	/* fallthrough */
> +	case STATE_SINK_CONNECTION:
> +		sp_sink_connection(anx78xx);
> +		SP_BREAK(STATE_SINK_CONNECTION, sp.tx_system_state);
> +	/* fallthrough */
> +	case STATE_PARSE_EDID:
> +		sp_edid_process(anx78xx);
> +		SP_BREAK(STATE_PARSE_EDID, sp.tx_system_state);
> +	/* fallthrough */
> +	case STATE_LINK_TRAINING:
> +		sp_link_training(anx78xx);
> +		SP_BREAK(STATE_LINK_TRAINING, sp.tx_system_state);
> +	/* fallthrough */
> +	case STATE_VIDEO_OUTPUT:
> +		sp_config_video_output(anx78xx);
> +		SP_BREAK(STATE_VIDEO_OUTPUT, sp.tx_system_state);
> +	/* fallthrough */
> +	case STATE_HDCP_AUTH:
> +		sp_hdcp_process(anx78xx);
> +		SP_BREAK(STATE_HDCP_AUTH, sp.tx_system_state);
> +	/* fallthrough */
> +	case STATE_AUDIO_OUTPUT:
> +		sp_config_audio_output(anx78xx);
> +		SP_BREAK(STATE_AUDIO_OUTPUT, sp.tx_system_state);
> +	/* fallthrough */
> +	case STATE_PLAY_BACK:
> +		SP_BREAK(STATE_PLAY_BACK, sp.tx_system_state);
> +	/* fallthrough */
> +	default:
> +		break;
> +	}
> +}
> +
> +/******************Start INT process********************/
> +static void sp_tx_int_rec(struct anx78xx *anx78xx)
> +{
> +	sp_read_reg(anx78xx, TX_P2, SP_COMMON_INT_STATUS1,
> +		    &sp.common_int_status.common_int[0]);
> +	sp_write_reg(anx78xx, TX_P2, SP_COMMON_INT_STATUS1,
> +		     sp.common_int_status.common_int[0]);
> +
> +	sp_read_reg(anx78xx, TX_P2, SP_COMMON_INT_STATUS1 + 1,
> +		    &sp.common_int_status.common_int[1]);
> +	sp_write_reg(anx78xx, TX_P2, SP_COMMON_INT_STATUS1 + 1,
> +		     sp.common_int_status.common_int[1]);
> +
> +	sp_read_reg(anx78xx, TX_P2, SP_COMMON_INT_STATUS1 + 2,
> +		    &sp.common_int_status.common_int[2]);
> +	sp_write_reg(anx78xx, TX_P2, SP_COMMON_INT_STATUS1 + 2,
> +		     sp.common_int_status.common_int[2]);
> +
> +	sp_read_reg(anx78xx, TX_P2, SP_COMMON_INT_STATUS1 + 3,
> +		    &sp.common_int_status.common_int[3]);
> +	sp_write_reg(anx78xx, TX_P2, SP_COMMON_INT_STATUS1 + 3,
> +		     sp.common_int_status.common_int[3]);
> +
> +	sp_read_reg(anx78xx, TX_P2, SP_COMMON_INT_STATUS1 + 6,
> +		    &sp.common_int_status.common_int[4]);
> +	sp_write_reg(anx78xx, TX_P2, SP_COMMON_INT_STATUS1 + 6,
> +		     sp.common_int_status.common_int[4]);

Loop please.

> +}
> +
> +static void sp_hdmi_rx_int_rec(struct anx78xx *anx78xx)
> +{
> +	 sp_read_reg(anx78xx, RX_P0, HDMI_RX_INT_STATUS1_REG,
> +		     &sp.hdmi_rx_int_status.hdmi_rx_int[0]);
> +	 sp_write_reg(anx78xx, RX_P0, HDMI_RX_INT_STATUS1_REG,
> +		      sp.hdmi_rx_int_status.hdmi_rx_int[0]);
> +	 sp_read_reg(anx78xx, RX_P0, HDMI_RX_INT_STATUS2_REG,
> +		     &sp.hdmi_rx_int_status.hdmi_rx_int[1]);
> +	 sp_write_reg(anx78xx, RX_P0, HDMI_RX_INT_STATUS2_REG,
> +		      sp.hdmi_rx_int_status.hdmi_rx_int[1]);
> +	 sp_read_reg(anx78xx, RX_P0, HDMI_RX_INT_STATUS3_REG,
> +		     &sp.hdmi_rx_int_status.hdmi_rx_int[2]);
> +	 sp_write_reg(anx78xx, RX_P0, HDMI_RX_INT_STATUS3_REG,
> +		      sp.hdmi_rx_int_status.hdmi_rx_int[2]);
> +	 sp_read_reg(anx78xx, RX_P0, HDMI_RX_INT_STATUS4_REG,
> +		     &sp.hdmi_rx_int_status.hdmi_rx_int[3]);
> +	 sp_write_reg(anx78xx, RX_P0, HDMI_RX_INT_STATUS4_REG,
> +		      sp.hdmi_rx_int_status.hdmi_rx_int[3]);
> +	 sp_read_reg(anx78xx, RX_P0, HDMI_RX_INT_STATUS5_REG,
> +		     &sp.hdmi_rx_int_status.hdmi_rx_int[4]);
> +	 sp_write_reg(anx78xx, RX_P0, HDMI_RX_INT_STATUS5_REG,
> +		      sp.hdmi_rx_int_status.hdmi_rx_int[4]);
> +	 sp_read_reg(anx78xx, RX_P0, HDMI_RX_INT_STATUS6_REG,
> +		     &sp.hdmi_rx_int_status.hdmi_rx_int[5]);
> +	 sp_write_reg(anx78xx, RX_P0, HDMI_RX_INT_STATUS6_REG,
> +		      sp.hdmi_rx_int_status.hdmi_rx_int[5]);
> +	 sp_read_reg(anx78xx, RX_P0, HDMI_RX_INT_STATUS7_REG,
> +		     &sp.hdmi_rx_int_status.hdmi_rx_int[6]);
> +	 sp_write_reg(anx78xx, RX_P0, HDMI_RX_INT_STATUS7_REG,
> +		      sp.hdmi_rx_int_status.hdmi_rx_int[6]);

Loop.

> +}
> +
> +static void sp_int_rec(struct anx78xx *anx78xx)
> +{
> +	sp_tx_int_rec(anx78xx);
> +	sp_hdmi_rx_int_rec(anx78xx);
> +}
> +
> +/******************End INT process********************/
> +
> +/******************Start task process********************/
> +static void sp_tx_pll_changed_int_handler(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +
> +	if (sp.tx_system_state >= STATE_LINK_TRAINING) {
> +		if (!sp_tx_get_pll_lock_status(anx78xx)) {
> +			dev_dbg(dev, "PLL:PLL not lock!\n");
> +			sp_tx_set_sys_state(anx78xx, STATE_LINK_TRAINING);
> +		}
> +	}
> +}
> +
> +static void sp_tx_hdcp_link_chk_fail_handler(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +
> +	system_state_change_with_case(anx78xx, STATE_HDCP_AUTH);
> +
> +	dev_dbg(dev, "hdcp_link_chk_fail:HDCP Sync lost!\n");
> +}
> +
> +static void sp_tx_phy_auto_test(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	u8 b_sw;
> +	u8 bytebuf[16];
> +
> +	/* DPCD 0x219 TEST_LINK_RATE */
> +	sp_tx_aux_dpcdread_bytes(anx78xx, 0x0, 0x02, 0x19, 1, bytebuf);
> +	dev_dbg(dev, "DPCD:0x00219 = %.2x\n", bytebuf[0]);
> +	switch (bytebuf[0]) {
> +	case LINK_1P62G:
> +	case LINK_2P7G:
> +	case LINK_5P4G:
> +	case LINK_6P75G:
> +		sp_tx_set_link_bw(anx78xx, bytebuf[0]);
> +		sp.tx_test_bw = bytebuf[0];
> +		break;
> +	default:
> +		sp_tx_set_link_bw(anx78xx, LINK_6P75G);
> +		sp.tx_test_bw = LINK_6P75G;
> +		break;
> +	}
> +
> +	/* DPCD 0x248 PHY_TEST_PATTERN */
> +	sp_tx_aux_dpcdread_bytes(anx78xx, 0x0, 0x02, 0x48, 1, bytebuf);
> +	dev_dbg(dev, "DPCD:0x00248 = %.2x\n", bytebuf[0]);
> +	switch (bytebuf[0]) {
> +	case 0:
> +		break;
> +	case 1:
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_TRAINING_PTN_SET_REG, 0x04);
> +		break;
> +	case 2:
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_TRAINING_PTN_SET_REG, 0x08);
> +		break;
> +	case 3:
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_TRAINING_PTN_SET_REG, 0x0c);
> +		break;
> +	case 4:
> +		sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x02, 0x50, 0xa,
> +					 bytebuf);
> +		sp_write_reg(anx78xx, TX_P1, SP_TX_LT_TEST_PATTERN_REG0,
> +			     bytebuf[0]);
> +		sp_write_reg(anx78xx, TX_P1, SP_TX_LT_TEST_PATTERN_REG1,
> +			     bytebuf[1]);
> +		sp_write_reg(anx78xx, TX_P1, SP_TX_LT_TEST_PATTERN_REG2,
> +			     bytebuf[2]);
> +		sp_write_reg(anx78xx, TX_P1, SP_TX_LT_TEST_PATTERN_REG3,
> +			     bytebuf[3]);
> +		sp_write_reg(anx78xx, TX_P1, SP_TX_LT_TEST_PATTERN_REG4,
> +			     bytebuf[4]);
> +		sp_write_reg(anx78xx, TX_P1, SP_TX_LT_TEST_PATTERN_REG5,
> +			     bytebuf[5]);
> +		sp_write_reg(anx78xx, TX_P1, SP_TX_LT_TEST_PATTERN_REG6,
> +			     bytebuf[6]);
> +		sp_write_reg(anx78xx, TX_P1, SP_TX_LT_TEST_PATTERN_REG7,
> +			     bytebuf[7]);
> +		sp_write_reg(anx78xx, TX_P1, SP_TX_LT_TEST_PATTERN_REG8,
> +			     bytebuf[8]);
> +		sp_write_reg(anx78xx, TX_P1, SP_TX_LT_TEST_PATTERN_REG9,
> +			     bytebuf[9]);

Loop.

> +		sp_write_reg(anx78xx, TX_P0, SP_TX_TRAINING_PTN_SET_REG, 0x30);
> +		break;
> +	case 5:
> +		sp_write_reg(anx78xx, TX_P0, ADDR_DP_CEP_TRAINING_CTRL0, 0x00);
> +		sp_write_reg(anx78xx, TX_P0, ADDR_DP_CEP_TRAINING_CTRL1, 0x01);
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_TRAINING_PTN_SET_REG, 0x14);
> +		break;
> +	}
> +
> +	sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x00, 0x03, 1, bytebuf);
> +	dev_dbg(dev, "DPCD:0x00003 = %.2x\n", bytebuf[0]);
> +	if (bytebuf[0] & 0x01)
> +		sp_tx_config_ssc(anx78xx, SSC_DEP_4000PPM);
> +	else
> +		sp_tx_spread_enable(anx78xx, 0);
> +
> +	/* get swing and emphasis adjust request */
> +	sp_read_reg(anx78xx, TX_P0, SP_TX_LT_SET_REG, &b_sw);
> +
> +	sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x02, 0x06, 1, bytebuf);
> +	dev_dbg(dev, "DPCD:0x00206 = %.2x\n", bytebuf[0]);
> +	switch (bytebuf[0] & 0x0f) {
> +	case 0x00:
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_LT_SET_REG,
> +			     (b_sw & ~TX_SW_SET_MASK) | 0x00);
> +		break;
> +	case 0x01:
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_LT_SET_REG,
> +			     (b_sw & ~TX_SW_SET_MASK) | 0x01);
> +		break;
> +	case 0x02:
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_LT_SET_REG,
> +			     (b_sw & ~TX_SW_SET_MASK) | 0x02);
> +		break;
> +	case 0x03:
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_LT_SET_REG,
> +			     (b_sw & ~TX_SW_SET_MASK) | 0x03);
> +		break;

Those 4 are just | (bytebuf[0] & 0x0f)

> +	case 0x04:
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_LT_SET_REG,
> +			     (b_sw & ~TX_SW_SET_MASK) | 0x08);
> +		break;
> +	case 0x05:
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_LT_SET_REG,
> +			     (b_sw & ~TX_SW_SET_MASK) | 0x09);
> +		break;
> +	case 0x06:
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_LT_SET_REG,
> +			     (b_sw & ~TX_SW_SET_MASK) | 0x0a);
> +		break;

Those 4 are | ((bytebuf[0] & 0x0f) + 4)

> +	case 0x08:
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_LT_SET_REG,
> +			     (b_sw & ~TX_SW_SET_MASK) | 0x10);
> +		break;
> +	case 0x09:
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_LT_SET_REG,
> +			     (b_sw & ~TX_SW_SET_MASK) | 0x11);
> +		break;
> +	case 0x0c:
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_LT_SET_REG,
> +			     (b_sw & ~TX_SW_SET_MASK) | 0x18);
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
> +static void sp_hpd_irq_process(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	u8 regval;
> +	u8 test_vector;
> +	u8 data_buf[6];
> +
> +	sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x02, 0x00, 6, data_buf);
> +	dev_dbg(dev, "+++++++++++++Get HPD IRQ %x\n", (int)data_buf[1]);
> +
> +	if (data_buf[1] != 0)
> +		sp_tx_aux_dpcdwrite_bytes(anx78xx, 0x00, 0x02,
> +					  DPCD_SERVICE_IRQ_VECTOR, 1,
> +					  &data_buf[1]);
> +
> +	/* HDCP IRQ */
> +	if (data_buf[1] & CP_IRQ) {
> +		if (sp.hcdp_state > HDCP_WAITTING_FINISH ||
> +		    sp.tx_system_state > STATE_HDCP_AUTH) {
> +			sp_tx_aux_dpcdread_bytes(anx78xx, 0x06, 0x80, 0x29, 1,
> +						 &regval);
> +			if (regval & 0x04) {
> +				system_state_change_with_case(anx78xx,
> +							      STATE_HDCP_AUTH);
> +				dev_dbg(dev, "IRQ:_______HDCP Sync lost!\n");
> +			}
> +		}
> +	}
> +
> +	/* AUTOMATED TEST IRQ */
> +	if (data_buf[1] & TEST_IRQ) {
> +		sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x02, 0x18, 1,
> +					 &test_vector);
> +
> +		if (test_vector & 0x01) {
> +			sp.tx_test_lt = 1;
> +
> +			sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x02, 0x19, 1,
> +						 &regval);
> +			switch (regval) {
> +			case LINK_1P62G:
> +			case LINK_2P7G:
> +			case LINK_5P4G:
> +			case LINK_6P75G:
> +				sp_tx_set_link_bw(anx78xx, regval);
> +				sp.tx_test_bw = regval;
> +				break;
> +			default:
> +				sp_tx_set_link_bw(anx78xx, LINK_6P75G);
> +				sp.tx_test_bw = LINK_6P75G;
> +				break;
> +			}
> +
> +			dev_dbg(dev, " test_bw = %.2x\n", sp.tx_test_bw);
> +
> +			sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x02, 0x60, 1,
> +						 &regval);
> +			regval = regval | TEST_ACK;
> +			sp_tx_aux_dpcdwrite_bytes(anx78xx, 0x00, 0x02, 0x60, 1,
> +						  &regval);
> +
> +			dev_dbg(dev, "Set TEST_ACK!\n");
> +			if (sp.tx_system_state >= STATE_LINK_TRAINING) {
> +				sp.tx_lt_state = LT_INIT;
> +				sp_tx_set_sys_state(anx78xx,
> +						    STATE_LINK_TRAINING);
> +			}
> +			dev_dbg(dev, "IRQ:test-LT request!\n");
> +		}
> +
> +		if (test_vector & 0x02) {
> +			sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x02, 0x60, 1,
> +						 &regval);
> +			regval = regval | TEST_ACK;
> +			sp_tx_aux_dpcdwrite_bytes(anx78xx, 0x00, 0x02, 0x60, 1,
> +						  &regval);
> +		}
> +		if (test_vector & 0x04) {
> +			if (sp.tx_system_state > STATE_PARSE_EDID)
> +				sp_tx_set_sys_state(anx78xx, STATE_PARSE_EDID);
> +			sp.tx_test_edid = 1;
> +			dev_dbg(dev, "Test EDID Requested!\n");
> +		}
> +
> +		if (test_vector & 0x08) {
> +			sp.tx_test_lt = 1;
> +
> +			sp_tx_phy_auto_test(anx78xx);
> +
> +			sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x02, 0x60, 1,
> +						 &regval);
> +			regval = regval | 0x01;
> +			sp_tx_aux_dpcdwrite_bytes(anx78xx, 0x00, 0x02, 0x60, 1,
> +						  &regval);
> +		}
> +	}
> +
> +	if (sp.tx_system_state > STATE_LINK_TRAINING) {
> +		if (!(data_buf[4] & 0x01) ||
> +		    ((data_buf[2] & (0x01 | 0x04)) != 0x05)) {

& 0x05) != 0x05

> +			sp_tx_set_sys_state(anx78xx, STATE_LINK_TRAINING);
> +			dev_dbg(dev, "INT:re-LT request!\n");
> +			return;
> +		}
> +
> +		dev_dbg(dev, "Lane align %x\n", data_buf[4]);
> +		dev_dbg(dev, "Lane clock recovery %x\n", data_buf[2]);
> +	}
> +}
> +
> +static void sp_tx_vsi_setup(struct anx78xx *anx78xx)
> +{
> +	u8 regval;
> +	int i;
> +
> +	for (i = 0; i < 10; i++) {
> +		sp_read_reg(anx78xx, RX_P1, (HDMI_RX_MPEG_DATA00_REG + i),

No parentheses.

> +			    &regval);
> +		sp.tx_packet_mpeg.mpeg_data[i] = regval;
> +	}
> +}
> +
> +static void sp_tx_mpeg_setup(struct anx78xx *anx78xx)
> +{
> +	u8 regval;
> +	int i;
> +
> +	for (i = 0; i < 10; i++) {
> +		sp_read_reg(anx78xx, RX_P1, (HDMI_RX_MPEG_DATA00_REG + i),
> +			    &regval);
> +		sp.tx_packet_mpeg.mpeg_data[i] = regval;
> +	}
> +}
> +
> +static void sp_tx_auth_done_int_handler(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	u8 bytebuf[2];
> +
> +	if (sp.hcdp_state > HDCP_HW_ENABLE &&
> +	    sp.tx_system_state == STATE_HDCP_AUTH) {
> +		sp_read_reg(anx78xx, TX_P0, SP_TX_HDCP_STATUS, bytebuf);
> +		if (bytebuf[0] & SP_TX_HDCP_AUTH_PASS) {
> +			sp_tx_aux_dpcdread_bytes(anx78xx, 0x06, 0x80, 0x2a, 2,
> +						 bytebuf);
> +			if ((bytebuf[1] & 0x08) || (bytebuf[0] & 0x80)) {
> +				dev_dbg(dev, "max cascade/devs exceeded!\n");
> +				sp_tx_hdcp_encryption_disable(anx78xx);
> +			} else
> +				dev_dbg(dev, "%s\n",
> +					"Authentication pass in Auth_Done");
> +
> +			sp.hcdp_state = HDCP_FINISH;
> +		} else {
> +			dev_err(dev, "Authentication failed in AUTH_done\n");
> +			sp_tx_video_mute(anx78xx, 1);
> +			sp_tx_clean_hdcp_status(anx78xx);
> +			sp.hcdp_state = HDCP_FAILED;
> +		}
> +	}
> +}
> +
> +static void sp_tx_lt_done_int_handler(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	u8 regval;
> +
> +	if (sp.tx_lt_state == LT_WAITTING_FINISH &&
> +	    sp.tx_system_state == STATE_LINK_TRAINING) {
> +		sp_read_reg(anx78xx, TX_P0, LT_CTRL, &regval);
> +		if (regval & 0x70) {
> +			regval = (regval & 0x70) >> 4;
> +			dev_dbg(dev, "LT failed in interrupt, ERR = %.2x\n",
> +				regval);
> +			sp.tx_lt_state = LT_ERROR;
> +		} else {
> +			dev_dbg(dev, "lt_done: LT Finish\n");
> +			sp.tx_lt_state = LT_FINISH;
> +		}
> +	}
> +}
> +
> +static void sp_hdmi_rx_clk_det_int(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +
> +	dev_dbg(dev, "*HDMI_RX Interrupt: Pixel Clock Change.\n");
> +	if (sp.tx_system_state > STATE_VIDEO_OUTPUT) {
> +		sp_tx_video_mute(anx78xx, 1);
> +		sp_tx_enable_audio_output(anx78xx, 0);
> +		sp_tx_set_sys_state(anx78xx, STATE_VIDEO_OUTPUT);
> +	}
> +}
> +
> +static void sp_hdmi_rx_hdmi_dvi_int(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	u8 regval;
> +
> +	dev_dbg(dev, "sp_hdmi_rx_hdmi_dvi_int.\n");
> +	sp_read_reg(anx78xx, RX_P0, HDMI_STATUS, &regval);
> +	sp.hdmi_dvi_status = 1;

= 1? What does that mean?

> +	if ((regval & BIT(0)) != (sp.hdmi_dvi_status & BIT(0))) {

!= 1: you assigned that variable just above...

> +		dev_dbg(dev, "hdmi_dvi_int: Is HDMI MODE: %x.\n",
> +			regval & HDMI_MODE);
> +		sp.hdmi_dvi_status = regval & BIT(0);
> +		hdmi_rx_mute_audio(anx78xx, 1);
> +		system_state_change_with_case(anx78xx, STATE_LINK_TRAINING);
> +	}
> +}
> +
> +static void sp_hdmi_rx_new_avi_int(struct anx78xx *anx78xx)
> +{
> +	sp_tx_lvttl_bit_mapping(anx78xx);
> +	sp_tx_set_colorspace(anx78xx);
> +	sp_tx_avi_setup(anx78xx);
> +	sp_tx_config_packets(anx78xx, AVI_PACKETS);
> +}
> +
> +static void sp_hdmi_rx_new_vsi_int(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	u8 hdmi_video_format, v3d_structure;
> +
> +	sp_write_reg_and(anx78xx, TX_P0, SP_TX_3D_VSC_CTRL,
> +			 ~INFO_FRAME_VSC_EN);
> +
> +	/* VSI package header */
> +	if ((sp_i2c_read_byte(anx78xx, RX_P1,
> +			      HDMI_RX_MPEG_TYPE_REG) != 0x81) ||
> +	    (sp_i2c_read_byte(anx78xx, RX_P1, HDMI_RX_MPEG_VER_REG) != 0x01))
> +		return;
> +
> +	dev_dbg(dev, "Setup VSI package!\n");
> +
> +	sp_tx_vsi_setup(anx78xx);
> +	sp_tx_config_packets(anx78xx, VSI_PACKETS);
> +
> +	sp_read_reg(anx78xx, RX_P1, HDMI_RX_MPEG_DATA03_REG,
> +		    &hdmi_video_format);
> +
> +	if ((hdmi_video_format & 0xe0) == 0x40) {
> +		dev_dbg(dev, "3D VSI packet detected. Config VSC packet\n");
> +
> +		sp_read_reg(anx78xx, RX_P1, HDMI_RX_MPEG_DATA05_REG,
> +			    &v3d_structure);
> +
> +		switch (v3d_structure & 0xf0) {
> +		case 0x00:
> +			v3d_structure = 0x02;
> +			break;
> +		case 0x20:
> +			v3d_structure = 0x03;
> +			break;
> +		case 0x30:
> +			v3d_structure = 0x04;
> +			break;
> +		default:
> +			v3d_structure = 0x00;
> +			dev_dbg(dev, "3D structure is not supported\n");
> +			break;
> +		}
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_VSC_DB1, v3d_structure);
> +	}
> +	sp_write_reg_or(anx78xx, TX_P0, SP_TX_3D_VSC_CTRL, INFO_FRAME_VSC_EN);
> +	sp_write_reg_and(anx78xx, TX_P0, SP_TX_PKT_EN_REG, ~SPD_IF_EN);
> +	sp_write_reg_or(anx78xx, TX_P0, SP_TX_PKT_EN_REG, SPD_IF_UD);
> +	sp_write_reg_or(anx78xx, TX_P0, SP_TX_PKT_EN_REG, SPD_IF_EN);
> +}
> +
> +static void sp_hdmi_rx_no_vsi_int(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	u8 regval;
> +
> +	sp_read_reg(anx78xx, TX_P0, SP_TX_3D_VSC_CTRL, &regval);
> +	if (regval & INFO_FRAME_VSC_EN) {
> +		dev_dbg(dev, "No new VSI is received, disable  VSC packet\n");
> +		regval &= ~INFO_FRAME_VSC_EN;
> +		sp_write_reg(anx78xx, TX_P0, SP_TX_3D_VSC_CTRL, regval);
> +		sp_tx_mpeg_setup(anx78xx);
> +		sp_tx_config_packets(anx78xx, MPEG_PACKETS);
> +	}
> +}
> +
> +static inline void sp_hdmi_rx_restart_audio_chk(struct anx78xx *anx78xx)
> +{
> +	system_state_change_with_case(anx78xx, STATE_AUDIO_OUTPUT);
> +}
> +
> +static void sp_hdmi_rx_cts_rcv_int(struct anx78xx *anx78xx)
> +{
> +	if (sp.tx_ao_state == AO_INIT)
> +		sp.tx_ao_state = AO_CTS_RCV_INT;
> +	else if (sp.tx_ao_state == AO_AUDIO_RCV_INT)
> +		sp.tx_ao_state = AO_RCV_INT_FINISH;
> +}
> +
> +static void sp_hdmi_rx_audio_rcv_int(struct anx78xx *anx78xx)
> +{
> +	if (sp.tx_ao_state == AO_INIT)
> +		sp.tx_ao_state = AO_AUDIO_RCV_INT;
> +	else if (sp.tx_ao_state == AO_CTS_RCV_INT)
> +		sp.tx_ao_state = AO_RCV_INT_FINISH;
> +}
> +
> +static void sp_hdmi_rx_audio_samplechg_int(struct anx78xx *anx78xx)
> +{
> +	u16 i;
> +	u8 regval;
> +
> +	/* transfer audio chaneel status from HDMI Rx to Slinmport Tx */

channel? Slimport?

> +	for (i = 0; i < 5; i++) {
> +		sp_read_reg(anx78xx, RX_P0, HDMI_RX_AUD_IN_CH_STATUS1_REG + i,
> +			    &regval);
> +		sp_write_reg(anx78xx, TX_P2, SP_TX_AUD_CH_STATUS_REG1 + i,
> +			     regval);
> +	}
> +}
> +
> +static void sp_hdmi_rx_hdcp_error_int(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	static u8 count;
> +
> +	dev_dbg(dev, "*HDMI_RX Interrupt: hdcp error.\n");
> +	if (count >= 40) {
> +		count = 0;
> +		dev_dbg(dev, "Lots of hdcp error occurred ...\n");
> +		hdmi_rx_mute_audio(anx78xx, 1);
> +		hdmi_rx_mute_video(anx78xx, 1);
> +		hdmi_rx_set_hpd(anx78xx, 0);
> +		usleep_range(10000, 11000);
> +		hdmi_rx_set_hpd(anx78xx, 1);
> +	} else {
> +		count++;
> +	}
> +}
> +
> +static void sp_hdmi_rx_new_gcp_int(struct anx78xx *anx78xx)
> +{
> +	u8 regval;
> +
> +	sp_read_reg(anx78xx, RX_P1, HDMI_RX_GENERAL_CTRL, &regval);
> +	if (regval & SET_AVMUTE) {
> +		hdmi_rx_mute_video(anx78xx, 1);
> +		hdmi_rx_mute_audio(anx78xx, 1);
> +	} else if (regval & CLEAR_AVMUTE) {
> +		hdmi_rx_mute_video(anx78xx, 0);
> +		hdmi_rx_mute_audio(anx78xx, 0);
> +	}
> +}
> +
> +static void sp_tx_hpd_int_handler(struct anx78xx *anx78xx, u8 hpd_source)

I'd split this function in 2 parts, one for LOST, the other for CHANGE, since
they do not share any code anyway.

> +{
> +	struct device *dev = &anx78xx->client->dev;
> +
> +	switch (hpd_source) {
> +	case HPD_LOST:
> +		hdmi_rx_set_hpd(anx78xx, 0);
> +		sp_tx_set_sys_state(anx78xx, STATE_WAITTING_CABLE_PLUG);
> +		break;
> +	case HPD_CHANGE:
> +		dev_dbg(dev, "HPD:____________HPD changed!\n");
> +		usleep_range(2000, 4000);
> +		if (sp.common_int_status.common_int[3] & HPD_IRQ)
> +			sp_hpd_irq_process(anx78xx);
> +
> +		if (sp_i2c_read_byte(anx78xx, TX_P0,
> +				     SP_TX_SYS_CTRL3_REG) & HPD_STATUS) {
> +			if (sp.common_int_status.common_int[3] & HPD_IRQ)
> +				sp_hpd_irq_process(anx78xx);
> +		} else {
> +			if (sp_i2c_read_byte(anx78xx, TX_P0,
> +					     SP_TX_SYS_CTRL3_REG) &
> +			    HPD_STATUS) {
> +				hdmi_rx_set_hpd(anx78xx, 0);
> +				sp_tx_set_sys_state(anx78xx,
> +						    STATE_WAITTING_CABLE_PLUG);
> +			}
> +		}
> +		break;
> +	case PLUG:

This case is never called.

> +		dev_dbg(dev, "HPD:____________HPD changed!\n");
> +		if (sp.tx_system_state < STATE_SP_INITIALIZED)
> +			sp_tx_set_sys_state(anx78xx, STATE_SP_INITIALIZED);
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
> +static void sp_system_isr_handler(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +
> +	if (sp.common_int_status.common_int[3] & HPD_CHANGE)
> +		sp_tx_hpd_int_handler(anx78xx, HPD_CHANGE);
> +	if (sp.common_int_status.common_int[3] & HPD_LOST)
> +		sp_tx_hpd_int_handler(anx78xx, HPD_LOST);
> +	if (sp.common_int_status.common_int[3] & HPD_IRQ)
> +		dev_dbg(dev, "++++++++++++++++========HDCP_IRQ interrupt\n");
> +	if (sp.common_int_status.common_int[0] & PLL_LOCK_CHG)
> +		sp_tx_pll_changed_int_handler(anx78xx);
> +
> +	if (sp.common_int_status.common_int[1] & HDCP_AUTH_DONE)
> +		sp_tx_auth_done_int_handler(anx78xx);
> +
> +	if (sp.common_int_status.common_int[2] & HDCP_LINK_CHECK_FAIL)
> +		sp_tx_hdcp_link_chk_fail_handler(anx78xx);
> +
> +	if (sp.common_int_status.common_int[4] & TRAINING_FINISH)
> +		sp_tx_lt_done_int_handler(anx78xx);
> +
> +	if (sp.tx_system_state > STATE_SINK_CONNECTION) {
> +		if (sp.hdmi_rx_int_status.hdmi_rx_int[5] & NEW_AVI)
> +			sp_hdmi_rx_new_avi_int(anx78xx);
> +	}
> +
> +	if (sp.tx_system_state > STATE_VIDEO_OUTPUT) {
> +		if (sp.hdmi_rx_int_status.hdmi_rx_int[6] & NEW_VS) {
> +			sp.hdmi_rx_int_status.hdmi_rx_int[6] &= ~NO_VSI;
> +			sp_hdmi_rx_new_vsi_int(anx78xx);
> +		}
> +		if (sp.hdmi_rx_int_status.hdmi_rx_int[6] & NO_VSI)
> +			sp_hdmi_rx_no_vsi_int(anx78xx);
> +	}
> +
> +	if (sp.tx_system_state >= STATE_VIDEO_OUTPUT) {
> +		if (sp.hdmi_rx_int_status.hdmi_rx_int[0] & CKDT_CHANGE)
> +			sp_hdmi_rx_clk_det_int(anx78xx);
> +
> +		if (sp.hdmi_rx_int_status.hdmi_rx_int[0] & SCDT_CHANGE)
> +			dev_dbg(dev, "*HDMI_RX Interrupt: Sync Detect.\n");
> +
> +		if (sp.hdmi_rx_int_status.hdmi_rx_int[0] & HDMI_DVI)
> +			sp_hdmi_rx_hdmi_dvi_int(anx78xx);
> +
> +		if ((sp.hdmi_rx_int_status.hdmi_rx_int[5] & NEW_AUD) ||
> +		    (sp.hdmi_rx_int_status.hdmi_rx_int[2] & AUD_MODE_CHANGE))
> +			sp_hdmi_rx_restart_audio_chk(anx78xx);
> +
> +		if (sp.hdmi_rx_int_status.hdmi_rx_int[5] & CTS_RCV)
> +			sp_hdmi_rx_cts_rcv_int(anx78xx);
> +
> +		if (sp.hdmi_rx_int_status.hdmi_rx_int[4] & AUDIO_RCV)
> +			sp_hdmi_rx_audio_rcv_int(anx78xx);
> +
> +		if (sp.hdmi_rx_int_status.hdmi_rx_int[1] & HDCP_ERR)
> +			sp_hdmi_rx_hdcp_error_int(anx78xx);
> +
> +		if (sp.hdmi_rx_int_status.hdmi_rx_int[5] & NEW_CP)
> +			sp_hdmi_rx_new_gcp_int(anx78xx);
> +
> +		if (sp.hdmi_rx_int_status.hdmi_rx_int[1] & AUDIO_SAMPLE_CHANGE)
> +			sp_hdmi_rx_audio_samplechg_int(anx78xx);
> +	}
> +}
> +
> +static void sp_tx_show_information(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	u8 regval, regval1;
> +	u16 h_res, h_act, v_res, v_act;
> +	u16 h_fp, h_sw, h_bp, v_fp, v_sw, v_bp;
> +	unsigned long fresh_rate;
> +	unsigned long pclk;
> +
> +	dev_dbg(dev, "\n************* SP Video Information **************\n");
> +
> +	switch (sp_tx_get_link_bw(anx78xx)) {
> +	case LINK_1P62G:
> +		dev_dbg(dev, "BW = 1.62G\n");
> +		break;
> +	case LINK_2P7G:
> +		dev_dbg(dev, "BW = 2.7G\n");
> +		break;
> +	case LINK_5P4G:
> +		dev_dbg(dev, "BW = 5.4G\n");
> +		break;
> +	case LINK_6P75G:
> +		dev_dbg(dev, "BW = 6.75G\n");
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	pclk = sp_tx_pclk_calc(anx78xx);
> +	pclk = pclk / 10;
> +
> +	sp_read_reg(anx78xx, TX_P2, SP_TX_TOTAL_LINE_STA_L, &regval);
> +	sp_read_reg(anx78xx, TX_P2, SP_TX_TOTAL_LINE_STA_H, &regval1);
> +
> +	v_res = regval1;
> +	v_res = v_res << 8;
> +	v_res = v_res + regval;
> +
> +	sp_read_reg(anx78xx, TX_P2, SP_TX_ACT_LINE_STA_L, &regval);
> +	sp_read_reg(anx78xx, TX_P2, SP_TX_ACT_LINE_STA_H, &regval1);
> +
> +	v_act = regval1;
> +	v_act = v_act << 8;
> +	v_act = v_act + regval;
> +
> +	sp_read_reg(anx78xx, TX_P2, SP_TX_TOTAL_PIXEL_STA_L, &regval);
> +	sp_read_reg(anx78xx, TX_P2, SP_TX_TOTAL_PIXEL_STA_H, &regval1);
> +
> +	h_res = regval1;
> +	h_res = h_res << 8;
> +	h_res = h_res + regval;
> +
> +	sp_read_reg(anx78xx, TX_P2, SP_TX_ACT_PIXEL_STA_L, &regval);
> +	sp_read_reg(anx78xx, TX_P2, SP_TX_ACT_PIXEL_STA_H, &regval1);
> +
> +	h_act = regval1;
> +	h_act = h_act << 8;
> +	h_act = h_act + regval;
> +
> +	sp_read_reg(anx78xx, TX_P2, SP_TX_H_F_PORCH_STA_L, &regval);
> +	sp_read_reg(anx78xx, TX_P2, SP_TX_H_F_PORCH_STA_H, &regval1);
> +
> +	h_fp = regval1;
> +	h_fp = h_fp << 8;
> +	h_fp = h_fp + regval;
> +
> +	sp_read_reg(anx78xx, TX_P2, SP_TX_H_SYNC_STA_L, &regval);
> +	sp_read_reg(anx78xx, TX_P2, SP_TX_H_SYNC_STA_H, &regval1);
> +
> +	h_sw = regval1;
> +	h_sw = h_sw << 8;
> +	h_sw = h_sw + regval;
> +
> +	sp_read_reg(anx78xx, TX_P2, SP_TX_H_B_PORCH_STA_L, &regval);
> +	sp_read_reg(anx78xx, TX_P2, SP_TX_H_B_PORCH_STA_H, &regval1);
> +
> +	h_bp = regval1;
> +	h_bp = h_bp << 8;
> +	h_bp = h_bp + regval;
> +
> +	sp_read_reg(anx78xx, TX_P2, SP_TX_V_F_PORCH_STA, &regval);
> +	v_fp = regval;
> +
> +	sp_read_reg(anx78xx, TX_P2, SP_TX_V_SYNC_STA, &regval);
> +	v_sw = regval;
> +
> +	sp_read_reg(anx78xx, TX_P2, SP_TX_V_B_PORCH_STA, &regval);
> +	v_bp = regval;
> +
> +	dev_dbg(dev, "Total resolution is %d * %d\n", h_res, v_res);
> +
> +	dev_dbg(dev, "HF=%d, HSW=%d, HBP=%d\n", h_fp, h_sw, h_bp);
> +	dev_dbg(dev, "VF=%d, VSW=%d, VBP=%d\n", v_fp, v_sw, v_bp);
> +	dev_dbg(dev, "Active resolution is %d * %d", h_act, v_act);
> +
> +	if (h_res == 0 || v_res == 0) {
> +		fresh_rate = 0;
> +	} else {
> +		fresh_rate = pclk * 1000;
> +		fresh_rate = fresh_rate / h_res;
> +		fresh_rate = fresh_rate * 1000;
> +		fresh_rate = fresh_rate / v_res;
> +	}
> +	dev_dbg(dev, "   @ %ldHz\n", fresh_rate);
> +
> +	sp_read_reg(anx78xx, TX_P0, SP_TX_VID_CTRL, &regval);
> +
> +	if ((regval & 0x06) == 0x00)
> +		dev_dbg(dev, "ColorSpace: RGB,");
> +	else if ((regval & 0x06) == 0x02)
> +		dev_dbg(dev, "ColorSpace: YCbCr422,");
> +	else if ((regval & 0x06) == 0x04)
> +		dev_dbg(dev, "ColorSpace: YCbCr444,");
> +
> +	sp_read_reg(anx78xx, TX_P0, SP_TX_VID_CTRL, &regval);
> +
> +	if ((regval & 0xe0) == 0x00)
> +		dev_dbg(dev, "6 BPC\n");
> +	else if ((regval & 0xe0) == 0x20)
> +		dev_dbg(dev, "8 BPC\n");
> +	else if ((regval & 0xe0) == 0x40)
> +		dev_dbg(dev, "10 BPC\n");
> +	else if ((regval & 0xe0) == 0x60)
> +		dev_dbg(dev, "12 BPC\n");
> +
> +	if (is_anx_dongle(anx78xx)) {
> +		sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x05, 0x23, 1, &regval);
> +		dev_dbg(dev, "Analogix Dongle FW Ver %.2x\n", regval & 0x7f);
> +	}
> +
> +	dev_dbg(dev, "\n**************************************************\n");
> +}
> +
> +static void sp_clean_system_status(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +
> +	if (sp.need_clean_status) {
> +		dev_dbg(dev, "sp_clean_system_status. A -> B;\n");
> +		dev_dbg(dev, "A:");
> +		sp_print_system_state(anx78xx, sp.tx_system_state_bak);
> +		dev_dbg(dev, "B:");
> +		sp_print_system_state(anx78xx, sp.tx_system_state);
> +
> +		sp.need_clean_status = 0;
> +		if (sp.tx_system_state_bak >= STATE_LINK_TRAINING) {
> +			if (sp.tx_system_state >= STATE_AUDIO_OUTPUT) {
> +				hdmi_rx_mute_audio(anx78xx, 1);
> +			} else {
> +				hdmi_rx_mute_video(anx78xx, 1);
> +				sp_tx_video_mute(anx78xx, 1);
> +			}
> +		}
> +		if (sp.tx_system_state_bak >= STATE_HDCP_AUTH &&
> +		    sp.tx_system_state <= STATE_HDCP_AUTH) {
> +			if (sp_i2c_read_byte(anx78xx, TX_P0, TX_HDCP_CTRL0)
> +			    & 0xfc)
> +				sp_tx_clean_hdcp_status(anx78xx);
> +		}
> +
> +		if (sp.hcdp_state != HDCP_CAPABLE_CHECK)
> +			sp.hcdp_state = HDCP_CAPABLE_CHECK;
> +
> +		if (sp.tx_sc_state != SC_INIT)
> +			sp.tx_sc_state = SC_INIT;
> +		if (sp.tx_lt_state != LT_INIT)
> +			sp.tx_lt_state = LT_INIT;
> +		if (sp.tx_vo_state != VO_WAIT_VIDEO_STABLE)
> +			sp.tx_vo_state = VO_WAIT_VIDEO_STABLE;
> +	}
> +}
> +
> +/******************add for HDCP cap check********************/
> +static u8 sp_hdcp_cap_check(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	u8 g_hdcp_cap = 0;
> +	u8 value;
> +
> +	if (sp_tx_aux_dpcdread_bytes(anx78xx, 0x06, 0x80, 0x28, 1, &value) == 0)
> +		g_hdcp_cap = value & 0x01;
> +	else
> +		dev_dbg(dev, "HDCP CAPABLE: read AUX err!\n");
> +
> +	dev_dbg(dev, "hdcp cap check: %s Supported\n",
> +		g_hdcp_cap ? "" : "No");
> +
> +	return g_hdcp_cap;
> +}
> +
> +/******************End HDCP cap check********************/
> +
> +static void sp_tasks_handler(struct anx78xx *anx78xx)
> +{
> +	sp_system_isr_handler(anx78xx);
> +	sp_hdcp_external_ctrl_flag_monitor(anx78xx);
> +	sp_clean_system_status(anx78xx);
> +	/*clear up backup system state*/
> +	if (sp.tx_system_state_bak != sp.tx_system_state)
> +		sp.tx_system_state_bak = sp.tx_system_state;
> +}
> +
> +/******************End task  process********************/
> +
> +void sp_main_process(struct anx78xx *anx78xx)
> +{
> +	sp_state_process(anx78xx);
> +	if (sp.tx_system_state > STATE_WAITTING_CABLE_PLUG) {
> +		sp_int_rec(anx78xx);
> +		sp_tasks_handler(anx78xx);
> +	}
> +}
> diff --git a/drivers/gpu/drm/bridge/anx78xx/slimport_tx_drv.h b/drivers/gpu/drm/bridge/anx78xx/slimport_tx_drv.h
> new file mode 100644
> index 0000000..04dbe06
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/anx78xx/slimport_tx_drv.h
> @@ -0,0 +1,214 @@
> +/*
> + * Copyright(c) 2015, Analogix Semiconductor. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#ifndef __SLIMPORT_TX_DRV_H
> +#define __SLIMPORT_TX_DRV_H
> +
> +#include "anx78xx.h"
> +#include "slimport_tx_reg.h"
> +
> +#define FW_VERSION	0x22
> +
> +#define DVI_MODE	0x00
> +#define HDMI_MODE	0x01
> +
> +#define SP_POWER_ON	1
> +#define SP_POWER_DOWN	0
> +
> +#define MAX_BUF_CNT	16
> +
> +#define SP_BREAK(current_status, next_status) \
> +	{ if (next_status != (current_status) + 1) break; }

Please remove these control flow macros...

> +
> +enum rx_cbl_type {
> +	DWN_STRM_IS_NULL,

DOWN_STREAM_IS_NULL

> +	DWN_STRM_IS_HDMI,
> +	DWN_STRM_IS_DIGITAL,
> +	DWN_STRM_IS_ANALOG,
> +	DWN_STRM_NUM
> +};
> +
> +enum sp_tx_state {
> +	STATE_WAITTING_CABLE_PLUG,
> +	STATE_SP_INITIALIZED,
> +	STATE_SINK_CONNECTION,
> +	STATE_PARSE_EDID,
> +	STATE_LINK_TRAINING,
> +	STATE_VIDEO_OUTPUT,
> +	STATE_HDCP_AUTH,
> +	STATE_AUDIO_OUTPUT,
> +	STATE_PLAY_BACK
> +};
> +
> +enum sp_tx_power_block {
> +	SP_TX_PWR_REG = REGISTER_PD,
> +	SP_TX_PWR_HDCP = HDCP_PD,
> +	SP_TX_PWR_AUDIO = AUDIO_PD,
> +	SP_TX_PWR_VIDEO = VIDEO_PD,
> +	SP_TX_PWR_LINK = LINK_PD,
> +	SP_TX_PWR_TOTAL = TOTAL_PD,
> +	SP_TX_PWR_NUMS
> +};
> +
> +enum hdmi_color_depth {
> +	HDMI_LEGACY = 0x00,
> +	HDMI_24BIT = 0x04,
> +	HDMI_30BIT = 0x05,
> +	HDMI_36BIT = 0x06,
> +	HDMI_48BIT = 0x07,
> +};
> +
> +enum sp_tx_send_msg {
> +	MSG_OCM_EN,
> +	MSG_INPUT_HDMI,
> +	MSG_INPUT_DVI,
> +	MSG_CLEAR_IRQ,
> +};
> +
> +enum sink_connection_status {
> +	SC_INIT,
> +	SC_CHECK_CABLE_TYPE,
> +	SC_WAITTING_CABLE_TYPE = SC_CHECK_CABLE_TYPE + 5,
> +	SC_SINK_CONNECTED,
> +	SC_NOT_CABLE,
> +	SC_STATE_NUM
> +};
> +
> +enum cable_type_status {
> +	CHECK_AUXCH,
> +	GETTED_CABLE_TYPE,
> +	CABLE_TYPE_STATE_NUM
> +};
> +
> +enum sp_tx_lt_status {
> +	LT_INIT,
> +	LT_WAIT_PLL_LOCK,
> +	LT_CHECK_LINK_BW,
> +	LT_START,
> +	LT_WAITTING_FINISH,
> +	LT_ERROR,
> +	LT_FINISH,
> +	LT_END,
> +	LT_STATES_NUM
> +};
> +
> +enum hdcp_status {
> +	HDCP_CAPABLE_CHECK,
> +	HDCP_WAITTING_VID_STB,
> +	HDCP_HW_ENABLE,
> +	HDCP_WAITTING_FINISH,
> +	HDCP_FINISH,
> +	HDCP_FAILED,
> +	HDCP_NOT_SUPPORT,
> +	HDCP_PROCESS_STATE_NUM
> +};
> +
> +enum video_output_status {
> +	VO_WAIT_VIDEO_STABLE,
> +	VO_WAIT_TX_VIDEO_STABLE,
> +	VO_CHECK_VIDEO_INFO,
> +	VO_FINISH,
> +	VO_STATE_NUM
> +};
> +
> +enum audio_output_status {
> +	AO_INIT,
> +	AO_CTS_RCV_INT,
> +	AO_AUDIO_RCV_INT,
> +	AO_RCV_INT_FINISH,
> +	AO_OUTPUT,
> +	AO_STATE_NUM
> +};
> +
> +struct packet_avi {
> +	u8 avi_data[13];
> +};
> +
> +struct packet_spd {
> +	u8 spd_data[25];
> +};
> +
> +struct packet_mpeg {
> +	u8 mpeg_data[13];
> +};
> +
> +struct audio_info_frame {
> +	u8 type;
> +	u8 version;
> +	u8 length;
> +	u8 pb_byte[11];
> +};
> +
> +enum packets_type {
> +	AVI_PACKETS,
> +	SPD_PACKETS,
> +	MPEG_PACKETS,
> +	VSI_PACKETS,
> +	AUDIF_PACKETS
> +};
> +
> +struct common_int {
> +	u8 common_int[5];
> +	u8 change_flag;
> +};
> +
> +struct hdmi_rx_int {
> +	u8 hdmi_rx_int[7];
> +	u8 change_flag;
> +};
> +
> +enum xtal_enum {
> +	XTAL_19D2M,
> +	XTAL_24M,
> +	XTAL_25M,
> +	XTAL_26M,
> +	XTAL_27M,
> +	XTAL_38D4M,
> +	XTAL_52M,
> +	XTAL_NOT_SUPPORT,
> +	XTAL_CLK_NUM
> +};
> +
> +enum sp_ssc_dep {
> +	SSC_DEP_DISABLE = 0x0,
> +	SSC_DEP_500PPM,
> +	SSC_DEP_1000PPM,
> +	SSC_DEP_1500PPM,
> +	SSC_DEP_2000PPM,
> +	SSC_DEP_2500PPM,
> +	SSC_DEP_3000PPM,
> +	SSC_DEP_3500PPM,
> +	SSC_DEP_4000PPM,
> +	SSC_DEP_4500PPM,
> +	SSC_DEP_5000PPM,
> +	SSC_DEP_5500PPM,
> +	SSC_DEP_6000PPM
> +};
> +
> +struct anx78xx_clock_data {
> +	unsigned char xtal_clk;
> +	unsigned int xtal_clk_m10;
> +};
> +
> +bool sp_chip_detect(struct anx78xx *anx78xx);
> +
> +void sp_main_process(struct anx78xx *anx78xx);
> +
> +void sp_tx_variable_init(void);
> +
> +enum sp_tx_state sp_tx_current_state(void);
> +
> +void sp_tx_clean_state_machine(void);
> +
> +#endif
> diff --git a/drivers/gpu/drm/bridge/anx78xx/slimport_tx_reg.h b/drivers/gpu/drm/bridge/anx78xx/slimport_tx_reg.h
> new file mode 100644
> index 0000000..56b575c
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/anx78xx/slimport_tx_reg.h
> @@ -0,0 +1,807 @@
> +/*
> + * Copyright(c) 2015, Analogix Semiconductor. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#ifndef __SLIMPORT_TX_REG_DEF_H
> +#define __SLIMPORT_TX_REG_DEF_H
> +
> +#define TX_P0				0x70
> +#define TX_P1				0x7a
> +#define TX_P2				0x72
> +
> +#define RX_P0				0x7e
> +#define RX_P1				0x80
> +
> +/***************************************************************/
> +/* Register definition of device address 0x7e                  */
> +/***************************************************************/
> +
> +#define HDMI_RX_PORT_SEL_REG		0x10
> +#define DDC_EN				0x10
> +#define TMDS_EN				0x01
> +
> +#define RX_SRST				0x11
> +#define VIDEO_RST			0x10
> +#define HDCP_MAN_RST			0x04
> +#define TMDS_RST			0x02
> +#define SW_MAN_RST			0x01
> +
> +#define RX_SW_RST2			0x12
> +#define DDC_RST				0x04
> +
> +#define HDMI_RX_SYS_STATUS_REG		0x14
> +#define PWR5V				0x08
> +#define TMDS_VSYNC_DET			0x04
> +#define TMDS_CLOCK_DET			0x02
> +#define TMDS_DE_DET			0x01
> +
> +#define HDMI_STATUS			0x15
> +#define DEEP_COLOR_MODE			0x40
> +#define HDMI_AUD_LAYOUT			0x08
> +#define MUTE_STAT			0x04
> +
> +#define RX_MUTE_CTRL			0x16
> +#define MUTE_POL			0x04
> +#define AUD_MUTE			0x02
> +#define VID_MUTE			0x01
> +
> +#define HDMI_RX_SYS_CTRL1_REG		0x17
> +
> +#define RX_SYS_PWDN1			0x18
> +#define PWDN_CTRL			0x01
> +
> +#define RX_AEC_CTRL			0x20
> +#define AVC_OE				0x80
> +#define AAC_OE				0x40
> +#define AVC_EN				0x02
> +#define AAC_EN				0x01
> +
> +#define RX_AEC_EN0			0x24
> +#define AEC_EN07			0x80
> +#define AEC_EN06			0x40
> +#define AEC_EN05			0x20
> +#define AEC_EN04			0x10
> +#define AEC_EN03			0x08
> +#define AEC_EN02			0x04
> +#define AEC_EN01			0x02
> +#define AEC_EN00			0x01
> +
> +#define RX_AEC_EN1			0x25
> +#define AEC_EN15			0x80
> +#define AEC_EN14			0x40
> +#define AEC_EN13			0x20
> +#define AEC_EN12			0x10
> +#define AEC_EN11			0x08
> +#define AEC_EN10			0x04
> +#define AEC_EN09			0x02
> +#define AEC_EN08			0x01
> +
> +#define RX_AEC_EN2			0x26
> +#define AEC_EN23			0x80
> +#define AEC_EN22			0x40
> +#define AEC_EN21			0x20
> +#define AEC_EN20			0x10
> +#define AEC_EN19			0x08
> +#define AEC_EN18			0x04
> +#define AEC_EN17			0x02
> +#define AEC_EN16			0x01
> +
> +#define HDMI_RX_INT_STATUS1_REG		0x31
> +#define HDMI_DVI			0x80
> +#define CKDT_CHANGE			0x40
> +#define SCDT_CHANGE			0x20
> +#define PCLK_CHANGE			0x10
> +#define PLL_UNLOCK			0x08
> +#define CABLE_UNPLUG			0x04
> +#define SET_MUTE			0x02
> +#define SW_INTR				0x01
> +
> +#define HDMI_RX_INT_STATUS2_REG		0x32
> +#define AUTH_START			0x80
> +#define AUTH_DONE			0x40
> +#define HDCP_ERR			0x20
> +#define ECC_ERR				0x10
> +#define AUDIO_SAMPLE_CHANGE		0x01
> +
> +#define HDMI_RX_INT_STATUS3_REG		0x33
> +#define AUD_MODE_CHANGE			0x01
> +
> +#define HDMI_RX_INT_STATUS4_REG		0x34
> +#define VSYNC_DET			0x80
> +#define SYNC_POL_CHANGE			0x40
> +#define V_RES_CHANGE			0x20
> +#define H_RES_CHANGE			0x10
> +#define I_P_CHANGE			0x08
> +#define DP_CHANGE			0x04
> +#define COLOR_DEPTH_CHANGE		0x02
> +#define COLOR_MODE_CHANGE		0x01
> +
> +#define HDMI_RX_INT_STATUS5_REG		0x35
> +#define VFIFO_OVERFLOW			0x80
> +#define VFIFO_UNDERFLOW			0x40
> +#define CTS_N_ERR			0x08
> +#define NO_AVI				0x02
> +#define AUDIO_RCV			0x01
> +
> +#define HDMI_RX_INT_STATUS6_REG		0x36
> +#define CTS_RCV				0x80
> +#define NEW_UNR_PKT			0x40
> +#define NEW_MPEG			0x20
> +#define NEW_AUD				0x10
> +#define NEW_SPD				0x08
> +#define NEW_ACP				0x04
> +#define NEW_AVI				0x02
> +#define NEW_CP				0x01
> +
> +#define HDMI_RX_INT_STATUS7_REG		0x37
> +#define NO_VSI				0x80
> +#define HSYNC_DET			0x20
> +#define NEW_VS				0x10
> +#define NO_ACP				0x08
> +#define REF_CLK_CHG			0x04
> +#define CEC_RX_READY			0x02
> +#define CEC_TX_DONE			0x01
> +
> +#define HDMI_RX_PKT_RX_INDU_INT_CTRL	0x3f
> +#define NEW_VS_CTRL			0x80
> +#define NEW_UNR				0x40
> +#define NEW_MPEG			0x20
> +#define NEW_AUD				0x10
> +#define NEW_SPD				0x08
> +#define NEW_ACP				0x04
> +#define NEW_AVI				0x02
> +
> +#define HDMI_RX_INT_MASK1_REG		0x41
> +#define HDMI_RX_INT_MASK2_REG		0x42
> +#define HDMI_RX_INT_MASK3_REG		0x43
> +#define HDMI_RX_INT_MASK4_REG		0x44
> +#define HDMI_RX_INT_MASK5_REG		0x45
> +#define HDMI_RX_INT_MASK6_REG		0x46
> +#define HDMI_RX_INT_MASK7_REG		0x47
> +
> +#define HDMI_RX_TMDS_CTRL_REG1		0x50
> +#define HDMI_RX_TMDS_CTRL_REG2		0x51
> +#define HDMI_RX_TMDS_CTRL_REG4		0x53
> +#define HDMI_RX_TMDS_CTRL_REG5		0x54
> +#define HDMI_RX_TMDS_CTRL_REG6		0x55
> +#define HDMI_RX_TMDS_CTRL_REG7		0x56
> +#define TERM_PD				0x01
> +
> +#define HDMI_RX_TMDS_CTRL_REG18		0x61
> +#define PLL_RESET			0x10
> +
> +#define HDMI_RX_TMDS_CTRL_REG19		0x62
> +#define HDMI_RX_TMDS_CTRL_REG20		0x63
> +#define HDMI_RX_TMDS_CTRL_REG21		0x64
> +#define HDMI_RX_TMDS_CTRL_REG22		0x65
> +
> +#define HDMI_RX_VIDEO_STATUS_REG1	0x70
> +#define COLOR_DEPTH			0xf0
> +#define DEFAULT_PHASE			0x08
> +#define VIDEO_TYPE			0x04
> +
> +#define HDMI_RX_HTOTAL_LOW		0x71
> +#define HDMI_RX_HTOTAL_HIGH		0x72
> +#define HDMI_RX_VTOTAL_LOW		0x73
> +#define HDMI_RX_VTOTAL_HIGH		0x74
> +
> +#define HDMI_RX_HACT_LOW		0x75
> +#define HDMI_RX_HACT_HIGH		0x76
> +#define HDMI_RX_VACT_LOW		0x77
> +#define HDMI_RX_VACT_HIGH		0x78
> +
> +#define HDMI_RX_V_SYNC_WIDTH		0x79
> +#define HDMI_RX_V_BACK_PORCH		0x7a
> +#define HDMI_RX_H_FRONT_PORCH_LOW	0x7b
> +#define HDMI_RX_H_FRONT_PORCH_HIGH	0x7c
> +
> +#define HDMI_RX_H_SYNC_WIDTH_LOW	0x7d
> +#define HDMI_RX_H_SYNC_WIDTH_HIGH	0x7e
> +
> +#define RX_VID_DATA_RNG			0x83
> +#define YC_LIMT				0x10
> +#define OUTPUT_LIMIT_EN			0x08
> +#define OUTPUT_LIMIT_RANGE		0x04
> +#define R2Y_INPUT_LIMIT			0x02
> +#define XVYCC_LIMIT			0x01
> +
> +#define HDMI_RX_VID_OUTPUT_CTRL3_REG	0x86
> +
> +#define HDMI_RX_VID_PCLK_CNTR_REG	0x8b
> +
> +/* Pixel Clock High Resolution Counter Register 1 */
> +#define PCLK_HR_CNT1			0x8c
> +/* Pixel Clock High Resolution Counter Register 2 */
> +#define PCLK_HR_CNT2			0x8d
> +
> +#define HDMI_RX_AUD_IN_CH_STATUS1_REG	0xc7
> +
> +/* Audio in S/PDIF Channel Status Register 4 */
> +#define AUD_SPDIF_CHST4			0xca
> +#define FS_FREQ_44100HZ			0x00
> +#define FS_FREQ_48000HZ			0x02
> +#define FS_FREQ_32000HZ			0x03
> +#define FS_FREQ_88200HZ			0x08
> +#define FS_FREQ_96000HZ			0x0a
> +#define FS_FREQ_176400HZ		0x0c
> +#define FS_FREQ_192000HZ		0x0e
> +
> +#define RX_CEC_CTRL			0xd0
> +#define CEC_RX_EN			0x08
> +#define CEC_TX_ST			0x04
> +#define CEC_PIN_SEL			0x02
> +#define CEC_RST				0x01
> +
> +#define HDMI_RX_CEC_RX_STATUS_REG	0xd1
> +#define HDMI_RX_CEC_RX_BUSY		0x80
> +#define HDMI_RX_CEC_RX_FULL		0x20
> +#define HDMI_RX_CEC_RX_EMP		0x10
> +
> +#define HDMI_RX_CEC_TX_STATUS_REG	0xd2
> +#define HDMI_RX_CEC_TX_BUSY		0x80
> +#define HDMI_RX_CEC_TX_FAIL		0x40
> +#define HDMI_RX_CEC_TX_FULL		0x20
> +#define HDMI_RX_CEC_TX_EMP		0x10
> +
> +#define HDMI_RX_CEC_FIFO_REG		0xd3
> +
> +#define RX_CEC_SPEED			0xd4
> +#define CEC_SPEED_27M			0x40
> +
> +#define HDMI_RX_HDMI_CRITERIA_REG	0xe1
> +
> +#define HDMI_RX_HDCP_EN_CRITERIA_REG	0xe2
> +#define ENC_EN_MODE			0x20
> +
> +#define RX_CHIP_CTRL			0xe3
> +#define MAN_HDMI5V_DET			0x08
> +#define PLLLOCK_CKDT_EN			0x04
> +#define ANALOG_CKDT_EN			0x02
> +#define DIGITAL_CKDT_EN			0x01
> +
> +#define RX_PACKET_REV_STA		0xf3
> +#define AVI_RCVD			0x40
> +#define VSI_RCVD			0x20
> +
> +/***************************************************************/
> +/* Register definition of device address 0x80                  */
> +/***************************************************************/
> +
> +#define HDMI_RX_HDCP_STATUS_REG		0x3f
> +#define ADV_CIPHER			0x80
> +#define LOAD_KEY_DONE			0x40
> +#define DECRYPT_EN			0x20
> +#define AUTH_EN				0x10
> +#define BKSV_DISABLE			0x02
> +#define CLEAR_RI			0x01
> +
> +#define HDMI_RX_SPD_TYPE_REG		0x40
> +#define HDMI_RX_SPD_VER_REG		0x41
> +#define HDMI_RX_SPD_LEN_REG		0x42
> +#define HDMI_RX_SPD_CHKSUM_REG		0x43
> +#define HDMI_RX_SPD_DATA00_REG		0x44
> +
> +#define HDMI_RX_ACP_HB0_REG		0x60
> +#define HDMI_RX_ACP_HB1_REG		0x61
> +#define HDMI_RX_ACP_HB2_REG		0x62
> +#define HDMI_RX_ACP_DATA00_REG		0x63
> +
> +#define HDMI_RX_AVI_TYPE_REG		0xa0
> +#define HDMI_RX_AVI_VER_REG		0xa1
> +#define HDMI_RX_AVI_LEN_REG		0xa2
> +#define HDMI_RX_AVI_CHKSUM_REG		0xa3
> +#define HDMI_RX_AVI_DATA00_REG		0xa4
> +
> +#define HDMI_RX_AUDIO_TYPE_REG		0xc0
> +#define HDMI_RX_AUDIO_VER_REG		0xc1
> +#define HDMI_RX_AUDIO_LEN_REG		0xc2
> +#define HDMI_RX_AUDIO_CHKSUM_REG	0xc3
> +#define HDMI_RX_AUDIO_DATA00_REG	0xc4
> +
> +#define HDMI_RX_MPEG_TYPE_REG		0xe0
> +#define HDMI_RX_MPEG_VER_REG		0xe1
> +#define HDMI_RX_MPEG_LEN_REG		0xe2
> +#define HDMI_RX_MPEG_CHKSUM_REG		0xe3
> +#define HDMI_RX_MPEG_DATA00_REG		0xe4
> +#define HDMI_RX_MPEG_DATA03_REG		0xe7
> +#define HDMI_RX_MPEG_DATA05_REG		0xe9
> +
> +#define HDMI_RX_SPD_INFO_CTRL		0x5f
> +#define HDMI_RX_ACP_INFO_CTRL		0x7f
> +
> +#define HDMI_RX_GENERAL_CTRL		0x9f
> +#define CLEAR_AVMUTE			0x10
> +#define SET_AVMUTE			0x01
> +
> +#define HDMI_RX_MPEG_VS_CTRL		0xdf
> +#define HDMI_RX_MPEG_VS_INFO_CTRL	0xff
> +
> +/***************************************************************/
> +/* Register definition of device address 0x70                  */
> +/***************************************************************/
> +
> +#define SP_TX_HDCP_STATUS		0x00
> +#define SP_TX_HDCP_AUTH_PASS		0x02
> +
> +#define TX_HDCP_CTRL0			0x01
> +#define STORE_AN			0x80
> +#define RX_REPEATER			0x40
> +#define RE_AUTH				0x20
> +#define SW_AUTH_OK			0x10
> +#define HARD_AUTH_EN			0x08
> +#define ENC_EN				0x04
> +#define BKSV_SRM_PASS			0x02
> +#define KSVLIST_VLD			0x01
> +
> +#define SP_TX_HDCP_CTRL1_REG		0x02
> +#define AINFO_EN			0x04
> +#define RCV_11_EN			0x02
> +#define HDCP_11_EN			0x01
> +
> +#define SP_TX_HDCP_LINK_CHK_FRAME_NUM	0x03
> +#define SP_TX_HDCP_CTRL2_REG		0x04
> +
> +#define SP_TX_VID_BLANK_SET1		0x2c
> +#define SP_TX_VID_BLANK_SET2		0x2d
> +#define SP_TX_VID_BLANK_SET3		0x2e
> +
> +#define SP_TX_WAIT_R0_TIME		0x40
> +#define SP_TX_LINK_CHK_TIMER		0x41
> +#define SP_TX_WAIT_KSVR_TIME		0x42
> +
> +#define HDCP_KEY_STATUS			0x5e
> +
> +#define M_VID_0				0xc0
> +#define M_VID_1				0xc1
> +#define M_VID_2				0xc2
> +#define N_VID_0				0xc3
> +#define N_VID_1				0xc4
> +#define N_VID_2				0xc5
> +#define HDCP_AUTO_TIMER			0x51
> +#define HDCP_AUTO_TIMER_VAL		0x00
> +
> +#define HDCP_KEY_CMD			0x5f
> +#define DISABLE_SYNC_HDCP		0x04
> +
> +#define OTP_KEY_PROTECT1		0x60
> +#define OTP_KEY_PROTECT2		0x61
> +#define OTP_KEY_PROTECT3		0x62
> +#define OTP_PSW1			0xa2
> +#define OTP_PSW2			0x7e
> +#define OTP_PSW3			0xc6
> +
> +#define SP_TX_SYS_CTRL1_REG		0x80
> +#define CHIP_AUTH_RESET			0x80
> +#define PD_BYPASS_CHIP_AUTH		0x40
> +#define DET_STA				0x04
> +#define FORCE_DET			0x02
> +#define DET_CTRL			0x01
> +
> +#define SP_TX_SYS_CTRL2_REG		0x81
> +#define CHA_STA				0x04
> +#define FORCE_CHA			0x02
> +#define CHA_CTRL			0x01
> +
> +#define SP_TX_SYS_CTRL3_REG		0x82
> +#define HPD_STATUS			0x40
> +#define F_HPD				0x20
> +#define HPD_CTRL			0x10
> +#define STRM_VALID			0x04
> +#define F_VALID				0x02
> +#define VALID_CTRL			0x01
> +
> +#define SP_TX_SYS_CTRL4_REG		0x83
> +#define ENHANCED_MODE			0x08
> +
> +#define SP_TX_VID_CTRL			0x84
> +
> +#define SP_TX_AUD_CTRL			0x87
> +#define AUD_EN				0x01
> +
> +#define  I2C_GEN_10US_TIMER0		0x88
> +#define  I2C_GEN_10US_TIMER1		0x89
> +
> +#define SP_TX_PKT_EN_REG		0x90
> +#define AUD_IF_UP			0x80
> +#define AVI_IF_UD			0x40
> +#define MPEG_IF_UD			0x20
> +#define SPD_IF_UD			0x10
> +#define AUD_IF_EN			0x08
> +#define AVI_IF_EN			0x04
> +#define MPEG_IF_EN			0x02
> +#define SPD_IF_EN			0x01
> +
> +#define TX_HDCP_CTRL			0x92
> +#define AUTO_EN				0x80
> +#define AUTO_START			0x20
> +#define LINK_POLLING			0x02
> +
> +#define SP_TX_LINK_BW_SET_REG		0xa0
> +#define LINK_BW_SET_MASK		0x0f
> +#define LINK_6P75G			0x19
> +#define LINK_5P4G			0x14
> +#define LINK_2P7G			0x0a
> +#define LINK_1P62G			0x06
> +
> +#define SP_TX_TRAINING_PTN_SET_REG	0xa2
> +#define SCRAMBLE_DISABLE		0x20
> +
> +#define SP_TX_LT_SET_REG		0xa3
> +#define TX_SW_SET_MASK			0x1b
> +#define MAX_PRE_REACH			0x20
> +#define MAX_DRIVE_REACH			0x04
> +#define DRVIE_CURRENT_LEVEL1		0x01
> +#define PRE_EMP_LEVEL1			0x08
> +
> +#define LT_CTRL				0xa8
> +#define SP_TX_LT_EN			0x01
> +
> +#define ADDR_DP_CEP_TRAINING_CTRL0	0xa9
> +#define ADDR_DP_CEP_TRAINING_CTRL1	0xaa
> +#define ADDR_DP_CEP_TRAINING_CTRL2	0xab
> +
> +#define TX_DEBUG1			0xb0
> +#define FORCE_HPD			0x80
> +#define HPD_POLLING_DET			0x40
> +#define HPD_POLLING_EN			0x20
> +#define DEBUG_PLL_LOCK			0x10
> +#define FORCE_PLL_LOCK			0x08
> +#define POLLING_EN			0x02
> +
> +#define SP_TX_DP_POLLING_PERIOD		0xb3
> +
> +#define TX_DP_POLLING			0xb4
> +#define AUTO_POLLING_DISABLE		0x01
> +
> +#define TX_LINK_DEBUG			0xb8
> +#define M_VID_DEBUG			0x20
> +#define NEW_PRBS7			0x10
> +#define INSERT_ER			0x02
> +#define PRBS31_EN			0x01
> +
> +#define DPCD_200			0xb9
> +#define DPCD_201			0xba
> +#define DPCD_202			0xbb
> +#define DPCD_203			0xbc
> +#define DPCD_204			0xbd
> +#define DPCD_205			0xbe
> +
> +#define SP_TX_PLL_CTRL_REG		0xc7
> +#define PLL_RST				0x40
> +
> +#define SP_TX_ANALOG_PD_REG		0xc8
> +#define MACRO_PD			0x20
> +#define AUX_PD				0x10
> +#define CH0_PD				0x01
> +
> +#define TX_MISC				0xcd
> +#define EQ_TRAINING_LOOP		0x40
> +
> +#define SP_TX_DOWN_SPREADING_CTRL1	0xd0
> +#define SP_TX_SSC_DISABLE		0xc0
> +#define SP_TX_SSC_DWSPREAD		0x40
> +
> +#define SP_TX_M_CALCU_CTRL		0xd9
> +#define M_GEN_CLK_SEL			0x01
> +
> +#define TX_EXTRA_ADDR			0xce
> +#define I2C_STRETCH_DISABLE		0x80
> +#define I2C_EXTRA_ADDR			0x50
> +
> +#define SP_TX_AUX_STATUS		0xe0
> +#define AUX_BUSY			0x10
> +
> +#define AUX_DEFER_CTRL			0xe2
> +#define BUF_DATA_COUNT			0xe4
> +
> +#define AUX_CTRL			0xe5
> +#define AUX_ADDR_7_0			0xe6
> +#define AUX_ADDR_15_8			0xe7
> +#define AUX_ADDR_19_16			0xe8
> +
> +#define AUX_CTRL2			0xe9
> +#define ADDR_ONLY_BIT			0x02
> +#define AUX_OP_EN			0x01
> +
> +#define SP_TX_3D_VSC_CTRL		0xea
> +#define INFO_FRAME_VSC_EN		0x01
> +
> +#define SP_TX_VSC_DB1			0xeb
> +
> +#define BUF_DATA_0			0xf0
> +
> +/***************************************************************/
> +/* Register definition of device address 0x72                  */
> +/***************************************************************/
> +
> +#define SP_TX_VND_IDL_REG		0x00
> +#define SP_TX_VND_IDH_REG		0x01
> +#define SP_TX_DEV_IDL_REG		0x02
> +#define SP_TX_DEV_IDH_REG		0x03
> +#define SP_TX_DEV_REV_REG		0x04
> +
> +#define SP_POWERD_CTRL_REG		0x05
> +#define REGISTER_PD			0x80
> +#define HDCP_PD				0x20
> +#define AUDIO_PD			0x10
> +#define VIDEO_PD			0x08
> +#define LINK_PD				0x04
> +#define TOTAL_PD			0x02
> +
> +#define SP_TX_RST_CTRL_REG		0x06
> +#define MISC_RST			0x80
> +#define VIDCAP_RST			0x40
> +#define VIDFIF_RST			0x20
> +#define AUDFIF_RST			0x10
> +#define AUDCAP_RST			0x08
> +#define HDCP_RST			0x04
> +#define SW_RST				0x02
> +#define HW_RST				0x01
> +
> +#define RST_CTRL2			0x07
> +#define AUX_RST				0x04
> +#define SERDES_FIFO_RST			0x02
> +#define I2C_REG_RST			0x01
> +
> +#define VID_CTRL1			0x08
> +#define VIDEO_EN			0x80
> +#define VIDEO_MUTE			0x40
> +#define IN_BIT_SEL			0x04
> +#define DDR_CTRL			0x02
> +#define EDGE_CTRL			0x01
> +
> +#define SP_TX_VID_CTRL2_REG		0x09
> +#define IN_BPC_12BIT			0x30
> +#define IN_BPC_10BIT			0x20
> +#define IN_BPC_8BIT			0x10
> +
> +#define SP_TX_VID_CTRL3_REG		0x0a
> +#define HPD_OUT				0x40
> +
> +#define SP_TX_VID_CTRL5_REG		0x0c
> +#define CSC_STD_SEL			0x80
> +#define RANGE_Y2R			0x20
> +#define CSPACE_Y2R			0x10
> +
> +#define SP_TX_VID_CTRL6_REG		0x0d
> +#define VIDEO_PROCESS_EN		0x40
> +#define UP_SAMPLE			0x02
> +#define DOWN_SAMPLE			0x01
> +
> +#define SP_TX_VID_CTRL8_REG		0x0f
> +#define VID_VRES_TH			0x01
> +
> +#define SP_TX_TOTAL_LINE_STA_L		0x24
> +#define SP_TX_TOTAL_LINE_STA_H		0x25
> +#define SP_TX_ACT_LINE_STA_L		0x26
> +#define SP_TX_ACT_LINE_STA_H		0x27
> +#define SP_TX_V_F_PORCH_STA		0x28
> +#define SP_TX_V_SYNC_STA		0x29
> +#define SP_TX_V_B_PORCH_STA		0x2a
> +#define SP_TX_TOTAL_PIXEL_STA_L		0x2b
> +#define SP_TX_TOTAL_PIXEL_STA_H		0x2c
> +#define SP_TX_ACT_PIXEL_STA_L		0x2d
> +#define SP_TX_ACT_PIXEL_STA_H		0x2e
> +#define SP_TX_H_F_PORCH_STA_L		0x2f
> +#define SP_TX_H_F_PORCH_STA_H		0x30
> +#define SP_TX_H_SYNC_STA_L		0x31
> +#define SP_TX_H_SYNC_STA_H		0x32
> +#define SP_TX_H_B_PORCH_STA_L		0x33
> +#define SP_TX_H_B_PORCH_STA_H		0x34
> +
> +#define SP_TX_DP_ADDR_REG1		0x3e
> +
> +#define SP_TX_VID_BIT_CTRL0_REG		0x40
> +#define SP_TX_VID_BIT_CTRL10_REG	0x4a
> +#define SP_TX_VID_BIT_CTRL20_REG	0x54
> +
> +#define SP_TX_AVI_TYPE			0x70
> +#define SP_TX_AVI_VER			0x71
> +#define SP_TX_AVI_LEN			0x72
> +#define SP_TX_AVI_DB0			0x73
> +
> +#define BIT_CTRL_SPECIFIC		0x80
> +#define ENABLE_BIT_CTRL			0x01
> +
> +#define SP_TX_AUD_TYPE			0x83
> +#define SP_TX_AUD_VER			0x84
> +#define SP_TX_AUD_LEN			0x85
> +#define SP_TX_AUD_DB0			0x86
> +
> +#define SP_TX_SPD_TYPE			0x91
> +#define SP_TX_SPD_VER			0x92
> +#define SP_TX_SPD_LEN			0x93
> +#define SP_TX_SPD_DB0			0x94
> +
> +#define SP_TX_MPEG_TYPE			0xb0
> +#define SP_TX_MPEG_VER			0xb1
> +#define SP_TX_MPEG_LEN			0xb2
> +#define SP_TX_MPEG_DB0			0xb3
> +
> +#define SP_TX_AUD_CH_STATUS_REG1	0xd0
> +
> +#define SP_TX_AUD_CH_NUM_REG5		0xd5
> +#define CH_NUM_8			0xe0
> +#define AUD_LAYOUT			0x01
> +
> +#define GPIO_1_CONTROL			0xd6
> +#define GPIO_1_PULL_UP			0x04
> +#define GPIO_1_OEN			0x02
> +#define GPIO_1_DATA			0x01
> +
> +#define TX_ANALOG_DEBUG2		0xdd
> +#define POWERON_TIME_1P5MS		0x03
> +
> +#define TX_PLL_FILTER			0xdf
> +#define PD_RING_OSC			0x40
> +#define V33_SWITCH_ON			0x08
> +
> +#define TX_PLL_FILTER5			0xe0
> +#define SP_TX_ANALOG_CTRL0		0xe1
> +#define P5V_PROTECT			0x80
> +#define SHORT_PROTECT			0x40
> +#define P5V_PROTECT_PD			0x20
> +#define SHORT_PROTECT_PD		0x10
> +
> +#define TX_ANALOG_CTRL			0xe5
> +#define SHORT_DPDM			0x4
> +
> +#define SP_COMMON_INT_STATUS1		0xf1
> +#define PLL_LOCK_CHG			0x40
> +#define VIDEO_FORMAT_CHG		0x08
> +#define AUDIO_CLK_CHG			0x04
> +#define VIDEO_CLOCK_CHG			0x02
> +
> +#define SP_COMMON_INT_STATUS2		0xf2
> +#define HDCP_AUTH_CHG			0x02
> +#define HDCP_AUTH_DONE			0x01
> +
> +#define SP_COMMON_INT_STATUS3		0xf3
> +#define HDCP_LINK_CHECK_FAIL		0x01
> +
> +#define SP_COMMON_INT_STATUS4		0xf4
> +#define PLUG				0x01
> +#define ESYNC_ERR			0x10
> +#define HPD_LOST			0x02
> +#define HPD_CHANGE			0x04
> +#define HPD_IRQ				0x40
> +
> +#define SP_TX_INT_STATUS1		0xf7
> +#define DPCD_IRQ_REQUEST		0x80
> +#define HPD				0x40
> +#define TRAINING_FINISH			0x20
> +#define POLLING_ERR			0x10
> +#define LINK_CHANGE			0x04
> +#define SINK_CHG			0x08
> +
> +#define SP_COMMON_INT_MASK1		0xf8
> +#define SP_COMMON_INT_MASK2		0xf9
> +#define SP_COMMON_INT_MASK3		0xfa
> +#define SP_COMMON_INT_MASK4		0xfb
> +#define SP_INT_MASK			0xfe
> +#define SP_TX_INT_CTRL_REG		0xff
> +
> +/***************************************************************/
> +/* Register definition of device address 0x7a                  */
> +/***************************************************************/
> +
> +#define SP_TX_LT_CTRL_REG0		0x30
> +#define SP_TX_LT_CTRL_REG1		0x31
> +#define SP_TX_LT_CTRL_REG2		0x34
> +#define SP_TX_LT_CTRL_REG3		0x35
> +#define SP_TX_LT_CTRL_REG4		0x36
> +#define SP_TX_LT_CTRL_REG5		0x37
> +#define SP_TX_LT_CTRL_REG6		0x38
> +#define SP_TX_LT_CTRL_REG7		0x39
> +#define SP_TX_LT_CTRL_REG8		0x3a
> +#define SP_TX_LT_CTRL_REG9		0x3b
> +#define SP_TX_LT_CTRL_REG10		0x40
> +#define SP_TX_LT_CTRL_REG11		0x41
> +#define SP_TX_LT_CTRL_REG12		0x44
> +#define SP_TX_LT_CTRL_REG13		0x45
> +#define SP_TX_LT_CTRL_REG14		0x46
> +#define SP_TX_LT_CTRL_REG15		0x47
> +#define SP_TX_LT_CTRL_REG16		0x48
> +#define SP_TX_LT_CTRL_REG17		0x49
> +#define SP_TX_LT_CTRL_REG18		0x4a
> +#define SP_TX_LT_CTRL_REG19		0x4b
> +#define SP_TX_LT_TEST_PATTERN_REG0	0x80
> +#define SP_TX_LT_TEST_PATTERN_REG1	0x81
> +#define SP_TX_LT_TEST_PATTERN_REG2	0x82
> +#define SP_TX_LT_TEST_PATTERN_REG3	0x83
> +#define SP_TX_LT_TEST_PATTERN_REG4	0x84
> +#define SP_TX_LT_TEST_PATTERN_REG5	0x85
> +#define SP_TX_LT_TEST_PATTERN_REG6	0x86
> +#define SP_TX_LT_TEST_PATTERN_REG7	0x87
> +#define SP_TX_LT_TEST_PATTERN_REG8	0x88
> +#define SP_TX_LT_TEST_PATTERN_REG9	0x89
> +
> +#define SP_TX_AUD_INTERFACE_CTRL0	0x5f
> +#define AUD_INTERFACE_DISABLE		0x80
> +
> +#define SP_TX_AUD_INTERFACE_CTRL2	0x60
> +#define M_AUD_ADJUST_ST			0x04
> +
> +#define SP_TX_AUD_INTERFACE_CTRL3	0x62
> +#define SP_TX_AUD_INTERFACE_CTRL4	0x67
> +#define SP_TX_AUD_INTERFACE_CTRL5	0x68
> +#define SP_TX_AUD_INTERFACE_CTRL6	0x69
> +
> +#define OCM_REG3			0x96
> +#define OCM_RST				0x80
> +
> +#define FW_VER_REG			0xb7
> +
> +/***************************************************************/
> +/* Definition of DPCD                                          */
> +/***************************************************************/
> +
> +#define DOWN_R_TERM_DET _BIT6
> +#define SRAM_EEPROM_LOAD_DONE _BIT5
> +#define SRAM_CRC_CHK_DONE _BIT4
> +#define SRAM_CRC_CHK_PASS _BIT3
> +#define DOWN_STRM_ENC _BIT2
> +#define DOWN_STRM_AUTH _BIT1
> +#define DOWN_STRM_HPD _BIT0
> +
> +#define DPCD_DPCD_REV			0x00
> +#define DPCD_MAX_LINK_RATE		0x01
> +
> +#define DPCD_MAX_LANE_COUNT		0x02
> +#define ENHANCED_FRAME_CAP		0x80
> +
> +#define DPCD_MAX_DOWNSPREAD		0x03
> +#define DPCD_NORP			0x04
> +#define DPCD_DSPORT_PRESENT		0x05
> +
> +#define DPCD_LINK_BW_SET		0x00
> +#define DPCD_LANE_COUNT_SET		0x01
> +#define ENHANCED_FRAME_EN		0x80
> +
> +#define DPCD_TRAINING_PATTERN_SET	0x02
> +#define DPCD_TRAINNIG_LANE0_SET		0x03
> +
> +#define DPCD_DOWNSPREAD_CTRL		0x07
> +#define SPREAD_AMPLITUDE		0x10
> +
> +#define DPCD_SINK_COUNT			0x00
> +#define DPCD_SERVICE_IRQ_VECTOR		0x01
> +#define TEST_IRQ			0x02
> +#define CP_IRQ				0x04
> +#define SINK_SPECIFIC_IRQ		0x40
> +
> +#define DPCD_LANE0_1_STATUS		0x02
> +
> +#define DPCD_LANE_ALIGN_UD		0x04
> +#define DPCD_SINK_STATUS		0x05
> +
> +#define DPCD_TEST_RESPONSE		0x60
> +#define TEST_ACK			0x01
> +#define DPCD_TEST_EDID_CHECKSUM_WRITE	0x04
> +
> +#define DPCD_TEST_EDID_CHECKSUM		0x61
> +
> +#define DPCD_SPECIFIC_INTERRUPT1	0x10
> +#define DPCD_USER_COMM1			0x22
> +
> +#define DPCD_SPECIFIC_INTERRUPT2	0x11
> +
> +#define DPCD_TEST_REQUEST		0x18
> +#define DPCD_TEST_LINK_RATE		0x19
> +
> +#define DPCD_TEST_LANE_COUNT		0x20
> +
> +#define DPCD_PHY_TEST_PATTERN		0x48
> +
> +#endif
> +
> -- 
> 2.1.0
> 
