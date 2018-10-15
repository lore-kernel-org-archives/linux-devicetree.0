From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: Re: [PATCH v2 15/29] drm/bridge/synopsys: dw-hdmi:
 Enable workaround for v2.12a
Date: Mon, 15 Oct 2018 19:43:44 +0200
Message-ID: <1599508.L0GctDr0rS@jernej-laptop>
References: <20181007093905.11253-1-jernej.skrabec@siol.net> <20181007093905.11253-16-jernej.skrabec@siol.net> <3616158.EzHeIcd69b@avalon>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBWFDSPPAKGQELQKMVPQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <3616158.EzHeIcd69b@avalon>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
Cc: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Dne torek, 09. oktober 2018 ob 19:40:44 CEST je Laurent Pinchart napisal(a):
> Hi Jernej,
> 
> Thank you for the patch.
> 
> On Sunday, 7 October 2018 12:38:51 EEST Jernej Skrabec wrote:
> > It turns out that even new DW HDMI controllers exhibits same magenta
> > line issues as older versions.
> > 
> > Enable workaround for v2.12a.
> 
> This doesn't affect the platforms I maintain, so I can't really test this,
> but I'm wondering whether there could be other platforms using a v2.12a DW
> HDMI that wouldn't need the workaround.
> 
> My platforms use a previous version, namely v2.01a. The workaround for that
> version has been enabled by
> 
> commit 9c305eb442f3b371fc722ade827bbf673514123e
> Author: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> Date:   Fri Feb 23 12:44:37 2018 +0100
> 
>     drm: bridge: dw-hdmi: Fix overflow workaround for Amlogic Meson GX SoCs
> 
> I haven't paid too much attention to the patch back then, and have now
> double- checked the HDMI output on R-Car Gen3. Enabling the workaround
> doesn't cause any regression, and reverting the commit doesn't cause any
> issue either. I thus wonder whether we shouldn't enable the workaround with
> count = 1 in the default case instead of adding new IP core versions to the
> list. It would be nice if someone from Synopsys could comment on this.

I was thinking about that too, or even having parameter in dw_hdmi_plat_data 
which would tell how many times to repeat workaround procedure for a specific 
platform. But this might be an overkill.

Best regards,
Jernej

> 
> > Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> > ---
> > 
> >  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c index
> > 5971976284bf..df1c7a2d6961 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > @@ -1664,6 +1664,7 @@ static void dw_hdmi_clear_overflow(struct dw_hdmi
> > 
> > *hdmi) case 0x131a:
> >  	case 0x132a:
> > 
> >  	case 0x201a:
> > +	case 0x212a:
> >  		count = 1;
> >  		break;
> >  	
> >  	default:
