From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 1/3] mfd: wm831x: Add basic device tree binding
Date: Thu, 16 Mar 2017 14:00:19 +0000
Message-ID: <20170316140019.eoe757vox5wrlkmu@dell>
References: <1489592384-11510-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1489592384-11510-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, gnurou@gmail.com, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Wed, 15 Mar 2017, Charles Keepax wrote:

> Add the basic ability to register the device through device tree, more
> work is needed to get each individual sub-driver functioning correctly
> but this is enough to get the device to probe from device tree.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
> 
> Changes since v3:
>  - No longer check return of of_match_device it should always match
>  - Move calls of of_match_device from helper function in wm831x-core
>    into both wm831x-i2c and wm831x-spi
>  - Move copy of pdata from wm831x-core into both wm831x-i2c and wm831x-spi
>  - Put device type into struct wm831x and remove the argument to that
>    effect passed to wm831x_device_init
> 
> Thanks,
> Charles
> 
>  drivers/mfd/wm831x-core.c       | 29 +++++++++++++++++++++--------
>  drivers/mfd/wm831x-i2c.c        | 21 ++++++++++++++++++++-
>  drivers/mfd/wm831x-irq.c        |  6 +++---
>  drivers/mfd/wm831x-spi.c        | 20 ++++++++++++++++++--
>  include/linux/mfd/wm831x/core.h |  9 ++++++++-
>  5 files changed, 70 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/mfd/wm831x-core.c b/drivers/mfd/wm831x-core.c
> index 3e0e99e..13a4c11 100644
> --- a/drivers/mfd/wm831x-core.c
> +++ b/drivers/mfd/wm831x-core.c
> @@ -19,6 +19,8 @@
>  #include <linux/mfd/core.h>
>  #include <linux/slab.h>
>  #include <linux/err.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
>  
>  #include <linux/mfd/wm831x/core.h>
>  #include <linux/mfd/wm831x/pdata.h>
> @@ -1613,12 +1615,24 @@ struct regmap_config wm831x_regmap_config = {
>  };
>  EXPORT_SYMBOL_GPL(wm831x_regmap_config);
>  
> +const struct of_device_id wm831x_of_match[] = {
> +	{ .compatible = "wlf,wm8310", .data = (void *)WM8310 },
> +	{ .compatible = "wlf,wm8311", .data = (void *)WM8311 },
> +	{ .compatible = "wlf,wm8312", .data = (void *)WM8312 },
> +	{ .compatible = "wlf,wm8320", .data = (void *)WM8320 },
> +	{ .compatible = "wlf,wm8321", .data = (void *)WM8321 },
> +	{ .compatible = "wlf,wm8325", .data = (void *)WM8325 },
> +	{ .compatible = "wlf,wm8326", .data = (void *)WM8326 },
> +	{ },
> +};
> +EXPORT_SYMBOL_GPL(wm831x_of_match);
> +
>  /*
>   * Instantiate the generic non-control parts of the device.
>   */
> -int wm831x_device_init(struct wm831x *wm831x, unsigned long id, int irq)
> +int wm831x_device_init(struct wm831x *wm831x, int irq)
>  {
> -	struct wm831x_pdata *pdata = dev_get_platdata(wm831x->dev);
> +	struct wm831x_pdata *pdata = &wm831x->pdata;
>  	int rev, wm831x_num;
>  	enum wm831x_parent parent;
>  	int ret, i;
> @@ -1627,8 +1641,7 @@ int wm831x_device_init(struct wm831x *wm831x, unsigned long id, int irq)
>  	mutex_init(&wm831x->key_lock);
>  	dev_set_drvdata(wm831x->dev, wm831x);
>  
> -	if (pdata)
> -		wm831x->soft_shutdown = pdata->soft_shutdown;
> +	wm831x->soft_shutdown = pdata->soft_shutdown;
>  
>  	ret = wm831x_reg_read(wm831x, WM831X_PARENT_ID);
>  	if (ret < 0) {
> @@ -1663,7 +1676,7 @@ int wm831x_device_init(struct wm831x *wm831x, unsigned long id, int irq)
>  	 */
>  	if (ret == 0) {
>  		dev_info(wm831x->dev, "Device is an engineering sample\n");
> -		ret = id;
> +		ret = wm831x->type;
>  	}
>  
>  	switch (ret) {
> @@ -1736,9 +1749,9 @@ int wm831x_device_init(struct wm831x *wm831x, unsigned long id, int irq)
>  	/* This will need revisiting in future but is OK for all
>  	 * current parts.
>  	 */
> -	if (parent != id)
> -		dev_warn(wm831x->dev, "Device was registered as a WM%lx\n",
> -			 id);
> +	if (parent != wm831x->type)
> +		dev_warn(wm831x->dev, "Device was registered as a WM%x\n",
> +			 wm831x->type);
>  
>  	/* Bootstrap the user key */
>  	ret = wm831x_reg_read(wm831x, WM831X_SECURITY_KEY);
> diff --git a/drivers/mfd/wm831x-i2c.c b/drivers/mfd/wm831x-i2c.c
> index 824bcba..c442736 100644
> --- a/drivers/mfd/wm831x-i2c.c
> +++ b/drivers/mfd/wm831x-i2c.c
> @@ -19,6 +19,8 @@
>  #include <linux/mfd/core.h>
>  #include <linux/slab.h>
>  #include <linux/err.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/regmap.h>
>  
>  #include <linux/mfd/wm831x/core.h>
> @@ -27,15 +29,28 @@
>  static int wm831x_i2c_probe(struct i2c_client *i2c,
>  			    const struct i2c_device_id *id)
>  {
> +	struct wm831x_pdata *pdata = dev_get_platdata(&i2c->dev);
>  	struct wm831x *wm831x;
> +	enum wm831x_parent type;
>  	int ret;
>  
> +	if (i2c->dev.of_node) {
> +		const struct of_device_id *id = of_match_device(wm831x_of_match,
> +								&i2c->dev);

Not keen on this.  Please declare the variable up with the others.

> +		unsigned long of_type = (unsigned long)id->data;

And this one.

> +		type = (enum wm831x_parent)of_type;

Looks like you don't even need of_type.

Just cast id->data straight into wm81x_parent.

> +	} else {
> +		type = (enum wm831x_parent)id->driver_data;
> +	}

No need for bracketing here.

>  	wm831x = devm_kzalloc(&i2c->dev, sizeof(struct wm831x), GFP_KERNEL);
>  	if (wm831x == NULL)
>  		return -ENOMEM;
>  
>  	i2c_set_clientdata(i2c, wm831x);
>  	wm831x->dev = &i2c->dev;
> +	wm831x->type = type;
>  
>  	wm831x->regmap = devm_regmap_init_i2c(i2c, &wm831x_regmap_config);
>  	if (IS_ERR(wm831x->regmap)) {
> @@ -45,7 +60,10 @@ static int wm831x_i2c_probe(struct i2c_client *i2c,
>  		return ret;
>  	}
>  
> -	return wm831x_device_init(wm831x, id->driver_data, i2c->irq);
> +	if (pdata)
> +		memcpy(&wm831x->pdata, pdata, sizeof(*pdata));
> +
> +	return wm831x_device_init(wm831x, i2c->irq);
>  }
>  
>  static int wm831x_i2c_remove(struct i2c_client *i2c)
> @@ -94,6 +112,7 @@ static struct i2c_driver wm831x_i2c_driver = {
>  	.driver = {
>  		.name = "wm831x",
>  		.pm = &wm831x_pm_ops,
> +		.of_match_table = of_match_ptr(wm831x_of_match),
>  	},
>  	.probe = wm831x_i2c_probe,
>  	.remove = wm831x_i2c_remove,
> diff --git a/drivers/mfd/wm831x-irq.c b/drivers/mfd/wm831x-irq.c
> index dfea8b9..c01239a 100644
> --- a/drivers/mfd/wm831x-irq.c
> +++ b/drivers/mfd/wm831x-irq.c
> @@ -564,7 +564,7 @@ static const struct irq_domain_ops wm831x_irq_domain_ops = {
>  
>  int wm831x_irq_init(struct wm831x *wm831x, int irq)
>  {
> -	struct wm831x_pdata *pdata = dev_get_platdata(wm831x->dev);
> +	struct wm831x_pdata *pdata = &wm831x->pdata;
>  	struct irq_domain *domain;
>  	int i, ret, irq_base;
>  
> @@ -579,7 +579,7 @@ int wm831x_irq_init(struct wm831x *wm831x, int irq)
>  	}
>  
>  	/* Try to dynamically allocate IRQs if no base is specified */
> -	if (pdata && pdata->irq_base) {
> +	if (pdata->irq_base) {
>  		irq_base = irq_alloc_descs(pdata->irq_base, 0,
>  					   WM831X_NUM_IRQS, 0);
>  		if (irq_base < 0) {
> @@ -608,7 +608,7 @@ int wm831x_irq_init(struct wm831x *wm831x, int irq)
>  		return -EINVAL;
>  	}
>  
> -	if (pdata && pdata->irq_cmos)
> +	if (pdata->irq_cmos)
>  		i = 0;
>  	else
>  		i = WM831X_IRQ_OD;
> diff --git a/drivers/mfd/wm831x-spi.c b/drivers/mfd/wm831x-spi.c
> index 80482ae..c8e7007 100644
> --- a/drivers/mfd/wm831x-spi.c
> +++ b/drivers/mfd/wm831x-spi.c
> @@ -14,6 +14,8 @@
>  
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/pm.h>
>  #include <linux/spi/spi.h>
>  #include <linux/regmap.h>
> @@ -23,12 +25,21 @@
>  
>  static int wm831x_spi_probe(struct spi_device *spi)
>  {
> +	struct wm831x_pdata *pdata = dev_get_platdata(&spi->dev);
>  	const struct spi_device_id *id = spi_get_device_id(spi);
>  	struct wm831x *wm831x;
>  	enum wm831x_parent type;
>  	int ret;
>  
> -	type = (enum wm831x_parent)id->driver_data;
> +	if (spi->dev.of_node) {
> +		const struct of_device_id *id = of_match_device(wm831x_of_match,
> +								&spi->dev);
> +		unsigned long of_type = (unsigned long)id->data;
> +
> +		type = (enum wm831x_parent)of_type;
> +	} else {
> +		type = (enum wm831x_parent)id->driver_data;
> +	}

As above.

>  	wm831x = devm_kzalloc(&spi->dev, sizeof(struct wm831x), GFP_KERNEL);
>  	if (wm831x == NULL)
> @@ -38,6 +49,7 @@ static int wm831x_spi_probe(struct spi_device *spi)
>  
>  	spi_set_drvdata(spi, wm831x);
>  	wm831x->dev = &spi->dev;
> +	wm831x->type = type;
>  
>  	wm831x->regmap = devm_regmap_init_spi(spi, &wm831x_regmap_config);
>  	if (IS_ERR(wm831x->regmap)) {
> @@ -47,7 +59,10 @@ static int wm831x_spi_probe(struct spi_device *spi)
>  		return ret;
>  	}
>  
> -	return wm831x_device_init(wm831x, type, spi->irq);
> +	if (pdata)
> +		memcpy(&wm831x->pdata, pdata, sizeof(*pdata));
> +
> +	return wm831x_device_init(wm831x, spi->irq);
>  }
>  
>  static int wm831x_spi_remove(struct spi_device *spi)
> @@ -97,6 +112,7 @@ static struct spi_driver wm831x_spi_driver = {
>  	.driver = {
>  		.name	= "wm831x",
>  		.pm	= &wm831x_spi_pm,
> +		.of_match_table = of_match_ptr(wm831x_of_match),
>  	},
>  	.id_table	= wm831x_spi_ids,
>  	.probe		= wm831x_spi_probe,
> diff --git a/include/linux/mfd/wm831x/core.h b/include/linux/mfd/wm831x/core.h
> index 76c2264..b49fa676 100644
> --- a/include/linux/mfd/wm831x/core.h
> +++ b/include/linux/mfd/wm831x/core.h
> @@ -21,6 +21,8 @@
>  #include <linux/list.h>
>  #include <linux/regmap.h>
>  #include <linux/mfd/wm831x/auxadc.h>
> +#include <linux/mfd/wm831x/pdata.h>
> +#include <linux/of.h>
>  
>  /*
>   * Register values.
> @@ -367,6 +369,9 @@ struct wm831x {
>  
>  	struct regmap *regmap;
>  
> +	struct wm831x_pdata pdata;
> +	enum wm831x_parent type;
> +
>  	int irq;  /* Our chip IRQ */
>  	struct mutex irq_lock;
>  	struct irq_domain *irq_domain;
> @@ -412,7 +417,7 @@ int wm831x_set_bits(struct wm831x *wm831x, unsigned short reg,
>  int wm831x_bulk_read(struct wm831x *wm831x, unsigned short reg,
>  		     int count, u16 *buf);
>  
> -int wm831x_device_init(struct wm831x *wm831x, unsigned long id, int irq);
> +int wm831x_device_init(struct wm831x *wm831x, int irq);
>  void wm831x_device_exit(struct wm831x *wm831x);
>  int wm831x_device_suspend(struct wm831x *wm831x);
>  void wm831x_device_shutdown(struct wm831x *wm831x);
> @@ -427,4 +432,6 @@ static inline int wm831x_irq(struct wm831x *wm831x, int irq)
>  
>  extern struct regmap_config wm831x_regmap_config;
>  
> +extern const struct of_device_id wm831x_of_match[];
> +
>  #endif

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
