From: Li Yang <leoyang.li@nxp.com>
Subject: Re: [v2,11/15] mtd: maps: Merge physmap_of.c into physmap-core.c
Date: Wed, 1 May 2019 13:02:04 -0500
Message-ID: <CADRPPNQn5vGBxOOQGrCJADYT4pe7inOqrTByo6K5wMhbs7Kd3A@mail.gmail.com>
References: <20181019074908.13226-12-boris.brezillon@bootlin.com>
 <10efc9a0980f4bc2b06b4149d9a4ff90@svr-chch-ex1.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <10efc9a0980f4bc2b06b4149d9a4ff90@svr-chch-ex1.atlnz.lc>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Boris Brezillon <bbrezillon@kernel.org>, "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Linus Walleij <linus.walleij@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Kumar Gala <galak@codeaurora.org>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 2, 2019 at 6:46 PM Chris Packham
<Chris.Packham@alliedtelesis.co.nz> wrote:
>
> Hi Boris,
>
> I've just come across the commit from this patch.
>
> On 19/10/18 8:49 PM, Boris Brezillon wrote:
> > There's no real reason to have two separate driver for the DT and pdata
> > case. Just do what we do everywhere else and handle DT and pdata
> > parsing in the same driver.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > Reviewed-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> > ---
> > Changes in v2:
> > - Add Ricardo's R-b
> > - Fix 2 checks (reported by Ricardo)
> > ---
> >   drivers/mtd/maps/Kconfig           |   4 +-
> >   drivers/mtd/maps/Makefile          |   7 +-
> >   drivers/mtd/maps/physmap-core.c    | 261 +++++++++++++++++++++++---
> >   drivers/mtd/maps/physmap_of_core.c | 368 -------------------------------------
> >   4 files changed, 240 insertions(+), 400 deletions(-)
> >   delete mode 100644 drivers/mtd/maps/physmap_of_core.c
> >
> > diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
> > index afb36bff13a7..5bffebacce86 100644
> > --- a/drivers/mtd/maps/Kconfig
> > +++ b/drivers/mtd/maps/Kconfig
> > @@ -66,8 +66,8 @@ config MTD_PHYSMAP_BANKWIDTH
> >         used internally by the CFI drivers.
> >
> >   config MTD_PHYSMAP_OF
> > -     tristate "Memory device in physical memory map based on OF description"
> > -     depends on OF && (MTD_CFI || MTD_JEDECPROBE || MTD_ROM || MTD_RAM)
> > +     bool "Memory device in physical memory map based on OF description"
> > +     depends on OF && MTD_PHYSMAP
>
> Previously we could select MTD_PHYSMAP_OF if MTD_RAM was defined. After
> this change we can't select this because MTD_PHYSMAP does not have
> MTD_RAM as dependency.
>
> I'm just in the process of porting the latest kernel to a platform with
> parallel SRAM and NAND via a dedicated controller. I haven't got to a
> point where the platform is booting but I suspect I'll loose my SRAM.

Another minor issue is that previously the MTD_PHYSMAP_OF can be
selected separately, but now it cannot be selected without the
MTD_PHYSMAP.  This may break existing defconfigs.  Probably it will be
better to select MTD_PHYSMAP automatically when MTD_PHYSMAP_OF is
selected?

Regards,
Leo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
