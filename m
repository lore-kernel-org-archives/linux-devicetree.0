From: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH] mwifiex: parse hscfg_gpio info from device tree
Date: Fri, 11 Dec 2015 09:23:06 +0000
Message-ID: <f65e448bfd344867afbf6c002cdfc2bf@SC-EXCH04.marvell.com>
References: <1448618297-19803-1-git-send-email-akarwar@marvell.com>
 <87vb855qpe.fsf@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87vb855qpe.fsf-HodKDYzPHsUD5k0oWYwrnHL1okKdlPRT@public.gmane.org>
Content-Language: en-US
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Nishant Sarmukadam <nishants-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Kalle,

> -----Original Message-----
> From: Kalle Valo [mailto:kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org]
> Sent: Friday, December 11, 2015 2:04 PM
> To: Amitkumar Karwar
> Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Nishant Sarmukadam; Xinming Hu;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [PATCH] mwifiex: parse hscfg_gpio info from device tree
> 
> + devicetree list
> 
> Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org> writes:
> 
> > From: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> >
> > This patch reads hscfg_gpio from device tree and update internal
> > variable
> >
> > Signed-off-by: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > Signed-off-by: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > ---
> >  drivers/net/wireless/marvell/mwifiex/sta_cmd.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/net/wireless/marvell/mwifiex/sta_cmd.c
> > b/drivers/net/wireless/marvell/mwifiex/sta_cmd.c
> > index e486867..d28a53f 100644
> > --- a/drivers/net/wireless/marvell/mwifiex/sta_cmd.c
> > +++ b/drivers/net/wireless/marvell/mwifiex/sta_cmd.c
> > @@ -1459,10 +1459,21 @@ int mwifiex_dnld_dt_cfgdata(struct
> > mwifiex_private *priv,  #ifdef CONFIG_OF
> >  	struct property *prop;
> >  	size_t len = strlen(prefix);
> > +	u32 data;
> >  	int ret;
> >
> >  	/* look for all matching property names */
> >  	for_each_property_of_node(node, prop) {
> > +		if (!strncmp(prop->name, "marvell,hscfg_gpio",
> > +			     strlen("marvell,hscfg_gpio"))) {
> > +			if (!of_property_read_u32(priv->adapter->dt_node,
> > +						  prop->name, &data)) {
> > +				dev_dbg(priv->adapter->dev,
> > +					"hscfg gpio = 0x%x\n", data);
> > +				priv->adapter->hs_cfg.gpio = data;
> > +			}
> > +		}
> 
> I don't see this documented in Documentation/devicetree/bindings. Please
> create a binding document and review it with the device tree
> maintainers.
> 
> Actually when looking mwifiex close I see that it uses more undocumented
> device tree interfaces:
> 
> marvell_cfgdata
> marvell,caldata
> marvell,00_txpwrlimit
> 
> I think these all should be properly documented and reviewed. But I'll
> let the device tree people chime in what's the best way.
> 

Thanks for the review.
Sure. We will document existing DT interfaces and create updated version of this patch which includes documentation in bindings.

Regards,
Amit
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
