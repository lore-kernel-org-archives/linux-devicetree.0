From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: make of_device_ids const
Date: Wed, 10 Sep 2014 11:17:43 -0400
Message-ID: <20140910151743.GW30828@titan.lakedaemon.net>
References: <1410337579-23466-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1410337579-23466-3-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1410337579-23466-3-git-send-email-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Uwe,

On Wed, Sep 10, 2014 at 10:26:18AM +0200, Uwe Kleine-K=F6nig wrote:
> of_device_ids (i.e. compatible strings and the respective data) are n=
ot
> supposed to change at runtime. All functions working with of_device_i=
ds
> provided by <linux/of.h> work with const of_device_ids. So mark the
> non-const structs in arch/arm as const, too.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
=2E..
>  arch/arm/mach-mvebu/coherency.c          | 2 +-
>  arch/arm/mach-mvebu/pmsu.c               | 2 +-

=46or the mvebu stuff,

Acked-by: Jason Cooper <jason-E2nrXYax+wsBe96aLqz0jA@public.gmane.org>

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
