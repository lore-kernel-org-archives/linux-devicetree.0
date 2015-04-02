From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL] Support for Fujitsu MB86S7X SoCs
Date: Wed, 1 Apr 2015 17:50:53 -0700
Message-ID: <20150402005053.GI8137@localhost>
References: <CAKR0VNJdCEEoM8mqFrc-teQ-q=DopGisos16+uKt=ky2mRjF8g@mail.gmail.com>
 <CAJe_ZheO1iNKj80798gT8RLcYoYo3xky3urw=ke4x-3wKdtZ9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAJe_ZheO1iNKj80798gT8RLcYoYo3xky3urw=ke4x-3wKdtZ9w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Vincent Yang <vincent.cw.yang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Paweee Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 31, 2015 at 08:32:01AM +0530, Jassi Brar wrote:
> On 18 March 2015 at 11:14, Vincent Yang <vincent.cw.yang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Hi Arnd and Olof,
> >
> > Please consider pulling in these patches for series of Fujitsu SoC
> > based around variations of 2xCA7+2xCA15 big.LITTLE architecture.
> >
> > The MHU driver is already queued in Mailbox tree.
> >
> > Thanks,
> >
> > The following changes since commit c517d838eb7d07bbe9507871fab3931deccff539:
> >
> >   Linux 4.0-rc1 (2015-02-22 18:21:14 -0800)
> >
> > are available in the git repository at:
> >
> >   git://git.linaro.org/landing-teams/working/fujitsu/integration.git
> > s7x-arch-pull
> >
> > for you to fetch changes up to 9cf417fee0bbea9296791fa9a15ab289307bb26a:
> >
> >   ARM: MB86S7x: Add configs (2015-03-17 11:22:40 +0530)
> >
> > ----------------------------------------------------------------
> > Jassi Brar (6):
> >       ARM: Add platform support for Fujitsu MB86S7X SoCs
> >       ARM: MB86S7X: Add MCPM support
> >       clk: Add clock driver for mb86s7x
> >       dt: mb86s7x: add dt files for MB86S7x evbs
> >       of: add Fujitsu vendor prefix
> >       ARM: MB86S7x: Add configs
> >
> Hi Arnd, Hi Olof,
>    A polite reminder on the pull request. Or do we miss doing something?

Hi,

No, we've just been backlogged and slow to respond.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
