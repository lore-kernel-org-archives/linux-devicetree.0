From: Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH v1 2/2] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Wed, 12 Dec 2018 07:38:11 +0000
Message-ID: <VI1PR04MB5327B1CB6C6BC7D293701F1D8BA70@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <1544445555-17325-1-git-send-email-pawell@cadence.com>
 <1544445555-17325-3-git-send-email-pawell@cadence.com>
 <87h8fkmfar.fsf@linux.intel.com>
 <BYAPR07MB47095110AF28CC11B4C9E144DDA60@BYAPR07MB4709.namprd07.prod.outlook.com>
 <CAL411-ryK2LLZVg5_sLkCYOuhwdHLVm5XavSyC9nbEXZah_43w@mail.gmail.com>
 <877egfmdxk.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <877egfmdxk.fsf@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>, Peter Chen <hzpeterchen@gmail.com>, "pawell@cadence.com" <pawell@cadence.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, lkml <linux-kernel@vger.kernel.org>, "adouglas@cadence.com" <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, "sureshp@cadence.com" <sureshp@cadence.com>, "pjez@cadence.com" <pjez@cadence.com>, "kurahul@cadence.com" <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

=20
> >> >> +                                           USB_CMD_STMODE |
> >> >> +
> >> >> + USB_STS_TMODE_SEL(tmode - 1));
> >> >
> >> >I'm 90% sure this won't work. There's a reason why we only enter the
> >> >requested test mode from status stage. How have you tested this?
> >>
> >
> > What's the reason?
> > It can work although the code is a little different with above, I
> > tested it using USBxHSETT tool at Windows.
>=20
> put a sniffer. Status stage won't complete
>=20

Ok, you mean sending test packet during the status completion handler?
I will see whether the status stage can complete next time when doing test.

> >> >> +    irqreturn_t ret =3D IRQ_NONE;
> >> >> +    unsigned long flags;
> >> >> +    u32 reg;
> >> >> +
> >> >> +    priv_dev =3D cdns->gadget_dev;
> >> >> +    spin_lock_irqsave(&priv_dev->lock, flags);
> >> >
> >> >you're already running in hardirq context. Why do you need this lock
> >> >at all? I would be better to use the hardirq handler to mask your
> >> >interrupts, so they don't fire again, then used the top-half
> >> >(softirq) handler to actually handle the interrupts.
> >>
> >
> > This controller may be ran at SMP environment, register and flag
> > access needs to be protected among CPUs running.
>=20
> in hardirq context? When interrupts are already disabled?

Interrupt handler (hardirq context) at CPU0, and process at CPU1, eg role s=
witch, unload module, etc.

Peter
