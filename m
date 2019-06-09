From: Dragan Cvetic <draganc@xilinx.com>
Subject: RE: [PATCH V5 02/11] misc: xilinx-sdfec: add core driver
Date: Sun, 9 Jun 2019 18:48:31 +0000
Message-ID: <CH2PR02MB6359778016A4BDCBD29EA275CB120@CH2PR02MB6359.namprd02.prod.outlook.com>
References: <1560038656-380620-1-git-send-email-dragan.cvetic@xilinx.com>
 <1560038656-380620-3-git-send-email-dragan.cvetic@xilinx.com>
 <20190609112235.GA16574@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190609112235.GA16574@kroah.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Michal Simek <michals@xilinx.com>, Derek Kiernan <dkiernan@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Greg KH [mailto:gregkh@linuxfoundation.org]
> Sent: Sunday 9 June 2019 12:23
> To: Dragan Cvetic <draganc@xilinx.com>
> Cc: arnd@arndb.de; Michal Simek <michals@xilinx.com>; linux-arm-kernel@lists.infradead.org; robh+dt@kernel.org;
> mark.rutland@arm.com; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Derek Kiernan <dkiernan@xilinx.com>
> Subject: Re: [PATCH V5 02/11] misc: xilinx-sdfec: add core driver
> 
> On Sun, Jun 09, 2019 at 01:04:07AM +0100, Dragan Cvetic wrote:
> > Implement a platform driver that matches with xlnx,
> > sd-fec-1.1 device tree node and registers as a character
> > device, including:
> > - SD-FEC driver binds to sdfec DT node.
> > - creates and initialise an initial driver dev structure.
> > - add the driver in Linux build and Kconfig.
> >
> > Tested-by: Dragan Cvetic <dragan.cvetic@xilinx.com>
> > Signed-off-by: Derek Kiernan <derek.kiernan@xilinx.com>
> > Signed-off-by: Dragan Cvetic <dragan.cvetic@xilinx.com>
> > ---
> >  drivers/misc/Kconfig        |  12 +++++
> >  drivers/misc/Makefile       |   1 +
> >  drivers/misc/xilinx_sdfec.c | 118 ++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 131 insertions(+)
> >  create mode 100644 drivers/misc/xilinx_sdfec.c
> >
> > diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> > index 6b0417b..319a6bf 100644
> > --- a/drivers/misc/Kconfig
> > +++ b/drivers/misc/Kconfig
> > @@ -471,6 +471,18 @@ config PCI_ENDPOINT_TEST
> >             Enable this configuration option to enable the host side test driver
> >             for PCI Endpoint.
> >
> > +config XILINX_SDFEC
> > +	tristate "Xilinx SDFEC 16"
> > +	help
> > +	  This option enables support for the Xilinx SDFEC (Soft Decision
> > +	  Forward Error Correction) driver. This enables a char driver
> > +	  for the SDFEC.
> > +
> > +	  You may select this driver if your design instantiates the
> > +	  SDFEC(16nm) hardened block. To compile this as a module choose M.
> > +
> > +	  If unsure, say N.
> > +
> >  config MISC_RTSX
> >  	tristate
> >  	default MISC_RTSX_PCI || MISC_RTSX_USB
> > diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> > index b9affcd..0cb3546 100644
> > --- a/drivers/misc/Makefile
> > +++ b/drivers/misc/Makefile
> > @@ -59,3 +59,4 @@ obj-$(CONFIG_OCXL)		+= ocxl/
> >  obj-y				+= cardreader/
> >  obj-$(CONFIG_PVPANIC)   	+= pvpanic.o
> >  obj-$(CONFIG_HABANA_AI)		+= habanalabs/
> > +obj-$(CONFIG_XILINX_SDFEC)	+= xilinx_sdfec.o
> > diff --git a/drivers/misc/xilinx_sdfec.c b/drivers/misc/xilinx_sdfec.c
> > new file mode 100644
> > index 0000000..75cc980
> > --- /dev/null
> > +++ b/drivers/misc/xilinx_sdfec.c
> > @@ -0,0 +1,118 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Xilinx SDFEC
> > + *
> > + * Copyright (C) 2019 Xilinx, Inc.
> > + *
> > + * Description:
> > + * This driver is developed for SDFEC16 (Soft Decision FEC 16nm)
> > + * IP. It exposes a char device which supports file operations
> > + * like  open(), close() and ioctl().
> > + */
> > +
> > +#include <linux/miscdevice.h>
> > +#include <linux/io.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/poll.h>
> > +#include <linux/slab.h>
> > +#include <linux/clk.h>
> > +
> > +static int xsdfec_ndevs;
> 
> You should use an idr for this, not just a number you bump up and down.
> This will not work properly at all.
> 
> Think about this situation:
> 	probe device 0
> 	xsdfec_ndevs = 1
> 	probe device 1
> 	xsdfec_ndevs = 2
> 	remove device 0
> 	xsdfec_ndevs = 0
> 	probe another device
> 	misc device fails due to duplicate name.
>

My bad.
I can use idr, but couldn't be better optimized code if use simple mutex to protect the variable.

> thanks,
> 
> greg k-h
