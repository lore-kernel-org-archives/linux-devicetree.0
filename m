From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 3/3] mailbox: Add support for ST's Mailbox IP
Date: Thu, 19 Mar 2015 09:57:38 +0000
Message-ID: <20150319095738.GY3318@x1>
References: <1425379283-1567-1-git-send-email-lee.jones@linaro.org>
 <1425379283-1567-4-git-send-email-lee.jones@linaro.org>
 <CAJe_Zhc1uLf_grsbzOs3ahJHJXXZ+BF__702mEPPL=SWPU5nzw@mail.gmail.com>
 <20150318131226.GM3318@x1>
 <CABb+yY2HwZn3VSvZ4iVfWE8GrsLDA6Tx_V2HZiOBvJb9UHY2Mg@mail.gmail.com>
 <20150318152658.GO3318@x1>
 <CABb+yY0tMwYTFDvF2Gce4h5xhKOboLS=32yK42-eoksZ8SAbZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABb+yY0tMwYTFDvF2Gce4h5xhKOboLS=32yK42-eoksZ8SAbZA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, kernel@stlinux.com
List-Id: devicetree@vger.kernel.org

On Thu, 19 Mar 2015, Jassi Brar wrote:

> On Wed, Mar 18, 2015 at 8:56 PM, Lee Jones <lee.jones@linaro.org> wro=
te:
> > On Wed, 18 Mar 2015, Jassi Brar wrote:
>=20
> >> >> > +                       mbox->irq =3D irq_create_mapping(mbin=
st->irq_domain,
> >> >> > +                                                      mbox->=
rx_id);
> >> >> >
> >> >> simply assigning same IRQ to all controller DT nodes and using
> >> >> IRQF_SHARED for the common handler, wouldn't work?
> >> >
> >> > I do have intentions to simplify this driver somewhat, but that =
will
> >> > take some time as it will require a great deal of consultation a=
nd
> >> > testing from the ST side.  This is the current internal implemen=
tation
> >> > which is used in the wild and has been fully tested.  If you'll =
allow
> >> > me to conduct my adaptions subsequently we can have full history=
 and a
> >> > possible reversion plan if anything untoward take place i.e. I m=
ess
> >> > something up.
> >> >
> >> OK, but wouldn't that break the bindings of this driver when you
> >> eventually do that?
> >
> > That's going to happen regardless, since these bindings are already=
 in
> > use internally.  Mainline (i.e. v4.0+) isn't going to be used in
> > products for years to come, so we have a lot of time until any new
> > bindings become ABI.
> >
> I thought time starts from upstream. It doesn't seem right to
> knowingly introduce a binding that we are going to break in coming
> weeks. For this reason, it needs ACK from some DT maintainer.

Time starts from when binding comes out of active development mode and
becomes ABI.  I can issue a statement in the binding document to say
that is in a state of flux if that makes you feel better about it.

Development bindings change all the time.

> >> >> > + * struct sti_mbox_msg - sti mailbox message description
> >> >> > + * @dsize:             data payload size
> >> >> > + * @pdata:             message data payload
> >> >> > + */
> >> >> > +struct sti_mbox_msg {
> >> >> > +       u32             dsize;
> >> >> > +       u8              *pdata;
> >> >> > +};
> >> >> >
> >> >> There isn't any client driver in this patchset to tell exactly,=
 but it
> >> >> seems the header could be split into one shared between mailbox
> >> >> clients and provider and another internal to client/provider ?
> >> >
> >> > I believe only the above will be required by the client.  Seems =
silly
> >> > to create a client specific header just for that, don't you thin=
k?
> >> >
> >> Do you mean to have copies of the structure in controller and clie=
nt driver? :O
> >
> > I do not.  I planned on sharing the main header with with client
> > also.
> >
> > But I guess by your reaction you suggest having a teeny client head=
er
> > as the best way forward then.
> >
> Yes, please.

Roger red leader.

> And also no header that's included by exactly one file.

So you also want me to drag in all of the controller structs into the
driver?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
