From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCHv3 3/3] drm: bridge: anx78xx: Add anx78xx driver support
 by analogix.
Date: Tue, 22 Sep 2015 22:43:31 +0300
Message-ID: <20150922194331.GG4953@mwanda>
References: <1441902952-14516-1-git-send-email-enric.balletbo@collabora.com>
 <1441902952-14516-4-git-send-email-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1441902952-14516-4-git-send-email-enric.balletbo@collabora.com>
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, djkurtz@chromium.org, drinkcat@chromium.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, airlied@linux.ie, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, sjoerd.simons@collabora.co.uk, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, galak@codeaurora.org, nathan.chung@mediatek.com, mark.rutland@arm.com, javier@dowhile0.org, span@analogixsemi.com
List-Id: devicetree@vger.kernel.org

On Thu, Sep 10, 2015 at 06:35:52PM +0200, Enric Balletbo i Serra wrote:
> diff --git a/drivers/gpu/drm/bridge/anx78xx/anx78xx.h b/drivers/gpu/drm/bridge/anx78xx/anx78xx.h
> new file mode 100644
> index 0000000..4f6dd1d
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/anx78xx/anx78xx.h
> @@ -0,0 +1,44 @@
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
> +#define AUX_ERR  1
> +#define AUX_OK   0

Get rid of these.  They aren't used much and we could easily use normal
error codes instead.

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
> index 0000000..b92d2bc
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/anx78xx/anx78xx_main.c
> @@ -0,0 +1,241 @@
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
> +	struct device *dev = &anx78xx->client->dev;
> +	struct anx78xx_platform_data *pdata = anx78xx->pdata;
> +
> +	gpiod_set_value_cansleep(pdata->gpiod_reset, 0);
> +	usleep_range(1000, 2000);
> +
> +	gpiod_set_value_cansleep(pdata->gpiod_pd, 0);
> +	usleep_range(1000, 2000);
> +
> +	gpiod_set_value_cansleep(pdata->gpiod_reset, 1);
> +
> +	dev_dbg(dev, "power on\n");

Remove these debug printks.  Use ftrace instead.

