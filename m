From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v8 10/17] phy: Add driver for rockchip Display Port PHY
Date: Thu, 12 Nov 2015 10:21:51 +0100
Message-ID: <1942026.CO9sWmi7sq@phil>
References: <1446020143-32645-1-git-send-email-ykk@rock-chips.com> <2368662.QeV0VQYq26@phil> <5643FB43.6090408@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5643FB43.6090408-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dri-deve
List-Id: devicetree@vger.kernel.org

Hi Yakir,

Am Donnerstag, 12. November 2015, 10:36:51 schrieb Yakir Yang:
> On 11/12/2015 07:23 AM, Heiko Stuebner wrote:
> > Am Mittwoch, 28. Oktober 2015, 16:30:33 schrieb Yakir Yang:
> >> Add phy driver for the Rockchip DisplayPort PHY module. This
> >> is required to get DisplayPort working in Rockchip SoCs.
> >>
> >> Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> >> Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > a general thing I have been pondering, we should probably move the
> > dp-phy under the GRF. Similar to the new power-domains being
> > a full child of the PMU, the dp-phy is a full child-device of the GRF.
> >
> > That would include:
> > - making the GRF a simply-mfd (just adding that property)
> > - moving the dts node under it
> > - making the driver get its regmap from its parent (just like
> >    drivers/soc/rockchip/pm_domains.c does)
> >
> >
> > The usbphy is another example of that, and I think I'll be moving it
> > below the grf as well.
> 
> Sounds great, pretty cool to collect those scattered "GRF" driver,
> if you want me do some rebase on your changes, please note me :)

nope, that won't be necessary ... I'm currently doing some usbphy
reorganization/cleanups for 4.5 first, so to keep conflicts down I'll do
the move probably for 4.6. As I expect your edp series to make it into
4.5 we'll also not have conflicts here then :-)


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
