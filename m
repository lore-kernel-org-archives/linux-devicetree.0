From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 2/6] mailbox: dt-bindings: Add shared [driver <=>
 device tree] defines
Date: Mon, 10 Aug 2015 09:24:45 +0100
Message-ID: <20150810082445.GA3249@x1>
References: <1437990272-23111-1-git-send-email-lee.jones@linaro.org>
 <1437990272-23111-3-git-send-email-lee.jones@linaro.org>
 <CABb+yY2asjH-c+VJXvG+RK0=2p=P4Y21pznNP0riaKMWLxYZog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABb+yY2asjH-c+VJXvG+RK0=2p=P4Y21pznNP0riaKMWLxYZog@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel@stlinux.com, Devicetree List <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, 10 Aug 2015, Jassi Brar wrote:
> On Mon, Jul 27, 2015 at 3:14 PM, Lee Jones <lee.jones@linaro.org> wro=
te:
> > This header is currently only used for defines pertaining to data
> > direction i.e. Rx, Tx or Loopback.
> >
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  include/dt-bindings/mailbox/mailbox.h | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >  create mode 100644 include/dt-bindings/mailbox/mailbox.h
> >
> > diff --git a/include/dt-bindings/mailbox/mailbox.h b/include/dt-bin=
dings/mailbox/mailbox.h
> > new file mode 100644
> > index 0000000..82e929a
> > --- /dev/null
> > +++ b/include/dt-bindings/mailbox/mailbox.h
> > @@ -0,0 +1,14 @@
> > +/*
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + */
> > +
> > +#ifndef __MAILBOX_CONTROLLER_DT_BINDINGS_H
> > +#define __MAILBOX_CONTROLLER_DT_BINDINGS_H
> > +
> > +#define MBOX_TX                0x1
> > +#define MBOX_RX                0x2
> > +#define MBOX_LOOPBACK  (MBOX_RX | MBOX_TX)
> > +
> Not sure I understand 'loopback'.  Does it mean h/w has some
> 'loopback' mode for testing purposes? Or it simply means the
> controller can send as well as receive messages?

'loopback' allows firmware to conduct some early function tests.
However, channels are simplex, so we provide protection against
multiple allocation of single channel.  By allocating a LOOPBACK
channel we over-ride this protection and allow a single channel to be
allocated twice, once for Rx and the other for Tx.

This mode was born out of a _real_ use-case.  Some of ST's firmware
running on products actually uses the loopback feature.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
