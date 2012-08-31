From: "Shilimkar, Santosh" <santosh.shilimkar@ti.com>
Subject: Re: [PATCH v2 6/9] misc: Generic on-chip SRAM allocation driver
Date: Fri, 31 Aug 2012 02:40:50 -0700
Message-ID: <CAMQu2gxsdeX4z2Zrnb2NW7-gnh2Tyjcxkd2pOMOagkdkHGsgWQ@mail.gmail.com>
References: <1346405224-20399-1-git-send-email-p.zabel@pengutronix.de>
 <1346405224-20399-7-git-send-email-p.zabel@pengutronix.de> <1346405848.5316.11.camel@coredoba.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1346405848.5316.11.camel@coredoba.hi.pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Jan_L=FCbbe?= <jlu@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Shawn Guo <shawn.guo@linaro.org>, Richard Zhao <richard.zhao@freescale.com>, Huang Shijie <shijie8@gmail.com>, Dong Aisheng <dong.aisheng@linaro.org>, kernel@pengutronix.de, devicetree-discuss@lists.ozlabs.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 31, 2012 at 2:37 AM, Jan L=FCbbe <jlu@pengutronix.de> wrote=
:
>
> On Fri, 2012-08-31 at 11:27 +0200, Philipp Zabel wrote:
> > This driver requests and remaps a memory region as configured in th=
e
> > device tree. It serves memory from this region via the genalloc API=
=2E
> >
> > Other drivers can retrieve the genalloc pool from a phandle pointin=
g
> > to this drivers' device node in the device tree.
> >
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> >  drivers/misc/Kconfig  |    8 ++++
> >  drivers/misc/Makefile |    1 +
> >  drivers/misc/sram.c   |  105
> > +++++++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 114 insertions(+)
> >  create mode 100644 drivers/misc/sram.c
>
> We now have drivers/memory, which seems to be a good place for this.
>
drivers/memory is created for Memory controller device drivers. SRAM is
just pool of memory and should belong to some other place.

Regards
Santosh
