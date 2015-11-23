From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2] phy-sun4i-usb: Add support for the host
 usb-phys found on the H3 SoC
Date: Mon, 23 Nov 2015 10:40:45 +0530
Message-ID: <56529FD5.5020305@ti.com>
References: <1448191764-11454-1-git-send-email-hdegoede@redhat.com>
Reply-To: kishon-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCOOP4VF5IDRBXV7ZKZAKGQE3EZAPMI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1448191764-11454-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Sunday 22 November 2015 04:59 PM, Hans de Goede wrote:
> From: Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>
> 
> Note this commit only adds support for phys 1-3, phy 0, the otg phy, is
> not yet (fully) supported after this commit.
> 
> Signed-off-by: Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v2:
> -Change break; after dev_err() to return, as intended, fixing a compiler
>  warning (the dev_err case should never be reached).
> ---
>  .../devicetree/bindings/phy/sun4i-usb-phy.txt      |  1 +
>  drivers/phy/phy-sun4i-usb.c                        | 67 +++++++++++++++++-----
>  2 files changed, 53 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> index 0cebf74..95736d7 100644
> --- a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> @@ -9,6 +9,7 @@ Required properties:
>    * allwinner,sun7i-a20-usb-phy
>    * allwinner,sun8i-a23-usb-phy
>    * allwinner,sun8i-a33-usb-phy
> +  * allwinner,sun8i-h3-usb-phy
>  - reg : a list of offset + length pairs
>  - reg-names :
>    * "phy_ctrl"
> diff --git a/drivers/phy/phy-sun4i-usb.c b/drivers/phy/phy-sun4i-usb.c
> index b12964b..11bc9cd 100644
> --- a/drivers/phy/phy-sun4i-usb.c
> +++ b/drivers/phy/phy-sun4i-usb.c
> @@ -46,6 +46,9 @@
>  #define REG_PHYBIST			0x08
>  #define REG_PHYTUNE			0x0c
>  #define REG_PHYCTL_A33			0x10
> +#define REG_PHY_UNK_H3			0x20
> +
> +#define REG_PMU_UNK_H3			0x10
>  
>  #define PHYCTL_DATA			BIT(7)
>  
> @@ -79,7 +82,7 @@
>  #define PHY_DISCON_TH_SEL		0x2a
>  #define PHY_SQUELCH_DETECT		0x3c
>  
> -#define MAX_PHYS			3
> +#define MAX_PHYS			4

