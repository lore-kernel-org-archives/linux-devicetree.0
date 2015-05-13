From: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3 v6] dt/bindings: Add binding for the BCM2835 mailbox
 driver
Date: Wed, 13 May 2015 08:57:05 +0100
Message-ID: <20150513075705.GB3394@x1>
References: <1430857666-18877-1-git-send-email-eric@anholt.net>
 <CABb+yY3fDP_U8dz7TEJ+N6gKwhkQKdsfXDq209nQUCWu-zZYgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CABb+yY3fDP_U8dz7TEJ+N6gKwhkQKdsfXDq209nQUCWu-zZYgg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 12 May 2015, Jassi Brar wrote:
> On Wed, May 6, 2015 at 1:57 AM, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> wrote:
> > From: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
> >
> > This patch was split out of Lubomir's original mailbox patch by Eric
> > Anholt, and the required properties documentation and examples have
> > been filled out more completely and updated for the driver being
> > changed to expose a single channel.
> >
> > Signed-off-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
> > Signed-off-by: Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>
> > Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> > Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> > ---
> Thanks to the reviewers. Applied all 3 patches.

Jassi, can you remove patch 3/3 from your tree please?  Changes to
DTS(I) files should go in via ARM-SoC.  If SS Maintainers took DT
changes, there would be carnage.

I'm going to apply it now.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
