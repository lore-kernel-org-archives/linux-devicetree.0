From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 3/3] mailbox: Add support for ST's Mailbox IP
Date: Wed, 18 Mar 2015 13:12:26 +0000
Message-ID: <20150318131226.GM3318@x1>
References: <1425379283-1567-1-git-send-email-lee.jones@linaro.org>
 <1425379283-1567-4-git-send-email-lee.jones@linaro.org>
 <CAJe_Zhc1uLf_grsbzOs3ahJHJXXZ+BF__702mEPPL=SWPU5nzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJe_Zhc1uLf_grsbzOs3ahJHJXXZ+BF__702mEPPL=SWPU5nzw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jaswinder.singh@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, kernel@stlinux.com
List-Id: devicetree@vger.kernel.org

On Wed, 04 Mar 2015, Jassi Brar wrote:
> On 3 March 2015 at 16:11, Lee Jones <lee.jones@linaro.org> wrote:
>=20
> > ---
> >  drivers/mailbox/Kconfig       |   7 +
> >  drivers/mailbox/Makefile      |   2 +
> >  drivers/mailbox/mailbox-sti.c | 664 ++++++++++++++++++++++++++++++=
++++++++++++
> >  include/linux/mailbox_sti.h   | 128 ++++++++

[...]

> > +static int sti_mbox_send_data(struct mbox_chan *chan, void *data)
> > +{
> > +       struct sti_mbox_dev_data *mbox =3D chan->con_priv;
> > +       struct sti_mbox_data *md =3D &mbox->mdata;
> > +       struct sti_mbox_device *mdev =3D mbox->parent;
> > +       struct sti_mbox_attribute *p =3D mdev->cfg;
> > +       void __iomem *base;
> > +
> > +       dev_info(mdev->dev, "Using Mbox (%x) %s: channel (%d)\n",
> > +                mdev->id, mdev->name, mbox->chan_id);
> > +
> > +       base =3D mdev->mbox_reg_base + (p->num_inst * mbox->tx_inst=
);
> > +
> > +       if ((!data) || (!sti_mbox_chan_is_tx(mbox)))
> >
> nit: too much protection.

What makes you think that?

[...]

> > +                       mbox->irq =3D irq_create_mapping(mbinst->ir=
q_domain,
> > +                                                      mbox->rx_id)=
;
> >
> simply assigning same IRQ to all controller DT nodes and using
> IRQF_SHARED for the common handler, wouldn't work?

I do have intentions to simplify this driver somewhat, but that will
take some time as it will require a great deal of consultation and
testing from the ST side.  This is the current internal implementation
which is used in the wild and has been fully tested.  If you'll allow
me to conduct my adaptions subsequently we can have full history and a
possible reversion plan if anything untoward take place i.e. I mess
something up.

[...]

> > + * struct sti_mbox_msg - sti mailbox message description
> > + * @dsize:             data payload size
> > + * @pdata:             message data payload
> > + */
> > +struct sti_mbox_msg {
> > +       u32             dsize;
> > +       u8              *pdata;
> > +};
> >
> There isn't any client driver in this patchset to tell exactly, but i=
t
> seems the header could be split into one shared between mailbox
> clients and provider and another internal to client/provider ?

I believe only the above will be required by the client.  Seems silly
to create a client specific header just for that, don't you think?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
