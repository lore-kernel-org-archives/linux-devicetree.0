From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH 3/3] fpga manager: Adding FPGA Manager support for Xilinx
 Zynq 7000
Date: Fri, 9 Oct 2015 19:23:51 +0100
Message-ID: <alpine.DEB.2.10.1510091922580.3150@atull-730U3E-740U3E>
References: <1444344307-22509-1-git-send-email-moritz.fischer@ettus.com> <1444344307-22509-4-git-send-email-moritz.fischer@ettus.com> <alpine.DEB.2.10.1510091903240.2257@atull-730U3E-740U3E> <20151009181613.GA12738@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151009181613.GA12738@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Moritz Fischer <moritz.fischer@ettus.com>, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 9 Oct 2015, Greg KH wrote:

> On Fri, Oct 09, 2015 at 07:09:15PM +0100, atull wrote:
> > On Thu, 8 Oct 2015, Moritz Fischer wrote:
> > 
> > > --- /dev/null
> > > +++ b/drivers/fpga/zynq-fpga.c
> > > @@ -0,0 +1,478 @@
> > > +/*
> > > + * Copyright (c) 2011-2015 Xilinx Inc.
> > > + * Copyright (c) 2015, National Instruments Corp.
> > > + *
> > > + * FPGA Manager Driver for Xilinx Zynq, heavily based on xdevcfg driver
> > > + * in their vendor tree.
> > > + *
> > > + * This program is free software; you can redistribute it and/or modify
> > > + * it under the terms of the GNU General Public License as published by
> > > + * the Free Software Foundation; version 2 of the License.
> > > + *
> > > + * This program is distributed in the hope that it will be useful,
> > > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> > > + * GNU General Public License for more details.
> > > + */
> > > +
> > > +#include <linux/clk.h>
> > > +#include <linux/completion.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/dma-mapping.h>
> > > +#include <linux/fpga/fpga-mgr.h>
> > > +#include <linux/io.h>
> > > +#include <linux/iopoll.h>
> > > +#include <linux/module.h>
> > > +#include <linux/mfd/syscon.h>
> > > +#include <linux/of_address.h>
> > > +#include <linux/of_irq.h>
> > > +#include <linux/interrupt.h>
> > > +#include <linux/pm.h>
> > > +#include <linux/regmap.h>
> > > +#include <linux/string.h>
> > 
> > Hi Moritz,
> > 
> > That was fast!  I just have a couple of very minor comments...
> > 
> > Please alphabetize the #includes.
> 
> Bah, who cares about that, it's not a requirement at all.
> 
> greg k-h
> 

Nice to know!  I get slammed every time for that!

Alan
