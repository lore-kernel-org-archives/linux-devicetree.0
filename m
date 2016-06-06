From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 02/22] amba: tegra-ahb: Use of_device_match()
Date: Mon, 6 Jun 2016 11:51:24 -0700
Message-ID: <5755C62C.4030109@gmail.com>
References: <20160606083204.19760-1-thierry.reding@gmail.com>
 <20160606083204.19760-3-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160606083204.19760-3-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/06/16 01:31, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Use the common implementation rather than the open-coded variant.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/amba/tegra-ahb.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/amba/tegra-ahb.c b/drivers/amba/tegra-ahb.c
> index b0b688c481e8..d87e76cf448c 100644
> --- a/drivers/amba/tegra-ahb.c
> +++ b/drivers/amba/tegra-ahb.c
> @@ -26,6 +26,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  
>  #include <soc/tegra/ahb.h>
>  
> @@ -143,14 +144,6 @@ static inline void gizmo_writel(struct tegra_ahb *ahb, u32 value, u32 offset)
>  }
>  
>  #ifdef CONFIG_TEGRA_IOMMU_SMMU
> -static int tegra_ahb_match_by_smmu(struct device *dev, void *data)
> -{
> -	struct tegra_ahb *ahb = dev_get_drvdata(dev);
> -	struct device_node *dn = data;
> -
> -	return (ahb->dev->of_node == dn) ? 1 : 0;
> -}
> -
>  int tegra_ahb_enable_smmu(struct device_node *dn)
>  {
>  	struct device *dev;
> @@ -158,7 +151,7 @@ int tegra_ahb_enable_smmu(struct device_node *dn)
>  	struct tegra_ahb *ahb;
>  
>  	dev = driver_find_device(&tegra_ahb_driver.driver, NULL, dn,

To use of_device_match, should that be something like:

        struct tegra_ahb *ahb = dev_get_drvdata(dev);
        dev = driver_find_device(&tegra_ahb_driver.driver, NULL, ahb->dev,


> -				 tegra_ahb_match_by_smmu);
> +				 of_device_match);
>  	if (!dev)
>  		return -EPROBE_DEFER;
>  	ahb = dev_get_drvdata(dev);
> 
