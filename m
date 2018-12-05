From: Peter Chen <hzpeterchen@gmail.com>
Subject: Re: [RFC PATCH v2 04/15] usb:cdns3: Driver initialization code.
Date: Wed, 5 Dec 2018 16:57:12 +0800
Message-ID: <CAL411-rdMjjWBB0sKV690kpGdqiTPpMTaKsJ6aEaABgzig=cFw@mail.gmail.com>
References: <1542535751-16079-1-git-send-email-pawell@cadence.com>
 <1542535751-16079-5-git-send-email-pawell@cadence.com> <5BF7E5E8.3090406@ti.com>
 <CAL411-rWc23fbP0Ny9Kfdpe9ESUSVt5X00G1uFjJf+rj-2jWzg@mail.gmail.com> <5C065AEE.4010205@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5C065AEE.4010205@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rogerq@ti.com
Cc: pawell@cadence.com, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, adouglas@cadence.com, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com
List-Id: devicetree@vger.kernel.org

>
>
>
> On 04/12/18 10:50, Peter Chen wrote:
> >>> + * Cadence USBSS DRD Driver.
> >>> + *
> >>> + * Copyright (C) 2018 Cadence.
> >>> + *
> >>> + * Author: Peter Chen <peter.chen@nxp.com>
> >>> + *         Pawel Laszczak <pawell@cadence.com>
> >>> + */
> >>> +
> >>> +#include <linux/module.h>
> >>> +#include <linux/kernel.h>
> >>> +#include <linux/platform_device.h>
> >>> +#include <linux/interrupt.h>
> >>> +#include <linux/io.h>
> >>> +#include <linux/pm_runtime.h>
> >>> +
> >>> +#include "gadget.h"
> >>> +#include "core.h"
> >>> +
> >>> +static inline struct cdns3_role_driver *cdns3_get_current_role_driver(struct cdns3 *cdns)
> >>> +{
> >>> +     WARN_ON(cdns->role >= CDNS3_ROLE_END || !cdns->roles[cdns->role]);
> >>> +     return cdns->roles[cdns->role];
> >>> +}
> >>> +
> >>> +static inline int cdns3_role_start(struct cdns3 *cdns, enum cdns3_roles role)
> >>> +{
> >>> +     int ret;
> >>> +
> >>> +     if (role >= CDNS3_ROLE_END)
> >>
> >> WARN_ON()?
> >>
> >>> +             return 0;
> >>> +
> >>> +     if (!cdns->roles[role])
> >>> +             return -ENXIO;
> >>> +
> >>> +     mutex_lock(&cdns->mutex);
> >>> +     cdns->role = role;
> >>> +     ret = cdns->roles[role]->start(cdns);
> >>> +     mutex_unlock(&cdns->mutex);
> >>> +     return ret;
> >>> +}
> >>> +
> >>> +static inline void cdns3_role_stop(struct cdns3 *cdns)
> >>> +{
> >>> +     enum cdns3_roles role = cdns->role;
> >>> +
> >>> +     if (role == CDNS3_ROLE_END)
> >>
> >> WARN_ON(role >= CNDS3_ROLE_END) ?
> >>
> >>> +             return;
> >>> +
> >>> +     mutex_lock(&cdns->mutex);
> >>> +     cdns->roles[role]->stop(cdns);
> >>> +     cdns->role = CDNS3_ROLE_END;
> >>
> >> Why change the role here? You are just stopping the role not changing it.
> >> I think cdns->role should remain unchanged, so we can call cdns3_role_start()
> >> if required without error.
> >>
> >
> > The current version of this IP has some issues to detect vbus status correctly,
> > we have to force vbus status accordingly, so we need a status to indicate
> > vbus disconnection, and add some code to let controller know vbus
> > removal, in that case, the controller's state machine can be correct.
> > So, we increase one role 'CDNS3_ROLE_END' to for this purpose.
> >
> > CDNS3_ROLE_GADGET: gadget mode and VBUS on
> > CDNS3_ROLE_HOST: host mode and VBUS on
> > CDNS3_ROLE_END: VBUS off, eg either host or device cable on the port.
> >
> > So, we may start role from CDNS3_ROLE_END at probe when nothing is connected,
> > and need to set role as CDNS3_ROLE_END at ->stop for further handling at
> > role switch routine.
>
> OK. but still this (changing to ROLE_END) must be moved to the role switch routine
> and the explanation you just mentioned must be added there.
>

If we use host part as separate driver, something may need to change.
The ROLE_END
may need to add at role switch routine as your said.

> >
> >>> +     mutex_unlock(&cdns->mutex);
> >>> +}
> >>> +
> >>> +static enum cdns3_roles cdns3_get_role(struct cdns3 *cdns)
> >>> +{
> >>> +     if (cdns->roles[CDNS3_ROLE_HOST] && cdns->roles[CDNS3_ROLE_GADGET]) {
> >>> +             //TODO: implements selecting device/host mode
> >>> +             return CDNS3_ROLE_HOST;
> >>> +     }
> >>> +     return cdns->roles[CDNS3_ROLE_HOST]
> >>> +             ? CDNS3_ROLE_HOST
> >>> +             : CDNS3_ROLE_GADGET;
> >>
> >> Why not just
> >>         return cdns->role;
> >>
> >> I'm wondering if we really need this function.
> >
> > cdns->role gets from cdns3_get_role, and this API tells role at the runtime.
> > If both roles are supported, the role is decided by external
> > conditions, eg, vbus/id
> > or external connector. If only single role is supported, only one role structure
> > is allocated, cdns->roles[CDNS3_ROLE_HOST] or cdns->roles[CDNS3_ROLE_GADGET]
> >
>
> How about adding this description in function documentation.
>

Sure, but may need to redesign it due to host part as a standalone driver.


> >>
> >> Then you can move cdns3_role_start() as well to core_init_role().
> >>
> >
> > Usually, we request irq after hardware initialization has finished, if not,
> > there may unexpected interrupt.
>
> Doesn't kernel warn if interrupt happens and there is no handler?
> To avoid that I was suggesting to request_irq first.
>

The interrupt will not happen (related bit at GIC is masked) until we
call request_irq.
And we don't want to handle interrupts until hardware initialization, don't we?

Peter
