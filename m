From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [V2, 2/2] media: i2c: Add more sensor modes for ov8856 camera
 sensor
Date: Tue, 10 Sep 2019 20:44:50 +0300
Message-ID: <20190910174450.GJ2680@smile.fi.intel.com>
References: <20190910130446.26413-1-dongchun.zhu@mediatek.com>
 <20190910130446.26413-3-dongchun.zhu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190910130446.26413-3-dongchun.zhu@mediatek.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, drinkcat@chromium.org, srv_heupstream@mediatek.com, shengnan.wang@mediatek.com, tfiga@chromium.org, louis.kuo@mediatek.com, sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, sakari.ailus@linux.intel.com, matthias.bgg@gmail.com, bingbu.cao@intel.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 10, 2019 at 09:04:46PM +0800, dongchun.zhu@mediatek.com wrote:
> From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> 
> This patch mainly adds two more sensor modes for OV8856 CMOS image sensor.
> That is, the resolution of 1632*1224 and 3264*2448, corresponding to the bayer order of BGGR.
> The sensor revision also differs in some OTP register.

> +static int __ov8856_power_on(struct ov8856 *ov8856)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
> +	int ret;
> +
> +	ret = clk_prepare_enable(ov8856->xvclk);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to enable xvclk\n");
> +		return ret;
> +	}
> +
> +	gpiod_set_value_cansleep(ov8856->n_shutdn_gpio, GPIOD_OUT_LOW);
> +
> +	ret = regulator_bulk_enable(OV8856_NUM_SUPPLIES, ov8856->supplies);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to enable regulators\n");
> +		goto disable_clk;
> +	}
> +
> +	gpiod_set_value_cansleep(ov8856->n_shutdn_gpio, GPIOD_OUT_HIGH);
> +

> +	usleep_range(1400, 1500);

This should be commented why this is needed and from where the requirement
comes from. Also, not, that 100us, which is only ~7%, is small margin.
Recommended one is ~20%.

> +
> +	return 0;
> +
> +disable_clk:
> +	clk_disable_unprepare(ov8856->xvclk);
> +
> +	return ret;
> +}

> +	ov8856->is_1B_revision = (val == OV8856_1B_MODULE) ? 1 : 0;

!! will give same result without using ternary operator.

> +	ov8856->xvclk = devm_clk_get(&client->dev, "xvclk");
> +	if (IS_ERR(ov8856->xvclk)) {
> +		dev_err(&client->dev, "failed to get xvclk\n");
> +		return -EINVAL;
> +	}

Previously it was optional.
How did it work before and why it's not optional?

> +	ov8856->n_shutdn_gpio = devm_gpiod_get(&client->dev, "reset",
> +					       GPIOD_OUT_LOW);
> +	if (IS_ERR(ov8856->n_shutdn_gpio)) {
> +		dev_err(&client->dev, "failed to get reset-gpios\n");
> +		return -EINVAL;
> +	}

Ditto.

> +static const struct of_device_id ov8856_of_match[] = {
> +	{ .compatible = "ovti,ov8856" },

> +	{},

No comma needed for terminator line.

> +};

-- 
With Best Regards,
Andy Shevchenko
