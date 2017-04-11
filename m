From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/4] drm: zte: add VGA driver support
Date: Tue, 11 Apr 2017 18:56:39 +0800
Message-ID: <20170411105633.GB9880@dragon>
References: <1491490870-6330-1-git-send-email-shawnguo@kernel.org>
 <1491490870-6330-5-git-send-email-shawnguo@kernel.org>
 <20170406171251.qlzdjmzalunplbdt@art_vandelay>
 <20170407030231.GH3394@dragon>
 <20170407144302.ge7afh5bq7eyy3s4@art_vandelay>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170407144302.ge7afh5bq7eyy3s4@art_vandelay>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Baoyou Xie <xie.baoyou-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org>, Xin Zhou <zhou.xin8-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org>, Jun Nie <jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 07, 2017 at 10:43:02AM -0400, Sean Paul wrote:
> On Fri, Apr 07, 2017 at 11:02:33AM +0800, Shawn Guo wrote:
> > When you suggested to have a lock for DETECT_SEL register access, I
> > thought we are accessing it in a read-modify-write way and thus agreed
> > to add a lock.  However, I just found that it's not the case actually.
> > All the accesses to the register are single direct write.
> > 
> > And here is my understanding about the condition you described above.
> > Once DETECT_SEL register gets reset (both bits cleared), the hardware
> > switches DDC bus for EDID read, and hotplug detection will stop working
> > right away (this is how ZTE hardware works).  That said, if we get a
> > disconnect before drm_get_edid() successfully finishes, two points:
> > 
> > - The irq handler will not be triggered, so it will not get a chance to
> >   update DETECT_SEL register.
> 
> Ah, this was the missing piece I needed. I hadn't realized that the first
> VGA_AUTO_DETECT_SEL write in get_modes disabled the irq. 

Sorry, something is not true with my point.  The irq handler can still
be triggered, but the cause has to be something else than hotplug
interrupt, like EDID data transfer done or various error conditions.

So my point should be that the VGA_AUTO_DETECT_SEL reset at the
beginning of .get_modes disables hotplug detection interrupt, and irq
handler will not get any chance to write to the register in this case.

> > - The drm_get_edid() fails, and .get_modes returns with both detect bits
> >   kept cleared.
> > 
> > I think what we can do better in this case is that we should set the
> > device state into disconnected, before returning from .get_modes,
> > something like the code below.  But still, I do not see we need a lock
> > for that.
> 
> Yep, agreed. Can you also please add to your comment in the !edid case,
> something like:
> 
> * Locking is not required here since the only other place to write this register
> * (and connected var) is the irq handler. The irq handler is disabled because
> * we've cleared AUTO_DETECT_SEL above.

Sure, thanks for the suggestion.  I will add proper comment in the new
version.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
