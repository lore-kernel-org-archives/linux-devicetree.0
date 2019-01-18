From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v4 9/9] hwmon (occ): Add sysfs attributes for additional
 OCC data
Date: Fri, 18 Jan 2019 12:47:08 +1100
Message-ID: <CACPK8Xf3=pTRubt0VnUJ6GyT7bG15oCL+XtqzfeAAtccqbR_xg@mail.gmail.com>
References: <1531342898-15790-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1531342898-15790-10-git-send-email-eajames@linux.vnet.ibm.com> <alpine.DEB.2.21.1901180140150.1647@nanos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.1901180140150.1647@nanos.tec.linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Eddie James <eajames@linux.vnet.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-hwmon@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, linux-doc@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>, Mark Rutland <mark.rutland@arm.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>, Kate Stewart <kstewart@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

On Fri, 18 Jan 2019 at 11:44, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Eddie,
>
> On Wed, 11 Jul 2018, Eddie James wrote:
>
> > --- /dev/null
> > +++ b/drivers/hwmon/occ/sysfs.c
> > @@ -0,0 +1,188 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * OCC hwmon driver sysfs interface
> > + *
> > + * Copyright (C) IBM Corporation 2018
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + */
>
> The above license information is inconsistent.
>
> The SPDX license identifier says GPL v2 only, but the license notice says
> GPL v2 or later. This is just wrong.
>
> Please decide which one to use and please also remove the boiler plate
> text. It is redundant.
>
> See Documentation/process/license-rules.rst

Thanks Thomas.

Eddie, as IBM contributed code our preferred license is GPLv2+. Be
sure to include the copyright line in your header (I noticed some OCC
files are missing this, please audit all of your recent
contributions):

// SPDX-License-Identifier: GPL-2.0+
// Copyright IBM Corp 2019

Cheers,

Joel
