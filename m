From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH V2 2/2] mailbox: introduce ARM SMC based mailbox
Date: Mon, 3 Jun 2019 09:32:42 -0700
Message-ID: <866db682-785a-e0a6-b394-bb65c7a694c6@gmail.com>
References: <20190603083005.4304-1-peng.fan@nxp.com>
 <20190603083005.4304-3-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190603083005.4304-3-peng.fan@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: peng.fan@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, jassisinghbrar@gmail.com, sudeep.holla@arm.com
Cc: kernel@pengutronix.de, linux-imx@nxp.com, shawnguo@kernel.org, festevam@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, andre.przywara@arm.com, van.freenix@gmail.com
List-Id: devicetree@vger.kernel.org

On 6/3/19 1:30 AM, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> This mailbox driver implements a mailbox which signals transmitted data
> via an ARM smc (secure monitor call) instruction. The mailbox receiver
> is implemented in firmware and can synchronously return data when it
> returns execution to the non-secure world again.
> An asynchronous receive path is not implemented.
> This allows the usage of a mailbox to trigger firmware actions on SoCs
> which either don't have a separate management processor or on which such
> a core is not available. A user of this mailbox could be the SCP
> interface.
> 
> Modified from Andre Przywara's v2 patch
> https://lore.kernel.org/patchwork/patch/812999/
> 
> Cc: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

[snip]

+#define ARM_SMC_MBOX_USB_IRQ	BIT(1)

That flag appears unused.

> +static int arm_smc_mbox_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mbox_controller *mbox;
> +	struct arm_smc_chan_data *chan_data;
> +	const char *method;
> +	bool use_hvc = false;
> +	int ret, irq_count, i;
> +	u32 val;
> +
> +	if (!of_property_read_u32(dev->of_node, "arm,num-chans", &val)) {
> +		if (val < 1 || val > INT_MAX) {
> +			dev_err(dev, "invalid arm,num-chans value %u of %pOFn\n", val, pdev->dev.of_node);
> +			return -EINVAL;
> +		}
> +	}

Should not the upper bound check be done against UINT_MAX since val is
an unsigned int?

> +
> +	irq_count = platform_irq_count(pdev);
> +	if (irq_count == -EPROBE_DEFER)
> +		return irq_count;
> +
> +	if (irq_count && irq_count != val) {
> +		dev_err(dev, "Interrupts not match num-chans\n");

Interrupts property does not match \"arm,num-chans\" would be more correct.

> +		return -EINVAL;
> +	}
> +
> +	if (!of_property_read_string(dev->of_node, "method", &method)) {
> +		if (!strcmp("hvc", method)) {
> +			use_hvc = true;
> +		} else if (!strcmp("smc", method)) {
> +			use_hvc = false;
> +		} else {
> +			dev_warn(dev, "invalid \"method\" property: %s\n",
> +				 method);
> +
> +			return -EINVAL;
> +		}

Having at least one method specified does not seem to be checked later
on in the code, so if I omitted to specify that property, we would still
register the mailbox and default to use "smc" since the
ARM_SMC_MBOX_USE_HVC flag would not be set, would not we want to make
sure that we do have in fact a valid method specified given the binding
documents that property as mandatory?

[snip]

> +	mbox->txdone_poll = false;
> +	mbox->txdone_irq = false;
> +	mbox->ops = &arm_smc_mbox_chan_ops;
> +	mbox->dev = dev;
> +
> +	ret = mbox_controller_register(mbox);
> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, mbox);

I would move this above mbox_controller_register() that way there is no
room for race conditions in case another part of the driver expects to
have pdev->dev.drvdata set before the mbox controller is registered.
Since you use devm_* functions for everything, you may even remove that
call.

[snip]

> +#ifndef _LINUX_ARM_SMC_MAILBOX_H_
> +#define _LINUX_ARM_SMC_MAILBOX_H_
> +
> +struct arm_smccc_mbox_cmd {
> +	unsigned long a0, a1, a2, a3, a4, a5, a6, a7;
> +};

Do you expect this to be used by other in-kernel users? If so, it might
be good to document how a0 can have a special meaning and be used as a
substitute for the function_id?
-- 
Florian