> +}
> +
> +void anx78xx_poweroff(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	struct anx78xx_platform_data *pdata = anx78xx->pdata;
> +
> +	gpiod_set_value_cansleep(pdata->gpiod_reset, 0);
> +	usleep_range(1000, 2000);
> +
> +	gpiod_set_value_cansleep(pdata->gpiod_pd, 1);
> +	usleep_range(1000, 2000);
> +
> +	dev_dbg(dev, "power down\n");

Delete.

> +}
> +
> +static int anx78xx_init_gpio(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	struct anx78xx_platform_data *pdata = anx78xx->pdata;
> +	int ret;
> +
> +	/* gpio for chip power down */
> +	pdata->gpiod_pd = devm_gpiod_get(dev, "pd", GPIOD_OUT_HIGH);
> +	if (IS_ERR(pdata->gpiod_pd)) {
> +		dev_err(dev, "unable to claim pd gpio\n");
> +		ret = PTR_ERR(pdata->gpiod_pd);
> +		return ret;


The ret variable isn't necessary in this function.

> +	}
> +
> +	/* gpio for chip reset */
> +	pdata->gpiod_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(pdata->gpiod_reset)) {
> +		dev_err(dev, "unable to claim reset gpio\n");
> +		ret = PTR_ERR(pdata->gpiod_reset);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int anx78xx_system_init(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	int ret;
> +
> +	ret = sp_chip_detect(anx78xx);

Make sp_chip_detect() use normal error codes.

> +	if (ret == 0) {
> +		anx78xx_poweroff(anx78xx);
> +		dev_err(dev, "failed to detect anx78xx\n");
> +		return -ENODEV;
> +	}
> +
> +	sp_tx_variable_init();
> +	return 0;
> +}
> +
> +static void anx78xx_work_func(struct work_struct *work)
> +{
> +	struct anx78xx *anx78xx = container_of(work, struct anx78xx,
> +					       work.work);
> +	int workqueu_timer = 0;
> +
> +	if (sp_tx_cur_states() >= STATE_PLAY_BACK)
> +		workqueu_timer = 500;
> +	else
> +		workqueu_timer = 100;
> +	mutex_lock(&anx78xx->lock);
> +	sp_main_process(anx78xx);
> +	mutex_unlock(&anx78xx->lock);
> +	queue_delayed_work(anx78xx->workqueue, &anx78xx->work,
> +			   msecs_to_jiffies(workqueu_timer));
> +}
> +
> +static int anx78xx_i2c_probe(struct i2c_client *client,
> +			     const struct i2c_device_id *id)
> +{
> +	struct anx78xx *anx78xx;
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +		I2C_FUNC_SMBUS_I2C_BLOCK)) {

Use checkpatch.pl --strict.

	if (!i2c_check_functionality(client->adapter,
				     I2C_FUNC_SMBUS_I2C_BLOCK)) {

> +		dev_err(&client->dev, "i2c bus does not support the device\n");
> +		return -ENODEV;
> +	}
> +
> +	anx78xx = devm_kzalloc(&client->dev,
> +			sizeof(struct anx78xx),
> +			GFP_KERNEL);

Better style is:

	anx78xx = devm_kzalloc(&client->dev, sizeof(*anx78xx), GFP_KERNEL);

> +	if (!anx78xx)
> +		return -ENOMEM;
> +
> +	anx78xx->pdata = devm_kzalloc(&client->dev,
> +			sizeof(struct anx78xx_platform_data),
> +			GFP_KERNEL);
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
> +	if (anx78xx->workqueue == NULL) {
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
> index 0000000..1be7f69
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/anx78xx/slimport_tx_drv.c
> @@ -0,0 +1,3198 @@
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
> +#define XTAL_CLK_M10	pxtal_data[XTAL_27M].xtal_clk_m10
> +#define XTAL_CLK	pxtal_data[XTAL_27M].xtal_clk
> +
> +struct slimport {
> +	int	block_en;	/* HDCP control enable/ disable from AP */
> +
> +	u8	tx_test_bw;
> +	bool	tx_test_lt;
> +	bool	tx_test_edid;
> +
> +	u8	changed_bandwidth;
> +
> +	u8	hdmi_dvi_status;
> +	u8	need_clean_status;
> +
> +	u8	ds_vid_stb_cntr;
> +	u8	hdcp_fail_count;
> +
> +	u8	edid_break;
> +	u8	edid_checksum;
> +	u8	edid_blocks[256];
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
> +};
> +
> +static void sp_hdmi_rx_new_vsi_int(struct anx78xx *anx78xx);
> +static u8 sp_hdcp_cap_check(struct anx78xx *anx78xx);
> +static void sp_tx_show_information(struct anx78xx *anx78xx);
> +static void sp_print_sys_state(struct anx78xx *anx78xx, u8 ss);
> +
> +static int sp_read_reg(struct anx78xx *anx78xx, u8 slave_addr,
> +		u8 offset, u8 *buf)
> +{
> +	u8 ret;

"ret" should be an int.  It causes a signedness bug later.

> +	struct i2c_client *client = anx78xx->client;
> +
> +	client->addr = (slave_addr >> 1);
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
> +
> +static int sp_write_reg(struct anx78xx *anx78xx, u8 slave_addr,
> +		u8 offset, u8 value)
> +{
> +	int ret;
> +	struct i2c_client *client = anx78xx->client;
> +
> +	client->addr = (slave_addr >> 1);
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
> +		u8 dev, u8 offset)
> +{
> +	u8 ret;
> +
> +	sp_read_reg(anx78xx, dev, offset, &ret);
> +	return ret;

Ugh...  None of the callers check sp_read_reg() for failure...

> +}
> +
> +static void sp_reg_bit_ctl(struct anx78xx *anx78xx, u8 addr, u8 offset,
> +			u8 data, bool enable)
> +{
> +	u8 c;
> +
> +	sp_read_reg(anx78xx, addr, offset, &c);
> +	if (enable) {
> +		if ((c & data) != data) {
> +			c |= data;
> +			sp_write_reg(anx78xx, addr, offset, c);
> +		}
> +	} else
> +		if ((c & data) == data) {
> +			c &= ~data;
> +			sp_write_reg(anx78xx, addr, offset, c);
> +		}

Put curly braces around the else statement for two style reasons.
1) If one side of an if else statement has curly braces then both get
   them.
2) Multi-line indents get curly braces for readability.

> +}
> +
> +static inline void sp_write_reg_or(struct anx78xx *anx78xx, u8 address,
> +			u8 offset, u8 mask)
> +{
> +	sp_write_reg(anx78xx, address, offset,
> +		sp_i2c_read_byte(anx78xx, address, offset) | mask);
> +}
> +
> +static inline void sp_write_reg_and(struct anx78xx *anx78xx, u8 address,
> +			u8 offset, u8 mask)
> +{
> +	sp_write_reg(anx78xx, address, offset,
> +		sp_i2c_read_byte(anx78xx, address, offset) & mask);
> +}
> +
> +static inline void sp_write_reg_and_or(struct anx78xx *anx78xx, u8 address,
> +			u8 offset, u8 and_mask, u8 or_mask)
> +{
> +	sp_write_reg(anx78xx, address, offset,
> +	  (sp_i2c_read_byte(anx78xx, address, offset) & and_mask) | or_mask);
> +}
> +
> +static inline void sp_write_reg_or_and(struct anx78xx *anx78xx, u8 address,
> +			 u8 offset, u8 or_mask, u8 and_mask)
> +{
> +	sp_write_reg(anx78xx, address, offset,
> +	  (sp_i2c_read_byte(anx78xx, address, offset) | or_mask) & and_mask);
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
> +	return sp_i2c_read_byte(anx78xx, TX_P0, SP_TX_LINK_BW_SET_REG);
> +}
> +
> +static inline bool sp_tx_get_pll_lock_status(struct anx78xx *anx78xx)
> +{
> +	u8 temp;
> +
> +	temp = sp_i2c_read_byte(anx78xx, TX_P0, TX_DEBUG1);
> +
> +	return (temp & DEBUG_PLL_LOCK) != 0 ? true : false;

Adding != 0 is just a double negative.  It adds verbiage and extra words
but it doesn't make the code more clear.

> +}
> +
> +static inline void gen_m_clk_with_downspeading(struct anx78xx *anx78xx)
> +{
> +	sp_write_reg_or(anx78xx, TX_P0, SP_TX_M_CALCU_CTRL, M_GEN_CLK_SEL);
> +}
> +
> +static inline void gen_m_clk_without_downspeading(struct anx78xx *anx78xx)
> +{
> +	sp_write_reg_and(anx78xx, TX_P0, SP_TX_M_CALCU_CTRL, (~M_GEN_CLK_SEL));
> +}
> +
> +static inline void hdmi_rx_set_hpd(struct anx78xx *anx78xx, bool enable)
> +{
> +	if (enable)
> +		sp_write_reg_or(anx78xx, TX_P2, SP_TX_VID_CTRL3_REG, HPD_OUT);
> +	else
> +		sp_write_reg_and(anx78xx, TX_P2, SP_TX_VID_CTRL3_REG, ~HPD_OUT);
> +}
> +
> +static inline void hdmi_rx_set_termination(struct anx78xx *anx78xx,
> +				bool enable)
> +{
> +	if (enable)
> +		sp_write_reg_and(anx78xx, RX_P0, HDMI_RX_TMDS_CTRL_REG7,
> +				~TERM_PD);
> +	else
> +		sp_write_reg_or(anx78xx, RX_P0, HDMI_RX_TMDS_CTRL_REG7,
> +				TERM_PD);
> +}
> +
> +static inline void sp_tx_clean_hdcp_status(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +
> +	sp_write_reg(anx78xx, TX_P0, TX_HDCP_CTRL0, 0x03);
> +	sp_write_reg_or(anx78xx, TX_P0, TX_HDCP_CTRL0, RE_AUTH);
> +	usleep_range(2000, 4000);
> +	dev_dbg(dev, "sp_tx_clean_hdcp_status\n");
> +}
> +
> +static inline void sp_tx_link_phy_initialization(struct anx78xx *anx78xx)
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
> +	sp_write_reg(anx78xx, TX_P1, SP_TX_LT_CTRL_REG9, 0x7F);
> +	sp_write_reg(anx78xx, TX_P1, SP_TX_LT_CTRL_REG19, 0x7e);
> +}
> +
> +static inline void sp_tx_set_sys_state(struct anx78xx *anx78xx, u8 ss)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +
> +	dev_dbg(dev, "set: clean_status: %x,\n ", (u16)sp.need_clean_status);
> +
> +	if ((sp.tx_system_state >= STATE_LINK_TRAINING)
> +	   && (ss < STATE_LINK_TRAINING))
> +		sp_write_reg_or(anx78xx, TX_P0, SP_TX_ANALOG_PD_REG, CH0_PD);
> +
> +	sp.tx_system_state_bak = sp.tx_system_state;
> +	sp.tx_system_state = ss;
> +	sp.need_clean_status = 1;
> +	sp_print_sys_state(anx78xx, sp.tx_system_state);
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
> +			u8 addrm, u8 addrl)
> +{
> +	u8 temp;
> +
> +	if (sp_i2c_read_byte(anx78xx, TX_P0, AUX_ADDR_7_0) != addrl)
> +		sp_write_reg(anx78xx, TX_P0, AUX_ADDR_7_0, addrl);
> +
> +	if (sp_i2c_read_byte(anx78xx, TX_P0, AUX_ADDR_15_8) != addrm)
> +		sp_write_reg(anx78xx, TX_P0, AUX_ADDR_15_8, addrm);
> +
> +	sp_read_reg(anx78xx, TX_P0, AUX_ADDR_19_16, &temp);
> +
> +	if ((temp & 0x0F) != (addrh & 0x0F))
> +		sp_write_reg(anx78xx, TX_P0, AUX_ADDR_19_16,
> +			(temp  & 0xF0) | addrh);
> +}
> +
> +static inline void goto_next_system_state(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +
> +	dev_dbg(dev, "next: clean_status: %x,\n ", (u16)sp.need_clean_status);
> +
> +	sp.tx_system_state_bak = sp.tx_system_state;
> +	sp.tx_system_state++;
> +	sp_print_sys_state(anx78xx, sp.tx_system_state);
> +}
> +
> +static inline void redo_cur_system_state(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +
> +	dev_dbg(dev, "redo: clean_status: %x,\n ", (u16)sp.need_clean_status);
> +
> +	sp.need_clean_status = 1;
> +	sp.tx_system_state_bak = sp.tx_system_state;
> +	sp_print_sys_state(anx78xx, sp.tx_system_state);
> +}
> +
> +static inline void system_state_change_with_case(struct anx78xx *anx78xx,
> +				u8 status)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +
> +	if (sp.tx_system_state >= status) {

Flip this condition around and pull the code in one indent level.

	if (status < sp.tx_system_state)
		return;

> +		dev_dbg(dev, "change_case: clean_status: %xm,\n ",

No extra space after the newline.

> +			(u16)sp.need_clean_status);
> +
> +		if ((sp.tx_system_state >= STATE_LINK_TRAINING)
> +				&& (status < STATE_LINK_TRAINING))

This should be aligned like this:

		if (sp.tx_system_state >= STATE_LINK_TRAINING &&
		    status < STATE_LINK_TRAINING)

1) Removed extra parens.
2) Move the && to the first line
3) Changed the alignment

