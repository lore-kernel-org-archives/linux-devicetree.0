From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH] mwifiex: parse hscfg_gpio info from device tree
Date: Fri, 11 Dec 2015 10:34:21 +0200
Message-ID: <87vb855qpe.fsf@kamboji.qca.qualcomm.com>
References: <1448618297-19803-1-git-send-email-akarwar@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448618297-19803-1-git-send-email-akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
	(Amitkumar Karwar's message of "Fri, 27 Nov 2015 01:58:17 -0800")
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nishant Sarmukadam <nishants-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

+ devicetree list

Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org> writes:

> From: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
>
> This patch reads hscfg_gpio from device tree and update
> internal variable
>
> Signed-off-by: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/net/wireless/marvell/mwifiex/sta_cmd.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/net/wireless/marvell/mwifiex/sta_cmd.c b/drivers/net/wireless/marvell/mwifiex/sta_cmd.c
> index e486867..d28a53f 100644
> --- a/drivers/net/wireless/marvell/mwifiex/sta_cmd.c
> +++ b/drivers/net/wireless/marvell/mwifiex/sta_cmd.c
> @@ -1459,10 +1459,21 @@ int mwifiex_dnld_dt_cfgdata(struct mwifiex_private *priv,
>  #ifdef CONFIG_OF
>  	struct property *prop;
>  	size_t len = strlen(prefix);
> +	u32 data;
>  	int ret;
>  
>  	/* look for all matching property names */
>  	for_each_property_of_node(node, prop) {
> +		if (!strncmp(prop->name, "marvell,hscfg_gpio",
> +			     strlen("marvell,hscfg_gpio"))) {
> +			if (!of_property_read_u32(priv->adapter->dt_node,
> +						  prop->name, &data)) {
> +				dev_dbg(priv->adapter->dev,
> +					"hscfg gpio = 0x%x\n", data);
> +				priv->adapter->hs_cfg.gpio = data;
> +			}
> +		}

I don't see this documented in Documentation/devicetree/bindings. Please
create a binding document and review it with the device tree
maintainers.

Actually when looking mwifiex close I see that it uses more undocumented
device tree interfaces:

marvell_cfgdata
marvell,caldata
marvell,00_txpwrlimit

I think these all should be properly documented and reviewed. But I'll
let the device tree people chime in what's the best way.

-- 
Kalle Valo
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
