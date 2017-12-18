From: Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH net-next v6 2/2] net: ethernet: socionext: add AVE ethernet driver
Date: Mon, 18 Dec 2017 12:51:06 +0900
Message-ID: <20171218125105.962D.4A936039@socionext.com>
References: <1513245910-15961-3-git-send-email-hayashi.kunihiko@socionext.com> <20171215.125749.1752831437819486183.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171215.125749.1752831437819486183.davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello David,

On Fri, 15 Dec 2017 12:57:49 -0500 David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org> wrote:

> From: Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> Date: Thu, 14 Dec 2017 19:05:10 +0900
> 
> > +static void ave_desc_write(struct net_device *ndev, enum desc_id id,
> > +			   int entry, int offset, u32 val)
> > +{
> > +	struct ave_private *priv = netdev_priv(ndev);
> > +	u32 addr = (id == AVE_DESCID_TX) ? priv->tx.daddr : priv->rx.daddr;
> 
> Please always order local variables from longest to shortest line.
> 
> Audit your entire submission for this issue, thank you.

I see. I'll fix the order of local variables.

> > +	ret = register_netdev(ndev);
> > +	if (ret) {
> > +		dev_err(dev, "failed to register netdevice\n");
> > +		goto out_del_napi;
> > +	}
> > +
> > +	platform_set_drvdata(pdev, ndev);
> 
> You must make all software state settings before reigster_netdev() is
> invoked.
> 
> At the exact moment you call register_netdev(), your device can be
> brought up, interrupts processed, PHY state changes made, etc.
> 
> So you must put this platform_set_drvdata() before the
> register_netdev() call.
> 
> Generally speaking, register_netdev() must always be the last state
> modification done by your probe routine.

Indeed. It's not good to invoke register_netdev() with all software
initialization not completed. I'll move register_netdev() after
all initialization.

Thank you,

---
Best Regards,
Kunihiko Hayashi


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
