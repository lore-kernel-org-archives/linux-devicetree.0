From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] ARM: vexpress: bindings: Add generic PD awareness to the
 spc controller
Date: Wed, 7 Jan 2015 15:57:47 +0000
Message-ID: <20150107155747.GA31975@red-moon>
References: <1420562732-4353-1-git-send-email-mathieu.poirier@linaro.org>
 <CAL_JsqJwauxNNojhAaYEr7oQTm6fwYwtByv_s6-tHiXYA214AQ@mail.gmail.com>
 <CANLsYkz_tx0MAnssO1JmgGzeaj12oU64FJjiKKyEOyXuUKk8jQ@mail.gmail.com>
 <CAL_JsqLv8Q4eS_bwuLbEOBSxjU7uff4__KcSi3qwAvgmjhQKHw@mail.gmail.com>
 <20150107105438.GA7256@e102568-lin.cambridge.arm.com>
 <CANLsYkxbMT1cYquZzbcYuo+=5xNBUhS6jJePovErwkaDDef_Gg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CANLsYkxbMT1cYquZzbcYuo+=5xNBUhS6jJePovErwkaDDef_Gg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 07, 2015 at 02:33:38PM +0000, Mathieu Poirier wrote:

[...]

> >> > I will ask the vexpress maintainers where they want to see this code
> >> > going.  Would you accept this binding as part of the existing
> >> > "arm,vexpress-sysreg" [1] or even "arm,vexpress-scc" [2]?
> >
> > We are not CC'ed :). [2] is my answer, see below.
> 
> Thanks for the review - does it also mean you'd like to see the
> creation of the generic power domains moved to tc2_pm.c ?

Not necessarily, I think the creation is ok where it is, what we have
to do is to link the power domains to idle states instead of "disabling"
the spc power down command, see other thread.

I agree you need updated DT bindings for idle states to achieve that
and all the glue code that goes with it (in order for an idle state
to link to the power domain structs you are creating).

I copied in Kevin and Daniel since I know they are interested and are
working on this.

Thanks,
Lorenzo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
