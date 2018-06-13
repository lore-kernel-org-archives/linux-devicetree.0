From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: Re: [PATCH v2 14/27] drm/sun4i: Don't check for
 panel or bridge on TV TCONs
Date: Wed, 13 Jun 2018 18:20:07 +0200
Message-ID: <2662622.yHSNrIAaJ9@jernej-laptop>
References: <20180612200036.21483-1-jernej.skrabec@siol.net> <20180613074621.5phumovcyymbkfbn@flea> <CAGb2v66QWr2CQhcfQ9BQds-0xeG=pS4MDzaNn7_HGz+q3gfkWA@mail.gmail.com>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERB6EIQXMQKGQEWK66H3I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v66QWr2CQhcfQ9BQds-0xeG=pS4MDzaNn7_HGz+q3gfkWA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dne sreda, 13. junij 2018 ob 10:04:20 CEST je Chen-Yu Tsai napisal(a):
> On Wed, Jun 13, 2018 at 3:46 PM, Maxime Ripard
> 
> <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> > On Tue, Jun 12, 2018 at 10:00:23PM +0200, Jernej Skrabec wrote:
> >> TV TCONs are always connected to TV or HDMI encoder, so it doesn't make
> >> sense to check if panel or bridge is connected to them.
> >> 
> >> Check if TCON has channel 0 and only then check for connected panel or
> >> bridges.
> >> 
> >> Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> >> ---
> >> 
> >>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 12 +++++++++---
> >>  1 file changed, 9 insertions(+), 3 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> >> b/drivers/gpu/drm/sun4i/sun4i_tcon.c index b1205a7bc20f..c9ffa5381185
> >> 100644
> >> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> >> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> >> @@ -1189,13 +1189,19 @@ static const struct component_ops sun4i_tcon_ops
> >> = {>> 
> >>  static int sun4i_tcon_probe(struct platform_device *pdev)
> >>  {
> >>  
> >>       struct device_node *node = pdev->dev.of_node;
> >> 
> >> +     const struct sun4i_tcon_quirks *quirks;
> >> 
> >>       struct drm_bridge *bridge;
> >>       struct drm_panel *panel;
> >>       int ret;
> >> 
> >> -     ret = drm_of_find_panel_or_bridge(node, 1, 0, &panel, &bridge);
> >> -     if (ret == -EPROBE_DEFER)
> >> -             return ret;
> >> +     quirks = of_device_get_match_data(&pdev->dev);
> > 
> > We should probably check ofr the pointer value before dereferencing it.
> 
> I think we've discussed this before. If the driver has data structures
> for all the supported compatible strings, and it is device tree only,
> then we should just let it blow up in the user's face, since they are
> obviously doing something they shouldn't be doing to get the driver
> to probe without a compatible string match.

TCON can't work with no quirks specified, since that would mean that neither 
channels are present. Additionally, sun4i_tcon_bind() also doesn't check if 
quirks are NULL or not. So I concur with Chen-Yu here.

Best regards,
Jernej
