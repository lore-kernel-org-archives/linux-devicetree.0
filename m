From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Subject: Re: [PATCH v6 net-next,mips 6/7] netdev: octeon-ethernet: Add
 Cavium Octeon III support.
Date: Fri, 08 Dec 2017 14:29:31 -0500 (EST)
Message-ID: <20171208.142931.969279261124372071.davem@davemloft.net>
References: <20171208000934.6554-1-david.daney@cavium.com>
        <20171208000934.6554-7-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171208000934.6554-7-david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, james.hogan-8NJIiSa5LzA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, steven.hill-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pombredanne-od1rfyK75/E@public.gmane.org, cmunoz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Date: Thu,  7 Dec 2017 16:09:33 -0800

> +static void bgx_port_check_state(struct work_struct *work)
> +{
 ...
> +	mutex_lock(&priv->lock);
> +	if (priv->work_queued)
> +		queue_delayed_work(check_state_wq, &priv->dwork, HZ);
> +	mutex_unlock(&priv->lock);
> +}
 ...
> +int bgx_port_disable(struct net_device *netdev)
> +{
 ...
> +	mutex_lock(&priv->lock);
> +	if (priv->work_queued) {
> +		cancel_delayed_work_sync(&priv->dwork);
> +		priv->work_queued = false;

This can deadlock.

When you do a sync work cancel, it waits until all running work
instances finish.  You have the priv->lock, so if
bgx_port_check_status() need to still take priv->lock to complete
then no further progress will be made.

I think it is pointless to use this weird work_queued boolean state.

Just unconditionally, and without locking, cancel the delayed work,
ragardless of whether it was actually used ever or not.

Thank you.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
