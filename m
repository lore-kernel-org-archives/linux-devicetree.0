From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/6] mailbox: Add support for ST's Mailbox IP
Date: Fri, 14 Aug 2015 07:33:43 +0100
Message-ID: <20150814063343.GI8782@x1>
References: <1437990272-23111-1-git-send-email-lee.jones@linaro.org>
 <1437990272-23111-4-git-send-email-lee.jones@linaro.org>
 <CABb+yY3NTHLx2N-sUABjxQW=MUCntdUg1d8kjvjH0dkb4n9EgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CABb+yY3NTHLx2N-sUABjxQW=MUCntdUg1d8kjvjH0dkb4n9EgA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 13 Aug 2015, Jassi Brar wrote:
> On Mon, Jul 27, 2015 at 3:14 PM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wro=
te:
>=20
> > +
> > +static bool sti_mbox_tx_is_ready(struct mbox_chan *chan)
> > +{
> > +       struct sti_channel *chan_info =3D chan->con_priv;
> > +       struct sti_mbox_device *mdev =3D chan_info->mdev;
> > +       unsigned int instance =3D chan_info->instance;
> > +       unsigned int channel =3D chan_info->channel;
> > +       void __iomem *base =3D MBOX_BASE(mdev, instance);
> > +
> > +       if (!(chan_info->direction & MBOX_TX))
> > +               return false;
> >
> Here the 'direction' is gotten via DT node of the client i.e, you
> expect consumer drivers to tell the provider what its limitations are=
?
>=20
> IMO if some physical channel can't do TX then that should be either
> hardcoded inside the controller driver or learnt via DT node of the
> _controller_.

That's a fair point.  I need to create a new property similar to the
already existing 'read-only'.  I guess 'tx-only' is equivalent.

> > +static struct mbox_chan *sti_mbox_xlate(struct mbox_controller *mb=
ox,
> > +                                       const struct of_phandle_arg=
s *spec)
> > +{
> > +       struct sti_mbox_device *mdev =3D dev_get_drvdata(mbox->dev)=
;
> > +       struct sti_mbox_pdata *pdata =3D dev_get_platdata(mdev->dev=
);
> > +       struct sti_channel *chan_info;
> > +       struct mbox_chan *chan =3D NULL;
> > +       unsigned int instance  =3D spec->args[0];
> > +       unsigned int channel   =3D spec->args[1];
> > +       unsigned int direction =3D spec->args[2];
> > +       int i;
> > +
> > +       /* Bounds checking */
> > +       if (instance >=3D pdata->num_inst || channel  >=3D pdata->n=
um_chan) {
> > +               dev_err(mbox->dev,
> > +                       "Invalid channel requested instance: %d cha=
nnel: %d\n",
> > +                       instance, channel);
> > +               return NULL;
> return ERR_PTR(-EINVAL)

I can handle all these, no problem.

> > +       }
> > +
> > +       for (i =3D 0; i < mbox->num_chans; i++) {
> > +               chan_info =3D mbox->chans[i].con_priv;
> > +
> > +               /* Is requested channel free? */
> > +               if (direction !=3D MBOX_LOOPBACK &&
> >
> Consider this example when 2 clients ask for same physical channel bu=
t
> in different modes.
>            mboxes =3D <&mboxA 0 1 MBOX_TX>;
>            mboxes =3D <&mboxA 0 1 MBOX_LOOPBACK>;
>=20
> You happily assign 2 virtual channels backed by one physical channel
> {mboxA, 0, 1}. The 2 clients think they can freely do startup(),
> shutdown() and send_data() on the channels. But obviously we are
> screwed with races like
>    client1.startup()
>     -> client2.startup()
>         -> client2.send_data()
>             -> client2.shutdown()
>                 -> client1.send_data()  XXXX

Good catch and a fair point.  As you say, it's unlikely to happen, but
I would like to prevent it in any case.

>  Now you can shove in some more checks to 'fix' the race OR you can
> simply expose only physical channels.

We can't expose all of the channels.  There are too many and would
take up too much *unused* memory.

I don't want to have an endless stream of checks either, but we should
try to cover the bases.  I think smarter (rather than more) checks is
the answer.  I'll have a think about it.

> Practically no client would ever
> ask it to do what it can't, and for the hypothetical possibility that
> some does, just return error.

Right.  Smarter error checking here and returning an error on a bad
config is what I plan to do.

[...]

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
