From: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v9 03/14] drm/mediatek: Add DSI sub driver
Date: Fri, 5 Feb 2016 17:06:26 +0800
Message-ID: <1454663186.16005.2.camel@mtksdaap41>
References: <1452611750-16283-1-git-send-email-p.zabel@pengutronix.de>
	 <1452611750-16283-4-git-send-email-p.zabel@pengutronix.de>
	 <CAGS+omCqKFQ-E_q7x=i95fhZSGgTOVW+_EoiRb++E14Xrob-tA@mail.gmail.com>
	 <1454497304.3867.1.camel@pengutronix.de>
	 <1454567865.12573.7.camel@mtksdaap41>
	 <1454590099.3356.22.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454590099.3356.22.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jie Qiu <jie.qiu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Cawa Cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sasha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>Daniel Vetter <da>
List-Id: devicetree@vger.kernel.org

Hi, Philipp:

On Thu, 2016-02-04 at 13:48 +0100, Philipp Zabel wrote:
> Am Donnerstag, den 04.02.2016, 14:37 +0800 schrieb CK Hu:
> > Hi Philipp:
> > 
> > On Wed, 2016-02-03 at 12:01 +0100, Philipp Zabel wrote:
> > > Hi Daniel,
> > > 
> > 
> > > > > +static void mtk_output_dsi_disable(struct mtk_dsi *dsi)
> > > > > +{
> > > > > +       if (!dsi->enabled)
> > > > > +               return;
> > > > > +
> > > > > +       if (dsi->panel) {
> > > > > +               if (drm_panel_disable(dsi->panel)) {
> > > > > +                       DRM_ERROR("failed to disable the panel\n");
> > > > > +                       return;
> > > > > +               }
> > > > > +       }
> > > > > +
> > > > > +       mtk_dsi_poweroff(dsi);
> > > > 
> > > > The order is a bit suspicious here; I would expect to poweroff dsi
> > > > before the panel to mirror the turn on order.
> > > 
> > > CK, could you comment on this?
> > > 
> > 
> > According to the experience of other Mediatek SoC,
> > In mtk_output_dsi_enable(), we should do power on dsi first and then
> > prepare panel because dsi should be ready to receive panel prepare error
> > message. So we should disable panel and then power off dsi in
> > mtk_output_dsi_disable().
> > 
> > > I can reorder this, but I'm not sure about the reasoning (what happens
> > > hardware wise if we just cut panel power vs. if the DSI panel first sees
> > > the ULP transition). Further, I don't have a panel to test, just the
> > > PS8640.
> > > 
> > > thanks
> > > Philipp
> 
> I just realized that this code isn't even using drm_panel_enable and
> drm_panel_unprepare. I suppose the order generally should be:
> 
> prepare and enable dsi (but don't start stream yet)
> drm_panel_prepare()
> enable dsi output
> drm_panel_enable()
> 
> and to disable:
> 
> drm_panel_disable()
> disable dsi output
> drm_panel_unprepare()
> power off dsi
> 
> ?
> 

I think the flow you suppose is ok and more general.

> regards
> Philipp
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