> +			sp_write_reg_or(anx78xx, TX_P0, SP_TX_ANALOG_PD_REG,
> +					CH0_PD);
> +
> +		sp.need_clean_status = 1;
> +		sp.tx_system_state_bak = sp.tx_system_state;
> +		sp.tx_system_state = status;
> +		sp_print_sys_state(anx78xx, sp.tx_system_state);
> +	}
> +}
> +
> +static void sp_wait_aux_op_finish(struct anx78xx *anx78xx, u8 *err_flag)

Return an error.  Don't use an err_flag pointer.

> +{
> +	u8 cnt;
> +	u8 c;
> +	struct device *dev = &anx78xx->client->dev;
> +
> +	*err_flag = 0;
> +	cnt = 150;
> +	while (sp_i2c_read_byte(anx78xx, TX_P0, AUX_CTRL2) & AUX_OP_EN) {
> +		usleep_range(2000, 4000);
> +		if ((cnt--) == 0) {

It's harmless but this will loop 151 times and not 150 as intended.
Putting parenthesis around a post-op doesn't change it to a pre-op.

> +			dev_err(dev, "aux operate failed!\n");
> +			*err_flag = 1;
> +			break;
> +		}
> +	}
> +
> +	sp_read_reg(anx78xx, TX_P0, SP_TX_AUX_STATUS, &c);
> +	if (c & 0x0F) {
> +		dev_err(dev, "wait aux operation status %.2x\n", (u16)c);
> +		*err_flag = 1;
> +	}
> +}
> +
> +static void sp_print_sys_state(struct anx78xx *anx78xx, u8 ss)
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
> +		dev_err(dev, "system state is error1\n");
> +		break;
> +	}
> +}
> +
> +static void sp_tx_rst_aux(struct anx78xx *anx78xx)
> +{
> +	sp_write_reg_or(anx78xx, TX_P2, RST_CTRL2, AUX_RST);
> +	sp_write_reg_and(anx78xx, TX_P2, RST_CTRL2, ~AUX_RST);
> +}
> +
> +static u8 sp_tx_aux_dpcdread_bytes(struct anx78xx *anx78xx, u8 addrh,
> +		u8 addrm, u8 addrl, u8 ccount, u8 *pbuf)
> +{
> +	u8 c, c1, i;
> +	u8 bok;
> +	struct device *dev = &anx78xx->client->dev;
> +
> +	sp_write_reg(anx78xx, TX_P0, BUF_DATA_COUNT, 0x80);
> +	c = ((ccount - 1) << 4) | 0x09;
> +	sp_write_reg(anx78xx, TX_P0, AUX_CTRL, c);
> +	write_dpcd_addr(anx78xx, addrh, addrm, addrl);
> +	sp_write_reg_or(anx78xx, TX_P0, AUX_CTRL2, AUX_OP_EN);
> +	usleep_range(2000, 4000);
> +
> +	sp_wait_aux_op_finish(anx78xx, &bok);
> +	if (bok == AUX_ERR) {
> +		dev_err(dev, "aux read failed\n");
> +		sp_read_reg(anx78xx, TX_P2, SP_TX_INT_STATUS1, &c);
> +		sp_read_reg(anx78xx, TX_P0, TX_DEBUG1, &c1);
> +		if (c1 & POLLING_EN) {
> +			if (c & POLLING_ERR)
> +				sp_tx_rst_aux(anx78xx);
> +		} else
> +			sp_tx_rst_aux(anx78xx);
> +		return AUX_ERR;
> +	}
> +
> +	for (i = 0; i < ccount; i++) {
> +		sp_read_reg(anx78xx, TX_P0, BUF_DATA_0 + i, &c);
> +		*(pbuf + i) = c;
> +		if (i >= MAX_BUF_CNT)
> +			break;
> +	}
> +	return AUX_OK;
> +}
> +
> +static u8 sp_tx_aux_dpcdwrite_bytes(struct anx78xx *anx78xx, u8 addrh,
> +		u8 addrm, u8 addrl, u8 ccount, u8 *pbuf)
> +{
> +	u8 c, i, ret;
> +
> +	c =  ((ccount - 1) << 4) | 0x08;
> +	sp_write_reg(anx78xx, TX_P0, AUX_CTRL, c);
> +	write_dpcd_addr(anx78xx, addrh, addrm, addrl);
> +	for (i = 0; i < ccount; i++) {
> +		c = *pbuf;
> +		pbuf++;
> +		sp_write_reg(anx78xx, TX_P0, BUF_DATA_0 + i, c);
> +
> +		if (i >= 15)
> +			break;


So far as I can see after a brief look at it, ccount is always 1 so we
will never hit the i >= 15 condition.  If we did though, then shouldn't
we handle it at the start of the function?  I never know how to handle
these imaginary situations in the right way...

> +	}
> +	sp_write_reg_or(anx78xx, TX_P0, AUX_CTRL2, AUX_OP_EN);
> +	sp_wait_aux_op_finish(anx78xx, &ret);
> +	return ret;
> +}
> +
> +static u8 sp_tx_aux_dpcdwrite_byte(struct anx78xx *anx78xx, u8 addrh,
> +		u8 addrm, u8 addrl, u8 data1)
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
> +		enum sp_tx_power_block sp_tx_pd_block, u8 power)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +
> +	if (power == SP_POWER_ON)
> +		sp_write_reg_and(anx78xx, TX_P2, SP_POWERD_CTRL_REG,
> +			~sp_tx_pd_block);
> +	else
> +		sp_write_reg_or(anx78xx, TX_P2, SP_POWERD_CTRL_REG,
> +			sp_tx_pd_block);
> +
> +	 dev_dbg(dev, "sp_tx_power_on: %.2x\n", (u16)sp_tx_pd_block);
> +}
> +
> +static void sp_vbus_power_off(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	int i;
> +
> +	for (i = 0; i < 5; i++) {
> +		sp_write_reg_and(anx78xx, TX_P2, TX_PLL_FILTER5,
> +				(~P5V_PROTECT_PD & ~SHORT_PROTECT_PD));
> +		sp_write_reg_or(anx78xx, TX_P2, TX_PLL_FILTER, V33_SWITCH_ON);
> +		if (!(sp_i2c_read_byte(anx78xx, TX_P2, TX_PLL_FILTER5)
> +		    & 0xc0)) {
> +			dev_dbg(dev, "3.3V output enabled\n");
> +			break;
> +		}
> +
> +		dev_dbg(dev, "VBUS power can not be supplied\n");

Why print this five times?

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
> +u8 sp_tx_cur_states(void)
> +{
> +	return sp.tx_system_state;
> +}
> +
> +void sp_tx_variable_init(void)
> +{
> +	u16 i;
> +
> +	sp.block_en = 1;
> +
> +	sp.tx_system_state = STATE_WAITTING_CABLE_PLUG;
> +	sp.tx_system_state_bak = STATE_WAITTING_CABLE_PLUG;
> +
> +	sp.edid_break = 0;
> +	sp.read_edid_flag = 0;
> +	sp.edid_checksum = 0;
> +	for (i = 0; i < 256; i++)
> +		sp.edid_blocks[i] = 0;
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
> +
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
> +	struct device *dev = &anx78xx->client->dev;
> +
> +	sp_write_reg(anx78xx, RX_P0, RX_MUTE_CTRL, AUD_MUTE | VID_MUTE);
> +	sp_write_reg_or(anx78xx, RX_P0, RX_CHIP_CTRL,
> +		MAN_HDMI5V_DET | PLLLOCK_CKDT_EN | DIGITAL_CKDT_EN);
> +
> +	sp_write_reg_or(anx78xx, RX_P0, RX_SRST, HDCP_MAN_RST | SW_MAN_RST |
> +		TMDS_RST | VIDEO_RST);
> +	sp_write_reg_and(anx78xx, RX_P0, RX_SRST, ~HDCP_MAN_RST &
> +		~SW_MAN_RST & ~TMDS_RST & ~VIDEO_RST);
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
> +	dev_dbg(dev, "HDMI Rx is initialized...\n");

Delete.  Use ftrace.

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
> +	dev_dbg(dev, "define XTAL_CLK:  %x\n ", (u16)XTAL_27M);
> +	sp_write_reg_and_or(anx78xx, TX_P2,
> +			TX_ANALOG_DEBUG2, (~0x3c), 0x3c & (XTAL_27M << 2));
> +	sp_write_reg(anx78xx, TX_P0, 0xEC, (u8)(((u16)XTAL_CLK_M10)));

Remove the superflous casts to u16.

> +	sp_write_reg(anx78xx, TX_P0, 0xED,
> +		(u8)(((u16)XTAL_CLK_M10 & 0xFF00) >> 2) | XTAL_CLK);
> +
> +	sp_write_reg(anx78xx, TX_P0,
> +			I2C_GEN_10US_TIMER0, (u8)(((u16)XTAL_CLK_M10)));
> +	sp_write_reg(anx78xx, TX_P0, I2C_GEN_10US_TIMER1,
> +			(u8)(((u16)XTAL_CLK_M10 & 0xFF00) >> 8));
> +	sp_write_reg(anx78xx, TX_P0, 0xBF, (u8)(((u16)XTAL_CLK - 1)));
> +
> +	sp_write_reg_and_or(anx78xx, RX_P0, 0x49, 0x07,
> +			(u8)(((((u16)XTAL_CLK) >> 1) - 2) << 3));
> +
> +}
> +
> +void sp_tx_initialization(struct anx78xx *anx78xx)
> +{
> +	sp_write_reg(anx78xx, TX_P0, AUX_CTRL2, 0x30);
> +	sp_write_reg_or(anx78xx, TX_P0, AUX_CTRL2, 0x08);
> +
> +	sp_write_reg_and(anx78xx, TX_P0, TX_HDCP_CTRL,
> +			(u8)(~AUTO_EN) & (~AUTO_START));
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
> +	sp_write_reg(anx78xx, TX_P0, AUX_DEFER_CTRL, 0x8C);
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
> +	sp_write_reg(anx78xx, TX_P2, SP_TX_INT_CTRL_REG, 0X01);
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
> +	for (i = 0; i < sizeof(chipid_list) / sizeof(u16); i++) {

	for (i = 0; i < ARRAY_SIZE(chipid_list); i++) {

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
> +static const u8 ANX_OUI[3] = {0x00, 0x22, 0xB9};
> +
> +static u8 is_anx_dongle(struct anx78xx *anx78xx)
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
> +					DPCD_MAX_LINK_RATE, 1, bw);
> +}
> +
> +static u8 sp_tx_get_cable_type(struct anx78xx *anx78xx,
> +			enum cable_type_status det_cable_type_state)
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
> +					&ds_port_preset);
> +
> +	dev_dbg(dev, "DPCD 0x005: %x\n", (int)ds_port_preset);
> +
> +	switch (det_cable_type_state) {
> +	case CHECK_AUXCH:
> +		if (AUX_OK == aux_status) {
> +			sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x00, 0, 0x0c,
> +					data_buf);
> +			det_cable_type_state = GETTED_CABLE_TYPE;
> +		} else {
> +			dev_err(dev, " AUX access error\n");
> +			break;
> +		}
> +	case GETTED_CABLE_TYPE:
> +		switch ((ds_port_preset  & (BIT(1) | BIT(2))) >> 1) {

Extra space char.

		switch ((ds_port_preset & (BIT(1) | BIT(2))) >> 1) {

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
> +{
> +	u8 c;
> +
> +	if (AUX_OK != sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x02,
> +				DPCD_SINK_COUNT, 1, &c))
> +		return 0;
> +
> +	if (c & 0x1f) {
> +		sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x00, 0x04, 1, &c);
> +		if (c & 0x20) {
> +			sp_tx_aux_dpcdread_bytes(anx78xx, 0x00, 0x06, 0x00, 1,
> +						&c);
> +			/*
> +			 * Bit 5 = SET_DN_DEVICE_DP_PWR_5V
> +			 * Bit 6 = SET_DN_DEVICE_DP_PWR_12V
> +			 * Bit 7 = SET_DN_DEVICE_DP_PWR_18V
> +			 */
> +			c = c & 0x1F;
> +			sp_tx_aux_dpcdwrite_byte(anx78xx, 0x00, 0x06, 0x00,
> +						c | 0x20);
> +		}
> +		return 1;
> +	} else
> +		return 0;
> +}
> +
> +static u8 sp_tx_get_downstream_connection(struct anx78xx *anx78xx)
> +{
> +	return sp_tx_get_dp_connection(anx78xx);
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
> +				sp.tx_sc_state = SC_NOT_CABLE;
> +				dev_dbg(dev, "Can not get cable type!\n");
> +			}
> +			break;
> +		}
> +
> +		sp.tx_sc_state = SC_SINK_CONNECTED;
> +	case SC_SINK_CONNECTED:
> +		if (sp_tx_get_downstream_connection(anx78xx))
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
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	u8 c;
> +
> +	sp_read_reg(anx78xx, TX_P2, VID_CTRL1, &c);
> +	if (enable) {
> +		c = (c & 0xf7) | VIDEO_EN;
> +		sp_write_reg(anx78xx, TX_P2, VID_CTRL1, c);
> +		dev_dbg(dev, "Slimport Video is enabled!\n");
> +
> +	} else {
> +		c &= ~VIDEO_EN;
> +		sp_write_reg(anx78xx, TX_P2, VID_CTRL1, c);
> +		dev_dbg(dev, "Slimport Video is disabled!\n");
> +	}
> +}
> +
> +static u8 sp_get_edid_detail(u8 *data_buf)
> +{
> +	u16 pixclock_edid;
> +
> +	pixclock_edid = ((((u16)data_buf[1] << 8))
> +			| ((u16)data_buf[0] & 0xFF));
> +	if (pixclock_edid <= 5300)
> +		return LINK_1P62G;
> +	else if ((pixclock_edid > 5300) && (pixclock_edid <= 8900))
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
> +	u8 desc_offset = 0;
> +	u8 i, bandwidth, temp;
> +
> +	bandwidth = LINK_1P62G;
> +	temp = LINK_1P62G;
> +	i = 0;
> +	while (i < 4 && sp.edid_blocks[0x36 + desc_offset] != 0) {
> +		temp = sp_get_edid_detail(sp.edid_blocks + 0x36 + desc_offset);
> +		dev_dbg(dev, "bandwidth via EDID : %x\n", (u16)temp);
> +		if (bandwidth < temp)
> +			bandwidth = temp;
> +		if (bandwidth > LINK_5P4G)
> +			break;
> +		desc_offset += 0x12;
> +		++i;
> +	}
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
> +	u8 c;
> +
> +	sp_tx_aux_wr(anx78xx, 0x7e);
> +	sp_tx_aux_rd(anx78xx, 0x01);
> +	sp_read_reg(anx78xx, TX_P0, BUF_DATA_0, &c);
> +	dev_dbg(dev, "EDID Block = %d\n", (int)(c + 1));
> +
> +	if (c > 3)
> +		c = 1;
> +	return c;
> +}
> +
> +static void sp_edid_read(struct anx78xx *anx78xx, u8 offset,
> +			u8 *pblock_buf)
> +{
> +	u8 data_cnt, cnt;
> +	u8 c;
> +
> +	sp_tx_aux_wr(anx78xx, offset);
> +	sp_tx_aux_rd(anx78xx, 0xf5);
> +	data_cnt = 0;
> +	cnt = 0;
> +
> +	while ((data_cnt) < 16)	{
> +		sp_read_reg(anx78xx, TX_P0, BUF_DATA_COUNT, &c);
> +
> +		if ((c & 0x1f) != 0) {

Double negative.  The right times to compare == 0 and != 0 are with
*cmp() functions and when talking about zero as a number.  Here zero is
a boolean so it should just be "if (c & 0x1f) {"

> +			data_cnt = data_cnt + c;
> +			do {
> +				sp_read_reg(anx78xx, TX_P0, BUF_DATA_0 + c - 1,
> +					&(pblock_buf[c - 1]));
> +				if (c == 1)
> +					break;
> +			} while (c--);

The "if (c == 1)" condition means that c is a number 2-255 so this
"while (c--)" condition is always true.  Remove the earlier condition
and do this instead:

			} while (--c)

Anyway, gotta run.

regards,
dan carpenter
