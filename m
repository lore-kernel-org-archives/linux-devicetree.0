From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH] of/overlay: add of overlay notifications
Date: Thu, 3 Mar 2016 09:11:26 -0600
Message-ID: <alpine.DEB.2.02.1603030911110.18468@linuxheads99>
References: <1456523056-15352-1-git-send-email-atull@opensource.altera.com> <CAL_Jsq+kkBBV=pYxn54ZRTCnj=cNDKw4o6qJ+z_Ze3JGLRq+aA@mail.gmail.com> <alpine.DEB.2.02.1603020918240.4647@linuxheads99>
 <CAL_JsqKxVPMZvYfy-UN4LfUWzUqiAAOz1XCB6R5phXHDEEkj4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKxVPMZvYfy-UN4LfUWzUqiAAOz1XCB6R5phXHDEEkj4g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Moritz Fischer <moritz.fischer@ettus.com>, Pantelis Antoniou <pantelis.antoniou@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Dinh Nguyen <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

On Thu, 3 Mar 2016, Rob Herring wrote:

> On Wed, Mar 2, 2016 at 12:49 PM, atull <atull@opensource.altera.com> wrote:
> > On Wed, 2 Mar 2016, Rob Herring wrote:
> >
> >> On Fri, Feb 26, 2016 at 3:44 PM, Alan Tull <atull@opensource.altera.com> wrote:
> >> > This patch add of overlay notifications.
> >> >
> >> > When DT overlays are being added, some drivers/subsystems
> >> > need to see device tree overlays before the changes go into
> >> > the live tree.
> 
> [...]
> 
> >> > @@ -389,6 +431,8 @@ int of_overlay_create(struct device_node *tree)
> >> >         /* add to the tail of the overlay list */
> >> >         list_add_tail(&ov->node, &ov_list);
> >> >
> >> > +       of_overlay_notify(ov, OF_OVERLAY_POST_APPLY);
> >> > +
> >> >         mutex_unlock(&of_mutex);
> >>
> >> This means that any post-apply handlers can't make any calls that take
> >> the mutex. Maybe that is fine? On the flip side, maybe we want to
> >> prevent any changes while the notifiers are called.
> >>
> >> The other calls could have similar issues. We should make sure we are
> >> consistent.
> >>
> >
> > Currently it's consistent - all 4 notifiers hold the mutex,
> > so all 4 prevent dt changes.  That's not super bad, but it's
> > different from the reconfig notifiers and I could see some
> > possible usefulness in allowing changes.
> >
> > I don't see any harm in unlocking for pre-apply, post-apply,
> > or post-remove.  But for pre-remove, unlocking would allow
> > notifier code to make changes to the overlay's changeset
> > that is about to be removed.  Is that something we need to
> > be super worried about preventing?
> >
> > For pre-apply, unlocking would allow changes to either the
> > live tree or the overlay. That's ok since the next thing
> > that will happen after the notifier is that the changeset
> > will be built from the overlay, so any changes made to the
> > overlay would make it into the changeset before it is
> > applied.  Post-apply and post-remove are also ok to
> > be unlocked.
> >
> > So if the pre-remove case is ok, I could release the mutex
> > for all 4 cases in v3.
> 
> The only one I can see it being useful to make changes would be
> pre-apply. The complication there is you would have to move the mutex.
> I don't think the mutex really needs to be held until before
> of_overlay_apply, but I'm not completely sure. For now, I think just
> leave things as they are now.
> 
> Rob
> 

OK

Alan
