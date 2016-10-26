From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v6] mwifiex: parse device tree node for PCIe
Date: Wed, 26 Oct 2016 13:17:36 -0700
Message-ID: <20161026201735.GA10192@localhost>
References: <1477070156-109965-1-git-send-email-rajatja@google.com>
 <1477084869-15612-1-git-send-email-rajatja@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1477084869-15612-1-git-send-email-rajatja-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rajat Jain <rajatja-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Brian Norris <briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, rajatxjain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rajat,

On Fri, Oct 21, 2016 at 02:21:09PM -0700, Rajat Jain wrote:
> From: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> 
> This patch derives device tree node from pcie bus layer framework, and
> fixes a minor memory leak in mwifiex_pcie_probe() (in failure path).
> Device tree bindings file has been renamed(marvell-sd8xxx.txt ->
> marvell-8xxx.txt) to accommodate PCIe changes.
> 
> Signed-off-by: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Rajat Jain <rajatja-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> v2: Included vendor and product IDs in compatible strings for PCIe
> chipsets(Rob Herring)
> v3: Patch is created using -M option so that it will only include diff of
> original and renamed files(Rob Herring)
> Resend v3: Resending the patch because I missed to include device tree mailing
> while sending v3.
> v4: Fix error handling, also move-on even if no device tree node is present.
> v5: Update commit log to include memory leak, return -EINVAL instead of -1.

I've been working on reworking some bugfixes for this driver, and I
noticed we have some problems w.r.t. memory leaks, and the "memory leak"
fix is not actually a fix. See below.

> v6: Remove an unnecessary error print, fix typo in commit log
> 
>  .../{marvell-sd8xxx.txt => marvell-8xxx.txt}       |  8 +++--
>  drivers/net/wireless/marvell/mwifiex/pcie.c        | 36 +++++++++++++++++++---
>  drivers/net/wireless/marvell/mwifiex/sta_cmd.c     |  3 +-
>  3 files changed, 39 insertions(+), 8 deletions(-)
>  rename Documentation/devicetree/bindings/net/wireless/{marvell-sd8xxx.txt => marvell-8xxx.txt} (91%)
> 
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
> index 3c3c4f1..f7c84d3 100644
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
> +		dev_err(dev, "required compatible string missing\n");
> +		return -EINVAL;
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
> @@ -199,13 +216,24 @@ static int mwifiex_pcie_probe(struct pci_dev *pdev,
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
> +		if (ret)
> +			goto err_free;
>  	}
>  
> +	ret = mwifiex_add_card(card, &add_remove_card_sem, &pcie_ops,
> +			       MWIFIEX_PCIE);
> +	if (ret) {
> +		pr_err("%s failed\n", __func__);
> +		goto err_free;

For most error cases in mwifiex_add_card(), we call cleanup_if(), which
currently calls kfree(card). It's currently unbalanced, so there are
*some* cases that leak. But...

> +	}
>  	return 0;
> +
> +err_free:
> +	kfree(card);

That means that most of the time, this is actually a double-free. I'd
rather have the leak than the double-free :)

Anyway, I have a patch in the works (as part of some device
init/teardown bugfixes) that will convert the allocation to
devm_kzalloc() and drop the kfree()'ing. So that'll fix the
aforementioned bug.

In your next revision (sorry), please just drop this "leak" fix.

Regards,
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
