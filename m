From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: Re: [PATCH v2 24/27] drm: of: Export drm_crtc_port_mask()
Date: Wed, 13 Jun 2018 18:04:24 +0200
Message-ID: <1909375.AJdhpVkKnf@jernej-laptop>
References: <20180612200036.21483-1-jernej.skrabec@siol.net> <20180612200036.21483-25-jernej.skrabec@siol.net> <20180613073605.gnhcwrywooxhyryj@flea>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBSEBQXMQKGQE22K37OY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180613073605.gnhcwrywooxhyryj@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Cc: wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dne sreda, 13. junij 2018 ob 09:36:05 CEST je Maxime Ripard napisal(a):
> On Tue, Jun 12, 2018 at 10:00:33PM +0200, Jernej Skrabec wrote:
> > Function is useful when drm_of_find_possible_crtcs() can't be used and
> > custom parsing is needed. This can happen for example when there is a
> > node with multiple muxes between crtc and encoder.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> > ---
> > 
> >  drivers/gpu/drm/drm_of.c | 4 ++--
> >  include/drm/drm_of.h     | 8 ++++++++
> >  2 files changed, 10 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> > index 1fe122461298..2e9cea3287b2 100644
> > --- a/drivers/gpu/drm/drm_of.c
> > +++ b/drivers/gpu/drm/drm_of.c
> > @@ -22,8 +22,8 @@ static void drm_release_of(struct device *dev, void
> > *data)> 
> >   * Given a port OF node, return the possible mask of the corresponding
> >   * CRTC within a device's list of CRTCs.  Returns zero if not found.
> >   */
> > 
> > -static uint32_t drm_crtc_port_mask(struct drm_device *dev,
> > -				   struct device_node *port)
> > +uint32_t drm_crtc_port_mask(struct drm_device *dev,
> > +			    struct device_node *port)
> 
> It should probably be exported too?

Yes, of course. It will be in next version.

Best regards,
Jernej
