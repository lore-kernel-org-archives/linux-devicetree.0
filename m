From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCHv2 3/4] reset: socfpga: Update reset-socfpga to read the
 altr,modrst-offset property
Date: Mon, 03 Aug 2015 13:16:38 +0200
Message-ID: <1438600598.3844.10.camel@pengutronix.de>
References: <1438376591-22100-1-git-send-email-dinguyen@opensource.altera.com>
	 <1438376591-22100-4-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438376591-22100-4-git-send-email-dinguyen@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dinguyen@opensource.altera.com
Cc: dinh.linux@gmail.com, robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mark.rutland@arm.com, pawel.moll@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, s.trumtrar@pengutronix.de
List-Id: devicetree@vger.kernel.org

Hi Dinh,

Am Freitag, den 31.07.2015, 16:03 -0500 schrieb
dinguyen@opensource.altera.com:
> From: Dinh Nguyen <dinguyen@opensource.altera.com>
> 
> In order for the Arria10 to be able to re-use the reset driver for SoCFPGA
> Cyclone5/Arria5, we need to read the 'altr,modrst-offset' property from the
> device tree entry. The 'altr,modrst-offset' property is the first register
> into the reset manager that is used for bringing peripherals out of reset.
> 
> The driver assumes a modrst-offset of 0x10 in order to support legacy
> Cyclone5/Arria5 hardware.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>

Applied, thanks.

regards
Philipp

> ---
> v2: assume a modrst-offset of 0x10 if the property is not specified in order
>     to support legacy boards that do not have the property.
> ---
>  drivers/reset/reset-socfpga.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/reset/reset-socfpga.c b/drivers/reset/reset-socfpga.c
> index 0a8def3..1a6c5d6 100644
> --- a/drivers/reset/reset-socfpga.c
> +++ b/drivers/reset/reset-socfpga.c
> @@ -24,11 +24,11 @@
>  #include <linux/types.h>
>  
>  #define NR_BANKS		4
> -#define OFFSET_MODRST		0x10
>  
>  struct socfpga_reset_data {
>  	spinlock_t			lock;
>  	void __iomem			*membase;
> +	u32				modrst_offset;
>  	struct reset_controller_dev	rcdev;
>  };
>  
> @@ -45,8 +45,8 @@ static int socfpga_reset_assert(struct reset_controller_dev *rcdev,
>  
>  	spin_lock_irqsave(&data->lock, flags);
>  
> -	reg = readl(data->membase + OFFSET_MODRST + (bank * NR_BANKS));
> -	writel(reg | BIT(offset), data->membase + OFFSET_MODRST +
> +	reg = readl(data->membase + data->modrst_offset + (bank * NR_BANKS));
> +	writel(reg | BIT(offset), data->membase + data->modrst_offset +
>  				 (bank * NR_BANKS));
>  	spin_unlock_irqrestore(&data->lock, flags);
>  
> @@ -67,8 +67,8 @@ static int socfpga_reset_deassert(struct reset_controller_dev *rcdev,
>  
>  	spin_lock_irqsave(&data->lock, flags);
>  
> -	reg = readl(data->membase + OFFSET_MODRST + (bank * NR_BANKS));
> -	writel(reg & ~BIT(offset), data->membase + OFFSET_MODRST +
> +	reg = readl(data->membase + data->modrst_offset + (bank * NR_BANKS));
> +	writel(reg & ~BIT(offset), data->membase + data->modrst_offset +
>  				  (bank * NR_BANKS));
>  
>  	spin_unlock_irqrestore(&data->lock, flags);
> @@ -85,7 +85,7 @@ static int socfpga_reset_status(struct reset_controller_dev *rcdev,
>  	int offset = id % BITS_PER_LONG;
>  	u32 reg;
>  
> -	reg = readl(data->membase + OFFSET_MODRST + (bank * NR_BANKS));
> +	reg = readl(data->membase + data->modrst_offset + (bank * NR_BANKS));
>  
>  	return !(reg & BIT(offset));
>  }
> @@ -100,6 +100,8 @@ static int socfpga_reset_probe(struct platform_device *pdev)
>  {
>  	struct socfpga_reset_data *data;
>  	struct resource *res;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
>  
>  	/*
>  	 * The binding was mainlined without the required property.
> @@ -120,6 +122,11 @@ static int socfpga_reset_probe(struct platform_device *pdev)
>  	if (IS_ERR(data->membase))
>  		return PTR_ERR(data->membase);
>  
> +	if (of_property_read_u32(np, "altr,modrst-offset", &data->modrst_offset)) {
> +		dev_warn(dev, "missing altr,modrst-offset property, assuming 0x10!\n");
> +		data->modrst_offset = 0x10;
> +	}
> +
>  	spin_lock_init(&data->lock);
>  
>  	data->rcdev.owner = THIS_MODULE;
