From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 2/2] reset: Add Broadcom STB SW_INIT reset controller
 driver
Date: Wed, 2 Jan 2019 12:38:02 -0800
Message-ID: <7387643e-b22e-fe25-08e9-1f641f8b306a@gmail.com>
References: <20181221013409.14324-1-f.fainelli@gmail.com>
 <20181221013409.14324-3-f.fainelli@gmail.com>
 <1546425895.3457.1.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1546425895.3457.1.camel@pengutronix.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Philipp,

On 1/2/19 2:44 AM, Philipp Zabel wrote:
> Hi Florian,
> 
> On Thu, 2018-12-20 at 17:34 -0800, Florian Fainelli wrote:
>> Add support for resetting blocks through the Linux reset controller
>> subsystem when reset lines are provided through a SW_INIT-style reset
>> controller on Broadcom STB SoCs.
>>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> Thank you, this looks mostly good to me. I just have a few small
> nitpicks and I'm curious about the mdelays, see below.

Thanks, answers inline.

[snip]

>> +struct brcmstb_reset {
>> +	void __iomem *base;
> 
>> +	unsigned int n_words;
>> +	struct device *dev;
> 
> These two variables are not used anywhere.

Indeed, the first one should actually be added as a check to make sure
we have a correct resource size being passed, I will add that back in.

> 
>> +	struct reset_controller_dev rcdev;
>> +};
>> +
>> +#define SW_INIT_SET		0x00
>> +#define SW_INIT_CLEAR		0x04
>> +#define SW_INIT_STATUS		0x08
>> +
>> +#define SW_INIT_BIT(id)		BIT((id) & 0x1f)
>> +#define SW_INIT_BANK(id)	(id >> 5)
> 
> Checkpatch suggests to use ((id) >> 5) here.
> 
>> +
>> +#define SW_INIT_BANK_SIZE	0x18
>> +
>> +static inline
>> +struct brcmstb_reset *to_brcmstb(struct reset_controller_dev *rcdev)
>> +{
>> +	return container_of(rcdev, struct brcmstb_reset, rcdev);
>> +}
>> +
>> +static int brcmstb_reset_assert(struct reset_controller_dev *rcdev,
>> +				unsigned long id)
>> +{
>> +	unsigned int off = SW_INIT_BANK(id) * SW_INIT_BANK_SIZE;
>> +	struct brcmstb_reset *priv = to_brcmstb(rcdev);
>> +
>> +	writel_relaxed(SW_INIT_BIT(id), priv->base + off + SW_INIT_SET);
>> +	msleep(10);
> 
> What is the purpose of the msleep(10)? Is it guaranteed that the writel
> takes effect before the msleep, or could it be lingering in some store
> buffer for (a part of) the duration? Also, checkpatch warns about this
> being < 20 ms. You could increase the delay or use usleep_range.

Good point, let me check what the real delay requirements are with the
design team, since I suspect they were just overly conservative in their
recommendations previously

> 
>> +	return 0;
>> +}
>> +
>> +static int brcmstb_reset_deassert(struct reset_controller_dev *rcdev,
>> +				  unsigned long id)
>> +{
>> +	unsigned int off = SW_INIT_BANK(id) * SW_INIT_BANK_SIZE;
>> +	struct brcmstb_reset *priv = to_brcmstb(rcdev);
>> +
>> +	writel_relaxed(SW_INIT_BIT(id), priv->base + off + SW_INIT_CLEAR);
>> +	msleep(10);
> 
> Same as above, what has to be delayed for 10 ms after deasserting the
> reset? Is this the same for all reset lines handled by this controller?

AFAICT, all lines behave the same way, as per our SoCs reset architecture.

> 
>> +
>> +	return 0;
>> +}
>> +
>> +static int brcmstb_reset_status(struct reset_controller_dev *rcdev,
>> +				unsigned long id)
>> +{
>> +	unsigned int off = SW_INIT_BANK(id) * SW_INIT_BANK_SIZE;
>> +	struct brcmstb_reset *priv = to_brcmstb(rcdev);
>> +
>> +	return readl_relaxed(priv->base + off + SW_INIT_STATUS);
> 
> Should this be
> 
> +	return readl_relaxed(priv->base + off + SW_INIT_STATUS) &
> +	       SW_INIT_BANK(id);
> 
> i.e. do the SW_INIT_STATUS registers contain 32 status bits, one for
> each reset line?

Yes they do. The same bits are used for SET/CLEAR/STATUS so this should
be something along the lines of:

return readl_relaxed(priv->base + off + SW_INIT_STATUS) & BIT(id));

thanks for spotting that!

> 
>> +}
>> +
>> +static const struct reset_control_ops brcmstb_reset_ops = {
>> +	.assert	= brcmstb_reset_assert,
>> +	.deassert = brcmstb_reset_deassert,
>> +	.status = brcmstb_reset_status,
>> +};
>> +
>> +static int brcmstb_reset_probe(struct platform_device *pdev)
>> +{
>> +	struct device *kdev = &pdev->dev;
>> +	struct brcmstb_reset *priv;
>> +	struct resource *res;
>> +
>> +	priv = devm_kzalloc(kdev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	priv->base = devm_ioremap_resource(kdev, res);
>> +	if (IS_ERR(priv->base))
>> +		return PTR_ERR(priv->base);
>> +
>> +	dev_set_drvdata(kdev, priv);
>> +
>> +	priv->rcdev.owner = THIS_MODULE;
>> +	priv->rcdev.nr_resets = (resource_size(res) / SW_INIT_BANK_SIZE) * 32;
>> +	priv->rcdev.ops = &brcmstb_reset_ops;
>> +	priv->rcdev.of_node = kdev->of_node;
>> +	/* Use defaults: 1 cell and simple xlate function */
>> +	priv->dev = kdev;
> 
> priv->dev could be removed.

Indeed, I had sprinkled dev_*() messages during debug, which required
it, but this is no longer required indeed.
-- 
Florian
