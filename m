From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH v4 3/4] arm64:thunder: Add initial dts for Cavium's
 Thunder SoC in 2 Node topology.
Date: Wed, 18 Mar 2015 10:47:34 +0000
Message-ID: <20150318104734.GG18951@arm.com>
References: <1421924755-26029-1-git-send-email-gkulkarni@caviumnetworks.com>
 <1421924755-26029-4-git-send-email-gkulkarni@caviumnetworks.com>
 <2882934.brFyhkGPyE@wuerfel>
 <1885509.Z0Gm3e3FlX@wuerfel>
 <CAFpQJXUvux+b9hYx_ZY-1hor0HRFFgh=e4vCYyJiDHrDC9Y=tQ@mail.gmail.com>
 <CAFpQJXXkXatxRcfpA1DjuuiUf3vup3DV+dACyGxT=TDkrO8rNQ@mail.gmail.com>
 <CAFpQJXVc5c=YRLw3uS5RiSR13veo_SUiM-aV6hf+diQuWxdfYQ@mail.gmail.com>
 <CAFpQJXWL-NM+WndfB5pLj6TmdVngACR9YCr_ahaUTqAO3DaX1g@mail.gmail.com>
 <20150318100004.GC18951@arm.com>
 <CAFpQJXWzhn=sFKOdbPGXGfQNr5outJodTH72RoC1VVYqt8jmdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAFpQJXWzhn=sFKOdbPGXGfQNr5outJodTH72RoC1VVYqt8jmdQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ganapatrao Kulkarni <gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Steve Capper <steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Roy Franz <roy.franz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "ddutile-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <ddutile-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org" <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ganapatrao Kulkarni <gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 18, 2015 at 10:39:43AM +0000, Ganapatrao Kulkarni wrote:
> On Wed, Mar 18, 2015 at 3:30 PM, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org> wrote:
> > On Wed, Mar 18, 2015 at 04:02:53AM +0000, Ganapatrao Kulkarni wrote:
> >> Please suggest how we go about these patches.
> >> please share your review comments, if any changes needs to be done.
> >
> > I can take the Kconfig patch if you send a version that applies cleanly.
> > As for the rest, you need an ack from a DT maintainer on the bindings
> > before anything else can get merged.
> i will send you Kconfig patch (i.e increase NR_CPUS range to 2-4096)
> separately after rebasing to
> linux-next, is that ok?

Just base against -rc4 and I'll fix any conflicts that arise.

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
