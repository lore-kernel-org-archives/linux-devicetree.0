From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/6] mailbox: dt-bindings: Add shared [driver <=>
 device tree] defines
Date: Wed, 12 Aug 2015 11:43:50 +0100
Message-ID: <20150812104350.GF18282@x1>
References: <1437990272-23111-1-git-send-email-lee.jones@linaro.org>
 <1437990272-23111-3-git-send-email-lee.jones@linaro.org>
 <CABb+yY2asjH-c+VJXvG+RK0=2p=P4Y21pznNP0riaKMWLxYZog@mail.gmail.com>
 <20150810082445.GA3249@x1>
 <CABb+yY3jUKXXJys32bHY1u+dbdsix71Xq_H1Lrkkt27vZzmf7w@mail.gmail.com>
 <20150812085309.GB18282@x1>
 <CABb+yY3LdX1Lk7jfPbdXr4Zw=zKGJ=TsRRhB5a4CeYHOsjb90A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CABb+yY3LdX1Lk7jfPbdXr4Zw=zKGJ=TsRRhB5a4CeYHOsjb90A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 12 Aug 2015, Jassi Brar wrote:

> On Wed, Aug 12, 2015 at 2:23 PM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wro=
te:
> > On Mon, 10 Aug 2015, Jassi Brar wrote:
> >
> >> On Mon, Aug 10, 2015 at 1:54 PM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> =
wrote:
> >> > On Mon, 10 Aug 2015, Jassi Brar wrote:
> >> >> On Mon, Jul 27, 2015 at 3:14 PM, Lee Jones <lee.jones-QSEj5FYQhm5QFI55V6+gNQ@public.gmane.org=
g> wrote:
> >> >> > This header is currently only used for defines pertaining to =
data
> >> >> > direction i.e. Rx, Tx or Loopback.
> >> >> >
> >> >> > Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >> >> > ---
> >> >> >  include/dt-bindings/mailbox/mailbox.h | 14 ++++++++++++++
> >> >> >  1 file changed, 14 insertions(+)
> >> >> >  create mode 100644 include/dt-bindings/mailbox/mailbox.h
> >> >> >
> >> >> > diff --git a/include/dt-bindings/mailbox/mailbox.h b/include/=
dt-bindings/mailbox/mailbox.h
> >> >> > new file mode 100644
> >> >> > index 0000000..82e929a
> >> >> > --- /dev/null
> >> >> > +++ b/include/dt-bindings/mailbox/mailbox.h
> >> >> > @@ -0,0 +1,14 @@
> >> >> > +/*
> >> >> > + * This program is free software; you can redistribute it an=
d/or modify
> >> >> > + * it under the terms of the GNU General Public License vers=
ion 2 as
> >> >> > + * published by the Free Software Foundation.
> >> >> > + */
> >> >> > +
> >> >> > +#ifndef __MAILBOX_CONTROLLER_DT_BINDINGS_H
> >> >> > +#define __MAILBOX_CONTROLLER_DT_BINDINGS_H
> >> >> > +
> >> >> > +#define MBOX_TX                0x1
> >> >> > +#define MBOX_RX                0x2
> >> >> > +#define MBOX_LOOPBACK  (MBOX_RX | MBOX_TX)
> >> >> > +
> >> >> Not sure I understand 'loopback'.  Does it mean h/w has some
> >> >> 'loopback' mode for testing purposes? Or it simply means the
> >> >> controller can send as well as receive messages?
> >> >
> >> > 'loopback' allows firmware to conduct some early function tests.
> >> > However, channels are simplex, so we provide protection against
> >> > multiple allocation of single channel.  By allocating a LOOPBACK
> >> > channel we over-ride this protection and allow a single channel =
to be
> >> > allocated twice, once for Rx and the other for Tx.
> >> >
> >> So basically hardware is half-duplex, not simplex. I think maybe y=
ou
> >> should simply allow for RX and TX always. It should work. Just
> >> handover any received data before send_data (reflecting the h/w
> >> limitation). That way you don't need any such special flag.
> >
> > Unfortunately no, that's not correct.  Only Mailbox 0 is half-duple=
x.
> > The others are simplex (Rx only).
> >
> Assuming that is indeed the case (though code and comments suggest
> otherwise),

Sorry, that should have read "Tx only".  Only the A9 (Mbox 0) can Rx.

> it is still not a matter of choice for clients to 'make' a
> channel RX or TX or RXTX. That is the property/constraint of the
> controller and the controller driver should simply check for channel
> ID to be zero in send_data() and return error if its non-zero.

The client is not 'making' the channel Rx or Tx.  It's requesting a
specific Rx or Tx channel.  It's the controller's responsibility to
tell the client if the configuration it has requested is invalid or
already in use.

You're suggesting I remove configuration checking during
mbox_request_channel(), which is not a good suggestion.  That will
fool the client into thinking it has successfully obtained a channel
with the configuration it desires, only to fail later when it attempts
to actually send a message.  Either that, or it will be waiting
forever for a message that it will never receive because it has
selected a Tx only channel to receive from.

That doesn't sound reasonable to me.

> >  Ideally I'd like to keep the
> > LOOPBACK flag, as it's easier to figure out if what someone is
> > attempting to do is actually valid.
> >
> I am not for such paranoia. Provider drivers is not the place to chec=
k
> for valid user data.

No one is checking data here.  We are checking channel confirmation,
which is absolutely a controller's responsibility.

> The controller driver should simply reject send_data() request on any
> mailbox > 0 while the consumer driver should scream for attention
> because that's where the problem is.

That would make debugging very difficult, due to the fact that we've
already insinuated that the client had successfully received the
channel/configuration it desired, when in actual fact, the provider of
that channel would know full well that it was actually invalid.

> Please note, what I suggest will only make the code simpler while not
> breaking anything.

Simpler yes.  We could remove all error checking and the driver would
be simpler still, but the fact remains that it would not be doing its
job and debugging would become neigh impossible.

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
