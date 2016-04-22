From: atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCH v3] of/overlay: add of overlay notifications
Date: Fri, 22 Apr 2016 16:19:52 -0500
Message-ID: <alpine.DEB.2.02.1604221618560.15697@linuxheads99>
References: <1457017841-20141-1-git-send-email-atull@opensource.altera.com> <CAL_JsqKLLOPfy8Psxgq7uOuy09+vj4K2jnoU+iZspfgou5ui4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKLLOPfy8Psxgq7uOuy09+vj4K2jnoU+iZspfgou5ui4g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 19 Apr 2016, Rob Herring wrote:

> On Thu, Mar 3, 2016 at 9:10 AM, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org> wrote:
> > This patch add of overlay notifications.
> >
> > When DT overlays are being added, some drivers/subsystems
> > need to see device tree overlays before the changes go into
> > the live tree.
> >
> > This is distinct from reconfig notifiers that are
> > post-apply or post-remove and which issue very granular
> > notifications without providing access to the context
> > of a whole overlay.
> >
> > The following 4 notificatons are issued:
> >   OF_OVERLAY_PRE_APPLY
> >   OF_OVERLAY_POST_APPLY
> >   OF_OVERLAY_PRE_REMOVE
> >   OF_OVERLAY_POST_REMOVE
> >
> > In the case of pre-apply notification, if the notifier
> > returns error, the overlay will be rejected.
> >
> > This patch exports two functions for registering/unregistering
> > notifications:
> >   of_overlay_notifier_register(struct notifier_block *nb)
> >   of_overlay_notifier_unregister(struct notifier_block *nb)
> >
> > The of_mutex is held during these notifications. The
> > notification data includes pointers to the overlay target
> > and the overlay:
> >
> > struct of_overlay_notify_data {
> >        struct device_node *overlay;
> >        struct device_node *target;
> > };
> >
> > Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > ---
> > v2: add missing 'static inline' in of.h
> > v3: fix build for !OF_OVERLAY in of.h
> >     add a note in the header that the of_mutex is held
> > ---
> >  drivers/of/overlay.c |   47 ++++++++++++++++++++++++++++++++++++++++++++++-
> >  include/linux/of.h   |   25 +++++++++++++++++++++++++
> >  2 files changed, 71 insertions(+), 1 deletion(-)
> 
> This looks fine to me, but apply it when you have a user.
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> Rob

Thanks!

I think I'll be the first user.

Alan

> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
