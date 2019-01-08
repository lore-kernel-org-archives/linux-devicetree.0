From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH V2 2/2] phy: bcm-ns-usb2: support updated DT binding with
 the CRU syscon
Date: Tue, 8 Jan 2019 09:53:21 -0800
Message-ID: <25695d19-3eed-af2b-521d-d7ac97989f94@broadcom.com>
References: <20190107082545.5529-1-zajec5@gmail.com>
 <20190108123907.19816-1-zajec5@gmail.com>
 <20190108123907.19816-2-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190108123907.19816-2-zajec5@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>, bcm-kernel-feedback-list@broadcom.com, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
List-Id: devicetree@vger.kernel.org



On 1/8/2019 4:39 AM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This adds support for the "syscon-cru" DT property which simply requires
> using regmap to access CRU registers.
> 
> The old binding has been deprecated and stays as a fallback method.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V2: Add bcm_ns_usb2_(read|write) & use syscon_regmap_lookup_by_phandle
> ---
>  drivers/phy/broadcom/phy-bcm-ns-usb2.c | 50 +++++++++++++++++++++++++++-------
>  1 file changed, 40 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/phy/broadcom/phy-bcm-ns-usb2.c b/drivers/phy/broadcom/phy-bcm-ns-usb2.c
> index 58dff80e9386..b9d3ba6f9609 100644
> --- a/drivers/phy/broadcom/phy-bcm-ns-usb2.c
> +++ b/drivers/phy/broadcom/phy-bcm-ns-usb2.c
> @@ -13,25 +13,50 @@
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
>  #include <linux/of_platform.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>  #include <linux/slab.h>
>  
> +#define CRU_USB2_CONTROL			0x64
> +#define CRU_CLKSET_KEY				0x80
> +
> +#define DMU_CRU_OFFSET				0x100
> +
>  struct bcm_ns_usb2 {
>  	struct device *dev;
>  	struct clk *ref_clk;
>  	struct phy *phy;
> +	struct regmap *cru;
>  	void __iomem *dmu;
>  };
>  
> +static void bcm_ns_usb2_read(struct bcm_ns_usb2 *usb2, unsigned int reg,
> +			     unsigned int *val)
> +{
> +	if (usb2->cru)
> +		regmap_read(usb2->cru, reg, val);
> +	else
> +		*val = readl(usb2->dmu + DMU_CRU_OFFSET + reg);
> +}
> +
> +static void bcm_ns_usb2_write(struct bcm_ns_usb2 *usb2, unsigned int reg,
> +			      unsigned int val)
> +{
> +	if (usb2->cru)
> +		regmap_write(usb2->cru, reg, val);
> +	else
> +		writel(val, usb2->dmu + DMU_CRU_OFFSET + reg);
> +}
> +
>  static int bcm_ns_usb2_phy_init(struct phy *phy)
>  {
>  	struct bcm_ns_usb2 *usb2 = phy_get_drvdata(phy);
>  	struct device *dev = usb2->dev;
> -	void __iomem *dmu = usb2->dmu;
>  	u32 ref_clk_rate, usb2ctl, usb_pll_ndiv, usb_pll_pdiv;
>  	int err = 0;
>  
> @@ -48,7 +73,7 @@ static int bcm_ns_usb2_phy_init(struct phy *phy)
>  		goto err_clk_off;
>  	}
>  
> -	usb2ctl = readl(dmu + BCMA_DMU_CRU_USB2_CONTROL);
> +	bcm_ns_usb2_read(usb2, CRU_USB2_CONTROL, &usb2ctl);
>  
>  	if (usb2ctl & BCMA_DMU_CRU_USB2_CONTROL_USB_PLL_PDIV_MASK) {
>  		usb_pll_pdiv = usb2ctl;
> @@ -62,15 +87,15 @@ static int bcm_ns_usb2_phy_init(struct phy *phy)
>  	usb_pll_ndiv = (1920000000 * usb_pll_pdiv) / ref_clk_rate;
>  
>  	/* Unlock DMU PLL settings with some magic value */
> -	writel(0x0000ea68, dmu + BCMA_DMU_CRU_CLKSET_KEY);
> +	bcm_ns_usb2_write(usb2, CRU_CLKSET_KEY, 0x0000ea68);
>  
>  	/* Write USB 2.0 PLL control setting */
>  	usb2ctl &= ~BCMA_DMU_CRU_USB2_CONTROL_USB_PLL_NDIV_MASK;
>  	usb2ctl |= usb_pll_ndiv << BCMA_DMU_CRU_USB2_CONTROL_USB_PLL_NDIV_SHIFT;
> -	writel(usb2ctl, dmu + BCMA_DMU_CRU_USB2_CONTROL);
> +	bcm_ns_usb2_write(usb2, CRU_USB2_CONTROL, usb2ctl);
>  
>  	/* Lock DMU PLL settings */
> -	writel(0x00000000, dmu + BCMA_DMU_CRU_CLKSET_KEY);
> +	bcm_ns_usb2_write(usb2, CRU_CLKSET_KEY, 0x00000000);
>  
>  err_clk_off:
>  	clk_disable_unprepare(usb2->ref_clk);
> @@ -95,11 +120,16 @@ static int bcm_ns_usb2_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	usb2->dev = dev;
>  
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dmu");
> -	usb2->dmu = devm_ioremap_resource(dev, res);
> -	if (IS_ERR(usb2->dmu)) {
> -		dev_err(dev, "Failed to map DMU regs\n");
> -		return PTR_ERR(usb2->dmu);
> +	usb2->cru = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon-cru");
> +	if (IS_ERR(usb2->cru)) {
> +		usb2->cru = NULL;
> +
> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dmu");
> +		usb2->dmu = devm_ioremap_resource(dev, res);
> +		if (IS_ERR(usb2->dmu)) {
> +			dev_err(dev, "Failed to map DMU regs\n");
> +			return PTR_ERR(usb2->dmu);
> +		}
>  	}
>  
>  	usb2->ref_clk = devm_clk_get(dev, "phy-ref-clk");
> 

Looks good to me. Thanks!

Reviewed-by: Ray Jui <ray.jui@broadcom.com>
