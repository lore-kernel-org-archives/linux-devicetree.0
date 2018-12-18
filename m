Return-Path: <SRS0=lkKz=O3=linux.intel.com=dalon.westergreen@kernel.org>
Message-ID: <26e08e796196eb846c62451e22d64edb860c818f.camel@linux.intel.com>
Subject: Re: [PATCH v2 net-next 09/10] net: eth: altera: add msgdma
 prefetcher
From: Dalon L Westergreen <dalon.westergreen@linux.intel.com>
Reply-To: dalon.westergreen@linux.intel.com
Date: Tue, 18 Dec 2018 09:00:24 -0800
In-Reply-To: <bf6d5920-fa90-abd7-65a5-19d48b3e6a7e@linux.intel.com>
References: <20181213175252.21143-1-dalon.westergreen@linux.intel.com>
	 <20181213175252.21143-10-dalon.westergreen@linux.intel.com>
	 <bf6d5920-fa90-abd7-65a5-19d48b3e6a7e@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
To: thor.thayer@linux.intel.com, netdev@vger.kernel.org, dinguyen@kernel.org, richardcochran@gmail.com, davem@davemloft.net, vbridger@opensource.altera.com, robh+dt@kernel.org, devicetree@vger.kernel.org, hean.loong.ong@intel.com
List-ID: <devicetree@vger.kernel.org>

On Tue, 2018-12-18 at 10:33 -0600, Thor Thayer wrote:
> Hi Dalon,
> 
> On 12/13/18 11:52 AM, dwesterg@gmail.com wrote:
> > From: Dalon Westergreen <dalon.westergreen@intel.com>
> > 
> > Add support for the mSGDMA prefetcher.  The prefetcher adds support
> > for a linked list of descriptors in system memory.  The prefetcher
> > feeds these to the mSGDMA dispatcher.
> > 
> > The prefetcher is configured to poll for the next descriptor in the
> > list to be owned by hardware, then pass the descriptor to the
> > dispatcher.  It will then poll the next descriptor until it is
> > owned by hardware.
> > 
> > The dispatcher responses are written back to the appropriate
> > descriptor, and the owned by hardware bit is cleared.
> > 
> > The driver sets up a linked list twice the tx and rx ring sizes,
> > with the last descriptor pointing back to the first.  This ensures
> > that the ring of descriptors will always have inactive descriptors
> > preventing the prefetcher from looping over and reusing descriptors
> > inappropriately.  The prefetcher will continuously loop over these
> > descriptors.  The driver modifies descriptors as required to update
> > the skb address and length as well as the owned by hardware bit.
> > 
> > In addition to the above, the mSGDMA prefetcher can be used to
> > handle rx and tx timestamps coming from the ethernet ip.  These
> > can be included in the prefetcher response in the descriptor.
> > 
> > Signed-off-by: Dalon Westergreen <dalon.westergreen@intel.com>
> > 
> > ---
> > Changes from v1:
> >   -> Alphabatize includes
> >   -> update xmit function to return type net_tx_t
> >   -> Cleanup msgdms descriptor ring by making is more apparent
> >      that the msgdma descriptor ring is 2 * ring_size
> > ---
> >   drivers/net/ethernet/altera/Makefile          |   2 +-
> >   .../altera/altera_msgdma_prefetcher.c         | 432 ++++++++++++++++++
> >   .../altera/altera_msgdma_prefetcher.h         |  30 ++
> >   .../altera/altera_msgdmahw_prefetcher.h       |  87 ++++
> >   drivers/net/ethernet/altera/altera_tse.h      |  14 +
> >   drivers/net/ethernet/altera/altera_tse_main.c |  51 +++
> >   6 files changed, 615 insertions(+), 1 deletion(-)
> >   create mode 100644 drivers/net/ethernet/altera/altera_msgdma_prefetcher.c
> >   create mode 100644 drivers/net/ethernet/altera/altera_msgdma_prefetcher.h
> >   create mode 100644
> > drivers/net/ethernet/altera/altera_msgdmahw_prefetcher.h
> > 
> > diff --git a/drivers/net/ethernet/altera/Makefile
> > b/drivers/net/ethernet/altera/Makefile
> > index 3e622b4c105a..f6627615c6c1 100644
> > --- a/drivers/net/ethernet/altera/Makefile
> > +++ b/drivers/net/ethernet/altera/Makefile
> > @@ -5,4 +5,4 @@
> >   obj-$(CONFIG_ALTERA_TSE) += altera_tse.o
> >   altera_tse-objs := altera_tse_main.o altera_tse_ethtool.o \
> >   		   altera_msgdma.o altera_sgdma.o altera_utils.o \
> > -		   intel_fpga_tod.o
> > +		   intel_fpga_tod.o altera_msgdma_prefetcher.o
> > diff --git a/drivers/net/ethernet/altera/altera_msgdma_prefetcher.c
> > b/drivers/net/ethernet/altera/altera_msgdma_prefetcher.c
> > new file mode 100644
> > index 000000000000..f50ea62f687d
> > --- /dev/null
> > +++ b/drivers/net/ethernet/altera/altera_msgdma_prefetcher.c
> > @@ -0,0 +1,432 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/* MSGDMA Prefetcher driver for Altera ethernet devices
> > + *
> > + * Copyright (C) 2018 Intel Corporation. All rights reserved.
> > + * Author(s):
> > + *   Dalon Westergreen <dalon.westergreen@intel.com>
> > + */
> > +
> > +#include <linux/list.h>
> > +#include <linux/netdevice.h>
> > +#include <linux/net_tstamp.h>
> > +#include "altera_tse.h"
> > +#include "altera_msgdma.h"
> > +#include "altera_msgdmahw.h"
> > +#include "altera_msgdma_prefetcher.h"
> > +#include "altera_msgdmahw_prefetcher.h"
> > +#include "altera_utils.h"
> > +
> Alphabetize includes. altera_tse.h can be just before altera_utils.h

snip...

> >   static const struct of_device_id altera_tse_ids[] = {
> > +	{ .compatible = "altr,tse-msgdma-2.0",
> > +		.data = &altera_dtype_prefetcher, },
> >   	{ .compatible = "altr,tse-msgdma-1.0", .data = &altera_dtype_msgdma, },
> >   	{ .compatible = "altr,tse-1.0", .data = &altera_dtype_sgdma, },
> >   	{ .compatible = "ALTR,tse-1.0", .data = &altera_dtype_sgdma, },
> > 
> Hmm. I'm not sure you sent the right version - this looks very similar 
> to v1.

Yes, something went wrong here.  I must have messed something up when playing
with git.

--dalon
