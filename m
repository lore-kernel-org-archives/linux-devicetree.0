From: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH v3 3/3] drm: bridge: anx78xx: Add anx78xx driver support.
Date: Mon, 18 Apr 2016 13:23:54 +0200
Message-ID: <5714C3CA.5020102@collabora.com>
References: <1460119972-8658-1-git-send-email-enric.balletbo@collabora.com> <1460119972-8658-4-git-send-email-enric.balletbo@collabora.com> <20160414131013.GA32237@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160414131013.GA32237-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Many thanks for dedicate some time to comment the patch, I'm going to 
send a v4 version, see my comments below.

On 14/04/16 15:10, Thierry Reding wrote:
> On Fri, Apr 08, 2016 at 02:52:52PM +0200, Enric Balletbo i Serra wrote:
>> Although there are other chips from the same family that can reuse this
>> driver, at the moment we only tested ANX7814 chip.
>>
>> The ANX7814 is an ultra-low power Full-HD (1080p60) SlimPort transmitter
>> designed for portable devices. This driver adds initial support for HDMI
>> to DP pass-through mode.
>>
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
>> Tested-by: Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> Reviewed-by: Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> Cc: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
>> Cc: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> Cc: Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> ---
>> Changes since v2:
>>   - Nicolas Boichat:
>>     - Get rid of wait_for macro since is only used once.
>>     - Do not replace the error code if it's readily available to you.
>>   - Add Tested-by: Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>   - Add Reviewed-by: Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>
>> Changes since v1:
>>   - Dan Carpenter:
>>     - Fix missing error code
>>     - Use meaningful names for goto exit paths
>>   - Rob Herring:
>>     - Use hpd instead cable_det as is the more standard name.
>>   - Daniel Kurtz:
>>     - Use regmap_bulk in aux_transfer
>>     - Fix gpio reset polarity.
>>     - Turn off v10 last so we mirror poweron sequence
>>     - Fix some error paths.
>>     - Remove mutex in anx78xx_detect
>>   - kbuild:
>>     - WARNING: PTR_ERR_OR_ZERO can be used
>>
>>   drivers/gpu/drm/bridge/Kconfig   |    8 +
>>   drivers/gpu/drm/bridge/Makefile  |    1 +
>>   drivers/gpu/drm/bridge/anx78xx.c | 1403 ++++++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/bridge/anx78xx.h |  719 +++++++++++++++++++
>>   4 files changed, 2131 insertions(+)
>>   create mode 100644 drivers/gpu/drm/bridge/anx78xx.c
>>   create mode 100644 drivers/gpu/drm/bridge/anx78xx.h
>>
>> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
>> index 27e2022..0f595ae 100644
>> --- a/drivers/gpu/drm/bridge/Kconfig
>> +++ b/drivers/gpu/drm/bridge/Kconfig
>> @@ -40,4 +40,12 @@ config DRM_PARADE_PS8622
>>   	---help---
>>   	  Parade eDP-LVDS bridge chip driver.
>>
>> +config DRM_ANX78XX
>
> The symbol name should include the vendor (DRM_ANALOGIX_ANX78XX) and the
> entry needs to be ordered alphabetically (by vendor, then name).
>

Done in v4

>> +	tristate "Analogix ANX78XX bridge"
>> +	select DRM_KMS_HELPER
>> +	select REGMAP_I2C
>> +	---help---
>> +	  ANX78XX is a HD video transmitter chip over micro-USB connector
>> +	  for smartphone device.
>
> The commit description says the device is a FullHD video transmitter,
> but here you say HD. Pick one. Preferably the correct one.
>

FullHD is the correct. I improved also a bit the description based on 
the datasheet. Changed in v4.

>>   endmenu
>> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
>> index f13c33d..8f0d69e 100644
>> --- a/drivers/gpu/drm/bridge/Makefile
>> +++ b/drivers/gpu/drm/bridge/Makefile
>> @@ -4,3 +4,4 @@ obj-$(CONFIG_DRM_DW_HDMI) += dw-hdmi.o
>>   obj-$(CONFIG_DRM_DW_HDMI_AHB_AUDIO) += dw-hdmi-ahb-audio.o
>>   obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
>>   obj-$(CONFIG_DRM_PARADE_PS8622) += parade-ps8622.o
>> +obj-$(CONFIG_DRM_ANX78XX) += anx78xx.o
>
> Same here, the source file should be named analogix-anx78xx.c, and this
> needs to be sorted by vendor, then name as well.
>

