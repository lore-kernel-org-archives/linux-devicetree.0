From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [RFC PATCH v3 4/7] PCI: rockchip: idle the inactive PHY(s)
Date: Tue, 18 Jul 2017 13:39:14 -0700
Message-ID: <20170718203913.GD116895@google.com>
References: <1500364623-97041-1-git-send-email-shawn.lin@rock-chips.com>
 <1500364623-97041-5-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1500364623-97041-5-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Jul 18, 2017 at 03:57:00PM +0800, Shawn Lin wrote:
> Check the status of all lanes and idle the inactive one(s).
> 
> Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Tested-by: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> 
> Changes in v3:
> - use cached lanes_map to avoid powering off inactive
>   lanes twice
> 
> Changes in v2: None
> 
>  drivers/pci/host/pcie-rockchip.c | 36 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/host/pcie-rockchip.c b/drivers/pci/host/pcie-rockchip.c
> index 4cc6aec..d73223f 100644
> --- a/drivers/pci/host/pcie-rockchip.c
> +++ b/drivers/pci/host/pcie-rockchip.c
> @@ -15,6 +15,7 @@
>   * (at your option) any later version.
>   */
>  
> +#include <linux/bitrev.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
> @@ -112,6 +113,9 @@
>  #define   PCIE_CORE_TXCREDIT_CFG1_MUI_SHIFT	16
>  #define   PCIE_CORE_TXCREDIT_CFG1_MUI_ENCODE(x) \
>  		(((x) >> 3) << PCIE_CORE_TXCREDIT_CFG1_MUI_SHIFT)
> +#define PCIE_CORE_LANE_MAP             (PCIE_CORE_CTRL_MGMT_BASE + 0x200)
> +#define   PCIE_CORE_LANE_MAP_MASK              0x0000000f
> +#define   PCIE_CORE_LANE_MAP_REVERSE           BIT(16)
>  #define PCIE_CORE_INT_STATUS		(PCIE_CORE_CTRL_MGMT_BASE + 0x20c)
>  #define   PCIE_CORE_INT_PRFPE			BIT(0)
>  #define   PCIE_CORE_INT_CRFPE			BIT(1)
> @@ -229,6 +233,7 @@ struct rockchip_pcie {
>  	struct	regulator *vpcie0v9; /* 0.9V power supply */
>  	struct	gpio_desc *ep_gpio;
>  	u32	lanes;
> +	u8      lanes_map;
>  	u8	root_bus_nr;
>  	int	link_gen;
>  	struct	device *dev;
> @@ -301,6 +306,17 @@ static int rockchip_pcie_valid_device(struct rockchip_pcie *rockchip,
>  	return 1;
>  }
>  
> +static void rockchip_pcie_lane_map(struct rockchip_pcie *rockchip)
> +{
> +	u32 val = rockchip_pcie_read(rockchip, PCIE_CORE_LANE_MAP);
> +
> +	rockchip->lanes_map = val & PCIE_CORE_LANE_MAP_MASK;
> +
> +	/* The link may be using a reverse-indexed mapping. */
> +	if (val & PCIE_CORE_LANE_MAP_REVERSE)
> +		rockchip->lanes_map = bitrev8(rockchip->lanes_map) >> 4;

This might just be a matter of taste, but it seems to make more sense
for this function to just return a u8, and the caller can assign it to
'rockchip->lane_map'.

> +}
> +
>  static int rockchip_pcie_rd_own_conf(struct rockchip_pcie *rockchip,
>  				     int where, int size, u32 *val)
>  {
> @@ -737,6 +753,18 @@ static int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
>  			  PCIE_CORE_PL_CONF_LANE_SHIFT);
>  	dev_dbg(dev, "current link width is x%d\n", status);
>  
> +	if (!rockchip->legacy_phy) {
> +		/*  power off unused lane(s) */
> +		rockchip_pcie_lane_map(rockchip);

My above comment would make it a lot clearer that the above line...

> +		for (i = 0; i < MAX_LANE_NUM; i++) {
> +			if (rockchip->lanes_map & BIT(i))

...is determining the behavior here.

> +				continue;
> +
> +			dev_dbg(dev, "idling lane %d\n", i);
> +			phy_power_off(rockchip->phys[i]);
> +		}
> +	}
> +
>  	rockchip_pcie_write(rockchip, ROCKCHIP_VENDOR_ID,
>  			    PCIE_CORE_CONFIG_VENDOR);
>  	rockchip_pcie_write(rockchip,

...

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
