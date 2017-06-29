From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 03/10] Documentation: Add device tree binding for
 Goldfish PIC driver
Date: Thu, 29 Jun 2017 18:17:33 -0500
Message-ID: <CAL_JsqJHN90TbOtcvr8CjLqpy9zokzKX1UgoRu+j=uH37-Xi6A@mail.gmail.com>
References: <1498664922-28493-1-git-send-email-aleksandar.markovic@rt-rk.com> <1498664922-28493-4-git-send-email-aleksandar.markovic@rt-rk.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1498664922-28493-4-git-send-email-aleksandar.markovic-FblTVreYubkAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aleksandar Markovic <aleksandar.markovic-FblTVreYubkAvxtiuMwx3w@public.gmane.org>
Cc: Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Aleksandar Markovic <aleksandar.markovic-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Miodrag Dinic <miodrag.dinic-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Goran Ferenc <goran.ferenc-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Douglas Leung <douglas.leung-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "Martin K. Petersen" <martin.petersen-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Petar Jovanovic <petar.jovanovic-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Ra
List-Id: devicetree@vger.kernel.org

On Wed, Jun 28, 2017 at 10:46 AM, Aleksandar Markovic
<aleksandar.markovic-FblTVreYubkAvxtiuMwx3w@public.gmane.org> wrote:
> From: Aleksandar Markovic <aleksandar.markovic-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
>
> Add documentation for DT binding of Goldfish PIC driver. The compatible
> string used by OS for binding the driver is "google,goldfish-pic".

This isn't even supported in Google's common kernel tree. If it's not
important enough for it, why should it be for mainline kernel?

To put it another way, why does goldfish need a special interrupt
controller. Just use one of the many that are already supported in the
kernel and emulated by qemu.

Same comments apply to the RTC patch.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
