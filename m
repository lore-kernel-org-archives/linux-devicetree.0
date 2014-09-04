From: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v9 2/3] clk: RK808: Add clkout driver for RK808
Date: Thu, 4 Sep 2014 11:34:21 -0700
Message-ID: <20140904183421.GE10224@core.coreip.homeip.net>
References: <1409793159-2573-1-git-send-email-zyw@rock-chips.com>
 <1409793159-2573-3-git-send-email-zyw@rock-chips.com>
 <20140904174024.GD10224@core.coreip.homeip.net>
 <3708545.id8zLgF0vo@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3708545.id8zLgF0vo@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 04, 2014 at 08:02:56PM +0200, Heiko St=FCbner wrote:
> Am Donnerstag, 4. September 2014, 10:40:24 schrieb Dmitry Torokhov:
> > Hi Chris,
> >=20
> > On Thu, Sep 04, 2014 at 09:12:38AM +0800, Chris Zhong wrote:
> > > +	rk808_clkout->clk_data.clks =3D clk_table;
> > > +	rk808_clkout->clk_data.clk_num =3D RK808_NR_OUTPUT;
> > > +
> > > +	return of_clk_add_provider(node, of_clk_src_onecell_get,
> > > +				   &rk808_clkout->clk_data);
> > > +}
> > > +
> > > +static struct platform_driver rk808_clkout_driver =3D {
> > > +	.probe =3D rk808_clkout_probe,
> > > +	.driver		=3D {
> > > +		.name	=3D "rk808-clkout",
> > > +	},
> > > +};
> >=20
> > Shouldn't there also be:
> >=20
> > static int rk808_clkout_probe(struct platform_device *pdev)
> 					^^ remove
>=20
> Just to prevent confusion. And you're right there of course.

Ah, yes, stupid cut-and-paste...

--=20
Dmitry
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
