From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [V2, 2/2] media: i2c: Add DW9768 VCM driver
Date: Thu, 5 Sep 2019 13:26:33 +0300
Message-ID: <20190905102633.GC2680@smile.fi.intel.com>
References: <20190905072142.14606-1-dongchun.zhu@mediatek.com>
 <20190905072142.14606-3-dongchun.zhu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190905072142.14606-3-dongchun.zhu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dongchun.zhu@mediatek.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, drinkcat@chromium.org, srv_heupstream@mediatek.com, sam.hung@mediatek.com, shengnan.wang@mediatek.com, tfiga@chromium.org, sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, sakari.ailus@linux.intel.com, matthias.bgg@gmail.com, bingbu.cao@intel.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 05, 2019 at 03:21:42PM +0800, dongchun.zhu@mediatek.com wrote:
> From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> =

> This patch adds a V4L2 sub-device driver for DW9768 lens voice coil,
> and provides control to set the desired focus.
> =

> The DW9768 is a 10 bit DAC with 100mA output current sink capability
> from Dongwoon, designed for linear control of voice coil motor,
> and controlled via I2C serial interface.

> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  MAINTAINERS                |   1 +

This should go to the same patch, where you introduce a record in the
MAINTAINERS database.

> +#define DW9768_SET_POSITION_ADDR                0x03

Indentation issue.

> +static struct regval_list dw9768_init_regs[] =3D {
> +	{0x02, 0x02},
> +	{DW9768_CMD_DELAY, DW9768_CMD_DELAY},
> +	{0x06, 0x41},
> +	{0x07, 0x39},
> +	{DW9768_CMD_DELAY, DW9768_CMD_DELAY},
> +};
> +
> +static struct regval_list dw9768_release_regs[] =3D {
> +	{0x02, 0x00},
> +	{DW9768_CMD_DELAY, DW9768_CMD_DELAY},
> +	{0x01, 0x00},
> +	{DW9768_CMD_DELAY, DW9768_CMD_DELAY},
> +};
> +
> +static int dw9768_write_smbus(struct dw9768 *dw9768, unsigned char reg,
> +			      unsigned char value)
> +{
> +	struct i2c_client *client =3D v4l2_get_subdevdata(&dw9768->sd);
> +	int ret;
> +

> +	if (reg =3D=3D DW9768_CMD_DELAY  && value =3D=3D DW9768_CMD_DELAY)

Indentation issue.
But see other's comments.

> +		usleep_range(DW9768_CTRL_DELAY_US,
> +			     DW9768_CTRL_DELAY_US + 100);

> +	else

This needs an explanation.

> +		ret =3D i2c_smbus_write_byte_data(client, reg, value);
> +	return ret;
> +}

I'm wondering if we can benefit from regmap I=B2C API in this driver.

> +static int __maybe_unused dw9768_vcm_suspend(struct device *dev)
> +{

> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);

isn't is simple dev_get_drvdata() ?

> +	struct dw9768 *dw9768 =3D sd_to_dw9768_vcm(sd);
> +
> +	return dw9768_power_off(dw9768);
> +}
> +
> +static int __maybe_unused dw9768_vcm_resume(struct device *dev)
> +{

> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);

Ditto.

> +	struct dw9768 *dw9768 =3D sd_to_dw9768_vcm(sd);
> +
> +	return dw9768_power_on(dw9768);
> +}

> +static const struct i2c_device_id dw9768_id_table[] =3D {
> +	{ DW9768_NAME, 0 },

> +	{ },

No comma.

> +};

> +static const struct of_device_id dw9768_of_table[] =3D {
> +	{ .compatible =3D "dongwoon,dw9768" },

> +	{ },

Ditto.

> +};

-- =

With Best Regards,
Andy Shevchenko
