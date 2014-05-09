From: "Priit Laes" <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: Re: Re: [PATCH v2 3/7] mfd: add support for sun6i PRCM
 (Power/Reset/Clock Management) unit
Date: Fri, 09 May 2014 08:05:09 +0300
Message-ID: <1399611909.13870.0.camel@chi>
References: <1399483554-8824-1-git-send-email-boris.brezillon@free-electrons.com>
	 <1399483554-8824-4-git-send-email-boris.brezillon@free-electrons.com>
	 <20140508110205.GB5767@lee--X1> <536BE366.8080907@free-electrons.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDJLTBEBXENBBMWBWGNQKGQE55QY3NQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <536BE366.8080907-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio =?ISO-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

=C3=9Chel kenal p=C3=A4eval, N, 08.05.2014 kell 22:04, kirjutas Boris BREZI=
LLON:
> On 08/05/2014 13:02, Lee Jones wrote:
> >> The PRCM (Power/Reset/Clock Management) block exposes several subdevic=
es
> >> in different subsystems (clk, reset ...)
> >>
> >> Add basic support for the PRCM unit with clk (AR100, AHB0, and APB0 cl=
ks)
> >> and reset controller subdevices.
> >>
> >> Other subdevices might be added later (if needed).
> >>
> >> Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >> ---
> >>  drivers/mfd/Kconfig      |   8 +++
> >>  drivers/mfd/Makefile     |   1 +
> >>  drivers/mfd/sun6i-prcm.c | 151 ++++++++++++++++++++++++++++++++++++++=
+++++++++
> >>  3 files changed, 160 insertions(+)
> >>  create mode 100644 drivers/mfd/sun6i-prcm.c
> > [...]
> >
> >> +#include <linux/module.h>
> >> +#include <linux/kernel.h>
> >> +#include <linux/errno.h>
> >> +#include <linux/err.h>
> >> +#include <linux/spinlock.h>
> >> +#include <linux/io.h>
> >> +#include <linux/slab.h>
> >> +#include <linux/mutex.h>
> >> +#include <linux/completion.h>
> >> +#include <linux/irq.h>
> >> +#include <linux/jiffies.h>
> >> +#include <linux/bitops.h>
> >> +#include <linux/fs.h>
> >> +#include <linux/of.h>
> >> +#include <linux/of_irq.h>
> >> +#include <linux/platform_device.h>
> >> +#include <linux/uaccess.h>
> >> +#include <linux/mfd/core.h>
> > I'm pretty sure you don't need half of these.  Please only add the
> > ones you make use of.
>=20
> Sure (this is what happens when you copy/paste from another driver :-))

Also, alphabetic order would be nice.

P=C3=A4ikest,
Priit Laes :)

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
