Return-Path: <SRS0=bPz3=XI=gmail.com=andre.draszik@kernel.org>
Message-ID: <8b32b04dd746ac2e9afc07d49e824465697182de.camel@andred.net>
Subject: Re: [v5,2/4] usb: chipidea: imx: add HSIC support
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
Date: Fri, 13 Sep 2019 10:47:58 +0100
In-Reply-To: <20181211020624.9433-3-peter.chen@nxp.com>
References: <20181211020624.9433-3-peter.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
To: Peter Chen <peter.chen@nxp.com>
Cc: dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "frieder.schrempf@exceet.de" <frieder.schrempf@exceet.de>, "festevam@gmail.com" <festevam@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Peter,

On Tue, 2018-12-11 at 02:08 +0000, Peter Chen wrote:
> To support imx HSIC, there are some special requirement:
> - The HSIC pad is 1.2v, it may need to supply from external
> - The data/strobe pin needs to be pulled down first, and after
>   host mode is initialized, the strobe pin needs to be pulled up
> - During the USB suspend/resume, special setting is needed

I have an imx7d based board that is using the USBH/HSIC port.

This USB-port isn't working with this commit because the pinctrl
is non-optional (as opposed to the NXP kernel 4.19.35 where
the pinctrl is optional and it appears to work fine for us
without).

Now, I'd like to make it work with your patch here, but I
am not sure the relevant pinmux setting is documented in
the IMX7D applications processor reference manual
IMX7DRM.pdf that I have.

As far as I understand, I need to provide sth like the following:

&usbh {
        ...
        pinctrl-names = "idle", "active";
        pinctrl-0 = <&pinctrl_usbh_idle>;
        pinctrl-1 = <&pinctrl_usbh_active>;
        ...
};

pinctrl_usbh_idle: usbhgrp-idle {
        fsl,pins = <
                MX7D_PAD_USB_H_DATA__USB_H_DATA         0x........
                MX7D_PAD_USB_H_STROBE__USB_H_STROBE     0x........
        >;
};

pinctrl_usbh_active: usbhgrp-active {
        fsl,pins = <
                MX7D_PAD_USB_H_DATA__USB_H_DATA         0x........
                MX7D_PAD_USB_H_STROBE__USB_H_STROBE     0x........
         >;
};


Can you help or point me to the relevant documentation please for
defining MX7D_PAD_USB_H_DATA__USB_H_DATA &
MX7D_PAD_USB_H_STROBE__USB_H_STROBE and their register settings?

Given USB_H_DATA and USB_H_STROBE don't appear to be board specific
'No muxing' is mentioned in IMX7DRM), should any such configuration
really go into imx7s.dtsi?

Alternatively, given that this works without the extra pinctrl
dance in the i.MX specific kernel, is it really needed on i.MX7,
or can the driver be changed to make this optional here as well?
What is the right approach?


Cheers,
Andre'




