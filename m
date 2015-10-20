From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] driver core: Disable late probes by default
Date: Tue, 20 Oct 2015 07:05:23 -0700
Message-ID: <20151020140523.GA22021@kroah.com>
References: <20151016181129.GA1764@gradator.net>
 <1445267602-12576-1-git-send-email-tomeu.vizoso@collabora.com>
 <20151019151953.GA22662@kroah.com>
 <CAAObsKC5LZU1YTmQd16duiN1d0WhpLF8Af8z4ep-PUVy3n_hnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAAObsKC5LZU1YTmQd16duiN1d0WhpLF8Af8z4ep-PUVy3n_hnw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 20, 2015 at 09:40:48AM +0200, Tomeu Vizoso wrote:
> On 19 October 2015 at 17:19, Greg Kroah-Hartman
> <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
> > On Mon, Oct 19, 2015 at 05:13:22PM +0200, Tomeu Vizoso wrote:
> >> To smooth the transition to late probes, make disabled the default for
> >> DELAY_DEVICE_PROBES and let individual SoCs enable the option as they
> >> get fixed.
> >>
> >> Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> >> Link: https://lkml.kernel.org/g/20151016181129.GA1764-XWGZPxRNpGHk1uMJSBkQmQ@public.gmane.org
> >>
> >> ---
> >>
> >> Hi Rob,
> >>
> >> I'm sending this in case you think it would be best to leave the
> >> on-demand probe series in -next for now but have late probes disabled to
> >> avoid hassle to some people.
> >
> > I would like Rob to just drop this series please, I don't agree with it
> > at all at the moment.
> 
> Hi Greg,
> 
> is it the case that you are satisfied with deferred probes as a way of
> ordering device probing and that I should look at how to solve my
> problem by improving it?

Yes, especially given that you have said this does not speed up your
boot times, which I thought was your main goal here :(

If deferred probes doesn't work well, we can fix it, but for now it
seems our best option.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
