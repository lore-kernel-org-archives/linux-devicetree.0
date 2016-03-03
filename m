From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of/overlay: add of overlay notifications
Date: Thu, 3 Mar 2016 08:24:06 -0600
Message-ID: <CAL_JsqKxVPMZvYfy-UN4LfUWzUqiAAOz1XCB6R5phXHDEEkj4g@mail.gmail.com>
References: <1456523056-15352-1-git-send-email-atull@opensource.altera.com>
 <CAL_Jsq+kkBBV=pYxn54ZRTCnj=cNDKw4o6qJ+z_Ze3JGLRq+aA@mail.gmail.com> <alpine.DEB.2.02.1603020918240.4647@linuxheads99>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1603020918240.4647@linuxheads99>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 2, 2016 at 12:49 PM, atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org> wrote:
> On Wed, 2 Mar 2016, Rob Herring wrote:
>
>> On Fri, Feb 26, 2016 at 3:44 PM, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org> wrote:
>> > This patch add of overlay notifications.
>> >
>> > When DT overlays are being added, some drivers/subsystems
>> > need to see device tree overlays before the changes go into
>> > the live tree.

[...]

>> > @@ -389,6 +431,8 @@ int of_overlay_create(struct device_node *tree)
>> >         /* add to the tail of the overlay list */
>> >         list_add_tail(&ov->node, &ov_list);
>> >
>> > +       of_overlay_notify(ov, OF_OVERLAY_POST_APPLY);
>> > +
>> >         mutex_unlock(&of_mutex);
>>
>> This means that any post-apply handlers can't make any calls that take
>> the mutex. Maybe that is fine? On the flip side, maybe we want to
>> prevent any changes while the notifiers are called.
>>
>> The other calls could have similar issues. We should make sure we are
>> consistent.
>>
>
> Currently it's consistent - all 4 notifiers hold the mutex,
> so all 4 prevent dt changes.  That's not super bad, but it's
> different from the reconfig notifiers and I could see some
> possible usefulness in allowing changes.
>
> I don't see any harm in unlocking for pre-apply, post-apply,
> or post-remove.  But for pre-remove, unlocking would allow
> notifier code to make changes to the overlay's changeset
> that is about to be removed.  Is that something we need to
> be super worried about preventing?
>
> For pre-apply, unlocking would allow changes to either the
> live tree or the overlay. That's ok since the next thing
> that will happen after the notifier is that the changeset
> will be built from the overlay, so any changes made to the
> overlay would make it into the changeset before it is
> applied.  Post-apply and post-remove are also ok to
> be unlocked.
>
> So if the pre-remove case is ok, I could release the mutex
> for all 4 cases in v3.

The only one I can see it being useful to make changes would be
pre-apply. The complication there is you would have to move the mutex.
I don't think the mutex really needs to be held until before
of_overlay_apply, but I'm not completely sure. For now, I think just
leave things as they are now.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
