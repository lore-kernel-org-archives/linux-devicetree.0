From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/6] mailbox: Add support for ST's Mailbox IP
Date: Thu, 23 Jul 2015 09:29:34 +0100
Message-ID: <20150723082934.GW3061@x1>
References: <1437134647-28298-1-git-send-email-lee.jones@linaro.org>
 <1437134647-28298-4-git-send-email-lee.jones@linaro.org>
 <CABb+yY2nAT6V4Q8suAXRtPXrXkArGWVTAW28ts4Z3C_ybuJovA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CABb+yY2nAT6V4Q8suAXRtPXrXkArGWVTAW28ts4Z3C_ybuJovA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Let's carry on the conversation here, rather than submitting my fixed
up patch.  Once agreed, I will re-send.

> On Fri, Jul 17, 2015 at 5:34 PM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wro=
te:
> > ST's platforms currently support a maximum of 5 Mailboxes, one for
> > each of the supported co-processors situated on the platform.  Each
> > Mailbox is divided up into 4 instances which consist of 32 channels=
=2E
> > Messages are passed between the application and co-processors using
> > shared memory areas.  It is the Client's responsibility to manage
> > these areas.
> >
> Thanks. It's a lot better than the old driver. However a few nits as =
usual :)
>=20
> > +
> > +#define STI_MBOX_INST_MAX      4      /* RAM saving: Max supported=
 instances */
> >
> Above you say 5 instances. Another u32 doesn't cost much.

This should stay the same.  There are 4 instances.

> > +#define STI_MBOX_CHAN_MAX      20     /* RAM saving: Max supported=
 channels  */
> > +
> This assumption is reasonable.
>=20
> > +
> > +static void sti_mbox_enable_channel(struct mbox_chan *chan)
> > +{
> > +       struct sti_channel *chan_info =3D chan->con_priv;
> > +       struct sti_mbox_device *mdev =3D chan_info->mdev;
> > +       struct sti_mbox_pdata *pdata =3D dev_get_platdata(mdev->dev=
);
> > +       unsigned int instance =3D chan_info->instance;
> > +       unsigned int channel =3D chan_info->channel;
> > +       unsigned long flags;
> > +       void __iomem *base;
> > +
> > +       base =3D mdev->base + (instance * sizeof(u32));
> > +
> Maybe have something simpler like MBOX_BASE(instance)? Or some inline
> function to avoid this 5-lines ritual?

I've checked and we can't do this, as the we need most (all?) of the
intermediary variables too.  No ritual just to get the final variable
for instance.

> > +       spin_lock_irqsave(&sti_mbox_chan_lock, flags);
> > +       mdev->enabled[instance] |=3D BIT(channel);
> > +       writel_relaxed(BIT(channel), base + pdata->ena_set);
> > +       spin_unlock_irqrestore(&sti_mbox_chan_lock, flags);
> >
> You don't need locking for SET/CLR type registers which are meant for
> when they could be accessed by processors that can not share a lock.
> So maybe drop the lock here and elsewhere.

=46rom what I can gather, I think we need this locking.  What happens i=
f
we get scheduled between setting the enabled bit in our cache and
actually setting the ena_set bit?  We would be out of sync.

> However, you need some mechanism to check if you succeeded 'owning'
> the channel by reading back what you write to own the channel (not
> sure which is that register here). Usually we need that action and
> verification when we assign a channel to some user.

I don't think we need to do that with this driver.  All of the
allocation is controlled from within this code base.  The channels are
pre-allocated and written into the co-proc's Firmware.

> > +static int sti_mbox_send_data(struct mbox_chan *chan, void *data)
> > +{
> > +       struct sti_channel *chan_info =3D chan->con_priv;
> > +       struct sti_mbox_device *mdev =3D chan_info->mdev;
> > +       struct sti_mbox_pdata *pdata =3D dev_get_platdata(mdev->dev=
);
> > +       unsigned int instance =3D chan_info->instance;
> > +       unsigned int channel =3D chan_info->channel;
> > +       void __iomem *base;
> > +
> > +       if (!sti_mbox_tx_is_ready(chan))
> > +               return -EBUSY;
> This is the first thing I look out for in every new driver :)  this
> check is unnecessary.

I see what you mean now.  I will remove this check.

> > +static void sti_mbox_shutdown_chan(struct mbox_chan *chan)
> > +{
> > +       struct sti_channel *chan_info =3D chan->con_priv;
> > +       struct mbox_controller *mbox =3D chan_info->mdev->mbox;
> > +       int i;
> > +
> > +       for (i =3D 0; i < mbox->num_chans; i++)
> > +               if (chan =3D=3D &mbox->chans[i])
> > +                       break;
> > +
> > +       if (mbox->num_chans =3D=3D i) {
> > +               dev_warn(mbox->dev, "Request to free non-existent c=
hannel\n");
> > +               return;
> > +       }
> > +
> > +       sti_mbox_disable_channel(chan);
> > +       sti_mbox_clear_irq(chan);
> > +
> > +       /* Reset channel */
> > +       memset(chan, 0, sizeof(*chan));
> > +       chan->mbox =3D mbox;
> > +       chan->txdone_method =3D TXDONE_BY_POLL;
> >
> No please. mbox_chan is owned by the API. At most you could clear con=
_priv.

Removed.

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
> > +       }
> > +
> > +       for (i =3D 0; i < mbox->num_chans; i++) {
> > +               chan_info =3D mbox->chans[i].con_priv;
> > +
> > +               /* Is requested channel free? */
> > +               if (direction !=3D MBOX_LOOPBACK &&
> > +                   chan_info &&
> > +                   mbox->dev =3D=3D chan_info->mdev->dev &&
> > +                   instance =3D=3D chan_info->instance &&
> > +                   channel =3D=3D chan_info->channel) {
> > +                       dev_err(mbox->dev, "Channel in use\n");
> > +                       return NULL;
> > +               }
> > +
> > +               /* Find the first free slot */
> > +               if (!chan && !chan_info)
> > +                       chan =3D &mbox->chans[i];
>         shouldn't it break out of loop here?

I checked that and we don't.  We need to check all of the channels do
wee if we have double allocated.  If we have, NULL is returned from
above.

I have; however, updated the comment above for clarity.

> > +       }
> > +
> Doesn't mbox->chans[i].con_priv need some locking here?

Not that I can see.  Would you mind explaining further please?

> > +static const struct sti_mbox_pdata mbox_stih407_pdata =3D {
> > +       .num_inst       =3D 4,
> > +       .num_chan       =3D 32,
> > +       .irq_val        =3D 0x04,
> > +       .irq_set        =3D 0x24,
> > +       .irq_clr        =3D 0x44,
> > +       .ena_val        =3D 0x64,
> > +       .ena_set        =3D 0x84,
> > +       .ena_clr        =3D 0xa4,
> >
> Register offsets are parameters of the controller, and also these loo=
k
> ugly. Please make these #define's

These are now #defined.

> > +static int __init sti_mbox_init(void)
> > +{
> > +       return platform_driver_register(&sti_mbox_driver);
> > +}
> > +
> > +static void __exit sti_mbox_exit(void)
> > +{
> > +       platform_driver_unregister(&sti_mbox_driver);
> > +}
> > +
> > +postcore_initcall(sti_mbox_init);
> >
> This seems fragile. Shouldn't the users defer probe if they don't get=
 a channel?

This has been converted to module_platform_driver()

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
