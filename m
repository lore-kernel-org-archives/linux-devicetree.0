From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 3/4] reset: socfpga: Update reset-socfpga to read the
 altr,modrst-offset property
Date: Tue, 28 Jul 2015 10:46:30 +0200
Message-ID: <1438073190.3193.28.camel@pengutronix.de>
References: <1438023444-11881-1-git-send-email-dinguyen@opensource.altera.com>
	 <1438023444-11881-4-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438023444-11881-4-git-send-email-dinguyen@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dinguyen@opensource.altera.com
Cc: dinh.linux@gmail.com, robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mark.rutland@arm.com, pawel.moll@arm.com, s.trumtrar@pengutronix.de, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Montag, den 27.07.2015, 13:57 -0500 schrieb
dinguyen@opensource.altera.com:
> From: Dinh Nguyen <dinguyen@opensource.altera.com>
> 
> In order for the Arria10 to be able to re-use the reset driver for SoCFPGA
> Cyclone5/Arria5, we need to read the 'altr,modrst-offset' property from the
> device tree entry. The 'altr,modrst-offset' property is the first register
> into the reset manager that is used for bringing peripherals out of reset.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
> ---
>  drivers/reset/reset-socfpga.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/reset/reset-socfpga.c b/drivers/reset/reset-socfpga.c
> index 0a8def3..9074d41 100644
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
> +		dev_err(dev, "no altr,modrst-offset specified in device tree\n");
> +		return -ENODEV;
> +	}
> +

This should fall back to the old value of 0x10 in case the device tree
property doesn't exist. Otherwise you are breaking Cyclone5/Arria5 with
older device trees.

regards
Philipp
