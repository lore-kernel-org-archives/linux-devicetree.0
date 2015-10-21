From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] driver core: Disable late probes by default
Date: Tue, 20 Oct 2015 20:39:17 -0700
Message-ID: <20151021033917.GB32366@kroah.com>
References: <20151016181129.GA1764@gradator.net>
 <1445267602-12576-1-git-send-email-tomeu.vizoso@collabora.com>
 <20151019151953.GA22662@kroah.com>
 <CAAObsKC5LZU1YTmQd16duiN1d0WhpLF8Af8z4ep-PUVy3n_hnw@mail.gmail.com>
 <20151020140523.GA22021@kroah.com>
 <CAAObsKAL782-poBT1gkid+zzhWBOrnOUh7P7epjcja38j_-fbQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAAObsKAL782-poBT1gkid+zzhWBOrnOUh7P7epjcja38j_-fbQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 20, 2015 at 06:17:39PM +0200, Tomeu Vizoso wrote:
> On 20 October 2015 at 16:05, Greg Kroah-Hartman
> <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
> > On Tue, Oct 20, 2015 at 09:40:48AM +0200, Tomeu Vizoso wrote:
> >> On 19 October 2015 at 17:19, Greg Kroah-Hartman
> >> <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
> >> > On Mon, Oct 19, 2015 at 05:13:22PM +0200, Tomeu Vizoso wrote:
> >> >> To smooth the transition to late probes, make disabled the default for
> >> >> DELAY_DEVICE_PROBES and let individual SoCs enable the option as they
> >> >> get fixed.
> >> >>
> >> >> Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> >> >> Link: https://lkml.kernel.org/g/20151016181129.GA1764-XWGZPxRNpGHk1uMJSBkQmQ@public.gmane.org
> >> >>
> >> >> ---
> >> >>
> >> >> Hi Rob,
> >> >>
> >> >> I'm sending this in case you think it would be best to leave the
> >> >> on-demand probe series in -next for now but have late probes disabled to
> >> >> avoid hassle to some people.
> >> >
> >> > I would like Rob to just drop this series please, I don't agree with it
> >> > at all at the moment.
> >>
> >> Hi Greg,
> >>
> >> is it the case that you are satisfied with deferred probes as a way of
> >> ordering device probing and that I should look at how to solve my
> >> problem by improving it?
> >
> > Yes, especially given that you have said this does not speed up your
> > boot times, which I thought was your main goal here :(
> 
> Sorry if I'm repeating myself too often, but I have two goals: change
> the probing order to not send deferred probes to the back of the queue
> (getting the display up as fast as possible), and making easier to
> understand the boot process on embedded platforms.
> 
> The concrete issue that would be fixed by achieving the first goal was
> explained in this email from last year:
> 
> http://lists.freedesktop.org/archives/dri-devel/2014-August/066527.html
> 
> Because of that, ChromeOS had to use their own bindings for the panel
> node so that the panel probe wouldn't be deferred, introducing a
> sizable delta that is a barrier to rebasing on newer mainline releases
> and for vendors to upstream their HW adaptation for chrome devices.

1.5 second delay is crazy (again, my laptop boots to X in less time than
that), if there are a zillion probe deferrs, then maybe you can blame
this type of system, but I would _strongly_ suggest fixing the broken
driver that is causing such a delay instead, as that's the real problem
here.

And again, you say you did this to save boot time, yet you didn't
actually test to see if you fixed this issue, sorry, but I need to see
real numbers.

> The goal of the project I'm working on is to help reduce the delta so
> that ChromeOS (but will also help other downstreams) can rebase more
> often and so that vendors have one excuse less to upstream support for
> their SoCs in a timely way.

That's great, and wonderful, and should be done, but again, find the
broken driver here and fix it.  We have the tools to determine what is
going wrong here, please use them.  Without that data, I'm going to
insist that it is not the deferred probe logic (hint, how many probe
functions can a processor make in 1.5 seconds?)

> About simplifying the boot processes, I was really convinced that
> people were as tired as me of debugging probing issues with deferred
> probes in the middle and I'm very surprised that you and Russell don't
> see any problem with it.

I don't see the problems on the hardware that I run, and if there are
problems, people don't tell me exactly what they are (hint, like what
I'm asking for here...)

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