Done in v4.

>> diff --git a/drivers/gpu/drm/bridge/anx78xx.c b/drivers/gpu/drm/bridge/anx78xx.c
> [...]
>> +#include <linux/async.h>
>
> At least this one doesn't seem to be needed.
>

Removed.

>> +static int anx78xx_aux_wait(struct anx78xx *anx78xx)
>> +{
>> +	int err;
>> +	unsigned int status;
>> +	unsigned long timeout;
>> +
>> +	/*
>> +	 * Does the right thing for modeset paths when run under kdgb or
>> +	 * similar atomic contexts. Note that it's important that we check the
>> +	 * condition again after having timed out, since the timeout could be
>> +	 * due to preemption or similar and we've never had a chance to check
>> +	 * the condition before the timeout.
>> +	 */
>
> I don't think this is necessary. The AUX code should never be called
> from atomic context, there are various other places where we take a
> mutex that would trigger warnings.
>

Right. Done in v4.

>> +	err = 0;
>
> You can move this up to where the variable is declared.
>

Done in v4.

>> +	timeout = jiffies + msecs_to_jiffies(AUX_WAIT_TIMEOUT_MS) + 1;
>> +	while (anx78xx_aux_op_finished(anx78xx)) {
>> +		if (time_after(jiffies, timeout)) {
>> +			if (anx78xx_aux_op_finished(anx78xx))
>> +				err = -ETIMEDOUT;
>
> Should this not be !cond? Ah, anx78xx_aux_op_finished() returns an error
> code on failure. Perhaps it would be clearer if this either returned a
> boolean or the name was changed to reflect the fact that it returns an
> error code. _finished() sounds too much like it would return boolean.
>
> To make it clearer what I mean, try reading the above aloud:
>
> 	if aux_op_finished, return error
>
> That's the wrong way around.
>

Yes, it's not readable, make sense to change and return a boolean. Done 
in v4.

>> +			break;
>> +		}
>> +		if (drm_can_sleep())
>> +			usleep_range(1000, 2000);
>> +		else
>> +			cpu_relax();
>> +	}
>> +
>> +	if (err) {
>> +		DRM_ERROR("Timed out waiting AUX to finish\n");
>> +		return -ETIMEDOUT;
>> +	}
>> +
>> +	/* Read the AUX channel access status */
>> +	err = regmap_read(anx78xx->map[I2C_IDX_TX_P0], SP_AUX_CH_STATUS_REG,
>> +			  &status);
>> +	if (err)
>> +		return err;
>> +
>> +	if (status & SP_AUX_STATUS) {
>> +		DRM_ERROR("Failed to read AUX channel: 0x%02x\n", status);
>> +		return -ETIMEDOUT;
>> +	}
>
> Would it make sense to disambiguate these two errors using different
> error codes? As it is this function will either return success or
> timeout, even though the latter is obviously not a timeout.
>

Yes makes sense simply return the timeout in both cases. Changed in v4.

>> +static int anx78xx_aux_address(struct anx78xx *anx78xx, unsigned int addr)
>> +{
>> +	int err = 0;
>> +
>> +	err |= regmap_write(anx78xx->map[I2C_IDX_TX_P0], SP_AUX_ADDR_7_0_REG,
>> +			    addr & 0xff);
>> +	err |= regmap_write(anx78xx->map[I2C_IDX_TX_P0], SP_AUX_ADDR_15_8_REG,
>> +			    (addr & 0xff00) >> 8);
>> +
>> +	/*
>> +	 * DP AUX CH Address Register #2, only update bits[3:0]
>> +	 * [7:4] RESERVED
>> +	 * [3:0] AUX_ADDR[19:16], Register control AUX CH address.
>> +	 */
>> +	err |= regmap_update_bits(anx78xx->map[I2C_IDX_TX_P0],
>> +				  SP_AUX_ADDR_19_16_REG,
>> +				  SP_AUX_ADDR_19_16_MASK,
>> +				  (addr & 0xf0000) >> 16);
>
> I'm not at all a fan of OR'ing error codes. Presumably if any of these
> register accesses fails there's no reason to attempt the subsequent
> accesses because the end result will be failure anyway.
>

Ok, I will remove all these OR'ed error codes and return if anything 
goes wrong.

>> +	/* Write address and request */
>> +	err = anx78xx_aux_address(anx78xx, msg->address);
>> +	err |= regmap_write(anx78xx->map[I2C_IDX_TX_P0], SP_DP_AUX_CH_CTRL1_REG,
>> +			    ctrl1);
>> +	if (err)
>> +		return -EIO;
>> +
>> +	/* Start transaction */
>> +	err = regmap_update_bits(anx78xx->map[I2C_IDX_TX_P0],
>> +				 SP_DP_AUX_CH_CTRL2_REG, SP_ADDR_ONLY |
>> +				 SP_AUX_EN, ctrl2);
>> +	if (err)
>> +		return err;
>> +
>> +	err = anx78xx_aux_wait(anx78xx);
>> +
>> +	msg->reply = err ? DP_AUX_I2C_REPLY_NACK : DP_AUX_I2C_REPLY_ACK;
>
> This looks wrong. What if anx78xx_aux_wait() return -ETIMEDOUT? You'll
> be setting msg->reply to NACK and return success That doesn't sound
> right at all.
>

Right. Changed in v4.

>> +static int anx78xx_set_hpd(struct anx78xx *anx78xx)
>> +{
>> +	int err = 0;
>> +
>> +	err |= anx78xx_clear_bits(anx78xx->map[I2C_IDX_RX_P0],
>> +				  SP_TMDS_CTRL_BASE + 7, SP_PD_RT);
>> +	err |= anx78xx_set_bits(anx78xx->map[I2C_IDX_TX_P2], SP_VID_CTRL3_REG,
>> +				SP_HPD_OUT);
>
> Again, OR'ing of error codes, please don't do it. There are some more
> occurrences below.
>

Done in v4.

>> +static int anx78xx_init_gpio(struct anx78xx *anx78xx)
>> +{
>> +	struct device *dev = &anx78xx->client->dev;
>> +	struct anx78xx_platform_data *pdata = &anx78xx->pdata;
>> +
>> +	/* GPIO for hpd */
>
> HPD being an abbreviation it should be capitalized. Similar for a couple
> of other abbreviations, some of which are inconsistently capitalized. In
> variable names of consumer names, the lowercase variant is fine, but the
> variant used in text (messages, comments) should be the all caps one.
>

Capitalized some HPD, HDMI and DP abbreviations.


>> +	pdata->gpiod_hpd = devm_gpiod_get(dev, "hpd", GPIOD_IN);
>> +	if (IS_ERR(pdata->gpiod_hpd))
>> +		return PTR_ERR(pdata->gpiod_hpd);
>> +
>> +	/* GPIO for chip power down */
>> +	pdata->gpiod_pd = devm_gpiod_get(dev, "pd", GPIOD_OUT_HIGH);
>> +	if (IS_ERR(pdata->gpiod_pd))
>> +		return PTR_ERR(pdata->gpiod_pd);
>> +
>> +	/* GPIO for chip reset */
>> +	pdata->gpiod_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
>> +	if (IS_ERR(pdata->gpiod_reset))
>> +		return PTR_ERR(pdata->gpiod_reset);
>> +
>> +	/* GPIO for V10 power control */
>> +	pdata->gpiod_v10 = devm_gpiod_get_optional(dev, "v10", GPIOD_OUT_LOW);
>
> Does this actually supply power? If so it should be modelled as a
> regulator.
>

Ok, done in v4.

>> +static int anx78xx_dp_link_training(struct anx78xx *anx78xx)
>> +{
>> +	int err = 0;
>> +	u8 dp_bw, regval;
>> +
>> +	err |= regmap_write(anx78xx->map[I2C_IDX_RX_P0], SP_HDMI_MUTE_CTRL_REG,
>> +			    0x0);
>> +	err |= anx78xx_clear_bits(anx78xx->map[I2C_IDX_TX_P2],
>> +				  SP_POWERDOWN_CTRL_REG,
>> +				  SP_TOTAL_PD);
>> +	if (err)
>> +		return -EIO;
>> +
>> +	err = drm_dp_dpcd_readb(&anx78xx->aux, DP_MAX_LINK_RATE, &dp_bw);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	switch (dp_bw) {
>> +	case DP_LINK_BW_1_62:
>> +	case DP_LINK_BW_2_7:
>> +	case DP_LINK_BW_5_4:
>> +		break;
>> +	default:
>> +		DRM_DEBUG_KMS("Waiting to read DP bandwidth.\n");
>> +		return -EAGAIN;
>> +	}
>
> That sounds wrong. Either you can read the content and it should be a
> valid value (albeit one which you may not support) or you can't. Why do
> you need to potentially repeat this read?
>

Right, changed in v4.

>> +
>> +	err = anx78xx_set_bits(anx78xx->map[I2C_IDX_TX_P2], SP_VID_CTRL1_REG,
>> +			       SP_VIDEO_MUTE);
>> +	err |= anx78xx_clear_bits(anx78xx->map[I2C_IDX_TX_P2],
>> +				  SP_VID_CTRL1_REG, SP_VIDEO_EN);
>> +	if (err)
>> +		return -EIO;
>> +
>> +	/* Get dpcd info */
>
> s/dpcd/DPCD/
>

Done in v4.

>> +	err = drm_dp_dpcd_read(&anx78xx->aux, DP_DPCD_REV,
>> +			       &anx78xx->dpcd, DP_RECEIVER_CAP_SIZE);
>> +	if (err < 0) {
>> +		DRM_ERROR("Failed to read DPCD\n");
>
> It's often useful to output the error code as part of the error message
> to make it easier for developers to diagnose problems.
>

Ok, there are more places that the error code is missing, I'll add all 
error codes. Done in v4.

>> +		return err;
>> +	}
>> +
>> +	/* Clear channel x SERDES power down */
>> +	err = anx78xx_clear_bits(anx78xx->map[I2C_IDX_TX_P0],
>> +				 SP_DP_ANALOG_POWER_DOWN_REG, SP_CH0_PD);
>> +	if (err)
>> +		return -EIO;
>> +
>> +	/* Check link capabilities */
>> +	err = drm_dp_link_probe(&anx78xx->aux, &anx78xx->link);
>> +	if (err < 0) {
>> +		DRM_ERROR("Failed to probe link capabilities\n");
>> +		return err;
>> +	}
>> +
>> +	/* Power up the sink */
>> +	err = drm_dp_link_power_up(&anx78xx->aux, &anx78xx->link);
>> +	if (err < 0) {
>> +		DRM_ERROR("Failed to power up DisplayPort link\n");
>> +		return err;
>> +	}
>> +
>> +	/* Possibly enable downspread on the sink */
>> +	err = regmap_write(anx78xx->map[I2C_IDX_TX_P0],
>> +			   SP_DP_DOWNSPREAD_CTRL1_REG, 0);
>> +	if (err)
>> +		return err;
>> +
>> +	if (anx78xx->dpcd[3] & 0x1) {
>
> This should use the symbolic constants defined in drm_dp_helper.h.
> Actually, it should probably add a symbolic constant because we don't
> have one yet for bit 0 in the DP_MAX_DOWNSPREAD register.
>

I'll add the new constant in DP_MAX_DOWNSPREAD and send a patch within 
these series. Done in v4.

>> +static inline struct anx78xx *
>> +	connector_to_anx78xx(struct drm_connector *connector)
>
> The function name should start on the first column. Also you might want
> to move this inline function after the struct anx78xx declaration, which
> is more consistent with other drivers.
>

Done in v4.

>> +static const struct drm_connector_helper_funcs
>> +	anx78xx_connector_helper_funcs = {
>
> The structure name should start in the first column as well.
>

Done in v4.

>> +	.get_modes = anx78xx_get_modes,
>> +	.best_encoder = anx78xx_best_encoder,
>> +};
>> +
>> +static enum drm_connector_status anx78xx_detect(struct drm_connector *connector,
>> +						bool force)
>> +{
>> +	struct anx78xx *anx78xx = container_of(connector, struct anx78xx,
>> +					       connector);
>
> Didn't you introduce an inline function for this just a few lines above?
>

Yes, replaced in v4

>> +	DRM_DEBUG_KMS("[CONNECTOR:%d:%s]\n", connector->base.id,
>> +		      connector->name);
>> +
>> +	if (!gpiod_get_value(anx78xx->pdata.gpiod_hpd)) {
>> +		DRM_DEBUG_KMS("CONNECTOR STATUS DISCONNECTED\n");
>> +		return connector_status_disconnected;
>> +	}
>> +
>> +	return connector_status_connected;
>> +}
>
> Is it really necessary to add two debug messages here? The DRM core will
> already output a message for connector status changes, so this is
> unnecessarily noisy in my opinion.
>

Ok, removed in v4.

>> +static inline struct anx78xx *bridge_to_anx78xx(struct drm_bridge *bridge)
>> +{
>> +	return container_of(bridge, struct anx78xx, bridge);
>> +}
>
> Put this together with the connector cast function.
>

Done in v4.

>> +static void anx78xx_bridge_disable(struct drm_bridge *bridge)
>> +{
>> +	struct anx78xx *anx78xx = bridge_to_anx78xx(bridge);
>> +
>> +	mutex_lock(&anx78xx->lock);
>
> Do you really need the locking here and below? I think the DRM core
> already ensures that these calls are always serialized.
>

Hmm, guess I can remove this from bridge_enable/disable calls, but I 
observed that sometimes the display is wrong (I see artefacts) if I 
remove the lock from mode_set for example, I just want to make sure all 
INTP interrupts are handled. It works with the lock but maybe there is 
another problem behind this.

>> +static void anx78xx_bridge_mode_set(struct drm_bridge *bridge,
>> +				    struct drm_display_mode *mode,
>> +				    struct drm_display_mode *adjusted_mode)
>> +{
>> +	int err;
>> +	struct hdmi_avi_infoframe frame;
>> +	struct anx78xx *anx78xx = bridge_to_anx78xx(bridge);
>> +
>> +	if (WARN_ON(!anx78xx->powered))
>> +		return;
>> +
>> +	mutex_lock(&anx78xx->lock);
>> +
>> +	mode = adjusted_mode;
>> +
>> +	err = drm_hdmi_avi_infoframe_from_display_mode(&frame, mode);
>
> This seems like jumping through hoops. Why not simply pass adjusted_mode
> to the function?
>

Fixed in v4.

>> +static const struct drm_bridge_funcs anx78xx_bridge_funcs = {
>> +	.attach		= anx78xx_bridge_attach,
>> +	.mode_fixup	= anx78xx_bridge_mode_fixup,
>> +	.disable	= anx78xx_bridge_disable,
>> +	.mode_set	= anx78xx_bridge_mode_set,
>> +	.enable		= anx78xx_bridge_enable,
>> +};
>
> I'd leave out the tab-padding. Simple spaces will do just fine.
>

Done in v4.

>> +static irqreturn_t anx78xx_hpd_threaded_handler(int unused, void *data)
>
> Might as well give the first parameter the proper name (irq).
>

Done in v4.

>> +static bool anx78xx_handle_common_int_4(struct anx78xx *anx78xx, u8 irq)
>> +{
>> +	int err;
>> +	bool event = false;
>> +
>> +	DRM_DEBUG_KMS("Handle common interrupt 4: %02x\n", irq);
>> +
>> +	err = regmap_write(anx78xx->map[I2C_IDX_TX_P2],
>> +			   SP_COMMON_INT_STATUS4_REG, irq);
>> +	if (err) {
>> +		DRM_ERROR("Failed to write SP_COMMON_INT_STATUS4 %d\n", err);
>> +		return event;
>> +	}
>> +
>> +	if (irq & SP_HPD_LOST) {
>> +		DRM_DEBUG_KMS("IRQ: Hot plug detect - cable is pulled out\n");
>> +		event = true;
>> +		anx78xx_poweroff(anx78xx);
>> +	} else if (irq & SP_HPD_PLUG) {
>> +		DRM_DEBUG_KMS("IRQ: Hot plug detect - cable plug\n");
>> +		event = true;
>> +		/* Free previous cached EDID if any */
>> +		kfree(anx78xx->edid);
>> +		anx78xx->edid = NULL;
>
> I think you can free the EDID on unplug, since it becomes stale at that
> point already. The DRM core will also remove the EDID data on unplug.
>

Yes, done in v4.

>> +static void unregister_i2c_dummy_clients(struct anx78xx *anx78xx)
>> +{
>> +	int i;
>
> unsigned int
>

Done in v4.

>> +
>> +	for (i = 0; i < ARRAY_SIZE(anx78xx->i2c_dummy); i++)
>> +		if (anx78xx->i2c_dummy[i])
>> +			i2c_unregister_device(anx78xx->i2c_dummy[i]);
>> +}
>> +
>> +static const struct regmap_config anx78xx_regmap_config = {
>> +	.reg_bits = 8,
>> +	.val_bits = 8,
>> +};
>> +
>> +static const u16 anx78xx_chipid_list[] = {
>> +	0x7812,
>> +	0x7814,
>> +	0x7818,
>> +};
>> +
>> +static int anx78xx_i2c_probe(struct i2c_client *client,
>> +			     const struct i2c_device_id *id)
>> +{
>> +	struct anx78xx *anx78xx;
>> +	struct anx78xx_platform_data *pdata;
>> +	int err, i;
>
> i should be unsigned int.
>

Done in v4.

>> +	unsigned int idl, idh, version;
>> +	bool found = false;
>> +
>> +	anx78xx = devm_kzalloc(&client->dev, sizeof(*anx78xx), GFP_KERNEL);
>> +	if (!anx78xx)
>> +		return -ENOMEM;
>> +
>> +	pdata = &anx78xx->pdata;
>> +
>> +	mutex_init(&anx78xx->lock);
>> +
>> +#if IS_ENABLED(CONFIG_OF)
>> +	anx78xx->bridge.of_node = client->dev.of_node;
>> +#endif
>> +
>> +	anx78xx->client = client;
>> +	i2c_set_clientdata(client, anx78xx);
>> +
>> +	err = anx78xx_init_gpio(anx78xx);
>> +	if (err) {
>> +		DRM_ERROR("Failed to initialize gpios\n");
>> +		return err;
>> +	}
>> +
>> +	pdata->hpd_irq = gpiod_to_irq(pdata->gpiod_hpd);
>> +	if (pdata->hpd_irq < 0) {
>> +		DRM_ERROR("Failed to get hpd irq %d\n",
>> +			  pdata->hpd_irq);
>> +		return -ENODEV;
>> +	}
>> +
>> +	pdata->intp_irq = client->irq;
>> +	if (!pdata->intp_irq) {
>> +		DRM_ERROR("Failed to get CABLE_DET and INTP irq\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	/* Map slave addresses of ANX7814 */
>> +	for (i = 0; i < I2C_NUM_ADDRESSES; i++) {
>> +		anx78xx->i2c_dummy[i] = i2c_new_dummy(client->adapter,
>> +						anx78xx_i2c_addresses[i] >> 1);
>> +		if (!anx78xx->i2c_dummy[i]) {
>> +			err = -ENOMEM;
>> +			DRM_ERROR("Failed to reserve i2c bus %02x.\n",
>> +				  anx78xx_i2c_addresses[i]);
>> +			goto err_unregister_i2c;
>> +		}
>> +
>> +		anx78xx->map[i] = devm_regmap_init_i2c(anx78xx->i2c_dummy[i],
>> +						       &anx78xx_regmap_config);
>> +		if (IS_ERR(anx78xx->map[i])) {
>> +			err = PTR_ERR(anx78xx->map[i]);
>> +			DRM_ERROR("Failed regmap initialization %02x.\n",
>> +				  anx78xx_i2c_addresses[i]);
>> +			goto err_unregister_i2c;
>> +		}
>> +	}
>
> That's quite some overhead merely to use regmap... Perhaps there's room
> to enhance regmap-i2c to support multiple addresses for the same device?
>

Yes it is, guess this is also used on other drivers, so will make sense 
enhance regmap-i2c, but let me do this on a future regmap-i2c patch 
series ;)

>> +static int anx78xx_i2c_remove(struct i2c_client *client)
>> +{
>> +	struct anx78xx *anx78xx = i2c_get_clientdata(client);
>> +
>> +	drm_bridge_remove(&anx78xx->bridge);
>> +
>> +	unregister_i2c_dummy_clients(anx78xx);
>> +
>> +	kfree(anx78xx->edid);
>> +	anx78xx->edid = NULL;
>
> The memory pointed at by anx78xx will be freed a couple of instructions
> later, there's no need to set ->edid to NULL.
>

Done in v4.

> Thierry
>

Thanks,
- Enric
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
