From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v3 3/3] drm: bridge: anx78xx: Add anx78xx driver support.
Date: Thu, 14 Apr 2016 15:10:15 +0200
Message-ID: <20160414131013.GA32237@ulmo.ba.sec>
References: <1460119972-8658-1-git-send-email-enric.balletbo@collabora.com>
 <1460119972-8658-4-git-send-email-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1269694430=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1460119972-8658-4-git-send-email-enric.balletbo@collabora.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org, Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, dri-devel@lists.freedesktop.org, dan.carpenter@oracle.com
List-Id: devicetree@vger.kernel.org

--===============1269694430==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline

--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 08, 2016 at 02:52:52PM +0200, Enric Balletbo i Serra wrote:
> Although there are other chips from the same family that can reuse this
> driver, at the moment we only tested ANX7814 chip.
>=20
> The ANX7814 is an ultra-low power Full-HD (1080p60) SlimPort transmitter
> designed for portable devices. This driver adds initial support for HDMI
> to DP pass-through mode.
>=20
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Tested-by: Nicolas Boichat <drinkcat@chromium.org>
> Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: Daniel Kurtz <djkurtz@chromium.org>
> Cc: Nicolas Boichat <drinkcat@chromium.org>
> ---
> Changes since v2:
>  - Nicolas Boichat:
>    - Get rid of wait_for macro since is only used once.
>    - Do not replace the error code if it's readily available to you.
>  - Add Tested-by: Nicolas Boichat <drinkcat@chromium.org>
>  - Add Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
>=20
> Changes since v1:
>  - Dan Carpenter:=20
>    - Fix missing error code
>    - Use meaningful names for goto exit paths
>  - Rob Herring:=20
>    - Use hpd instead cable_det as is the more standard name.
>  - Daniel Kurtz:=20
>    - Use regmap_bulk in aux_transfer
>    - Fix gpio reset polarity.
>    - Turn off v10 last so we mirror poweron sequence
>    - Fix some error paths.
>    - Remove mutex in anx78xx_detect
>  - kbuild:
>    - WARNING: PTR_ERR_OR_ZERO can be used
>=20
>  drivers/gpu/drm/bridge/Kconfig   |    8 +
>  drivers/gpu/drm/bridge/Makefile  |    1 +
>  drivers/gpu/drm/bridge/anx78xx.c | 1403 ++++++++++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/bridge/anx78xx.h |  719 +++++++++++++++++++
>  4 files changed, 2131 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/anx78xx.c
>  create mode 100644 drivers/gpu/drm/bridge/anx78xx.h
>=20
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kcon=
fig
> index 27e2022..0f595ae 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -40,4 +40,12 @@ config DRM_PARADE_PS8622
>  	---help---
>  	  Parade eDP-LVDS bridge chip driver.
> =20
> +config DRM_ANX78XX

The symbol name should include the vendor (DRM_ANALOGIX_ANX78XX) and the
entry needs to be ordered alphabetically (by vendor, then name).

> +	tristate "Analogix ANX78XX bridge"
> +	select DRM_KMS_HELPER
> +	select REGMAP_I2C
> +	---help---
> +	  ANX78XX is a HD video transmitter chip over micro-USB connector
> +	  for smartphone device.

The commit description says the device is a FullHD video transmitter,
but here you say HD. Pick one. Preferably the correct one.

>  endmenu
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Mak=
efile
> index f13c33d..8f0d69e 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_DRM_DW_HDMI) +=3D dw-hdmi.o
>  obj-$(CONFIG_DRM_DW_HDMI_AHB_AUDIO) +=3D dw-hdmi-ahb-audio.o
>  obj-$(CONFIG_DRM_NXP_PTN3460) +=3D nxp-ptn3460.o
>  obj-$(CONFIG_DRM_PARADE_PS8622) +=3D parade-ps8622.o
> +obj-$(CONFIG_DRM_ANX78XX) +=3D anx78xx.o

Same here, the source file should be named analogix-anx78xx.c, and this
needs to be sorted by vendor, then name as well.

> diff --git a/drivers/gpu/drm/bridge/anx78xx.c b/drivers/gpu/drm/bridge/an=
x78xx.c
[...]
> +#include <linux/async.h>

