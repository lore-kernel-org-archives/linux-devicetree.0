From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4 v4] mailbox: Enable BCM2835 mailbox support
Date: Tue, 17 Mar 2015 18:05:17 +0000
Message-ID: <20150317180517.GD3318@x1>
References: <1426213936-4139-1-git-send-email-eric@anholt.net>
 <1426213936-4139-3-git-send-email-eric@anholt.net>
 <5507A095.5090805@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5507A095.5090805-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 16 Mar 2015, Stephen Warren wrote:

> On 03/12/2015 08:32 PM, Eric Anholt wrote:
> > From: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
> >=20
> > Implement BCM2835 mailbox support as a device registered with the
> > general purpose mailbox framework. Implementation based on commits =
by
> > Lubomir Rintel [1], Suman Anna and Jassi Brar [2] on which to base =
the
> > implementation.
> >=20
> > [1] http://lists.infradead.org/pipermail/linux-rpi-kernel/2013-Apri=
l/000528.html
> > [2] http://lists.infradead.org/pipermail/linux-rpi-kernel/2013-May/=
000546.html
> >=20
> > Signed-off-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
> > Signed-off-by: Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>
> > Signed-off-by: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
> > Signed-off-by: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> > Cc: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>=20
> Acks often don't carry over when there are significant changes.

Did I even Ack this?

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
