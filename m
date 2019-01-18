From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v4 9/9] hwmon (occ): Add sysfs attributes for additional
 OCC data
Date: Fri, 18 Jan 2019 01:43:52 +0100 (CET)
Message-ID: <alpine.DEB.2.21.1901180140150.1647@nanos.tec.linutronix.de>
References: <1531342898-15790-1-git-send-email-eajames@linux.vnet.ibm.com> <1531342898-15790-10-git-send-email-eajames@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531342898-15790-10-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux@roeck-us.net, jdelvare@suse.com, Mark Rutland <mark.rutland@arm.com>, openbmc@lists.ozlabs.org, robh+dt@kernel.org, joel@jms.id.au, Kate Stewart <kstewart@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

Eddie,

On Wed, 11 Jul 2018, Eddie James wrote:

> --- /dev/null
> +++ b/drivers/hwmon/occ/sysfs.c
> @@ -0,0 +1,188 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * OCC hwmon driver sysfs interface
> + *
> + * Copyright (C) IBM Corporation 2018
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */

The above license information is inconsistent.

The SPDX license identifier says GPL v2 only, but the license notice says
GPL v2 or later. This is just wrong.

Please decide which one to use and please also remove the boiler plate
text. It is redundant.

See Documentation/process/license-rules.rst

Please fix ASAP.

Thanks,

	tglx