> 
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 140 ++++++++++++++++++++++++++++++++-----
>  drivers/usb/chipidea/ci_hdrc_imx.h |   9 ++-
>  drivers/usb/chipidea/usbmisc_imx.c | 140 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 270 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 09b37c0d075d..56781c329db0 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -14,6 +14,7 @@
>  #include <linux/usb/chipidea.h>
>  #include <linux/usb/of.h>
>  #include <linux/clk.h>
> +#include <linux/pinctrl/consumer.h>
>  
>  #include "ci.h"
>  #include "ci_hdrc_imx.h"
> @@ -85,6 +86,9 @@ struct ci_hdrc_imx_data {
>  	bool supports_runtime_pm;
>  	bool override_phy_control;
>  	bool in_lpm;
> +	struct pinctrl *pinctrl;
> +	struct pinctrl_state *pinctrl_hsic_active;
> +	struct regulator *hsic_pad_regulator;
>  	/* SoC before i.mx6 (except imx23/imx28) needs three clks */
>  	bool need_three_clks;
>  	struct clk *clk_ipg;
> @@ -245,19 +249,49 @@ static void imx_disable_unprepare_clks(struct device *dev)
>  	}
>  }
>  
> +static int ci_hdrc_imx_notify_event(struct ci_hdrc *ci, unsigned int event)
> +{
> +	struct device *dev = ci->dev->parent;
> +	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
> +	int ret = 0;
> +
> +	switch (event) {
> +	case CI_HDRC_IMX_HSIC_ACTIVE_EVENT:
> +		ret = pinctrl_select_state(data->pinctrl,
> +				data->pinctrl_hsic_active);
> +		if (ret)
> +			dev_err(dev, "hsic_active select failed, err=%d\n",
> +				ret);
> +		break;
> +	case CI_HDRC_IMX_HSIC_SUSPEND_EVENT:
> +		ret = imx_usbmisc_hsic_set_connect(data->usbmisc_data);
> +		if (ret)
> +			dev_err(dev,
> +				"hsic_set_connect failed, err=%d\n", ret);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
>  static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  {
>  	struct ci_hdrc_imx_data *data;
>  	struct ci_hdrc_platform_data pdata = {
>  		.name		= dev_name(&pdev->dev),
>  		.capoffset	= DEF_CAPOFFSET,
> +		.notify_event	= ci_hdrc_imx_notify_event,
>  	};
>  	int ret;
>  	const struct of_device_id *of_id;
>  	const struct ci_hdrc_imx_platform_flag *imx_platform_flag;
>  	struct device_node *np = pdev->dev.of_node;
> +	struct device *dev = &pdev->dev;
> +	struct pinctrl_state *pinctrl_hsic_idle;
>  
> -	of_id = of_match_device(ci_hdrc_imx_dt_ids, &pdev->dev);
> +	of_id = of_match_device(ci_hdrc_imx_dt_ids, dev);
>  	if (!of_id)
>  		return -ENODEV;
>  
> @@ -268,19 +302,73 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	platform_set_drvdata(pdev, data);
> -	data->usbmisc_data = usbmisc_get_init_data(&pdev->dev);
> +	data->usbmisc_data = usbmisc_get_init_data(dev);
>  	if (IS_ERR(data->usbmisc_data))
>  		return PTR_ERR(data->usbmisc_data);
>  
> -	ret = imx_get_clks(&pdev->dev);
> +	if (of_usb_get_phy_mode(dev->of_node) == USBPHY_INTERFACE_MODE_HSIC) {
> +		pdata.flags |= CI_HDRC_IMX_IS_HSIC;
> +		data->usbmisc_data->hsic = 1;
> +		data->pinctrl = devm_pinctrl_get(dev);
> +		if (IS_ERR(data->pinctrl)) {
> +			dev_err(dev, "pinctrl get failed, err=%ld\n",
> +					PTR_ERR(data->pinctrl));
> +			return PTR_ERR(data->pinctrl);
> +		}
> +
> +		pinctrl_hsic_idle = pinctrl_lookup_state(data->pinctrl, "idle");
> +		if (IS_ERR(pinctrl_hsic_idle)) {
> +			dev_err(dev,
> +				"pinctrl_hsic_idle lookup failed, err=%ld\n",
> +					PTR_ERR(pinctrl_hsic_idle));
> +			return PTR_ERR(pinctrl_hsic_idle);
> +		}
> +
> +		ret = pinctrl_select_state(data->pinctrl, pinctrl_hsic_idle);
> +		if (ret) {
> +			dev_err(dev, "hsic_idle select failed, err=%d\n", ret);
> +			return ret;
> +		}
> +
> +		data->pinctrl_hsic_active = pinctrl_lookup_state(data->pinctrl,
> +								"active");
> +		if (IS_ERR(data->pinctrl_hsic_active)) {
> +			dev_err(dev,
> +				"pinctrl_hsic_active lookup failed, err=%ld\n",
> +					PTR_ERR(data->pinctrl_hsic_active));
> +			return PTR_ERR(data->pinctrl_hsic_active);
> +		}
> +
> +		data->hsic_pad_regulator = devm_regulator_get(dev, "hsic");
> +		if (PTR_ERR(data->hsic_pad_regulator) == -EPROBE_DEFER) {
> +			return -EPROBE_DEFER;
> +		} else if (PTR_ERR(data->hsic_pad_regulator) == -ENODEV) {
> +			/* no pad regualator is needed */
> +			data->hsic_pad_regulator = NULL;
> +		} else if (IS_ERR(data->hsic_pad_regulator)) {
> +			dev_err(dev, "Get HSIC pad regulator error: %ld\n",
> +					PTR_ERR(data->hsic_pad_regulator));
> +			return PTR_ERR(data->hsic_pad_regulator);
> +		}
> +
> +		if (data->hsic_pad_regulator) {
> +			ret = regulator_enable(data->hsic_pad_regulator);
> +			if (ret) {
> +				dev_err(dev,
> +					"Failed to enable HSIC pad regulator\n");
> +				return ret;
> +			}
> +		}
> +	}
> +	ret = imx_get_clks(dev);
>  	if (ret)
> -		return ret;
> +		goto disable_hsic_regulator;
>  
> -	ret = imx_prepare_enable_clks(&pdev->dev);
> +	ret = imx_prepare_enable_clks(dev);
>  	if (ret)
> -		return ret;
> +		goto disable_hsic_regulator;
>  
> -	data->phy = devm_usb_get_phy_by_phandle(&pdev->dev, "fsl,usbphy", 0);
> +	data->phy = devm_usb_get_phy_by_phandle(dev, "fsl,usbphy", 0);
>  	if (IS_ERR(data->phy)) {
>  		ret = PTR_ERR(data->phy);
>  		/* Return -EINVAL if no usbphy is available */
> @@ -305,40 +393,43 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  
>  	ret = imx_usbmisc_init(data->usbmisc_data);
>  	if (ret) {
> -		dev_err(&pdev->dev, "usbmisc init failed, ret=%d\n", ret);
> +		dev_err(dev, "usbmisc init failed, ret=%d\n", ret);
>  		goto err_clk;
>  	}
>  
> -	data->ci_pdev = ci_hdrc_add_device(&pdev->dev,
> +	data->ci_pdev = ci_hdrc_add_device(dev,
>  				pdev->resource, pdev->num_resources,
>  				&pdata);
>  	if (IS_ERR(data->ci_pdev)) {
>  		ret = PTR_ERR(data->ci_pdev);
>  		if (ret != -EPROBE_DEFER)
> -			dev_err(&pdev->dev,
> -				"ci_hdrc_add_device failed, err=%d\n", ret);
> +			dev_err(dev, "ci_hdrc_add_device failed, err=%d\n",
> +					ret);
>  		goto err_clk;
>  	}
>  
>  	ret = imx_usbmisc_init_post(data->usbmisc_data);
>  	if (ret) {
> -		dev_err(&pdev->dev, "usbmisc post failed, ret=%d\n", ret);
> +		dev_err(dev, "usbmisc post failed, ret=%d\n", ret);
>  		goto disable_device;
>  	}
>  
>  	if (data->supports_runtime_pm) {
> -		pm_runtime_set_active(&pdev->dev);
> -		pm_runtime_enable(&pdev->dev);
> +		pm_runtime_set_active(dev);
> +		pm_runtime_enable(dev);
>  	}
>  
> -	device_set_wakeup_capable(&pdev->dev, true);
> +	device_set_wakeup_capable(dev, true);
>  
>  	return 0;
>  
>  disable_device:
>  	ci_hdrc_remove_device(data->ci_pdev);
>  err_clk:
> -	imx_disable_unprepare_clks(&pdev->dev);
> +	imx_disable_unprepare_clks(dev);
> +disable_hsic_regulator:
> +	if (data->hsic_pad_regulator)
> +		ret = regulator_disable(data->hsic_pad_regulator);
>  	return ret;
>  }
>  
> @@ -355,6 +446,8 @@ static int ci_hdrc_imx_remove(struct platform_device *pdev)
>  	if (data->override_phy_control)
>  		usb_phy_shutdown(data->phy);
>  	imx_disable_unprepare_clks(&pdev->dev);
> +	if (data->hsic_pad_regulator)
> +		regulator_disable(data->hsic_pad_regulator);
>  
>  	return 0;
>  }
> @@ -367,9 +460,16 @@ static void ci_hdrc_imx_shutdown(struct platform_device *pdev)
>  static int __maybe_unused imx_controller_suspend(struct device *dev)
>  {
>  	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
> +	int ret = 0;
>  
>  	dev_dbg(dev, "at %s\n", __func__);
>  
> +	ret = imx_usbmisc_hsic_set_clk(data->usbmisc_data, false);
> +	if (ret) {
> +		dev_err(dev, "usbmisc hsic_set_clk failed, ret=%d\n", ret);
> +		return ret;
> +	}
> +
>  	imx_disable_unprepare_clks(dev);
>  	data->in_lpm = true;
>  
> @@ -400,8 +500,16 @@ static int __maybe_unused imx_controller_resume(struct device *dev)
>  		goto clk_disable;
>  	}
>  
> +	ret = imx_usbmisc_hsic_set_clk(data->usbmisc_data, true);
> +	if (ret) {
> +		dev_err(dev, "usbmisc hsic_set_clk failed, ret=%d\n", ret);
> +		goto hsic_set_clk_fail;
> +	}
> +
>  	return 0;
>  
> +hsic_set_clk_fail:
> +	imx_usbmisc_set_wakeup(data->usbmisc_data, true);
>  clk_disable:
>  	imx_disable_unprepare_clks(dev);
>  	return ret;
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.h b/drivers/usb/chipidea/ci_hdrc_imx.h
> index 204275f47573..fcecab478934 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.h
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.h
> @@ -14,10 +14,13 @@ struct imx_usbmisc_data {
>  	unsigned int oc_polarity:1; /* over current polarity if oc enabled */
>  	unsigned int evdo:1; /* set external vbus divider option */
>  	unsigned int ulpi:1; /* connected to an ULPI phy */
> +	unsigned int hsic:1; /* HSIC controlller */
>  };
>  
> -int imx_usbmisc_init(struct imx_usbmisc_data *);
> -int imx_usbmisc_init_post(struct imx_usbmisc_data *);
> -int imx_usbmisc_set_wakeup(struct imx_usbmisc_data *, bool);
> +int imx_usbmisc_init(struct imx_usbmisc_data *data);
> +int imx_usbmisc_init_post(struct imx_usbmisc_data *data);
> +int imx_usbmisc_set_wakeup(struct imx_usbmisc_data *data, bool enabled);
> +int imx_usbmisc_hsic_set_connect(struct imx_usbmisc_data *data);
> +int imx_usbmisc_hsic_set_clk(struct imx_usbmisc_data *data, bool on);
>  
>  #endif /* __DRIVER_USB_CHIPIDEA_CI_HDRC_IMX_H */
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> index def80ff547e4..43a15a6e86f5 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -64,10 +64,22 @@
>  #define MX6_BM_OVER_CUR_DIS		BIT(7)
>  #define MX6_BM_OVER_CUR_POLARITY	BIT(8)
>  #define MX6_BM_WAKEUP_ENABLE		BIT(10)
> +#define MX6_BM_UTMI_ON_CLOCK		BIT(13)
>  #define MX6_BM_ID_WAKEUP		BIT(16)
>  #define MX6_BM_VBUS_WAKEUP		BIT(17)
>  #define MX6SX_BM_DPDM_WAKEUP_EN		BIT(29)
>  #define MX6_BM_WAKEUP_INTR		BIT(31)
> +
> +#define MX6_USB_HSIC_CTRL_OFFSET	0x10
> +/* Send resume signal without 480Mhz PHY clock */
> +#define MX6SX_BM_HSIC_AUTO_RESUME	BIT(23)
> +/* set before portsc.suspendM = 1 */
> +#define MX6_BM_HSIC_DEV_CONN		BIT(21)
> +/* HSIC enable */
> +#define MX6_BM_HSIC_EN			BIT(12)
> +/* Force HSIC module 480M clock on, even when in Host is in suspend mode */
> +#define MX6_BM_HSIC_CLK_ON		BIT(11)
> +
>  #define MX6_USB_OTG1_PHY_CTRL		0x18
>  /* For imx6dql, it is host-only controller, for later imx6, it is otg's */
>  #define MX6_USB_OTG2_PHY_CTRL		0x1c
> @@ -94,6 +106,10 @@ struct usbmisc_ops {
>  	int (*post)(struct imx_usbmisc_data *data);
>  	/* It's called when we need to enable/disable usb wakeup */
>  	int (*set_wakeup)(struct imx_usbmisc_data *data, bool enabled);
> +	/* It's called before setting portsc.suspendM */
> +	int (*hsic_set_connect)(struct imx_usbmisc_data *data);
> +	/* It's called during suspend/resume */
> +	int (*hsic_set_clk)(struct imx_usbmisc_data *data, bool enabled);
>  };
>  
>  struct imx_usbmisc {
> @@ -353,6 +369,18 @@ static int usbmisc_imx6q_init(struct imx_usbmisc_data *data)
>  	writel(reg | MX6_BM_NON_BURST_SETTING,
>  			usbmisc->base + data->index * 4);
>  
> +	/* For HSIC controller */
> +	if (data->hsic) {
> +		reg = readl(usbmisc->base + data->index * 4);
> +		writel(reg | MX6_BM_UTMI_ON_CLOCK,
> +			usbmisc->base + data->index * 4);
> +		reg = readl(usbmisc->base + MX6_USB_HSIC_CTRL_OFFSET
> +			+ (data->index - 2) * 4);
> +		reg |= MX6_BM_HSIC_EN | MX6_BM_HSIC_CLK_ON;
> +		writel(reg, usbmisc->base + MX6_USB_HSIC_CTRL_OFFSET
> +			+ (data->index - 2) * 4);
> +	}
> +
>  	spin_unlock_irqrestore(&usbmisc->lock, flags);
>  
>  	usbmisc_imx6q_set_wakeup(data, false);
> @@ -360,6 +388,79 @@ static int usbmisc_imx6q_init(struct imx_usbmisc_data *data)
>  	return 0;
>  }
>  
> +static int usbmisc_imx6_hsic_get_reg_offset(struct imx_usbmisc_data *data)
> +{
> +	int offset, ret = 0;
> +
> +	if (data->index == 2 || data->index == 3) {
> +		offset = (data->index - 2) * 4;
> +	} else if (data->index == 0) {
> +		/*
> +		 * For SoCs like i.MX7D and later, each USB controller has
> +		 * its own non-core register region. For SoCs before i.MX7D,
> +		 * the first two USB controllers are non-HSIC controllers.
> +		 */
> +		offset = 0;
> +	} else {
> +		dev_err(data->dev, "index is error for usbmisc\n");
> +		ret = -EINVAL;
> +	}
> +
> +	return ret ? ret : offset;
> +}
> +
> +static int usbmisc_imx6_hsic_set_connect(struct imx_usbmisc_data *data)
> +{
> +	unsigned long flags;
> +	u32 val;
> +	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> +	int offset;
> +
> +	spin_lock_irqsave(&usbmisc->lock, flags);
> +	offset = usbmisc_imx6_hsic_get_reg_offset(data);
> +	if (offset < 0) {
> +		spin_unlock_irqrestore(&usbmisc->lock, flags);
> +		return offset;
> +	}
> +
> +	val = readl(usbmisc->base + MX6_USB_HSIC_CTRL_OFFSET + offset);
> +	if (!(val & MX6_BM_HSIC_DEV_CONN))
> +		writel(val | MX6_BM_HSIC_DEV_CONN,
> +			usbmisc->base + MX6_USB_HSIC_CTRL_OFFSET + offset);
> +
> +	spin_unlock_irqrestore(&usbmisc->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int usbmisc_imx6_hsic_set_clk(struct imx_usbmisc_data *data, bool on)
> +{
> +	unsigned long flags;
> +	u32 val;
> +	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> +	int offset;
> +
> +	spin_lock_irqsave(&usbmisc->lock, flags);
> +	offset = usbmisc_imx6_hsic_get_reg_offset(data);
> +	if (offset < 0) {
> +		spin_unlock_irqrestore(&usbmisc->lock, flags);
> +		return offset;
> +	}
> +
> +	val = readl(usbmisc->base + MX6_USB_HSIC_CTRL_OFFSET + offset);
> +	val |= MX6_BM_HSIC_EN | MX6_BM_HSIC_CLK_ON;
> +	if (on)
> +		val |= MX6_BM_HSIC_CLK_ON;
> +	else
> +		val &= ~MX6_BM_HSIC_CLK_ON;
> +
> +	writel(val, usbmisc->base + MX6_USB_HSIC_CTRL_OFFSET + offset);
> +	spin_unlock_irqrestore(&usbmisc->lock, flags);
> +
> +	return 0;
> +}
> +
> +
>  static int usbmisc_imx6sx_init(struct imx_usbmisc_data *data)
>  {
>  	void __iomem *reg = NULL;
> @@ -385,6 +486,13 @@ static int usbmisc_imx6sx_init(struct imx_usbmisc_data *data)
>  		spin_unlock_irqrestore(&usbmisc->lock, flags);
>  	}
>  
> +	/* For HSIC controller */
> +	if (data->hsic) {
> +		val = readl(usbmisc->base + MX6_USB_HSIC_CTRL_OFFSET);
> +		val |= MX6SX_BM_HSIC_AUTO_RESUME;
> +		writel(val, usbmisc->base + MX6_USB_HSIC_CTRL_OFFSET);
> +	}
> +
>  	return 0;
>  }
>  
> @@ -454,6 +562,7 @@ static int usbmisc_imx7d_init(struct imx_usbmisc_data *data)
>  	reg &= ~MX7D_USB_VBUS_WAKEUP_SOURCE_MASK;
>  	writel(reg | MX7D_USB_VBUS_WAKEUP_SOURCE_BVALID,
>  		 usbmisc->base + MX7D_USBNC_USB_CTRL2);
> +
>  	spin_unlock_irqrestore(&usbmisc->lock, flags);
>  
>  	usbmisc_imx7d_set_wakeup(data, false);
> @@ -481,6 +590,8 @@ static const struct usbmisc_ops imx53_usbmisc_ops = {
>  static const struct usbmisc_ops imx6q_usbmisc_ops = {
>  	.set_wakeup = usbmisc_imx6q_set_wakeup,
>  	.init = usbmisc_imx6q_init,
> +	.hsic_set_connect = usbmisc_imx6_hsic_set_connect,
> +	.hsic_set_clk   = usbmisc_imx6_hsic_set_clk,
>  };
>  
>  static const struct usbmisc_ops vf610_usbmisc_ops = {
> @@ -490,6 +601,8 @@ static const struct usbmisc_ops vf610_usbmisc_ops = {
>  static const struct usbmisc_ops imx6sx_usbmisc_ops = {
>  	.set_wakeup = usbmisc_imx6q_set_wakeup,
>  	.init = usbmisc_imx6sx_init,
> +	.hsic_set_connect = usbmisc_imx6_hsic_set_connect,
> +	.hsic_set_clk = usbmisc_imx6_hsic_set_clk,
>  };
>  
>  static const struct usbmisc_ops imx7d_usbmisc_ops = {
> @@ -546,6 +659,33 @@ int imx_usbmisc_set_wakeup(struct imx_usbmisc_data *data, bool enabled)
>  }
>  EXPORT_SYMBOL_GPL(imx_usbmisc_set_wakeup);
>  
> +int imx_usbmisc_hsic_set_connect(struct imx_usbmisc_data *data)
> +{
> +	struct imx_usbmisc *usbmisc;
> +
> +	if (!data)
> +		return 0;
> +
> +	usbmisc = dev_get_drvdata(data->dev);
> +	if (!usbmisc->ops->hsic_set_connect || !data->hsic)
> +		return 0;
> +	return usbmisc->ops->hsic_set_connect(data);
> +}
> +EXPORT_SYMBOL_GPL(imx_usbmisc_hsic_set_connect);
> +
> +int imx_usbmisc_hsic_set_clk(struct imx_usbmisc_data *data, bool on)
> +{
> +	struct imx_usbmisc *usbmisc;
> +
> +	if (!data)
> +		return 0;
> +
> +	usbmisc = dev_get_drvdata(data->dev);
> +	if (!usbmisc->ops->hsic_set_clk || !data->hsic)
> +		return 0;
> +	return usbmisc->ops->hsic_set_clk(data, on);
> +}
> +EXPORT_SYMBOL_GPL(imx_usbmisc_hsic_set_clk);
>  static const struct of_device_id usbmisc_imx_dt_ids[] = {
>  	{
>  		.compatible = "fsl,imx25-usbmisc",
