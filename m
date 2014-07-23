From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv9 2/4] mailbox: Introduce framework for mailbox
Date: Wed, 23 Jul 2014 16:26:49 +0100
Message-ID: <20140723152649.GJ23210@lee--X1>
References: <1406055250-29159-1-git-send-email-jaswinder.singh@linaro.org>
 <1406055374-29275-1-git-send-email-jaswinder.singh@linaro.org>
 <20140723085411.GG23210@lee--X1>
 <CAJe_ZhfaLqgKb3oK-m5Rpae5+zeAEk9-DLFOovq4qjBgg64b-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAJe_ZhfaLqgKb3oK-m5Rpae5+zeAEk9-DLFOovq4qjBgg64b-w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, LeyFoon Tan <lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Loic Pallardy <loic.pallardy-qxv4g6HH51o@public.gmane.org>, "Anna, Suman" <s-anna-l0cyMroinI0@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tetsuya Takinishi <t.takinishi-+CUm20s59erQFUHtdCDX3A@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mollie Wu <mollie.wu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 23 Jul 2014, Jassi Brar wrote:
> On 23 July 2014 14:24, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > On Wed, 23 Jul 2014, Jassi Brar wrote:
> >> Introduce common framework for client/protocol drivers and
> >> controller drivers of Inter-Processor-Communication (IPC).
> >>
> >> Client driver developers should have a look at
> >>  include/linux/mailbox_client.h to understand the part of
> >> the API exposed to client drivers.
> >> Similarly controller driver developers should have a look
> >> at include/linux/mailbox_controller.h
> >>
> >> Signed-off-by: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >> ---
> >>  MAINTAINERS                        |   8 +
> >>  drivers/mailbox/Makefile           |   4 +
> >>  drivers/mailbox/mailbox.c          | 467 ++++++++++++++++++++++++=
+++++++++++++
> >>  include/linux/mailbox_client.h     |  45 ++++
> >>  include/linux/mailbox_controller.h | 131 +++++++++++
> >>  5 files changed, 655 insertions(+)
> >>  create mode 100644 drivers/mailbox/mailbox.c
> >>  create mode 100644 include/linux/mailbox_client.h
> >>  create mode 100644 include/linux/mailbox_controller.h

[...]

> >> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> >> new file mode 100644
> >> index 0000000..99c0d23
> >> --- /dev/null
> >> +++ b/drivers/mailbox/mailbox.c
> >> @@ -0,0 +1,467 @@
> >> +/*
> >> + * Mailbox: Common code for Mailbox controllers and users
> >> + *
> >> + * Copyright (C) 2013-2014 Linaro Ltd.
> >> + * Author: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >
> > (C) Linaro, but you've supplied your Gmail?
> >
> I don't understand how that's a problem. Is it?
> I always try to post from my Linaro id still.

I don't know to be honest.  I always use my Linaro address when using
Linaro's time (and sometimes when I'm using my own), and plan to
s/linaro.org/gmail.com when/if I move on.  Not sure if there's even a
policy on this, just thought I'd mention it.

[...]

> >> +     if (!dev || !dev->of_node) {
> >> +             pr_debug("%s: No owner device node\n", __func__);
> >
> > Are you sure you want all of this debug prints in the final version=
?
> >
> pr_debug is as good as absent unless DEBUG is defined

I'm more concerned with how the code looks than the system log, but if
think it will be useful to someone, by all means keep it in.

[...]

> >> +     if (chan->txdone_method =3D=3D (TXDONE_BY_POLL | TXDONE_BY_A=
CK))
> >> +             chan->txdone_method =3D TXDONE_BY_POLL;
> >
> > Unless you're leaving it there for clarity, you can drop the
> > "TXDONE_BY_POLL |" from if().
> >
> We need to check for both.

What I'm trying to get at is; if it's already TXDONE_BY_POLL, there is =
no
need to set it to TXDONE_BY_POLL.

[...]

> >> +++ b/include/linux/mailbox_controller.h
> >> @@ -0,0 +1,131 @@
> >> +/*
> >> + * This program is free software; you can redistribute it and/or =
modify
> >> + * it under the terms of the GNU General Public License version 2=
 as
> >> + * published by the Free Software Foundation.
> >> + */
> >> +
> >> +#ifndef __MAILBOX_CONTROLLER_H
> >> +#define __MAILBOX_CONTROLLER_H
> >> +
> >> +#include <linux/of.h>
> >
> > completion.h
> > device.h
> > timer.h
> >
> > Etc.
> >
> And what else? :)

I'm not going to do all the work for you Jassi. ;)

(Actually, that's as far as I got.  It was more a hint for you to look
to see _if_ there are any others to add, not to say that there were.)

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
