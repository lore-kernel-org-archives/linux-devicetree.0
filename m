From: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2] bus: ARM CCN PMU driver
Date: Tue, 22 Jul 2014 17:29:24 +0100
Message-ID: <1406046564.25343.74.camel@hornet>
References: <1405091188-31754-1-git-send-email-pawel.moll@arm.com>
	 <1406023886.25343.48.camel@hornet>
	 <CAOesGMijrD6SxAyjvQptmAB8swqcvXNkiVS_nRCtUVtX2vYUFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMijrD6SxAyjvQptmAB8swqcvXNkiVS_nRCtUVtX2vYUFQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephane Eranian <eranian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnaldo Carvalho de Melo <acme-f8uhVLnGfZaxAyOMLChx1axOck334EZe@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jiri Olsa <jolsa-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2014-07-22 at 09:08 -0700, Olof Johansson wrote:
> On Tue, Jul 22, 2014 at 3:11 AM, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org> wrote:
> > Hi Arnd, Kevin, Olof,
> >
> > On Fri, 2014-07-11 at 16:06 +0100, Pawel Moll wrote:
> >> Driver providing perf backend for ARM Cache Coherent Network
> >> interconnect. Supports counting all hardware events and crosspoint
> >> watchpoints.
> >>
> >> Currently works with CCN-504 only, although there should be
> >> no changes required for CCN-508 (just impossible to test it now).
> >>
> >> Signed-off-by: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> >
> > Would you consider taking this through arm-soc tree? There isn't
> > anything in MAINTAINERS, but I vaguely remember Arnd proposing this
> > directory in the first place...
> 
> Yeah, drivers/bus lacks an owner and we've normally been the ones
> merging them. Please send a fresh version of the patch over.

I've just rebased in on top of v3.16-rc6 and there's no change
whatsoever (which is a good thing, I guess), so I can send v3, but the
"changes since v2" will say "nothing" :-)

Thanks!

Pawel

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
