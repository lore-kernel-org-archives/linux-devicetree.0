From: Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v2 2/2] Embedded USB Debugger (EUD) driver
Date: Wed, 5 Sep 2018 15:01:26 +0530
Message-ID: <c68c466a-576f-43d9-a7dd-7ee8e0ebba3f@codeaurora.org>
References: <1536096853-30473-1-git-send-email-pheragu@codeaurora.org>
 <1536096853-30473-3-git-send-email-pheragu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1536096853-30473-3-git-send-email-pheragu@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Prakruthi Deepak Heragu <pheragu@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, ckadabi@codeaurora.org, tsoni@codeaurora.org, rnayak@codeaurora.org, bryanh@codeaurora.org, psodagud@codeaurora.org, Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi,


On 9/5/2018 3:04 AM, Prakruthi Deepak Heragu wrote:
> Add support for control peripheral of EUD (Embedded USB Debugger) to
> listen to events such as USB attach/detach, charger enable/disable, pet
> EUD to indicate software is functional.
>
> Signed-off-by: Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
> Signed-off-by: Prakruthi Deepak Heragu <pheragu@codeaurora.org>
> ---
>  drivers/soc/qcom/Kconfig  |  12 ++
>  drivers/soc/qcom/Makefile |   1 +
>  drivers/soc/qcom/eud.c    | 338 ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 351 insertions(+)
>  create mode 100644 drivers/soc/qcom/eud.c
>
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
[snip]
> +
> +#define EUD_ENABLE_CMD 1
> +#define EUD_DISABLE_CMD 0

