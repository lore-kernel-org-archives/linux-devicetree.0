From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v5 2/2] phy: rockchip-inno-usb2: add a new driver for Rockchip usb2phy
Date: Tue, 14 Jun 2016 17:20:14 +0200
Message-ID: <2983992.DFFWV4P4jo@diego>
References: <1465783810-18756-1-git-send-email-frank.wang@rock-chips.com> <1465783810-18756-3-git-send-email-frank.wang@rock-chips.com> <57601A1D.9020803@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57601A1D.9020803-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 14. Juni 2016, 07:52:13 schrieb Guenter Roeck:
> On 06/12/2016 07:10 PM, Frank Wang wrote:
> > The newer SoCs (rk3366, rk3399) take a different usb-phy IP block
> > than rk3288 and before, and most of phy-related registers are also
> > different from the past, so a new phy driver is required necessarily.
> > 
> > Signed-off-by: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > ---
> 
> [ ... ]
> 
> > +
> > +static int rockchip_usb2phy_resume(struct phy *phy)
> > +{
> > +	struct rockchip_usb2phy_port *rport = phy_get_drvdata(phy);
> > +	struct rockchip_usb2phy *rphy = dev_get_drvdata(phy->dev.parent);
> > +	int ret;
> > +
> > +	dev_dbg(&rport->phy->dev, "port resume\n");
> > +
> > +	ret = clk_prepare_enable(rphy->clk480m);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = property_enable(rphy, &rport->port_cfg->phy_sus, false);
> > +	if (ret)
> > +		return ret;
> > +
> > +	rport->suspended = false;
> > +	return 0;
> > +}
> > +
> > +static int rockchip_usb2phy_suspend(struct phy *phy)
> > +{
> > +	struct rockchip_usb2phy_port *rport = phy_get_drvdata(phy);
> > +	struct rockchip_usb2phy *rphy = dev_get_drvdata(phy->dev.parent);
> > +	int ret;
> > +
> > +	dev_dbg(&rport->phy->dev, "port suspend\n");
> > +
> > +	ret = property_enable(rphy, &rport->port_cfg->phy_sus, true);
> > +	if (ret)
> > +		return ret;
> > +
> > +	rport->suspended = true;
> > +	clk_disable_unprepare(rphy->clk480m);
> > +	return 0;
> > +}
> > +
> 
> I am still quite confused by the clock handling.
> 
> The above will be called for each instantiated phy (user, otg).
> Each time, clk_disable_unprepare() will be called. Yet, there
> is no matching clk_prepare_enable() call during initialization.
> 
> How does this work ?

the created clock gets the supplying clock as parent, see 

+       rphy->clk = of_clk_get_by_name(node, "phyclk");
+       if (IS_ERR(rphy->clk)) {
+               rphy->clk = NULL;
+               init.parent_names = NULL;
+               init.num_parents = 0;
+       } else {
+               clk_name = __clk_get_name(rphy->clk);
+               init.parent_names = &clk_name;
+               init.num_parents = 1;
+       }

that way when you enable the 480m clock from the phy, its parent will 
automatically get enabled as well. And of course due to refcounting in the 
clock framework, the 480m clock (and thus also its parent) will only get 
disabled once both the host and otg port have disabled it.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