Is it 4 only for h3-usb-phy or for others too? If so, can we add it in driver data?
>  
>  /*
>   * Note do not raise the debounce time, we must report Vusb high within 100ms
> @@ -88,12 +91,19 @@
>  #define DEBOUNCE_TIME			msecs_to_jiffies(50)
>  #define POLL_TIME			msecs_to_jiffies(250)
>  
> +enum sun4i_usb_phy_type {
> +	sun4i_a10_phy,
> +	sun8i_a33_phy,
> +	sun8i_h3_phy
> +};
> +
>  struct sun4i_usb_phy_data {
> +	struct device *dev;
>  	void __iomem *base;
>  	struct mutex mutex;
>  	int num_phys;
>  	u32 disc_thresh;
> -	bool has_a33_phyctl;
> +	enum sun4i_usb_phy_type type;
>  	struct sun4i_usb_phy {
>  		struct phy *phy;
>  		void __iomem *pmu;
> @@ -164,12 +174,18 @@ static void sun4i_usb_phy_write(struct sun4i_usb_phy *phy, u32 addr, u32 data,
>  
>  	mutex_lock(&phy_data->mutex);
>  
> -	if (phy_data->has_a33_phyctl) {
> +	switch (phy_data->type) {
> +	case sun4i_a10_phy:
> +		phyctl = phy_data->base + REG_PHYCTL_A10;
> +		break;
> +	case sun8i_a33_phy:
>  		phyctl = phy_data->base + REG_PHYCTL_A33;
>  		/* A33 needs us to set phyctl to 0 explicitly */
>  		writel(0, phyctl);
> -	} else {
> -		phyctl = phy_data->base + REG_PHYCTL_A10;
> +		break;
> +	case sun8i_h3_phy:
> +		dev_err(phy_data->dev, "H3 usb_phy_write is not supported\n");
> +		return;
>  	}
>  
>  	for (i = 0; i < len; i++) {
> @@ -230,6 +246,7 @@ static int sun4i_usb_phy_init(struct phy *_phy)
>  	struct sun4i_usb_phy *phy = phy_get_drvdata(_phy);
>  	struct sun4i_usb_phy_data *data = to_sun4i_usb_phy_data(phy);
>  	int ret;
> +	u32 val;
>  
>  	ret = clk_prepare_enable(phy->clk);
>  	if (ret)
> @@ -241,15 +258,26 @@ static int sun4i_usb_phy_init(struct phy *_phy)
>  		return ret;
>  	}
>  
> -	/* Enable USB 45 Ohm resistor calibration */
> -	if (phy->index == 0)
> -		sun4i_usb_phy_write(phy, PHY_RES45_CAL_EN, 0x01, 1);
> +	if (data->type == sun8i_h3_phy) {
> +		if (phy->index == 0) {
> +			val = readl(data->base + REG_PHY_UNK_H3);
> +			writel(val & ~1, data->base + REG_PHY_UNK_H3);
> +		}
> +
> +		val = readl(phy->pmu + REG_PMU_UNK_H3);
> +		writel(val & ~2, phy->pmu + REG_PMU_UNK_H3);
> +	} else {
> +		/* Enable USB 45 Ohm resistor calibration */
> +		if (phy->index == 0)
> +			sun4i_usb_phy_write(phy, PHY_RES45_CAL_EN, 0x01, 1);
>  
> -	/* Adjust PHY's magnitude and rate */
> -	sun4i_usb_phy_write(phy, PHY_TX_AMPLITUDE_TUNE, 0x14, 5);
> +		/* Adjust PHY's magnitude and rate */
> +		sun4i_usb_phy_write(phy, PHY_TX_AMPLITUDE_TUNE, 0x14, 5);
>  
> -	/* Disconnect threshold adjustment */
> -	sun4i_usb_phy_write(phy, PHY_DISCON_TH_SEL, data->disc_thresh, 2);
> +		/* Disconnect threshold adjustment */
> +		sun4i_usb_phy_write(phy, PHY_DISCON_TH_SEL,
> +				    data->disc_thresh, 2);
> +	}
>  
>  	sun4i_usb_phy_passby(phy, 1);
>  
> @@ -522,11 +550,14 @@ static int sun4i_usb_phy_probe(struct platform_device *pdev)
>  	mutex_init(&data->mutex);
>  	INIT_DELAYED_WORK(&data->detect, sun4i_usb_phy0_id_vbus_det_scan);
>  	dev_set_drvdata(dev, data);
> +	data->dev = dev;
>  
>  	if (of_device_is_compatible(np, "allwinner,sun5i-a13-usb-phy") ||
>  	    of_device_is_compatible(np, "allwinner,sun8i-a23-usb-phy") ||
>  	    of_device_is_compatible(np, "allwinner,sun8i-a33-usb-phy"))
>  		data->num_phys = 2;
> +	else if (of_device_is_compatible(np, "allwinner,sun8i-h3-usb-phy"))
> +		data->num_phys = 4;

this should come from driver data.
>  	else
>  		data->num_phys = 3;
>  
> @@ -538,13 +569,18 @@ static int sun4i_usb_phy_probe(struct platform_device *pdev)
>  
>  	if (of_device_is_compatible(np, "allwinner,sun6i-a31-usb-phy") ||
>  	    of_device_is_compatible(np, "allwinner,sun8i-a23-usb-phy") ||
> -	    of_device_is_compatible(np, "allwinner,sun8i-a33-usb-phy"))
> +	    of_device_is_compatible(np, "allwinner,sun8i-a33-usb-phy") ||
> +	    of_device_is_compatible(np, "allwinner,sun8i-h3-usb-phy"))
>  		dedicated_clocks = true;

same here.
>  	else
>  		dedicated_clocks = false;
>  
>  	if (of_device_is_compatible(np, "allwinner,sun8i-a33-usb-phy"))
> -		data->has_a33_phyctl = true;
> +		data->type = sun8i_a33_phy;
> +	else if (of_device_is_compatible(np, "allwinner,sun8i-h3-usb-phy"))
> +		data->type = sun8i_h3_phy;
> +	else
> +		data->type = sun4i_a10_phy;

this too can come from driver data.

Thanks
Kishon
