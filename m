From: Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH v1 2/2] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Wed, 12 Dec 2018 09:24:59 +0000
Message-ID: <VI1PR04MB532701CEDE94C068759987688BA70@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <1544445555-17325-1-git-send-email-pawell@cadence.com>
 <1544445555-17325-3-git-send-email-pawell@cadence.com>
 <87h8fkmfar.fsf@linux.intel.com>
 <BYAPR07MB47095110AF28CC11B4C9E144DDA60@BYAPR07MB4709.namprd07.prod.outlook.com>
 <CAL411-ryK2LLZVg5_sLkCYOuhwdHLVm5XavSyC9nbEXZah_43w@mail.gmail.com>
 <877egfmdxk.fsf@linux.intel.com>
 <VI1PR04MB5327B1CB6C6BC7D293701F1D8BA70@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <871s6nm9db.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <871s6nm9db.fsf@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>, Peter Chen <hzpeterchen@gmail.com>, "pawell@cadence.com" <pawell@cadence.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, lkml <linux-kernel@vger.kernel.org>, "adouglas@cadence.com" <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, "sureshp@cadence.com" <sureshp@cadence.com>, "pjez@cadence.com" <pjez@cadence.com>, "kurahul@cadence.com" <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

=20
> >
> > Interrupt handler (hardirq context) at CPU0, and process at CPU1, eg
> > role switch, unload module, etc.
>=20
> the process at CPU1 would need to disable interrupts (spin_lock_irq() or
> spin_lock_irqsave()), not the hardirq on CPU0 as that already runs with i=
nterrrupts
> disabled.
>=20
> https://www.kernel.org/doc/html/latest/kernel-hacking/locking.html#table-=
of-
> minimum-requirements
>=20

I see, thanks.

Peter
