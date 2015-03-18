From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 3/3] mailbox: Add support for ST's Mailbox IP
Date: Wed, 18 Mar 2015 15:26:58 +0000
Message-ID: <20150318152658.GO3318@x1>
References: <1425379283-1567-1-git-send-email-lee.jones@linaro.org>
 <1425379283-1567-4-git-send-email-lee.jones@linaro.org>
 <CAJe_Zhc1uLf_grsbzOs3ahJHJXXZ+BF__702mEPPL=SWPU5nzw@mail.gmail.com>
 <20150318131226.GM3318@x1>
 <CABb+yY2HwZn3VSvZ4iVfWE8GrsLDA6Tx_V2HZiOBvJb9UHY2Mg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABb+yY2HwZn3VSvZ4iVfWE8GrsLDA6Tx_V2HZiOBvJb9UHY2Mg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, kernel@stlinux.com
List-Id: devicetree@vger.kernel.org

On Wed, 18 Mar 2015, Jassi Brar wrote:
> On Wed, Mar 18, 2015 at 6:42 PM, Lee Jones <lee.jones@linaro.org> wro=
te:
> > On Wed, 04 Mar 2015, Jassi Brar wrote:
> >
> >> > +
> >> > +       if ((!data) || (!sti_mbox_chan_is_tx(mbox)))
> >> >
> >> nit: too much protection.
> >
> > What makes you think that?
> >
>  Usually we write
>                if (!data || !sti_mbox_chan_is_tx(mbox))

Ah, the parentheses.  Yes, I agree.  Thanks for clarifying.

> >> > +                       mbox->irq =3D irq_create_mapping(mbinst-=
>irq_domain,
> >> > +                                                      mbox->rx_=
id);
> >> >
> >> simply assigning same IRQ to all controller DT nodes and using
> >> IRQF_SHARED for the common handler, wouldn't work?
> >
> > I do have intentions to simplify this driver somewhat, but that wil=
l
> > take some time as it will require a great deal of consultation and
> > testing from the ST side.  This is the current internal implementat=
ion
> > which is used in the wild and has been fully tested.  If you'll all=
ow
> > me to conduct my adaptions subsequently we can have full history an=
d a
> > possible reversion plan if anything untoward take place i.e. I mess
> > something up.
> >
> OK, but wouldn't that break the bindings of this driver when you
> eventually do that?

That's going to happen regardless, since these bindings are already in
use internally.  Mainline (i.e. v4.0+) isn't going to be used in
products for years to come, so we have a lot of time until any new
bindings become ABI.

> >> > + * struct sti_mbox_msg - sti mailbox message description
> >> > + * @dsize:             data payload size
> >> > + * @pdata:             message data payload
> >> > + */
> >> > +struct sti_mbox_msg {
> >> > +       u32             dsize;
> >> > +       u8              *pdata;
> >> > +};
> >> >
> >> There isn't any client driver in this patchset to tell exactly, bu=
t it
> >> seems the header could be split into one shared between mailbox
> >> clients and provider and another internal to client/provider ?
> >
> > I believe only the above will be required by the client.  Seems sil=
ly
> > to create a client specific header just for that, don't you think?
> >
> Do you mean to have copies of the structure in controller and client =
driver? :O

I do not.  I planned on sharing the main header with with client
also.

But I guess by your reaction you suggest having a teeny client header
as the best way forward then.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
