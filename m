From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v5 2/2] phy: rockchip-inno-usb2: add a new driver for Rockchip usb2phy
Date: Fri, 17 Jun 2016 18:46:25 +0200
Message-ID: <1653733.7f4MgdqfFf@diego>
References: <1465783810-18756-1-git-send-email-frank.wang@rock-chips.com> <1465783810-18756-3-git-send-email-frank.wang@rock-chips.com> <5763E506.1060500@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5763E506.1060500-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Kishon,

Am Freitag, 17. Juni 2016, 17:24:46 schrieb Kishon Vijay Abraham I:

> > +	ret = of_clk_add_provider(node, of_clk_src_simple_get, rphy->clk480m);
> > +	if (ret < 0)
> > +		goto err_clk_provider;
> > +
> > +	ret = devm_add_action(rphy->dev, rockchip_usb2phy_clk480m_unregister,
> > +			      rphy);
> > +	if (ret < 0)
> > +		goto err_unreg_action;
> > +
> > +	return 0;
> > +
> > +err_unreg_action:
> > +	of_clk_del_provider(node);
> > +err_clk_provider:
> > +	clk_unregister(rphy->clk480m);
> > +err_register:
> > +	if (rphy->clk)
> > +		clk_put(rphy->clk);
> > +	return ret;
> > +}
> 
> I'm seeing lot of similarities specifically w.r.t to clock handling part in
> drivers/phy/phy-rockchip-usb.c. Why not just re-use that driver?

It's a completely different phy block (Designware vs. Innosilicon) and a lot 
of stuff also is handled differently.

For one on the old block, each phy was somewhat independent and had for examle 
its own clock-supply, while on this one there is only one for both ports of 
the phy. Similarly with the clock getting fed back to the clock-controller 
(one clock per port on the old block, now one clock for the whole phy).

Then as you can see, the handling for power-up and down is a bit different and 
I guess one big block might be the still missing special otg handling, Frank 
wrote about.


[...]

> > +		/*
> > +		 * we don't need to rearm the delayed work when the phy port
> > +		 * is suspended.
> > +		 */
> > +		mutex_unlock(&rport->mutex);
> > +		return;
> > +	default:
> > +		dev_dbg(&rport->phy->dev, "unknown phy state\n");
> > +		break;
> > +	}
> > +
> > +next_schedule:
> > +	mutex_unlock(&rport->mutex);
> > +	schedule_delayed_work(&rport->sm_work, SCHEDULE_DELAY);
> 
> Why are you scheduling the work again? Interrupt handlers can invoke this
> right?

Frank said, that the phy is only able to detect the plug-in event via 
interrupts, not the removal, so once a plugged device is detected, this gets 
rescheduled until the device gets removed.

[...]

> > +	/* find out a proper config which can be matched with dt. */
> > +	index = 0;
> > +	while (phy_cfgs[index].reg) {
> > +		if (phy_cfgs[index].reg == reg) {
> 
> Why not pass these config values from dt? Moreover finding the config using
> register offset is bound to break.

As you have probably seen, this phy block is no stand-alone (mmio-)device, but 
gets controlled through special register/bits in the so called "General 
Register Files" syscon.

The values stored and accessed here, are the location and layout of those 
control registers. Bits in those phy control registers at times move between 
phy-versions in different socs (rk3036, rk3228, rk3366, rk3368, rk3399) and 
some are even missing. So I don't really see a nice way to describe that in dt 
without describing the register and offset of each of those 22 used bits 
individually.


I'm also not sure where you expect it to break? The reg-offset is the offset 
of the phy inside the GRF and the Designware-phy also already does something 
similar to select some appropriate values.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
