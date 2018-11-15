From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v3 2/2] Embedded USB Debugger (EUD) driver
Date: Thu, 15 Nov 2018 15:09:47 -0800
Message-ID: <20181115230947.GC26568@kroah.com>
References: <1542310374-18474-1-git-send-email-pheragu@codeaurora.org>
 <1542310374-18474-3-git-send-email-pheragu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1542310374-18474-3-git-send-email-pheragu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Prakruthi Deepak Heragu <pheragu@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, ckadabi@codeaurora.org, tsoni@codeaurora.org, bryanh@codeaurora.org, psodagud@codeaurora.org, rnayak@codeaurora.org, Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 15, 2018 at 11:32:54AM -0800, Prakruthi Deepak Heragu wrote:
> +struct device_attribute eud_attribute = {
> +	.attr.name = "enable",
> +	.attr.mode = 0644,
> +	.show = eud_enable_show,
> +	.store = eud_enable_store,
> +};

Please use:
	static DEVICE_ATTR_RW(enable);
instead of open-coding all of that mess.

Also it makes it static, this should not be a global symbol.

> +
> +static void eud_event_notifier(struct work_struct *eud_work)
> +{
> +	struct eud_chip *chip = container_of(eud_work, struct eud_chip,
> +					eud_work);
> +	int ret;
> +
> +	if (chip->int_status == EUD_INT_VBUS) {
> +		ret = extcon_set_state_sync(chip->extcon, chip->extcon_id,
> +					chip->usb_attach);
> +		if (ret)
> +			return;
> +	} else if (chip->int_status == EUD_INT_CHGR) {
> +		ret = extcon_set_state_sync(chip->extcon, chip->extcon_id,
> +					chip->chgr_enable);
> +		if (ret)
> +			return;
> +	}
> +}
> +
> +static void usb_attach_detach(struct eud_chip *chip)
> +{
> +	u32 reg;
> +
> +	chip->extcon_id = EXTCON_USB;
> +	/* read ctl_out_1[4] to find USB attach or detach event */
> +	reg = readl_relaxed(chip->eud_reg_base + EUD_REG_CTL_OUT_1);
> +	if (reg & BIT(4))
> +		chip->usb_attach = true;
> +	else
> +		chip->usb_attach = false;
> +
> +	schedule_work(&chip->eud_work);
> +
> +	/* set and clear vbus_int_clr[0] to clear interrupt */
> +	writel_relaxed(BIT(0), chip->eud_reg_base + EUD_REG_VBUS_INT_CLR);
> +	/* Ensure Register Writes Complete */
> +	wmb();
> +	writel_relaxed(0, chip->eud_reg_base + EUD_REG_VBUS_INT_CLR);
> +}
> +
> +static void chgr_enable_disable(struct eud_chip *chip)
> +{
> +	u32 reg;
> +
> +	chip->extcon_id = EXTCON_CHG_USB_SDP;
> +	/* read ctl_out_1[6] to find charger enable or disable event */
> +	reg = readl_relaxed(chip->eud_reg_base + EUD_REG_CTL_OUT_1);
> +	if (reg & BIT(6))
> +		chip->chgr_enable = true;
> +	else
> +		chip->chgr_enable = false;
> +
> +	schedule_work(&chip->eud_work);
> +
> +	/* set and clear chgr_int_clr[0] to clear interrupt */
> +	writel_relaxed(BIT(0), chip->eud_reg_base + EUD_REG_CHGR_INT_CLR);
> +	/* Ensure Register Writes Complete */
> +	wmb();
> +	writel_relaxed(0, chip->eud_reg_base + EUD_REG_CHGR_INT_CLR);
> +}
> +
> +static void pet_eud(struct eud_chip *chip)
> +{
> +	u32 reg;
> +
> +	/* read sw_attach_det[0] to find attach/detach event */
> +	reg = readl_relaxed(chip->eud_reg_base + EUD_REG_SW_ATTACH_DET);
> +	if (reg & BIT(0)) {
> +		/* Detach & Attach pet for EUD */
> +		writel_relaxed(0, chip->eud_reg_base + EUD_REG_SW_ATTACH_DET);
> +		/* Ensure Register Writes Complete */
> +		wmb();
> +		/* Delay to make sure detach pet is done before attach pet */
> +		udelay(100);
> +		writel_relaxed(BIT(0), chip->eud_reg_base +
> +					EUD_REG_SW_ATTACH_DET);
> +		/* Ensure Register Writes Complete */
> +		wmb();
> +	} else {
> +		/* Attach pet for EUD */
> +		writel_relaxed(BIT(0), chip->eud_reg_base +
> +					EUD_REG_SW_ATTACH_DET);
> +		/* Ensure Register Writes Complete */
> +		wmb();
> +	}
> +}
> +
> +static irqreturn_t handle_eud_irq(int irq, void *data)
> +{
> +	struct eud_chip *chip = data;
> +	u32 reg;
> +
> +	/* read status register and find out which interrupt triggered */
> +	reg = readl_relaxed(chip->eud_reg_base + EUD_REG_INT_STATUS_1);
> +	switch (reg & EUD_INT_ALL) {
> +	case EUD_INT_VBUS:
> +		chip->int_status = EUD_INT_VBUS;
> +		usb_attach_detach(chip);
> +		break;
> +	case EUD_INT_CHGR:
> +		chip->int_status = EUD_INT_CHGR;
> +		chgr_enable_disable(chip);
> +		break;
> +	case EUD_INT_SAFE_MODE:
> +		pet_eud(chip);
> +		break;
> +	default:
> +		return IRQ_NONE;
> +	}
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
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	chip->dev = &pdev->dev;
> +	platform_set_drvdata(pdev, chip);
> +
> +	ret = device_create_file(&pdev->dev, &eud_attribute);
> +	if (ret)
> +		return ret;

You just raced with userspace and lost :(

Isn't there a way to add the attribute to the platform device as a group
to have it correctly added by the driver core?

Also, you are adding an attribute to a structure that you do not
control/own, are you _sure_ you want to do that?  It's a bit odd and you
don't really control the lifetime of that device.


> +
> +	chip->extcon = devm_extcon_dev_allocate(&pdev->dev, eud_extcon_cable);
> +	if (IS_ERR(chip->extcon))
> +		return PTR_ERR(chip->extcon);

As an example of this problem, the sysfs file is now there if this was
an error.  Yet that sysfs file now means nothing and if userspace
touches it bad things will happen.

So please at the very least, properly clean up your error paths.  And
look into doing this correctly.

thanks,

greg k-h
