From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [PATCH 2/9] drm/panel: simple: simplify display_mode
 definitions by using macro
Date: Tue, 17 Oct 2017 15:05:16 +0200
Message-ID: <20171017150516.0cab0cc1@karo-electronics.de>
References: <1507721021-28174-1-git-send-email-LW@KARO-electronics.de>
        <1507721021-28174-3-git-send-email-LW@KARO-electronics.de>
        <20171017120937.GC684@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171017120937.GC684@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, 17 Oct 2017 14:09:37 +0200 Thierry Reding wrote:
> On Wed, Oct 11, 2017 at 01:23:34PM +0200, Lothar Waßmann wrote:
> > Use the newly defined macro to generate the display_mode data entries
> > for all panels. This reduces the code size significantly and makes the
> > code more readable.
> > 
> > Signed-off-by: Lothar Waßmann <LW@KARO-electronics.de>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 799 ++++++-----------------------------
> >  1 file changed, 134 insertions(+), 665 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index dec639d..fde9c41 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -89,6 +89,20 @@ struct panel_simple {
> >  	struct gpio_desc *enable_gpio;
> >  };
> >  
> > +#define SP_DISPLAY_MODE(freq, ha, hfp, hs, hbp, va, vfp, vs, vbp, vr, flgs) { \
> > +	.clock = freq,							\
> > +	.hdisplay = ha,							\
> > +	.hsync_start = (ha) + (hfp),					\
> > +	.hsync_end = (ha) + (hfp) + (hs),				\
> > +	.htotal = (ha) + (hfp) + (hs) + (hbp),				\
> > +	.vdisplay = (va),						\
> > +	.vsync_start = (va) + (vfp),					\
> > +	.vsync_end = (va) + (vfp) + (vs),				\
> > +	.vtotal = (va) + (vfp) + (vs) + (vbp),				\
> > +	.vrefresh = vr,							\
> > +	.flags = flgs,							\
> > +}
> > +
> >  static inline struct panel_simple *to_panel_simple(struct drm_panel *panel)
> >  {
> >  	return container_of(panel, struct panel_simple, base);
> [...]
> > @@ -411,33 +415,9 @@ static const struct panel_desc ampire_am_480272h3tmqw_t01h = {
> >  	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> >  };
> >  
> > -#define SP_DISPLAY_MODE(freq, ha, hfp, hs, hbp, va, vfp, vs, vbp, vr, flgs) { \
> > -	.clock = freq,							\
> > -	.hdisplay = ha,							\
> > -	.hsync_start = (ha) + (hfp),					\
> > -	.hsync_end = (ha) + (hfp) + (hs),				\
> > -	.htotal = (ha) + (hfp) + (hs) + (hbp),				\
> > -	.vdisplay = (va),						\
> > -	.vsync_start = (va) + (vfp),					\
> > -	.vsync_end = (va) + (vfp) + (vs),				\
> > -	.vtotal = (va) + (vfp) + (vs) + (vbp),				\
> > -	.vrefresh = vr,							\
> > -	.flags = flgs,							\
> > -	}
> 
> Your first patch should put this in the right place to begin with so
> that this patch is really just the conversion.
> 
> Again, I don't think this macro actually improves the way modes are
> defined.
> 
I'm not happy with this panel driver stuff anyway. With the legacy
'display-timings' node that provided the timing data directly in the
DTB, every bootloader could pick up the timing data and feed it to
whatever driver it used for the display.
With the panel driver stuff the whole Linux driver has to be replicated
in the boot loader in order to be able to use the same DTB as Linux for
its HW configuration.
And adding a new panel involves recompiling the kernel and the boot
loader, rather than adding the timing data from the panel's datasheet
into the DTB.


Lothar Waßmann
