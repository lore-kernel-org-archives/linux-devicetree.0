From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [PATCH v2 11/27] drm/sun4i: tcon: Add support for
 tcon-top gate
Date: Fri, 15 Jun 2018 18:41:16 +0200
Message-ID: <2948115.KggauuSURZ@jernej-laptop>
References: <20180612200036.21483-1-jernej.skrabec@siol.net> <20180612200036.21483-12-jernej.skrabec@siol.net> <20180615083110.laruycabvyjmesmo@flea>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERB36YR7MQKGQEOIJ4TPA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180615083110.laruycabvyjmesmo@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Dne petek, 15. junij 2018 ob 10:31:10 CEST je Maxime Ripard napisal(a):
> Hi,
> 
> On Tue, Jun 12, 2018 at 10:00:20PM +0200, Jernej Skrabec wrote:
> > TV TCONs connected to TCON TOP have to enable additional gate in order
> > to work.
> > 
> > Add support for such TCONs.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> > ---
> > 
> >  drivers/gpu/drm/sun4i/sun4i_tcon.c | 11 +++++++++++
> >  drivers/gpu/drm/sun4i/sun4i_tcon.h |  4 ++++
> >  2 files changed, 15 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > b/drivers/gpu/drm/sun4i/sun4i_tcon.c index 08747fc3ee71..0afb5a94a414
> > 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > @@ -688,6 +688,16 @@ static int sun4i_tcon_init_clocks(struct device *dev,
> > 
> >  		dev_err(dev, "Couldn't get the TCON bus clock\n");
> >  		return PTR_ERR(tcon->clk);
> >  	
> >  	}
> > 
> > +
> > +	if (tcon->quirks->has_tcon_top_gate) {
> > +		tcon->top_clk = devm_clk_get(dev, "tcon-top");
> > +		if (IS_ERR(tcon->top_clk)) {
> > +			dev_err(dev, "Couldn't get the TCON TOP bus clock\n");
> > +			return PTR_ERR(tcon->top_clk);
> > +		}
> > +		clk_prepare_enable(tcon->top_clk);
> > +	}
> > +
> 
> Is it required for the TCON itself to operate, or does the TCON
> requires the TCON TOP, which in turn requires that clock to be
> functional?
> 
> I find it quite odd to have a clock that isn't meant for a particular
> device to actually be wired to another device. I'm not saying this
> isn't the case, but it would be a first.

Documentation doesn't say much about that gate. I did few tests and TCON 
registers can be read and written even if TCON TOP TV TCON gate is disabled. 
However, there is no image, as expected.

More interestingly, I enabled test pattern directly in TCON to eliminate 
influence of the mixer. As soon as I disabled that gate, test pattern on HDMI 
screen was gone, which suggest that this gate influences something inside 
TCON.

Another test I did was that I moved enable/disable gate code to 
sun4i_tcon_channel_set_status() and it worked just as well.

I'll ask AW engineer what that gate actually does, but from what I saw, I 
would say that most appropriate location to enable/disable TCON TOP TV TCON 
gate is TCON driver. Alternatively, TCON TOP driver could check if any TV TCON 
is in use and enable appropriate gate. However, that doesn't sound right to me 
for some reason.

Best regards,
Jernej
