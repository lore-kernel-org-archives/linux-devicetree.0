From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v5 2/9] mfd: Add ST Multi-Function eXpander (STMFX) core
 driver
Date: Wed, 8 May 2019 09:36:22 +0100
Message-ID: <20190508083622.GE3995@dell>
References: <1554794651-6874-1-git-send-email-amelie.delaunay@st.com>
 <1554794651-6874-3-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1554794651-6874-3-git-send-email-amelie.delaunay@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

On Tue, 09 Apr 2019, Amelie Delaunay wrote:

> STMicroelectronics Multi-Function eXpander (STMFX) is a slave controller
> using I2C for communication with the main MCU. Main features are:
> - 16 fast GPIOs individually configurable in input/output
> - 8 alternate GPIOs individually configurable in input/output when other
> STMFX functions are not used
> - Main MCU IDD measurement
> - Resistive touchscreen controller
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
>  drivers/mfd/Kconfig       |  13 ++
>  drivers/mfd/Makefile      |   2 +-
>  drivers/mfd/stmfx.c       | 566 ++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/stmfx.h | 123 ++++++++++
>  4 files changed, 703 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/mfd/stmfx.c
>  create mode 100644 include/linux/mfd/stmfx.h
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 3443f1a..9783e18 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1907,6 +1907,19 @@ config MFD_STPMIC1
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called stpmic1.
>  
> +config MFD_STMFX
> +	tristate "Support for STMicroelectronics Multi-Function eXpander (STMFX)"
> +	depends on I2C
> +	depends on OF || COMPILE_TEST
> +	select MFD_CORE
> +	select REGMAP_I2C
> +	help
> +	  Support for the STMicroelectronics Multi-Function eXpander.
> +
> +	  This driver provides common support for accessing the device,
> +	  additional drivers must be enabled in order to use the functionality
> +	  of the device.
> +
>  menu "Multimedia Capabilities Port drivers"
>  	depends on ARCH_SA1100
>  
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index b4569ed7..614eea8 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -246,4 +246,4 @@ obj-$(CONFIG_MFD_MXS_LRADC)     += mxs-lradc.o
>  obj-$(CONFIG_MFD_SC27XX_PMIC)	+= sprd-sc27xx-spi.o
>  obj-$(CONFIG_RAVE_SP_CORE)	+= rave-sp.o
>  obj-$(CONFIG_MFD_ROHM_BD718XX)	+= rohm-bd718x7.o
> -
> +obj-$(CONFIG_MFD_STMFX) 	+= stmfx.o
> diff --git a/drivers/mfd/stmfx.c b/drivers/mfd/stmfx.c
> new file mode 100644
> index 0000000..59f0a03
> --- /dev/null
> +++ b/drivers/mfd/stmfx.c
> @@ -0,0 +1,566 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for STMicroelectronics Multi-Function eXpander (STMFX) core
> + *
> + * Copyright (C) 2019 STMicroelectronics
> + * Author(s): Amelie Delaunay <amelie.delaunay@st.com>.
> + */
> +#include <linux/bitfield.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/stmfx.h>
> +#include <linux/module.h>
> +#include <linux/regulator/consumer.h>

[...]

> +static int stmfx_chip_init(struct i2c_client *client)
> +{
> +	struct stmfx *stmfx = i2c_get_clientdata(client);
> +	u32 id;
> +	u8 version[2];
> +	int ret;
> +
> +	stmfx->vdd = devm_regulator_get_optional(&client->dev, "vdd");
> +	if (IS_ERR(stmfx->vdd)) {
> +		ret = PTR_ERR(stmfx->vdd);
> +		if (ret != -ENODEV) {
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(&client->dev,
> +					"Can't get VDD regulator:%d\n", ret);
> +			return ret;
> +		}

Any reason you've decided to stick with this 3-layer nested if instead
of going with my suggestion?

> +	} else {
> +		ret = regulator_enable(stmfx->vdd);
> +		if (ret) {
> +			dev_err(&client->dev, "VDD enable failed: %d\n", ret);
> +			return ret;
> +		}
> +	}

[...]

> +#ifdef CONFIG_PM_SLEEP
> +static int stmfx_backup_regs(struct stmfx *stmfx)
> +{
> +	int ret;
> +
> +	ret = regmap_raw_read(stmfx->map, STMFX_REG_SYS_CTRL,
> +			      &stmfx->bkp_sysctrl, sizeof(stmfx->bkp_sysctrl));
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_raw_read(stmfx->map, STMFX_REG_IRQ_OUT_PIN,
> +			      &stmfx->bkp_irqoutpin,
> +			      sizeof(stmfx->bkp_irqoutpin));
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int stmfx_restore_regs(struct stmfx *stmfx)
> +{
> +	int ret;
> +
> +	ret = regmap_raw_write(stmfx->map, STMFX_REG_SYS_CTRL,
> +			       &stmfx->bkp_sysctrl, sizeof(stmfx->bkp_sysctrl));
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_raw_write(stmfx->map, STMFX_REG_IRQ_OUT_PIN,
> +			       &stmfx->bkp_irqoutpin,
> +			       sizeof(stmfx->bkp_irqoutpin));
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_raw_write(stmfx->map, STMFX_REG_IRQ_SRC_EN,
> +			       &stmfx->irq_src, sizeof(stmfx->irq_src));
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int stmfx_suspend(struct device *dev)
> +{
> +	struct stmfx *stmfx = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = stmfx_backup_regs(stmfx);
> +	if (ret) {
> +		dev_err(stmfx->dev, "Registers backup failure\n");
> +		return ret;
> +	}

This doesn't need to be an extra function.  You're just adding more
lines of code for no real gain in reusability/readability.

> +	if (!IS_ERR(stmfx->vdd)) {
> +		ret = regulator_disable(stmfx->vdd);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int stmfx_resume(struct device *dev)
> +{
> +	struct stmfx *stmfx = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (!IS_ERR(stmfx->vdd)) {
> +		ret = regulator_enable(stmfx->vdd);
> +		if (ret) {
> +			dev_err(stmfx->dev,
> +				"VDD enable failed: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	ret = stmfx_restore_regs(stmfx);
> +	if (ret) {
> +		dev_err(stmfx->dev, "Registers restoration failure\n");
> +		return ret;
> +	}

This doesn't need to be an extra function.  You're just adding more
lines of code for no real gain in reusability/readability.

> +	return 0;
> +}
> +#endif

[...]

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
