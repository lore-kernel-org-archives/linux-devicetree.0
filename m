From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/6] mailbox: Add support for ST's Mailbox IP
Date: Fri, 14 Aug 2015 11:41:23 +0100
Message-ID: <20150814104123.GL8782@x1>
References: <1437990272-23111-1-git-send-email-lee.jones@linaro.org>
 <1437990272-23111-4-git-send-email-lee.jones@linaro.org>
 <CABb+yY3NTHLx2N-sUABjxQW=MUCntdUg1d8kjvjH0dkb4n9EgA@mail.gmail.com>
 <20150814063343.GI8782@x1>
 <CABb+yY07A=jWvDgbPMpDdT=WPhwSzLumMGiJSB4NddTA4z7Hww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CABb+yY07A=jWvDgbPMpDdT=WPhwSzLumMGiJSB4NddTA4z7Hww-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 14 Aug 2015, Jassi Brar wrote:

> On Fri, Aug 14, 2015 at 12:03 PM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wr=
ote:
> > On Thu, 13 Aug 2015, Jassi Brar wrote:
> >> On Mon, Jul 27, 2015 at 3:14 PM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> =
wrote:
> >>
> >> > +
> >> > +static bool sti_mbox_tx_is_ready(struct mbox_chan *chan)
> >> > +{
> >> > +       struct sti_channel *chan_info =3D chan->con_priv;
> >> > +       struct sti_mbox_device *mdev =3D chan_info->mdev;
> >> > +       unsigned int instance =3D chan_info->instance;
> >> > +       unsigned int channel =3D chan_info->channel;
> >> > +       void __iomem *base =3D MBOX_BASE(mdev, instance);
> >> > +
> >> > +       if (!(chan_info->direction & MBOX_TX))
> >> > +               return false;
> >> >
> >> Here the 'direction' is gotten via DT node of the client i.e, you
> >> expect consumer drivers to tell the provider what its limitations =
are?
> >>
> >> IMO if some physical channel can't do TX then that should be eithe=
r
> >> hardcoded inside the controller driver or learnt via DT node of th=
e
> >> _controller_.
> >
> > That's a fair point.
> .
>=20
> >  I need to create a new property similar to the
> > already existing 'read-only'.  I guess 'tx-only' is equivalent.
> >
> Just to be clear, if you must have such a property it should come fro=
m
> the _controller_ node.

Correct.  That's the plan.

> However at one point you said,  "Only the A9 (Mbox 0) can Rx."
>   Which sounds like the 'simplex' constraint is not coming from the
> mailbox controller but from the remote endpoints that don't RX+TX
> except for one of them. That makes more sense than a controller with
> differently capable physical channels. If that is indeed the
> situation, then the controller is actually 'duplex' and there should
> be no tx-only/rx-only property anywhere. Everything automatically
> falls into place because client drivers are written for specific
> targets and, unless you write some code, there can be no TX call to a
> remote that doesn't listen.

Unfortunately it's a restriction of the hardware (or the controller as
you call it, although it's not really a controller).  There is only
one IRQ for Rx'ing and that's wired up to the A9's mailbox (Mailbox
0).  If one of the remote processors attempted to send a message
through any of the other mailboxes (other than the Mailbox 0), then no
one would hear the doorbell ring and the message would go unserviced.

> >> > +
> >> > +       for (i =3D 0; i < mbox->num_chans; i++) {
> >> > +               chan_info =3D mbox->chans[i].con_priv;
> >> > +
> >> > +               /* Is requested channel free? */
> >> > +               if (direction !=3D MBOX_LOOPBACK &&
> >> >
> >> Consider this example when 2 clients ask for same physical channel=
 but
> >> in different modes.
> >>            mboxes =3D <&mboxA 0 1 MBOX_TX>;
> >>            mboxes =3D <&mboxA 0 1 MBOX_LOOPBACK>;
> >>
> >> You happily assign 2 virtual channels backed by one physical chann=
el
> >> {mboxA, 0, 1}. The 2 clients think they can freely do startup(),
> >> shutdown() and send_data() on the channels. But obviously we are
> >> screwed with races like
> >>    client1.startup()
> >>     -> client2.startup()
> >>         -> client2.send_data()
> >>             -> client2.shutdown()
> >>                 -> client1.send_data()  XXXX
> >
> > Good catch and a fair point.  As you say, it's unlikely to happen, =
but
> > I would like to prevent it in any case.
> >
> No, such races are a practical problem. We must own them.
>=20
> I was talking about problems that arise because someone wrote bad
> DT... those are not 'practical' problems because there are too many
> ways to screw up with bad DT properties that if we try to check for
> them we'll go insane.

The only thing I'm having trouble with protecting at the moment is
other clients _also_ requesting a LOOPBACK channel.  I would like to
check which clients have already requested one/them, however that
information is not available until _after_ xlate() has been called,
which is pretty frustrating.  Perhaps I'll put a comment in instead.

> >>  Now you can shove in some more checks to 'fix' the race OR you ca=
n
> >> simply expose only physical channels.
> >
> > We can't expose all of the channels.  There are too many and would
> > take up too much *unused* memory.
> >
> I am aware of that. I said expose _only_ physical channels, not _all_=
 :)

It's impossible to know which physical channels will be used by
clients and subsequently which physical channels to expose.

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
