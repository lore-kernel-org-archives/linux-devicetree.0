From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 1/9] mtd: nand: define struct nand_timings
Date: Thu, 8 May 2014 15:29:30 +0100
Message-ID: <20140508142930.GC5767@lee--X1>
References: <1394647664-8258-1-git-send-email-b.brezillon.dev@gmail.com>
 <1394647664-8258-2-git-send-email-b.brezillon.dev@gmail.com>
 <20140430175157.GB2497@norris-Latitude-E6410>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140430175157.GB2497@norris-Latitude-E6410>
Sender: linux-doc-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: Boris BREZILLON <b.brezillon.dev@gmail.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org, dev@linux-sunxi.org, linux-kernel@vger.kernel.org, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Rob Herring <robherring2@gmail.com>, Grant Likely <grant.likely@linaro.org>, linux-mtd@lists.infradead.org, Maxime Ripard <maxime.ripard@free-electrons.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

> > Define a struct containing the standard NAND timings as described i=
n NAND
> > datasheets.
> >=20
> > Signed-off-by: Boris BREZILLON <b.brezillon.dev@gmail.com>
> > ---
> >  include/linux/mtd/nand.h |   49 ++++++++++++++++++++++++++++++++++=
++++++++++++
> >  1 file changed, 49 insertions(+)
> >=20
> > diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> > index 389b3c5..f3ff3a3 100644
> > --- a/include/linux/mtd/nand.h
> > +++ b/include/linux/mtd/nand.h

[...]

> > + * Parameters)
>=20
> Please document the units for these fields here. It looks like you're
> using picoseconds.

Can't we leave this open to interpretation?  For instance, it's more
convenient for our driver to handle these as nano second values.

> > + *
> > + */
> > +
>=20
> Extra blank line.
>=20
> > +struct nand_sdr_timings {
> > +	u32 tALH_min;
> > +	u32 tADL_min;
> > +	u32 tALS_min;
> > +	u32 tAR_min;
> > +	u32 tCEA_max;
> > +	u32 tCEH_min;
> > +	u32 tCH_min;
> > +	u32 tCHZ_max;
> > +	u32 tCLH_min;
> > +	u32 tCLR_min;
> > +	u32 tCLS_min;
> > +	u32 tCOH_min;
> > +	u32 tCS_min;

	u32 tCSD_min;

> > +	u32 tDH_min;
> > +	u32 tDS_min;
> > +	u32 tFEAT_max;
> > +	u32 tIR_min;
> > +	u32 tITC_max;

	u32 tR_max;

> > +	u32 tRC_min;
> > +	u32 tREA_max;
> > +	u32 tREH_min;
> > +	u32 tRHOH_min;
> > +	u32 tRHW_min;
> > +	u32 tRHZ_max;
> > +	u32 tRLOH_min;
> > +	u32 tRP_min;
> > +	u32 tRR_min;
> > +	u64 tRST_max;
> > +	u32 tWB_max;
> > +	u32 tWC_min;
> > +	u32 tWH_min;
> > +	u32 tWHR_min;
> > +	u32 tWP_min;
> > +	u32 tWW_min;
> > +};
> > +
> >  #endif /* __LINUX_MTD_NAND_H */

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
