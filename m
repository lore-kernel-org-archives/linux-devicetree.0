From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 2/4] drm: Add support for ARM's HDLCD controller.
Date: Thu, 3 Dec 2015 14:48:55 +0000
Message-ID: <20151203144855.GA12521@e106497-lin.cambridge.arm.com>
References: <1449058982-18595-1-git-send-email-Liviu.Dudau@arm.com>
 <1449058982-18595-3-git-send-email-Liviu.Dudau@arm.com>
 <CAPj87rNFFGeL8z9GBXxyVri1RyhVpMGS0yz7opgCYamHYV1Yow@mail.gmail.com>
 <20151203100021.GD972@e106497-lin.cambridge.arm.com>
 <CAPj87rOyBciAtBH_MiKA1bcqbpmk8gOscOMcLcgcbcag7k1W9g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPj87rOyBciAtBH_MiKA1bcqbpmk8gOscOMcLcgcbcag7k1W9g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Punit Agrawal <punit.agrawal-5wv7dgnIgG8@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DRI devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 03, 2015 at 02:20:26PM +0000, Daniel Stone wrote:
> Hi Liviu,
>=20
> On 3 December 2015 at 10:00, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org> wrote:
> > On Wed, Dec 02, 2015 at 05:21:44PM +0000, Daniel Stone wrote:
> >> On 2 December 2015 at 12:23, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org> wro=
te:
> >> > +       if (irq_status & HDLCD_INTERRUPT_VSYNC) {
> >> > +               unsigned long flags;
> >> > +
> >> > +               drm_handle_vblank(drm, 0);
> >> > +
> >> > +               spin_lock_irqsave(&drm->event_lock, flags);
> >> > +               if (hdlcd->event) {
> >> > +                       drm_send_vblank_event(drm, hdlcd->event-=
>pipe, hdlcd->event);
> >> > +                       drm_crtc_vblank_put(&hdlcd->crtc);
> >> > +                       hdlcd->event =3D NULL;
> >> > +               }
> >> > +               spin_unlock_irqrestore(&drm->event_lock, flags);
> >> > +       }
> >>
> >> As with VC4 and Rockchip, you're missing a ->preclose handler in y=
our
> >> drm_drv, to make sure that you don't try to send events to a dead
> >> client (which causes an OOPS):
> >> https://git.collabora.com/cgit/user/daniels/linux.git/commit/?h=3D=
wip/4.4.x/rockchip-drm-fixes&id=3Dd14f21bcd7
> >> (and its parent)
> >
> > Thanks for reviewing this!
> >
> > I do acknowledge your concerns and you might correct my understandi=
ng on
> > how atomic DRM works, but I believe in this case we should be safe.=
 The
> > event stored in hdlcd->event is taken out of the crtc->state->event=
 during
> > the crtc->atomic_begin() callback. If the client is dead the callba=
ck should
> > not be called, so that's how we avoid the OOPS.
>=20
> Right, it's taken out of the CRTC state and put into the overall HDLC=
D
> structure. So the OOPS happens when:
>   - client submits state with event requested, async flag set
>   - atomic_begin moves crtc->state->event into hdlcd->event
>   - control returns to client, who exits immediately
>   - vblank happens
>   - hdlcd->event->base.file_priv now points to a dead client
>   - OOPS

I will try to construct an userspace test to see if I can trigger this =
scenario.

Thanks for explaining it to me.

Best regards,
Liviu

>=20
> >> Also, is there anything preventing clients from submitting multipl=
e
> >> pageflips before the event is sent? I couldn't see anything from a
> >> quick look, so you could have the situation of:
> >>   - client submits pageflip, event 1 stored to hdlcd->event
> >>   - client submits pageflip, event 2 stored to hdlcd->event
> >>   - vblank arrives, event 2 is sent
> >>   - event 1 has disappeared and been leaked
> >
> > As for multiple events being submitted before vsync interrupt happe=
ning: given
> > that the event is plucked out of the crtc->state, is that possible?=
 And if so,
> > is there a case where having the later event overwrite the earlier =
one a desired
> > outcome?
>=20
> Having events being overwritten is extremely undesirable; it could
> cause a client to stall in the right scenarios (e.g. requests
> submitted separately for different planes). It would be far better to
> turn hdlcd->event into a list of events which are sent per-vblank,
> probably just by retaining a list of pending states to apply; this
> also makes it easier to handle async commits in the future (which
> Weston in particular relies on).
>=20
> Cheers,
> Daniel
>=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
