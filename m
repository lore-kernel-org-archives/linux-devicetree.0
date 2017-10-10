From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH v4 2/4] phy: rcar-gen3-usb2: cleanup the
 role_{store,show}()
Date: Tue, 10 Oct 2017 09:45:56 +0200
Message-ID: <20171010074556.GM2518@verge.net.au>
References: <1507615110-26206-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1507615110-26206-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1507615110-26206-3-git-send-email-yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 10, 2017 at 02:58:28PM +0900, Yoshihiro Shimoda wrote:
> This patch cleanups the role_{store,show}() and replaces the local
> "bool" for host/device mode selection with the "enum phy_mode" in
> the role_store().
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 58 ++++++++++++++++++++++----------
>  1 file changed, 40 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> index e00e99a..7619468 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -219,14 +219,10 @@ static bool rcar_gen3_is_host(struct rcar_gen3_chan *ch)
>  	return !(readl(ch->base + USB2_COMMCTRL) & USB2_COMMCTRL_OTG_PERI);
>  }
>  
> -static ssize_t role_store(struct device *dev, struct device_attribute *attr,
> -			  const char *buf, size_t count)
> +static ssize_t rcar_gen3_otg_change_role(struct rcar_gen3_chan *ch,
> +					 enum phy_mode mode)
>  {
> -	struct rcar_gen3_chan *ch = dev_get_drvdata(dev);
> -	bool is_b_device, is_host, new_mode_is_host;
> -
> -	if (!ch->has_otg || !ch->phy->init_count)
> -		return -EIO;
> +	bool is_b_device, is_host;
>  
>  	/*
>  	 * is_b_device: true is B-Device. false is A-Device.
> @@ -234,18 +230,13 @@ static ssize_t role_store(struct device *dev, struct device_attribute *attr,
>  	 */
>  	is_b_device = rcar_gen3_check_id(ch);
>  	is_host = rcar_gen3_is_host(ch);
> -	if (!strncmp(buf, "host", strlen("host")))
> -		new_mode_is_host = true;
> -	else if (!strncmp(buf, "peripheral", strlen("peripheral")))
> -		new_mode_is_host = false;
> -	else
> -		return -EINVAL;
>  
>  	/* If current and new mode is the same, this returns the error */
> -	if (is_host == new_mode_is_host)
> +	if ((is_host && mode == PHY_MODE_USB_HOST) ||
> +	    (!is_host && mode == PHY_MODE_USB_DEVICE))

Maybe it is not worth the effort, but it seems that if
rcar_gen3_is_host returned enum phy_mode then the above
could be changed into a single comparison.

>  		return -EINVAL;
>  
> -	if (new_mode_is_host) {		/* And is_host must be false */
> +	if (mode == PHY_MODE_USB_HOST) { /* And is_host must be false */
>  		if (!is_b_device)	/* A-Peripheral */
>  			rcar_gen3_init_from_a_peri_to_a_host(ch);
>  		else			/* B-Peripheral */
> @@ -257,6 +248,32 @@ static ssize_t role_store(struct device *dev, struct device_attribute *attr,
>  			rcar_gen3_init_for_peri(ch);
>  	}
>  
> +	return 0;
> +}
> +
> +static ssize_t role_store(struct device *dev, struct device_attribute *attr,
> +			  const char *buf, size_t count)
> +{
> +	struct rcar_gen3_chan *ch = dev_get_drvdata(dev);
> +	enum phy_mode mode;
> +	ssize_t ret = -EIO;
> +
> +	if (!ch->phy->init_count)
> +		return -EIO;
> +
> +	if (!strncmp(buf, "host", strlen("host")))
> +		mode = PHY_MODE_USB_HOST;
> +	else if (!strncmp(buf, "peripheral", strlen("peripheral")))
> +		mode = PHY_MODE_USB_DEVICE;
> +	else
> +		return -EINVAL;
> +
> +	if (ch->has_otg)
> +		ret = rcar_gen3_otg_change_role(ch, mode);
> +
> +	if (ret < 0)
> +		return ret;
> +
>  	return count;
>  }
>  
> @@ -264,12 +281,17 @@ static ssize_t role_show(struct device *dev, struct device_attribute *attr,
>  			 char *buf)
>  {
>  	struct rcar_gen3_chan *ch = dev_get_drvdata(dev);
> +	bool is_host;
>  
> -	if (!ch->has_otg || !ch->phy->init_count)
> +	if (!ch->phy->init_count)
> +		return -EIO;
> +
> +	if (ch->has_otg)
> +		is_host = rcar_gen3_is_host(ch);
> +	else
>  		return -EIO;
>  
> -	return sprintf(buf, "%s\n", rcar_gen3_is_host(ch) ? "host" :
> -							    "peripheral");
> +	return sprintf(buf, "%s\n", is_host ? "host" : "peripheral");
>  }

I'm not sure why the above hunk is necessary.
They function seems logically the same before and after.

>  static DEVICE_ATTR_RW(role);
>  
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
