From: Amelie DELAUNAY <amelie.delaunay@st.com>
Subject: Re: [PATCH v4 2/9] mfd: Add ST Multi-Function eXpander (STMFX) core
 driver
Date: Thu, 4 Apr 2019 13:22:12 +0000
Message-ID: <f6b36d98-956e-1d4c-d436-632bda8a3bef@st.com>
References: <1551260094-32570-1-git-send-email-amelie.delaunay@st.com>
 <1551260094-32570-3-git-send-email-amelie.delaunay@st.com>
 <20190403100101.GK11301@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190403100101.GK11301@dell>
Content-Language: en-US
Content-ID: <FB09F3E90CC3C7479C6834A3D1A3612F@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 4/3/19 12:01 PM, Lee Jones wrote:
> On Wed, 27 Feb 2019, Amelie Delaunay wrote:
> 
>> STMicroelectronics Multi-Function eXpander (STMFX) is a slave controller
>> using I2C for communication with the main MCU. Main features are:
>> - 16 fast GPIOs individually configurable in input/output
>> - 8 alternate GPIOs individually configurable in input/output when other
>> STMFX functions are not used
>> - Main MCU IDD measurement
>> - Resistive touchscreen controller
>>
>> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
>> ---
>>   drivers/mfd/Kconfig       |  13 ++
>>   drivers/mfd/Makefile      |   2 +-
>>   drivers/mfd/stmfx.c       | 568 ++++++++++++++++++++++++++++++++++++++++++++++
>>   include/linux/mfd/stmfx.h | 123 ++++++++++
>>   4 files changed, 705 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/mfd/stmfx.c
>>   create mode 100644 include/linux/mfd/stmfx.h
> 
> Very nice first attempt for what is a pretty complex driver.
> 
> Just a couple of nits below.
> 
> [...]
> 

Thanks for reviewing.

