From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 00/31] Armada 370/XP NAND support
Date: Thu, 7 Nov 2013 20:28:47 -0300
Message-ID: <20131107232846.GA2467@localhost>
References: <1383837455-30721-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1383837455-30721-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Willy Tarreau <w@1wt.eu>, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Brian,

If at all possible I would like the feedback not to stall,
so the discussion (which is pretty complex) is still fresh in
everybody's mind (specially mine!).

Thanks!

On Thu, Nov 07, 2013 at 12:17:04PM -0300, Ezequiel Garcia wrote:
> Another version of the Armada 370/XP SoCs v3 patchset, addressing
> all the feedback provided by Brian Norris.
>=20
> Please see Documentation/mtd/nand/pxa3xx-nand.txt for specific detail=
s
> about the controller and the driver.
>=20
> Just as the last version, the bad block factory initial detection iss=
ue
> is not addressed by this patchset, but support for it will be added i=
n
> a near future once we decide the proper roadmap. See here the discuss=
ion
> about it:
>=20
>   http://permalink.gmane.org/gmane.linux.drivers.mtd/49401
>=20
> As usual patches 1-4, adding the clock infrastructure have already be=
en merged
> and will be dropped once this series can be based on v3.13-rc1.
> I'm including them just for completeness.
>=20
> Based in l2-mtd's master branch. Also, I've pushed a branch to our gi=
thub
> in case anyone wants to test it:
>=20
>   https://github.com/MISL-EBU-System-SW/mainline-public/tree/l2-mtd/u=
pstream-nand-v4
>=20
> As per Jason Cooper's suggestion I'm Ccing devicetree mailing list, t=
o get a review
> on the small binding changes this patchset contains. If the devicetre=
e people wants
> us to just Cc you on the relevant patches, just let us know.
>=20
> Of course, there's some room for improvements in this driver, and I'l=
l probably
> continue working on it. However, for now I'd like to focus in adding =
the strict
> minimum amount of changes required to support the new SoC family and =
pospone any
> improvements.
>=20
> Thanks!
>=20
> * Changes from v3 (feedback from Brian Norris)
>=20
>   * Add binding documentation for the nand-flash-bbt DT property.
>=20
>   * Expand in the documentation and in a comment the reason for
>     setting the NAND_BBT_NO_OOB_BBM option.
>=20
>   * Reworked the 'is_ready' completion handler. We still have
>     two completions, but we've dropped the atomic_t type as
>     now the variable is no longer accesed from interruption context.
>=20
>   * Fixed the ecc.read_page() which lacked the max_bitflip return.
>=20
>   * Reworked the ECC strength and size setting. This is important
>     to allow the MTD layer to properly report on bitflip threshold
>     situation.
>=20
>   * Dropped an unused fifo_size state variable
>=20
>   * Use '0' instead of the wrong '-1' when the extended command type
>     doesn't matter or extended semantics are not supposed to be used.
>=20
> * Changes from v2 (some minor fixes as per Huang's good feedback)
>=20
>   * Add some more details to the commit log in patch
>     "mtd: nand: pxa3xx: Early variant detection"
>=20
>   * Add an empty line between variable declaration and function body
>     in patch "mtd: nand: pxa3xx: Use chip->cmdfunc instead of the int=
ernal".
>=20
>   * Fix a build break caused by incomplete variable replacement:
>     "mtd: nand: pxa3xx: Replace host->page_size by mtd->writesize"
>=20
> * Changes from v1
>=20
> Aside from several changes based in Brian's feedback, the main change=
s
> from v1 are:
>=20
>   * The controller's clock source is now fully modeled, see patche 1 =
to 4.
>     Of course, none of those patches should be taken through the mtd
>     subsystem, but I'm adding them here for completeness.
>=20
>   * The chip's cmdfunc() is now independently implemented in each SoC=
 variant.
>     The rationale behind this decision is that 'chunked' I/O is the o=
nly tested
>     mode on the Armada370 variant, while the old 'vanilla' I/O is the=
 only
>     tested mode on the PXA variant.
>=20
>     So it's safer to have an implementation for each variant.
>=20
>   * Added support for BCH-8, in other words: 8-bits of correction in =
a 512-byte
>     region. This is obtained by using a data chunk size of 1024B, thu=
s doubling
>     the ECC BCH strength, as per this ECC engine mechanism.
>=20
>   * The ECC layout in use, which must be set according to the page si=
ze and
>     desired ECC strength is now strictly chosen to match only the tes=
ted
>     combinations.
>=20
> Ezequiel Garcia (31):
>   clk: mvebu: Add Core Divider clock
>   ARM: mvebu: Add Core Divider clock device-tree binding
>   ARM: mvebu: Add a 2 GHz fixed-clock Armada 370/XP
>   ARM: mvebu: Add the core-divider clock to Armada 370/XP
>   mtd: nand: pxa3xx: devicetree binding update
>   mtd: nand: pxa3xx: Add documentation about the controller
>   mtd: nand: pxa3xx: Make config menu show supported platforms
>   mtd: nand: pxa3xx: Prevent sub-page writes
>   mtd: nand: pxa3xx: read_page() returns max_bitflips
>   mtd: nand: pxa3xx: Early variant detection
>   mtd: nand: pxa3xx: Use chip->cmdfunc instead of the internal
>   mtd: nand: pxa3xx: Split FIFO size from to-be-read FIFO count
>   mtd: nand: pxa3xx: Replace host->page_size by mtd->writesize
>   mtd: nand: pxa3xx: Add a nice comment to pxa3xx_set_datasize()
>   mtd: nand: pxa3xx: Use a completion to signal device ready
>   mtd: nand: pxa3xx: Use waitfunc() to wait for the device to be read=
y
>   mtd: nand: pxa3xx: Add bad block handling
>   mtd: nand: pxa3xx: Add driver-specific ECC BCH support
>   mtd: nand: pxa3xx: Clear cmd buffer #3 (NDCB3) on command start
>   mtd: nand: pxa3xx: Add helper function to set page address
>   mtd: nand: pxa3xx: Remove READ0 switch/case falltrough
>   mtd: nand: pxa3xx: Split prepare_command_pool() in two stages
>   mtd: nand: pxa3xx: Move the data buffer clean to
>     prepare_start_command()
>   mtd: nand: pxa3xx: Fix SEQIN column address set
>   mtd: nand: pxa3xx: Add a read/write buffers markers
>   mtd: nand: pxa3xx: Introduce multiple page I/O support
>   mtd: nand: pxa3xx: Add multiple chunk write support
>   mtd: nand: pxa3xx: Add ECC BCH correctable errors detection
>   ARM: mvebu: Add support for NAND controller in Armada 370/XP
>   ARM: mvebu: Enable NAND controller in Armada XP GP board
>   ARM: mvebu: Enable NAND controller in Armada 370 Mirabox
>=20
>  .../bindings/clock/mvebu-corediv-clock.txt         |  19 +
>  .../devicetree/bindings/mtd/pxa3xx-nand.txt        |   6 +-
>  Documentation/mtd/nand/pxa3xx-nand.txt             | 113 ++++
>  arch/arm/boot/dts/armada-370-mirabox.dts           |  21 +
>  arch/arm/boot/dts/armada-370-xp.dtsi               |  26 +
>  arch/arm/boot/dts/armada-xp-gp.dts                 |   8 +
>  drivers/clk/mvebu/Kconfig                          |   5 +
>  drivers/clk/mvebu/Makefile                         |   1 +
>  drivers/clk/mvebu/clk-corediv.c                    | 223 +++++++
>  drivers/mtd/nand/Kconfig                           |   4 +-
>  drivers/mtd/nand/pxa3xx_nand.c                     | 678 +++++++++++=
+++++-----
>  include/linux/platform_data/mtd-nand-pxa3xx.h      |   3 +
>  12 files changed, 965 insertions(+), 142 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/mvebu-cor=
ediv-clock.txt
>  create mode 100644 Documentation/mtd/nand/pxa3xx-nand.txt
>  create mode 100644 drivers/clk/mvebu/clk-corediv.c
>=20
> --=20
> 1.8.1.5
>=20

--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
