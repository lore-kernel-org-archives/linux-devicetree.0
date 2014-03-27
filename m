From: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCHv2 1/1] mtd: gpmi: make blockmark swapping optional
Date: Thu, 27 Mar 2014 17:59:58 +0800
Message-ID: <20140327095956.GA29623@localhost>
References: <532BCFCC.4080205@freescale.com>
 <1395399017-19005-1-git-send-email-LW@KARO-electronics.de>
 <20140324095902.GB11377@localhost>
 <20140326095156.3e5585b8@ipc1.ka-ro>
 <5332AEE7.2040402@freescale.com>
 <20140326125502.0e8d0657@ipc1.ka-ro>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140326125502.0e8d0657@ipc1.ka-ro>
Sender: linux-doc-owner@vger.kernel.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawn.guo@linaro.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@freescale.com>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 26, 2014 at 12:55:02PM +0100, Lothar Wa=C3=9Fmann wrote:
> Hi,
>=20
> Huang Shijie wrote:
> > =E4=BA=8E 2014=E5=B9=B403=E6=9C=8826=E6=97=A5 16:51, Lothar Wa=C3=9F=
mann =E5=86=99=E9=81=93:
> > > I don't see why this should not be supported on i.MX28 (i.MX23 do=
esn't
> > > do byteswapping anyway, so this wouldn't change anything for i.MX=
23).
> > > The partitions used by Linux need not necessarily be accessible f=
or the
> > > Boot ROM code (and vice versa).
> > But the first partition used to store the u-boot is accessible for =
the ROM.
> >=20
> Whether this partition is available to Linux depends on the partition=
 table
> passed in the DT.
yes, i agree.

But it is strange if we do not export this partition to Linux.

>=20
> > Please see "Figure 12-13" in the 12.12.1.12:
> >    "In order to preserve the BI (bad block information), flash upda=
ter=20
> > or gang programmer
> > applications need to swap Bad Block Information (BI) data to byte 0=
 of=20
> > metadata area for
> > every page before programming NAND Flash. ROM when loading firmware=
,=20
> > copies back
> > the value at metadata[0] to BI offset in page data. The following f=
igure=20
> > shows how the
> > factory bad block marker is preserved."
> >=20
> The inspection of the BB markers is only a fallback for the case that
> there is no DBBT. From the same chapter that you quoted above:
> | ROM uses DBBT to skip any bad block that falls within firmware data
> | on NAND Flash device.
> | If the address of DBBT Search Area in FCB is 0, ROM will rely on
> | factory marked bad block markers to find out if a block is good or =
bad.
>=20
> Thus, even the boot ROM of i.MX28 can well live without blockmark
> swapping.

Assume that there is a NAND block "A",  and the A consist of 256 pages.
the uboot is burned to the "A", can occupy 6 pages:

  ---------------------------------------------------------------------=
--------
 | page 0 |  page 1 | page 2 | page 3 | page 4 | page 5 | ... | ... | p=
age 255 |
  ---------------------------------------------------------------------=
--------
=20
  \-------------------------------------- -----------------------------=
-------/
                                         V =20
                                        "A"					=20

The DBBT is used to track if "A" is bad or not.
Assume we know that "A" is a good block, ROM then need to read out the =
uboot.
When the ROM needs to read out the 6 pages one by one. And each time th=
e ROM read
the page, it should do the swapping for this page.

In this case, the ROM will do the swapping six times.

Please read the sector again, you will see the "every page" in it:
--------------------------------------------------------------------
   "In order to preserve the BI (bad block information), flash updater=20
or gang programmer applications need to swap Bad Block Information (BI)=
 data to byte 0 of=20
metadata area for every page before programming NAND Flash. ROM when lo=
ading firmware,=20
copies back
--------------------------------------------------------------------

thanks
Huang Shijie

