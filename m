From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: display: rk3288-mipi-dsi: add reset property
Date: Tue, 4 Apr 2017 14:30:47 -0400
Message-ID: <20170404183047.s7flyjv6vfhzxzb6@art_vandelay>
References: <20170224125506.21533-1-john@metanate.com>
 <20170224125506.21533-24-john@metanate.com>
 <20170302215643.GA49163@google.com>
 <20170303113945.3bd2cbd9.john@metanate.com>
 <20170312120659.hpiwnsto6hkxs5yh@rob-hp-laptop>
 <20170404141513.2bad3b1b.john@metanate.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170404141513.2bad3b1b.john-HooS5bfzL4hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Keeping <john-HooS5bfzL4hWk0Htik3J/w@public.gmane.org>
Cc: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 04, 2017 at 02:15:13PM +0100, John Keeping wrote:
> Hi Sean,
> 
> On Sun, 12 Mar 2017 07:06:59 -0500, Rob Herring wrote:
> 
> > On Fri, Mar 03, 2017 at 11:39:45AM +0000, John Keeping wrote:
> > > This reset is required in order to fully reset the internal state of the
> > > MIPI controller.
> > > 
> > > Signed-off-by: John Keeping <john-HooS5bfzL4hWk0Htik3J/w@public.gmane.org>
> > > ---
> > > On Thu, 2 Mar 2017 13:56:46 -0800, Brian Norris wrote:  
> > > > On Fri, Feb 24, 2017 at 12:55:06PM +0000, John Keeping wrote:  
> > > > > +	/*
> > > > > +	 * Note that the reset was not defined in the initial device tree, so
> > > > > +	 * we have to be prepared for it not being found.
> > > > > +	 */
> > > > > +	apb_rst = devm_reset_control_get(dev, "apb");    
> > > > 
> > > > Did this reset ever get documented in the device tree bindings? I
> > > > couldn't find it. Perhaps a follow-up patch is in order?  
> > > 
> > > Here's a patch to do that.
> > > 
> > >  .../devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt  | 7 +++++++
> > >  1 file changed, 7 insertions(+)  
> > 
> > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> I don't see this patch in linux-next, so I guess it has fallen through
> the cracks somewhere.  Since we have Rob's ack, can you pick this via
> drm-misc?
> 

Yeah, sorry about that. Applied to misc-next

Sean

> 
> Regards,
> John

-- 
Sean Paul, Software Engineer, Google / Chromium OS
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
