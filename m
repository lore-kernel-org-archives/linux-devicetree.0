From: Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v3 2/4] of/platform: Add functional dependency link from
 DT bindings
Date: Tue, 16 Jul 2019 16:49:38 -0700
Message-ID: <CAGETcx8FN6E3dgUrK6uk0W1g_FBk1wzohjf3W9eeVeRds0zrAg@mail.gmail.com>
References: <20190702004811.136450-1-saravanak@google.com> <20190702004811.136450-3-saravanak@google.com>
 <CAL_JsqLdvDpKB=iV6x3eTr2F4zY0bxU-Wjb+JeMjj5rdnRc-OQ@mail.gmail.com>
 <CAGETcx_i9353aRFbJXNS78EvqwmU-2-xSBJ+ySZX1gjjHpz_cg@mail.gmail.com>
 <9e75b3dd-380b-c868-728f-46379e53bc11@gmail.com> <07812739-0e6b-6598-ac58-8e0ea74a3331@gmail.com>
 <CAGETcx8YCCGxgXnByenVUb+q8pHPPTjwAjK3L_+9mwoCe=9SbA@mail.gmail.com>
 <3e340ff1-e842-2521-4344-da62802d472f@gmail.com> <CAL_JsqLySLMLanBJvyWqFGhVzXrEaUP-3t9MDmpnAXhQA_7y=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLySLMLanBJvyWqFGhVzXrEaUP-3t9MDmpnAXhQA_7y=g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Collins <collinsd@codeaurora.org>, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

Resending again due to HTML. Sorry about it, the darn thing keeps
getting turned on for some reason!

On Tue, Jul 16, 2019 at 3:57 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Mon, Jul 15, 2019 at 7:05 PM Frank Rowand <frowand.list@gmail.com> wrote:
> >
> > On 7/15/19 11:40 AM, Saravana Kannan wrote:
> > > Replying again because the previous email accidentally included HTML.
> > >
> > > Thanks for taking the time to reconsider the wording Frank. Your
> > > intention was clear to me in the first email too.
> > >
> > > A kernel command line option can also completely disable this
> > > functionality easily and cleanly. Can we pick that as an option? I've
> > > an implementation of that in the v5 series I sent out last week.
> >
> > Yes, Rob suggested a command line option for debugging, and I am fine with
> > that.  But even with that, I would like a lot of testing so that we have a
> > chance of finding systems that have trouble with the changes and could
> > potentially be fixed before impacting a large number of users.
>
> Leaving it in -next for more than a cycle will not help. There's some
> number of users who test linux-next. Then there's more that test -rc
> kernels. Then there's more that test final releases and/or stable
> kernels. Probably, the more stable the h/w, the more it tends to be
> latter groups. (I don't get reports of breaking PowerMacs with the
> changes sitting in linux-next.)
>
> My main worry about this being off by default is it won't get tested.
> I'm not sure there's enough interest to drive folks to turn it on and
> test. Maybe it needs to be on until we see breakage.

Android will start using this. So there's definitely going to be a lot
of motivation for people to start using this and testing this.

I'm also thinking we should start rejecting late_initcall_sync() level
clean up code in device drivers in the future and start asking them to
move to sync_state(). If this feature isn't turned on, the behavior
will default to a late_initcall_sync() level execution. But when this
is on, it'll actually work nicely with modules. So that's another way
to drive folks to it and improve things over time.

Maybe we can have this on by default in linux-next and -rc. Fix any
issues that show up and can be fixed without breaking the goal of this
series (make things work with modules). And finally turn it off by
default before it gets pulled into mainline? That way, we get the
maximum test coverage we can get, but not accidentally break anything
that wasn't tested?

Thanks,
Saravana