At least this one doesn't seem to be needed.

> +static int anx78xx_aux_wait(struct anx78xx *anx78xx)
> +{
> +	int err;
> +	unsigned int status;
> +	unsigned long timeout;
> +
> +	/*
> +	 * Does the right thing for modeset paths when run under kdgb or
> +	 * similar atomic contexts. Note that it's important that we check the
> +	 * condition again after having timed out, since the timeout could be
> +	 * due to preemption or similar and we've never had a chance to check
> +	 * the condition before the timeout.
> +	 */

I don't think this is necessary. The AUX code should never be called
=66rom atomic context, there are various other places where we take a
mutex that would trigger warnings.

> +	err =3D 0;

You can move this up to where the variable is declared.

> +	timeout =3D jiffies + msecs_to_jiffies(AUX_WAIT_TIMEOUT_MS) + 1;
> +	while (anx78xx_aux_op_finished(anx78xx)) {
> +		if (time_after(jiffies, timeout)) {
> +			if (anx78xx_aux_op_finished(anx78xx))
> +				err =3D -ETIMEDOUT;

Should this not be !cond? Ah, anx78xx_aux_op_finished() returns an error
code on failure. Perhaps it would be clearer if this either returned a
boolean or the name was changed to reflect the fact that it returns an
error code. _finished() sounds too much like it would return boolean.

To make it clearer what I mean, try reading the above aloud:

	if aux_op_finished, return error

That's the wrong way around.

> +			break;
> +		}
> +		if (drm_can_sleep())
> +			usleep_range(1000, 2000);
> +		else
> +			cpu_relax();
> +	}
> +
> +	if (err) {
> +		DRM_ERROR("Timed out waiting AUX to finish\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	/* Read the AUX channel access status */
> +	err =3D regmap_read(anx78xx->map[I2C_IDX_TX_P0], SP_AUX_CH_STATUS_REG,
> +			  &status);
> +	if (err)
> +		return err;
> +
> +	if (status & SP_AUX_STATUS) {
> +		DRM_ERROR("Failed to read AUX channel: 0x%02x\n", status);
> +		return -ETIMEDOUT;
> +	}

Would it make sense to disambiguate these two errors using different
error codes? As it is this function will either return success or
timeout, even though the latter is obviously not a timeout.

> +static int anx78xx_aux_address(struct anx78xx *anx78xx, unsigned int add=
r)
> +{
> +	int err =3D 0;
> +
> +	err |=3D regmap_write(anx78xx->map[I2C_IDX_TX_P0], SP_AUX_ADDR_7_0_REG,
> +			    addr & 0xff);
> +	err |=3D regmap_write(anx78xx->map[I2C_IDX_TX_P0], SP_AUX_ADDR_15_8_REG,
> +			    (addr & 0xff00) >> 8);
> +
> +	/*
> +	 * DP AUX CH Address Register #2, only update bits[3:0]
> +	 * [7:4] RESERVED
> +	 * [3:0] AUX_ADDR[19:16], Register control AUX CH address.
> +	 */
> +	err |=3D regmap_update_bits(anx78xx->map[I2C_IDX_TX_P0],
> +				  SP_AUX_ADDR_19_16_REG,
> +				  SP_AUX_ADDR_19_16_MASK,
> +				  (addr & 0xf0000) >> 16);

I'm not at all a fan of OR'ing error codes. Presumably if any of these
register accesses fails there's no reason to attempt the subsequent
accesses because the end result will be failure anyway.

> +	/* Write address and request */
> +	err =3D anx78xx_aux_address(anx78xx, msg->address);
> +	err |=3D regmap_write(anx78xx->map[I2C_IDX_TX_P0], SP_DP_AUX_CH_CTRL1_R=
EG,
> +			    ctrl1);
> +	if (err)
> +		return -EIO;
> +
> +	/* Start transaction */
> +	err =3D regmap_update_bits(anx78xx->map[I2C_IDX_TX_P0],
> +				 SP_DP_AUX_CH_CTRL2_REG, SP_ADDR_ONLY |
> +				 SP_AUX_EN, ctrl2);
> +	if (err)
> +		return err;
> +
> +	err =3D anx78xx_aux_wait(anx78xx);
> +
> +	msg->reply =3D err ? DP_AUX_I2C_REPLY_NACK : DP_AUX_I2C_REPLY_ACK;

This looks wrong. What if anx78xx_aux_wait() return -ETIMEDOUT? You'll
be setting msg->reply to NACK and return success That doesn't sound
right at all.

> +static int anx78xx_set_hpd(struct anx78xx *anx78xx)
> +{
> +	int err =3D 0;
> +
> +	err |=3D anx78xx_clear_bits(anx78xx->map[I2C_IDX_RX_P0],
> +				  SP_TMDS_CTRL_BASE + 7, SP_PD_RT);
> +	err |=3D anx78xx_set_bits(anx78xx->map[I2C_IDX_TX_P2], SP_VID_CTRL3_REG,
> +				SP_HPD_OUT);

Again, OR'ing of error codes, please don't do it. There are some more
occurrences below.

> +static int anx78xx_init_gpio(struct anx78xx *anx78xx)
> +{
> +	struct device *dev =3D &anx78xx->client->dev;
> +	struct anx78xx_platform_data *pdata =3D &anx78xx->pdata;
> +
> +	/* GPIO for hpd */

HPD being an abbreviation it should be capitalized. Similar for a couple
of other abbreviations, some of which are inconsistently capitalized. In
variable names of consumer names, the lowercase variant is fine, but the
variant used in text (messages, comments) should be the all caps one.

> +	pdata->gpiod_hpd =3D devm_gpiod_get(dev, "hpd", GPIOD_IN);
> +	if (IS_ERR(pdata->gpiod_hpd))
> +		return PTR_ERR(pdata->gpiod_hpd);
> +
> +	/* GPIO for chip power down */
> +	pdata->gpiod_pd =3D devm_gpiod_get(dev, "pd", GPIOD_OUT_HIGH);
> +	if (IS_ERR(pdata->gpiod_pd))
> +		return PTR_ERR(pdata->gpiod_pd);
> +
> +	/* GPIO for chip reset */
> +	pdata->gpiod_reset =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(pdata->gpiod_reset))
> +		return PTR_ERR(pdata->gpiod_reset);
> +
> +	/* GPIO for V10 power control */
> +	pdata->gpiod_v10 =3D devm_gpiod_get_optional(dev, "v10", GPIOD_OUT_LOW);

Does this actually supply power? If so it should be modelled as a
regulator.

> +static int anx78xx_dp_link_training(struct anx78xx *anx78xx)
> +{
> +	int err =3D 0;
> +	u8 dp_bw, regval;
> +
> +	err |=3D regmap_write(anx78xx->map[I2C_IDX_RX_P0], SP_HDMI_MUTE_CTRL_RE=
G,
> +			    0x0);
> +	err |=3D anx78xx_clear_bits(anx78xx->map[I2C_IDX_TX_P2],
> +				  SP_POWERDOWN_CTRL_REG,
> +				  SP_TOTAL_PD);
> +	if (err)
> +		return -EIO;
> +
> +	err =3D drm_dp_dpcd_readb(&anx78xx->aux, DP_MAX_LINK_RATE, &dp_bw);
> +	if (err < 0)
> +		return err;
> +
> +	switch (dp_bw) {
> +	case DP_LINK_BW_1_62:
> +	case DP_LINK_BW_2_7:
> +	case DP_LINK_BW_5_4:
> +		break;
> +	default:
> +		DRM_DEBUG_KMS("Waiting to read DP bandwidth.\n");
> +		return -EAGAIN;
> +	}

That sounds wrong. Either you can read the content and it should be a
valid value (albeit one which you may not support) or you can't. Why do
you need to potentially repeat this read?

> +
> +	err =3D anx78xx_set_bits(anx78xx->map[I2C_IDX_TX_P2], SP_VID_CTRL1_REG,
> +			       SP_VIDEO_MUTE);
> +	err |=3D anx78xx_clear_bits(anx78xx->map[I2C_IDX_TX_P2],
> +				  SP_VID_CTRL1_REG, SP_VIDEO_EN);
> +	if (err)
> +		return -EIO;
> +
> +	/* Get dpcd info */

s/dpcd/DPCD/

> +	err =3D drm_dp_dpcd_read(&anx78xx->aux, DP_DPCD_REV,
> +			       &anx78xx->dpcd, DP_RECEIVER_CAP_SIZE);
> +	if (err < 0) {
> +		DRM_ERROR("Failed to read DPCD\n");

It's often useful to output the error code as part of the error message
to make it easier for developers to diagnose problems.

> +		return err;
> +	}
> +
> +	/* Clear channel x SERDES power down */
> +	err =3D anx78xx_clear_bits(anx78xx->map[I2C_IDX_TX_P0],
> +				 SP_DP_ANALOG_POWER_DOWN_REG, SP_CH0_PD);
> +	if (err)
> +		return -EIO;
> +
> +	/* Check link capabilities */
> +	err =3D drm_dp_link_probe(&anx78xx->aux, &anx78xx->link);
> +	if (err < 0) {
> +		DRM_ERROR("Failed to probe link capabilities\n");
> +		return err;
> +	}
> +
> +	/* Power up the sink */
> +	err =3D drm_dp_link_power_up(&anx78xx->aux, &anx78xx->link);
> +	if (err < 0) {
> +		DRM_ERROR("Failed to power up DisplayPort link\n");
> +		return err;
> +	}
> +
> +	/* Possibly enable downspread on the sink */
> +	err =3D regmap_write(anx78xx->map[I2C_IDX_TX_P0],
> +			   SP_DP_DOWNSPREAD_CTRL1_REG, 0);
> +	if (err)
> +		return err;
> +
> +	if (anx78xx->dpcd[3] & 0x1) {

This should use the symbolic constants defined in drm_dp_helper.h.
Actually, it should probably add a symbolic constant because we don't
have one yet for bit 0 in the DP_MAX_DOWNSPREAD register.

> +static inline struct anx78xx *
> +	connector_to_anx78xx(struct drm_connector *connector)

The function name should start on the first column. Also you might want
to move this inline function after the struct anx78xx declaration, which
is more consistent with other drivers.

> +static const struct drm_connector_helper_funcs
> +	anx78xx_connector_helper_funcs =3D {

The structure name should start in the first column as well.

> +	.get_modes =3D anx78xx_get_modes,
> +	.best_encoder =3D anx78xx_best_encoder,
> +};
> +
> +static enum drm_connector_status anx78xx_detect(struct drm_connector *co=
nnector,
> +						bool force)
> +{
> +	struct anx78xx *anx78xx =3D container_of(connector, struct anx78xx,
> +					       connector);

Didn't you introduce an inline function for this just a few lines above?

> +	DRM_DEBUG_KMS("[CONNECTOR:%d:%s]\n", connector->base.id,
> +		      connector->name);
> +
> +	if (!gpiod_get_value(anx78xx->pdata.gpiod_hpd)) {
> +		DRM_DEBUG_KMS("CONNECTOR STATUS DISCONNECTED\n");
> +		return connector_status_disconnected;
> +	}
> +
> +	return connector_status_connected;
> +}

Is it really necessary to add two debug messages here? The DRM core will
already output a message for connector status changes, so this is
unnecessarily noisy in my opinion.

> +static inline struct anx78xx *bridge_to_anx78xx(struct drm_bridge *bridg=
e)
> +{
> +	return container_of(bridge, struct anx78xx, bridge);
> +}

Put this together with the connector cast function.

> +static void anx78xx_bridge_disable(struct drm_bridge *bridge)
> +{
> +	struct anx78xx *anx78xx =3D bridge_to_anx78xx(bridge);
> +
> +	mutex_lock(&anx78xx->lock);

Do you really need the locking here and below? I think the DRM core
already ensures that these calls are always serialized.

> +static void anx78xx_bridge_mode_set(struct drm_bridge *bridge,
> +				    struct drm_display_mode *mode,
> +				    struct drm_display_mode *adjusted_mode)
> +{
> +	int err;
> +	struct hdmi_avi_infoframe frame;
> +	struct anx78xx *anx78xx =3D bridge_to_anx78xx(bridge);
> +
> +	if (WARN_ON(!anx78xx->powered))
> +		return;
> +
> +	mutex_lock(&anx78xx->lock);
> +
> +	mode =3D adjusted_mode;
> +
> +	err =3D drm_hdmi_avi_infoframe_from_display_mode(&frame, mode);

This seems like jumping through hoops. Why not simply pass adjusted_mode
to the function?

> +static const struct drm_bridge_funcs anx78xx_bridge_funcs =3D {
> +	.attach		=3D anx78xx_bridge_attach,
> +	.mode_fixup	=3D anx78xx_bridge_mode_fixup,
> +	.disable	=3D anx78xx_bridge_disable,
> +	.mode_set	=3D anx78xx_bridge_mode_set,
> +	.enable		=3D anx78xx_bridge_enable,
> +};

I'd leave out the tab-padding. Simple spaces will do just fine.

> +static irqreturn_t anx78xx_hpd_threaded_handler(int unused, void *data)

Might as well give the first parameter the proper name (irq).

> +static bool anx78xx_handle_common_int_4(struct anx78xx *anx78xx, u8 irq)
> +{
> +	int err;
> +	bool event =3D false;
> +
> +	DRM_DEBUG_KMS("Handle common interrupt 4: %02x\n", irq);
> +
> +	err =3D regmap_write(anx78xx->map[I2C_IDX_TX_P2],
> +			   SP_COMMON_INT_STATUS4_REG, irq);
> +	if (err) {
> +		DRM_ERROR("Failed to write SP_COMMON_INT_STATUS4 %d\n", err);
> +		return event;
> +	}
> +
> +	if (irq & SP_HPD_LOST) {
> +		DRM_DEBUG_KMS("IRQ: Hot plug detect - cable is pulled out\n");
> +		event =3D true;
> +		anx78xx_poweroff(anx78xx);
> +	} else if (irq & SP_HPD_PLUG) {
> +		DRM_DEBUG_KMS("IRQ: Hot plug detect - cable plug\n");
> +		event =3D true;
> +		/* Free previous cached EDID if any */
> +		kfree(anx78xx->edid);
> +		anx78xx->edid =3D NULL;

I think you can free the EDID on unplug, since it becomes stale at that
point already. The DRM core will also remove the EDID data on unplug.

> +static void unregister_i2c_dummy_clients(struct anx78xx *anx78xx)
> +{
> +	int i;

unsigned int

> +
> +	for (i =3D 0; i < ARRAY_SIZE(anx78xx->i2c_dummy); i++)
> +		if (anx78xx->i2c_dummy[i])
> +			i2c_unregister_device(anx78xx->i2c_dummy[i]);
> +}
> +
> +static const struct regmap_config anx78xx_regmap_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +};
> +
> +static const u16 anx78xx_chipid_list[] =3D {
> +	0x7812,
> +	0x7814,
> +	0x7818,
> +};
> +
> +static int anx78xx_i2c_probe(struct i2c_client *client,
> +			     const struct i2c_device_id *id)
> +{
> +	struct anx78xx *anx78xx;
> +	struct anx78xx_platform_data *pdata;
> +	int err, i;

i should be unsigned int.

> +	unsigned int idl, idh, version;
> +	bool found =3D false;
> +
> +	anx78xx =3D devm_kzalloc(&client->dev, sizeof(*anx78xx), GFP_KERNEL);
> +	if (!anx78xx)
> +		return -ENOMEM;
> +
> +	pdata =3D &anx78xx->pdata;
> +
> +	mutex_init(&anx78xx->lock);
> +
> +#if IS_ENABLED(CONFIG_OF)
> +	anx78xx->bridge.of_node =3D client->dev.of_node;
> +#endif
> +
> +	anx78xx->client =3D client;
> +	i2c_set_clientdata(client, anx78xx);
> +
> +	err =3D anx78xx_init_gpio(anx78xx);
> +	if (err) {
> +		DRM_ERROR("Failed to initialize gpios\n");
> +		return err;
> +	}
> +
> +	pdata->hpd_irq =3D gpiod_to_irq(pdata->gpiod_hpd);
> +	if (pdata->hpd_irq < 0) {
> +		DRM_ERROR("Failed to get hpd irq %d\n",
> +			  pdata->hpd_irq);
> +		return -ENODEV;
> +	}
> +
> +	pdata->intp_irq =3D client->irq;
> +	if (!pdata->intp_irq) {
> +		DRM_ERROR("Failed to get CABLE_DET and INTP irq\n");
> +		return -ENODEV;
> +	}
> +
> +	/* Map slave addresses of ANX7814 */
> +	for (i =3D 0; i < I2C_NUM_ADDRESSES; i++) {
> +		anx78xx->i2c_dummy[i] =3D i2c_new_dummy(client->adapter,
> +						anx78xx_i2c_addresses[i] >> 1);
> +		if (!anx78xx->i2c_dummy[i]) {
> +			err =3D -ENOMEM;
> +			DRM_ERROR("Failed to reserve i2c bus %02x.\n",
> +				  anx78xx_i2c_addresses[i]);
> +			goto err_unregister_i2c;
> +		}
> +
> +		anx78xx->map[i] =3D devm_regmap_init_i2c(anx78xx->i2c_dummy[i],
> +						       &anx78xx_regmap_config);
> +		if (IS_ERR(anx78xx->map[i])) {
> +			err =3D PTR_ERR(anx78xx->map[i]);
> +			DRM_ERROR("Failed regmap initialization %02x.\n",
> +				  anx78xx_i2c_addresses[i]);
> +			goto err_unregister_i2c;
> +		}
> +	}

That's quite some overhead merely to use regmap... Perhaps there's room
to enhance regmap-i2c to support multiple addresses for the same device?

> +static int anx78xx_i2c_remove(struct i2c_client *client)
> +{
> +	struct anx78xx *anx78xx =3D i2c_get_clientdata(client);
> +
> +	drm_bridge_remove(&anx78xx->bridge);
> +
> +	unregister_i2c_dummy_clients(anx78xx);
> +
> +	kfree(anx78xx->edid);
> +	anx78xx->edid =3D NULL;

The memory pointed at by anx78xx will be freed a couple of instructions
later, there's no need to set ->edid to NULL.

Thierry

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXD5ayAAoJEN0jrNd/PrOhvTAQAIs/kAB8hB7nWOH/I9FHefBV
aOZO5HbA6D7CmfuJBhnjRR/gjmx3Rv/s6pkmQpRaEp8pLApG+++ubo+H0/7PN0YZ
0I7oYkKam9X1+g+3n3NeKHQLgP7Ju4OCfHjtquujeBdPZ0zRKPf8/3u+5pFH+B1u
SbDbWEfaok0OfpJJkO1mILEeJa0iN38bOzPjTVzCxaG675j3wpJIz9ai2fBkkfy3
cyqiCm89OvNUrk73iWmv9qmtVBLstFbnF+31TRuUwuISswTchBkxj/zeJbm74qYu
XGNgpkSVobb+A2hhz2rxGiPRNqmh6R1543HUY116tDOanJ2QY5cjCqjLoIHs2Mh0
+KYHdnJHOYdLioC0naPRntMGYaETR7VIbQnXa55oUarZSyM30OhyR8p+NM3xslKi
glTHMqjUEl2LcwTgX07j53lQa4twnaxb+rOsB+umQNcvJx+nWO8mkUNi+Swy+mOt
ReuosUwKc5hzvz4PNFBoXHvkGInaOvVyg460SwG7wH+udDJA9vZIe3e/Q0Pq/CRT
ccDfK1mhHS0It5dJaeuYAbnBOvSy/88kOr6nunk2HvM2M7zzU2AW2IhrlRVNNHRz
V4ROHDLLqcpSXfGW96tk2IquOR/gcQWUr+ykFl7iVOaw6oD37uA/MV6kIxhSnTeV
AcLRgcJT/gYzdmXRlkhz
=+/Ru
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--

--===============1269694430==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1269694430==--