Why not use module param as boolean? I mean zero to disable and non-zero to enable?
> +
> +#define EUD_REG_INT1_EN_MASK	0x0024
> +#define EUD_REG_INT_STATUS_1	0x0044
> +#define EUD_REG_CTL_OUT_1	0x0074
> +#define EUD_REG_VBUS_INT_CLR	0x0080
> +#define EUD_REG_CHGR_INT_CLR	0x0084
> +#define EUD_REG_CSR_EUD_EN	0x1014
> +#define EUD_REG_SW_ATTACH_DET	0x1018
> +
> +#define EUD_INT_VBUS		BIT(2)
> +#define EUD_INT_CHGR		BIT(3)
> +#define EUD_INT_SAFE_MODE	BIT(4)
> +
> +struct eud_chip {
> +	struct device			*dev;
> +	int				eud_irq;
> +	unsigned int			extcon_id;
> +	unsigned int			int_status;
> +	bool				usb_attach;
> +	bool				chgr_enable;
> +	void __iomem			*eud_reg_base;
> +	struct extcon_dev		*extcon;
> +	struct work_struct		eud_work;
> +};
> +
> +static const unsigned int eud_extcon_cable[] = {
> +	EXTCON_USB,
> +	EXTCON_CHG_USB_SDP,
> +	EXTCON_NONE,
> +};
> +
> +/*
> + * On the kernel command line specify eud.enable=1 to enable EUD.
> + * EUD is disabled by default.
> + */
> +static int enable;
> +static bool eud_ready;
> +static struct eud_chip *eud_private;
> +
> +static void enable_eud(struct eud_chip *priv)
> +{
> +	struct power_supply *usb_psy = NULL;
> +	union power_supply_propval pval = {0};
> +	union power_supply_propval tval = {0};
> +	int ret;
> +
> +	usb_psy = power_supply_get_by_name("usb");
> +	if (!usb_psy)
> +		return;
> +
> +	ret = power_supply_get_property(usb_psy,
> +			POWER_SUPPLY_PROP_PRESENT, &pval);
> +	if (ret)
> +		return;
> +
> +	ret = power_supply_get_property(usb_psy,
> +			POWER_SUPPLY_PROP_REAL_TYPE, &tval);
> +	if (ret)
> +		return;
> +

	if(!pval.intval || (tval.intval != POWER_SUPPLY_TYPE_USB &&
	    tval.intval != POWER_SUPPLY_TYPE_USB_CDP))
 		return;

	/* following if-else can be removed */
 

> +	if (pval.intval && (tval.intval == POWER_SUPPLY_TYPE_USB ||
> +	    tval.intval == POWER_SUPPLY_TYPE_USB_CDP)) {
> +		/* write into CSR to enable EUD */
> +		writel_relaxed(BIT(0), priv->eud_reg_base + EUD_REG_CSR_EUD_EN);
> +		/* Enable vbus, chgr & safe mode warning interrupts */
> +		writel_relaxed(EUD_INT_VBUS | EUD_INT_CHGR | EUD_INT_SAFE_MODE,
> +				priv->eud_reg_base + EUD_REG_INT1_EN_MASK);
> +
> +		/* Ensure Register Writes Complete */
> +		wmb();
> +
> +		/*
> +		 * Set the default cable state to usb connect and charger
> +		 * enable
> +		 */
> +		ret = extcon_set_state_sync(priv->extcon, EXTCON_USB, true);
> +		if (ret)
> +			return;
> +		ret = extcon_set_state_sync(priv->extcon,
> +				EXTCON_CHG_USB_SDP, true);
> +		if (ret)
> +			return;
> +	} else {
> +		return;
> +	}
> +
> +}
> +
> +static void disable_eud(struct eud_chip *priv)
> +{
> +	/* write into CSR to disable EUD */
> +	writel_relaxed(0, priv->eud_reg_base + EUD_REG_CSR_EUD_EN);
> +}
> +
> +static int param_eud_set(const char *val, const struct kernel_param *kp)
> +{
> +	int enable = 0;
> +
> +	if (sscanf(val, "%du", &enable) != 1)
> +		return -EINVAL;
> +
> +	if (enable != EUD_ENABLE_CMD && enable != EUD_DISABLE_CMD)
> +		return -EINVAL;
Do we really need to worry about it? 'enable' could just be treated as bool

[snip]
> +
> +
> +static irqreturn_t handle_eud_irq(int irq, void *data)
> +{
> +	struct eud_chip *chip = data;
> +	u32 reg;
> +
> +	/* read status register and find out which interrupt triggered */
> +	reg = readl_relaxed(chip->eud_reg_base + EUD_REG_INT_STATUS_1);
> +	if (reg & EUD_INT_VBUS) {
> +		chip->int_status = EUD_INT_VBUS;
> +		usb_attach_detach(chip);
> +	} else if (reg & EUD_INT_CHGR) {
> +		chip->int_status = EUD_INT_CHGR;
> +		chgr_enable_disable(chip);
> +	} else if (reg & EUD_INT_SAFE_MODE) {
> +		pet_eud(chip);
> +	} else {
> +		return IRQ_NONE;
> +	}

switch-case instead?

> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int msm_eud_probe(struct platform_device *pdev)
> +{
> +	struct eud_chip *chip;
> +	struct resource *res;
> +	int ret;
> +
> +	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip) {
> +		ret = -ENOMEM;
> +		return ret;
return -ENOMEM;
> +	}
> +
> +	platform_set_drvdata(pdev, chip);
> +
> +	chip->extcon = devm_extcon_dev_allocate(&pdev->dev, eud_extcon_cable);
> +	if (IS_ERR(chip->extcon))
> +		return PTR_ERR(chip->extcon);
> +
> +	ret = devm_extcon_dev_register(&pdev->dev, chip->extcon);
> +	if (ret)
> +		return ret;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		ret = -ENOMEM;
> +		return ret;
same here
> +	}
> +
> +	chip->eud_reg_base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(chip->eud_reg_base))
> +		return PTR_ERR(chip->eud_reg_base);
> +
> +	chip->eud_irq = platform_get_irq(pdev, 0);
> +
> +	ret = devm_request_irq(&pdev->dev, chip->eud_irq, handle_eud_irq,
> +				IRQF_TRIGGER_HIGH, NULL, chip);
> +	if (ret)
> +		return ret;
> +
> +	device_init_wakeup(&pdev->dev, true);
> +	enable_irq_wake(chip->eud_irq);
> +
> +	INIT_WORK(&chip->eud_work, eud_event_notifier);
> +
> +	eud_private = chip;
> +	eud_ready = true;
> +
> +	/* Enable EUD */
> +	if (enable)
> +		enable_eud(eud_private);
> +
> +	return 0;
> +}
> +
> +static int msm_eud_remove(struct platform_device *pdev)
> +{
> +	struct eud_chip *chip = platform_get_drvdata(pdev);
> +
> +	if (enable)
> +		disable_eud(eud_private);
> +	device_init_wakeup(&pdev->dev, false);
> +	disable_irq_wake(chip->eud_irq);
> +	platform_set_drvdata(pdev, NULL);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id msm_eud_dt_match[] = {
> +	{.compatible = "qcom,msm-eud"},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, msm_eud_dt_match);
> +
> +static struct platform_driver msm_eud_driver = {
> +	.probe		= msm_eud_probe,
> +	.remove		= msm_eud_remove,
> +	.driver		= {
> +		.name		= "msm-eud",
> +		.of_match_table = msm_eud_dt_match,
> +	},
> +};
> +module_platform_driver(msm_eud_driver);
> +
> +MODULE_DESCRIPTION("QTI EUD driver");
> +MODULE_LICENSE("GPL v2");

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
