From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4] mwifiex: parse device tree node for PCIe
Date: Thu, 20 Oct 2016 19:06:10 -0700
Message-ID: <20161021020609.GA18359@localhost>
References: <20161005194827.GA14626@localhost>
 <1477009812-95032-1-git-send-email-rajatja@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1477009812-95032-1-git-send-email-rajatja-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rajat Jain <rajatja-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Brian Norris <briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, rajatxjain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 20, 2016 at 05:30:12PM -0700, Rajat Jain wrote:
> From: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> 
> This patch derives device tree node from pcie bus layer framework.
> Device tree bindings file has been renamed(marvell-sd8xxx.txt ->
> marvell-8xxx.txt) to accomodate PCIe changes.
> 
> Signed-off-by: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Rajat Jain <rajatja-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> ---
> Since I need this patch and haven't seen updates, I thought I'll take a stab.
> 
> v2: Included vendor and product IDs in compatible strings for PCIe
> chipsets(Rob Herring)
> v3: Patch is created using -M option so that it will only include diff of
> original and renamed files(Rob Herring)
> Resend v3: Resending the patch because I missed to include device tree mailing
> while sending v3.
> v4: Fix error handling, also move-on even if no device tree node is present.
> 
>  .../{marvell-sd8xxx.txt => marvell-8xxx.txt}       |  8 +++--
>  drivers/net/wireless/marvell/mwifiex/pcie.c        | 39 +++++++++++++++++++---
>  drivers/net/wireless/marvell/mwifiex/sta_cmd.c     |  3 +-
>  3 files changed, 42 insertions(+), 8 deletions(-)
>  rename Documentation/devicetree/bindings/net/wireless/{marvell-sd8xxx.txt => marvell-8xxx.txt} (91%)

Patch looks better to me (esp. the error handling):

Reviewed-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

> diff --git a/Documentation/devicetree/bindings/net/wireless/marvell-sd8xxx.txt b/Documentation/devicetree/bindings/net/wireless/marvell-8xxx.txt
> similarity index 91%
> rename from Documentation/devicetree/bindings/net/wireless/marvell-sd8xxx.txt
> rename to Documentation/devicetree/bindings/net/wireless/marvell-8xxx.txt
> index c421aba..dfe5f8e 100644
> --- a/Documentation/devicetree/bindings/net/wireless/marvell-sd8xxx.txt
> +++ b/Documentation/devicetree/bindings/net/wireless/marvell-8xxx.txt
> @@ -1,8 +1,8 @@
> -Marvell 8897/8997 (sd8897/sd8997) SDIO devices
> +Marvell 8897/8997 (sd8897/sd8997/pcie8997) SDIO/PCIE devices
>  ------
>  
> -This node provides properties for controlling the marvell sdio wireless device.
> -The node is expected to be specified as a child node to the SDIO controller that
> +This node provides properties for controlling the marvell sdio/pcie wireless device.
> +The node is expected to be specified as a child node to the SDIO/PCIE controller that
>  connects the device to the system.
>  
>  Required properties:
> @@ -10,6 +10,8 @@ Required properties:
>    - compatible : should be one of the following:
>  	* "marvell,sd8897"
>  	* "marvell,sd8997"
> +	* "pci11ab,2b42"
> +	* "pci1b4b,2b42"
>  
>  Optional properties:
>  
> diff --git a/drivers/net/wireless/marvell/mwifiex/pcie.c b/drivers/net/wireless/marvell/mwifiex/pcie.c
> index 3c3c4f1..b3e6f06 100644
> --- a/drivers/net/wireless/marvell/mwifiex/pcie.c
> +++ b/drivers/net/wireless/marvell/mwifiex/pcie.c
> @@ -37,6 +37,22 @@ static struct mwifiex_if_ops pcie_ops;
>  
>  static struct semaphore add_remove_card_sem;
>  
> +static const struct of_device_id mwifiex_pcie_of_match_table[] = {
> +	{ .compatible = "pci11ab,2b42" },
> +	{ .compatible = "pci1b4b,2b42" },
> +	{ }
> +};
> +
> +static int mwifiex_pcie_probe_of(struct device *dev)
> +{
> +	if (!of_match_node(mwifiex_pcie_of_match_table, dev->of_node)) {
> +		pr_err("pcie device node not available");
> +		return -1;

Not a big fan of these '-1' error codes, instead or proper error codes.
But that's preexisting. (Or at least, this matches the sdio.c version.)

> +	}
> +
> +	return 0;
> +}
> +
>  static int
>  mwifiex_map_pci_memory(struct mwifiex_adapter *adapter, struct sk_buff *skb,
>  		       size_t size, int flags)
> @@ -178,6 +194,7 @@ static int mwifiex_pcie_probe(struct pci_dev *pdev,
>  					const struct pci_device_id *ent)
>  {
>  	struct pcie_service_card *card;
> +	int ret;
>  
>  	pr_debug("info: vendor=0x%4.04X device=0x%4.04X rev=%d\n",
>  		 pdev->vendor, pdev->device, pdev->revision);
> @@ -199,13 +216,27 @@ static int mwifiex_pcie_probe(struct pci_dev *pdev,
>  		card->pcie.can_ext_scan = data->can_ext_scan;
>  	}
>  
> -	if (mwifiex_add_card(card, &add_remove_card_sem, &pcie_ops,
> -			     MWIFIEX_PCIE)) {
> -		pr_err("%s failed\n", __func__);
> -		return -1;
> +	/* device tree node parsing and platform specific configuration*/
> +	if (pdev->dev.of_node) {
> +		ret = mwifiex_pcie_probe_of(&pdev->dev);
> +		if (ret) {
> +			dev_err(&pdev->dev,
> +				"required compatible string missing\n");
> +			goto err_free;
> +		}
>  	}
>  
> +	ret = mwifiex_add_card(card, &add_remove_card_sem, &pcie_ops,
> +			       MWIFIEX_PCIE);
> +	if (ret) {
> +		pr_err("%s failed\n", __func__);
> +		goto err_free;
> +	}
>  	return 0;
> +
> +err_free:
> +	kfree(card);

Is it just me, or does this fix a memory leak too? Not a big deal IMO,
but maybe worth noting.

Brian

> +	return ret;
>  }
>  
>  /*
> diff --git a/drivers/net/wireless/marvell/mwifiex/sta_cmd.c b/drivers/net/wireless/marvell/mwifiex/sta_cmd.c
> index 2a162c3..c8dccf5 100644
> --- a/drivers/net/wireless/marvell/mwifiex/sta_cmd.c
> +++ b/drivers/net/wireless/marvell/mwifiex/sta_cmd.c
> @@ -2218,7 +2218,8 @@ int mwifiex_sta_init_cmd(struct mwifiex_private *priv, u8 first_sta, bool init)
>  		 * The cal-data can be read from device tree and/or
>  		 * a configuration file and downloaded to firmware.
>  		 */
> -		if (priv->adapter->iface_type == MWIFIEX_SDIO &&
> +		if ((priv->adapter->iface_type == MWIFIEX_SDIO ||
> +		    priv->adapter->iface_type == MWIFIEX_PCIE) &&
>  		    adapter->dev->of_node) {
>  			adapter->dt_node = adapter->dev->of_node;
>  			if (of_property_read_u32(adapter->dt_node,
> -- 
> 2.8.0.rc3.226.g39d4020
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
