From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/5] mailbox: Add support for ST's Mailbox IP
Date: Fri, 2 Oct 2015 10:32:01 +0100
Message-ID: <20151002093201.GA23213@x1>
References: <1439994175-13360-1-git-send-email-lee.jones@linaro.org>
 <1439994175-13360-3-git-send-email-lee.jones@linaro.org>
 <CABb+yY2wJKBvL3eceVxkq3ZdS6V+-yqQp98YCaS_oR+3CobQ0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CABb+yY2wJKBvL3eceVxkq3ZdS6V+-yqQp98YCaS_oR+3CobQ0g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 02 Oct 2015, Jassi Brar wrote:

> On Wed, Aug 19, 2015 at 7:52 PM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wro=
te:
>=20
> ....
>=20
> > +
> > +#define MBOX_BASE(mdev, inst)   ((mdev)->base + (inst * 4))
> >
> It should be    (inst) * 4

I'm guessing you mean:

  ((mdev)->base + ((inst) * 4))

?

> > +/**
> > + * STi Mailbox device data
> > + *
> > + * An IP Mailbox is currently composed of 4 instances
> > + * Each instance is currently composed of 32 channels
> > + * This means that we have 128 channels per Mailbox
> > + * A channel an be used for TX or RX
> > + *
> > + * @dev:       Device to which it is attached
> > + * @mbox:      Representation of a communication channel controlle=
r
> > + * @base:      Base address of the register mapping region
> > + * @name:      Name of the mailbox
> > + * @enabled:   Local copy of enabled channels
> > + * @lock:      Mutex protecting enabled status
> > + */
> > +struct sti_mbox_device {
> > +       struct device           *dev;
> > +       struct mbox_controller  *mbox;
> > +       void __iomem            *base;
> > +       const char              *name;
> > +       u32                     enabled[STI_MBOX_INST_MAX];
> > +       spinlock_t              lock;
> > +       bool                    txonly;
> >
> txonly is never used after being initialized from DT :)   which is a
> good sign. So maybe just drop it and the optional property 'tx-only'.

Okay.

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