>> +static int stmfx_chip_init(struct i2c_client *client)
>> +{
>> +	struct stmfx *stmfx = i2c_get_clientdata(client);
>> +	u32 id;
>> +	u8 version[2];
>> +	int ret;
>> +
>> +	stmfx->vdd = devm_regulator_get_optional(&client->dev, "vdd");
>> +	if (IS_ERR(stmfx->vdd)) {
>> +		ret = PTR_ERR(stmfx->vdd);
>> +		if (ret != -ENODEV) {
>> +			if (ret != -EPROBE_DEFER)
>> +				dev_err(&client->dev,
>> +					"No VDD regulator found:%d\n", ret);
> 
> Actually -ENODEV means this, which is okay.
> 
> In this case we failed to obtain a provided regulator.
> 

Ok, "Can't get VDD regulator" instead of "No VDD regulator found" is 
more accurate.

>> +			return ret;
>> +		}
>> +	} else {
> 
> 	if (IS_ERR(stmfx->vdd) && PTR_ERR(stmfx->vdd) == -EPROBE_DEFER) {
> 		return PTR_ERR(stmfx->vdd);
> 	} else (IS_ERR(stmfx->vdd) && PTR_ERR(stmfx->vdd) == -ENODEV) {
> 		stmfx->vdd = NULL;
> 	} else (IS_ERR(stmfx->vdd))) {
> 		dev_err(&client->dev, "Failed to get VDD regulator:%d\n", ret);
> 		return PTR_ERR(stmfx->vdd);
> 	}
> 
> 	if (stmfx->vdd) {
> 
>> +		ret = regulator_enable(stmfx->vdd);
>> +		if (ret) {
>> +			dev_err(&client->dev, "VDD enable failed: %d\n", ret);
>> +			return ret;
>> +		}
>> +	}
>> +
> 
> [...]
> 
>> +static const struct resource stmfx_ts_resources[] = {
>> +	DEFINE_RES_IRQ(STMFX_REG_IRQ_SRC_EN_TS_DET),
>> +	DEFINE_RES_IRQ(STMFX_REG_IRQ_SRC_EN_TS_NE),
>> +	DEFINE_RES_IRQ(STMFX_REG_IRQ_SRC_EN_TS_TH),
>> +	DEFINE_RES_IRQ(STMFX_REG_IRQ_SRC_EN_TS_FULL),
>> +	DEFINE_RES_IRQ(STMFX_REG_IRQ_SRC_EN_TS_OVF),
>> +};
> 
> Please move everything from here --------------->
> 
>> +static struct mfd_cell stmfx_cells[] = {
>> +	{
>> +		.of_compatible = "st,stmfx-0300-pinctrl",
>> +		.name = "stmfx-pinctrl",
>> +		.resources = stmfx_pinctrl_resources,
>> +		.num_resources = ARRAY_SIZE(stmfx_pinctrl_resources),
>> +	},
>> +	{
>> +		.of_compatible = "st,stmfx-0300-idd",
>> +		.name = "stmfx-idd",
>> +		.resources = stmfx_idd_resources,
>> +		.num_resources = ARRAY_SIZE(stmfx_idd_resources),
>> +	},
>> +	{
>> +		.of_compatible = "st,stmfx-0300-ts",
>> +		.name = "stmfx-ts",
>> +		.resources = stmfx_ts_resources,
>> +		.num_resources = ARRAY_SIZE(stmfx_ts_resources),
>> +	},
>> +};
>> +
>> +static bool stmfx_reg_volatile(struct device *dev, unsigned int reg)
>> +{
>> +	switch (reg) {
>> +	case STMFX_REG_SYS_CTRL:
>> +	case STMFX_REG_IRQ_SRC_EN:
>> +	case STMFX_REG_IRQ_PENDING:
>> +	case STMFX_REG_IRQ_GPI_PENDING1:
>> +	case STMFX_REG_IRQ_GPI_PENDING2:
>> +	case STMFX_REG_IRQ_GPI_PENDING3:
>> +	case STMFX_REG_GPIO_STATE1:
>> +	case STMFX_REG_GPIO_STATE2:
>> +	case STMFX_REG_GPIO_STATE3:
>> +	case STMFX_REG_IRQ_GPI_SRC1:
>> +	case STMFX_REG_IRQ_GPI_SRC2:
>> +	case STMFX_REG_IRQ_GPI_SRC3:
>> +	case STMFX_REG_GPO_SET1:
>> +	case STMFX_REG_GPO_SET2:
>> +	case STMFX_REG_GPO_SET3:
>> +	case STMFX_REG_GPO_CLR1:
>> +	case STMFX_REG_GPO_CLR2:
>> +	case STMFX_REG_GPO_CLR3:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
>> +
>> +static bool stmfx_reg_writeable(struct device *dev, unsigned int reg)
>> +{
>> +	return (reg >= STMFX_REG_SYS_CTRL);
>> +}
>> +
>> +static const struct regmap_config stmfx_regmap_config = {
>> +	.reg_bits	= 8,
>> +	.reg_stride	= 1,
>> +	.val_bits	= 8,
>> +	.max_register	= STMFX_REG_MAX,
>> +	.volatile_reg	= stmfx_reg_volatile,
>> +	.writeable_reg	= stmfx_reg_writeable,
>> +	.cache_type	= REGCACHE_RBTREE,
>> +};
> 
> ----------------------->
> 
> ... to here, up to the top, just below the includes.
> 

I'll move the regmap_config & mfx_cell declarations just below the includes.

>> +static int stmfx_probe(struct i2c_client *client,
>> +		       const struct i2c_device_id *id)
>> +{
>> +	struct device *dev = &client->dev;
>> +	struct stmfx *stmfx;
>> +	int i, ret;
>> +
>> +	stmfx = devm_kzalloc(dev, sizeof(*stmfx), GFP_KERNEL);
>> +	if (!stmfx)
>> +		return -ENOMEM;
>> +
>> +	i2c_set_clientdata(client, stmfx);
>> +
>> +	stmfx->dev = dev;
>> +
>> +	stmfx->map = devm_regmap_init_i2c(client, &stmfx_regmap_config);
>> +	if (IS_ERR(stmfx->map)) {
>> +		ret = PTR_ERR(stmfx->map);
>> +		dev_err(dev, "Failed to allocate register map: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	mutex_init(&stmfx->lock);
>> +
>> +	ret = stmfx_chip_init(client);
>> +	if (ret) {
>> +		if (ret == -ETIMEDOUT)
>> +			return -EPROBE_DEFER;
>> +		return ret;
>> +	}
>> +
>> +	if (client->irq < 0) {
>> +		dev_err(dev, "Failed to get IRQ: %d\n", client->irq);
>> +		ret = client->irq;
>> +		goto err_chip_exit;
>> +	}
>> +
>> +	ret = stmfx_irq_init(client);
>> +	if (ret)
>> +		goto err_chip_exit;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(stmfx_cells); i++) {
>> +		stmfx_cells[i].platform_data = stmfx;
>> +		stmfx_cells[i].pdata_size = sizeof(struct stmfx);
>> +	}
> 
> Pass this though dev_get_drvdata() instead.
> 
> ...
> 
> Actually, didn't you already set this with i2c_set_clientdata()?  That
> does exactly the same thing.  So you can get this back from the client
> via i2c_get_clientdata().  No need to send it though platform data.
> 

Yes, I agree. I'll remove this loop and use 
dev_get_drvdata(pdev->dev.parent) in child drivers.

>> +	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
>> +				   stmfx_cells, ARRAY_SIZE(stmfx_cells), NULL,
>> +				   0, stmfx->irq_domain);
>> +	if (ret)
>> +		goto err_irq_exit;
>> +
>> +	return 0;
>> +
>> +err_irq_exit:
>> +	stmfx_irq_exit(client);
>> +err_chip_exit:
>> +	stmfx_chip_exit(client);
>> +
>> +	return ret;
>> +}
>> +
>> +static int stmfx_remove(struct i2c_client *client)
>> +{
>> +	stmfx_irq_exit(client);
>> +
>> +	return stmfx_chip_exit(client);
>> +}
>> +
>> +#ifdef CONFIG_PM_SLEEP
>> +static int stmfx_backup_regs(struct stmfx *stmfx)
>> +{
>> +	int ret;
>> +
>> +	ret = regmap_raw_read(stmfx->map, STMFX_REG_SYS_CTRL,
>> +			      &stmfx->bkp_sysctrl, sizeof(stmfx->bkp_sysctrl));
>> +	if (ret)
>> +		return ret;
> 
> '\n' here.
> 
>> +	ret = regmap_raw_read(stmfx->map, STMFX_REG_IRQ_OUT_PIN,
>> +			      &stmfx->bkp_irqoutpin,
>> +			      sizeof(stmfx->bkp_irqoutpin));
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int stmfx_restore_regs(struct stmfx *stmfx)
>> +{
>> +	int ret;
>> +
>> +	ret = regmap_raw_write(stmfx->map, STMFX_REG_SYS_CTRL,
>> +			       &stmfx->bkp_sysctrl, sizeof(stmfx->bkp_sysctrl));
>> +	if (ret)
>> +		return ret;
> 
> '\n' here.
> 
>> +	ret = regmap_raw_write(stmfx->map, STMFX_REG_IRQ_OUT_PIN,
>> +			       &stmfx->bkp_irqoutpin,
>> +			       sizeof(stmfx->bkp_irqoutpin));
>> +	if (ret)
>> +		return ret;
> 
> '\n' here.
> 
>> +	ret = regmap_raw_write(stmfx->map, STMFX_REG_IRQ_SRC_EN,
>> +			       &stmfx->irq_src, sizeof(stmfx->irq_src));
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int stmfx_suspend(struct device *dev)
>> +{
>> +	struct stmfx *stmfx = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	ret = stmfx_backup_regs(stmfx);
> 
> Don't think you need a separate function for this.  Just move the
> regmap_raw_write() commands here.
> 

I used a separate function to have only one dev_err in case of 
backup/restore failure.

>> +	if (ret) {
>> +		dev_err(stmfx->dev, "Registers backup failure\n");
>> +		return ret;
>> +	}
>> +
>> +	if (!IS_ERR(stmfx->vdd)) {
>> +		ret = regulator_disable(stmfx->vdd);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int stmfx_resume(struct device *dev)
>> +{
>> +	struct stmfx *stmfx = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	if (!IS_ERR(stmfx->vdd)) {
>> +		ret = regulator_enable(stmfx->vdd);
>> +		if (ret) {
>> +			dev_err(stmfx->dev,
>> +				"VDD enable failed: %d\n", ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	ret = stmfx_restore_regs(stmfx);
> 
> As above.
> 
>> +	if (ret) {
>> +		dev_err(stmfx->dev, "Registers restoration failure\n");
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +#endif
>> +
>> +static SIMPLE_DEV_PM_OPS(stmfx_dev_pm_ops, stmfx_suspend, stmfx_resume);
>> +
>> +static const struct of_device_id stmfx_of_match[] = {
>> +	{ .compatible = "st,stmfx-0300", },
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(of, stmfx_of_match);
>> +
>> +static struct i2c_driver stmfx_driver = {
>> +	.driver = {
>> +		.name = "stmfx-core",
>> +		.of_match_table = of_match_ptr(stmfx_of_match),
>> +		.pm = &stmfx_dev_pm_ops,
>> +	},
>> +	.probe = stmfx_probe,
>> +	.remove = stmfx_remove,
>> +};
>> +module_i2c_driver(stmfx_driver);
>> +
>> +MODULE_DESCRIPTION("STMFX core driver");
>> +MODULE_AUTHOR("Amelie Delaunay <amelie.delaunay@st.com>");
>> +MODULE_LICENSE("GPL v2");
> 
> [...]
> 

I am prepare a v5. Is it OK for you if I keep the backup/restore 
separate functions ?

Regards,
Amelie
