From: Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v7 3/7] of/platform: Add functional dependency link from
 DT bindings
Date: Mon, 19 Aug 2019 13:49:09 -0700
Message-ID: <CAGETcx-XcXZq7YFHsFdzBDniQku9cxFUJL_vBoEKKhCH+cDKRw@mail.gmail.com>
References: <20190724001100.133423-1-saravanak@google.com> <20190724001100.133423-4-saravanak@google.com>
 <141d2e16-26cc-1f05-1ac0-6784bab5ae88@gmail.com> <CAGETcx-dVnLCRA+1CX47gtZgtwTcrN5KefpjMzh9OJB-BEnqyg@mail.gmail.com>
 <19c99a6e-51c3-68d7-d1d6-640aae754c14@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <19c99a6e-51c3-68d7-d1d6-640aae754c14@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Jonathan Corbet <corbet@lwn.net>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, David Collins <collinsd@codeaurora.org>, Android Kernel Team <kernel-team@android.com>, Linux Doc Mailing List <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 19, 2019 at 10:16 AM Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 8/15/19 6:50 PM, Saravana Kannan wrote:
> > On Wed, Aug 7, 2019 at 7:06 PM Frank Rowand <frowand.list@gmail.com> wrote:
> >>
> >> On 7/23/19 5:10 PM, Saravana Kannan wrote:
> >>> Add device-links after the devices are created (but before they are
> >>> probed) by looking at common DT bindings like clocks and
> >>> interconnects.
>
>
> < very big snip (lots of comments that deserve answers) >
>
>
> >>
> >> /**
> >>  * of_link_property - TODO:
> >>  * dev:
> >>  * con_np:
> >>  * prop:
> >>  *
> >>  * TODO...
> >>  *
> >>  * Any failed attempt to create a link will NOT result in an immediate return.
> >>  * of_link_property() must create all possible links even when one of more
> >>  * attempts to create a link fail.
> >>
> >> Why?  isn't one failure enough to prevent probing this device?
> >> Continuing to scan just results in extra work... which will be
> >> repeated every time device_link_check_waiting_consumers() is called
> >
> > Context:
> > As I said in the cover letter, avoiding unnecessary probes is just one
> > of the reasons for this patch. The other (arguably more important)
>
> Agree that it is more important.
>
>
> > reason for this patch is to make sure suppliers know that they have
> > consumers that are yet to be probed. That way, suppliers can leave
> > their resource on AND in the right state if they were left on by the
> > bootloader. For example, if a clock was left on and at 200 MHz, the
> > clock provider needs to keep that clock ON and at 200 MHz till all the
> > consumers are probed.
> >
> > Answer: Let's say a consumer device Z has suppliers A, B and C. If the
> > linking fails at A and you return immediately, then B and C could
> > probe and then figure that they have no more consumers (they don't see
> > a link to Z) and turn off their resources. And Z could fail
> > catastrophically.
>
> Then I think that this approach is fatally flawed in the current implementation.

I'm waiting to hear how it is fatally flawed. But maybe this is just a
misunderstanding of the problem?

In the text below, I'm not sure if you mixing up two different things
or just that your wording it a bit ambiguous. So pardon my nitpick to
err on the side of clarity.

> A device can be added by a module that is loaded.

No, in the example I gave, of_platform_default_populate_init() would
add all 3 of those devices during arch_initcall_sync().

>  In that case the device
> was not present at late boot when the suppliers may turn off their resources.

In that case, the _drivers_ for those devices aren't present at late
boot. So that they can't request to keep the resources on for their
consumer devices. Since there are no consumer requests on resources,
the suppliers turn off their resources at late boot (since there isn't
a better location as of today). The sync_state() call back added in a
subsequent patche in this series will provide the better location.

> (I am assuming the details since I have not reviewed the patches later in
> the series that implement this part.)
>
> Am I missing something?

I think you are mixing up devices getting added/populated with drivers
getting loaded as modules?

> If I am wrong, then I'll have more comments for your review replies for
> patches 2 and 3.

I'll wait for more review replies?

Thanks,
Saravana
