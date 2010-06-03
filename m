From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [git pull] (updated) OF-related build breakage fixes
Date: Wed, 2 Jun 2010 21:06:54 -0600
Message-ID: <AANLkTikNcAvyHf1yHPweNBVSCSPNmq-JaEOgYW2FYUGJ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Updated pull request.  Added more fixes from Anatolij of the same sort.

g.

The following changes since commit aef4b9aaae1decc775778903922bd0075cce7a88:
  Linus Torvalds (1):
        Merge branch 'next' of git://git.kernel.org/.../benh/powerpc

are available in the git repository at:

  git://git.secretlab.ca/git/linux-2.6 merge

Alexandre Bounine (1):
      of/powerpc: fix 85xx RapidIO device node pointer

Anatolij Gustschin (12):
      of/spi: mpc512x_psc_spi.c: Fix build failures
      of/mtd/nand: mpc5121_nfc.c: Fix build failures
      of/dma: mpc512x_dma.c: Fix build failures
      of/pcmcia: m8xx_pcmcia.c: Fix build failures
      of/video: fix build breakage in FB drivers
      of/mtd: nand: fix build breakage in drivers
      of/dma: fix build breakage in ppc4xx adma driver
      of/crypto: crypto4xx_core.c: fix build breakage
      of/usb: fsl_qe_udc.c: fix build breakage
      of/net: fs_enet/mii-bitbang.c: fix build breakage
      of/edac: fix build breakage in drivers
      of/watchdog: gef_wdt.c: fix build breakage

Grant Likely (3):
      of/usb: fix build error due to of_node pointer move
      of/spi: Fix build failure on spi_ppc4xx.c
      of/rtc: rtc-mpc5121.c: Fix build failures

Michael Guntsche (1):
      watchdog: Fix build failure with OF changes

 arch/powerpc/sysdev/fsl_rio.c        |    2 +-
 drivers/crypto/amcc/crypto4xx_core.c |    6 +++---
 drivers/dma/mpc512x_dma.c            |   10 +++++-----
 drivers/dma/ppc4xx/adma.c            |    4 ++--
 drivers/edac/mpc85xx_edac.c          |   12 ++++++------
 drivers/edac/ppc4xx_edac.c           |    6 +++---
 drivers/mtd/nand/fsl_upm.c           |   17 +++++++++--------
 drivers/mtd/nand/mpc5121_nfc.c       |    8 ++++----
 drivers/mtd/nand/socrates_nand.c     |    4 ++--
 drivers/net/fs_enet/mii-bitbang.c    |    4 ++--
 drivers/pcmcia/m8xx_pcmcia.c         |    4 ++--
 drivers/rtc/rtc-mpc5121.c            |   14 ++++++++------
 drivers/spi/mpc512x_psc_spi.c        |   12 ++++++------
 drivers/spi/spi_ppc4xx.c             |    2 +-
 drivers/usb/gadget/fsl_qe_udc.c      |    4 ++--
 drivers/usb/host/ehci-xilinx-of.c    |    2 +-
 drivers/video/bw2.c                  |    2 +-
 drivers/video/cg14.c                 |    2 +-
 drivers/video/cg3.c                  |    2 +-
 drivers/video/leo.c                  |    2 +-
 drivers/video/mb862xx/mb862xxfb.c    |    2 +-
 drivers/video/p9100.c                |    2 +-
 drivers/video/tcx.c                  |    2 +-
 drivers/watchdog/gef_wdt.c           |    2 +-
 drivers/watchdog/mpc8xxx_wdt.c       |    2 +-
 25 files changed, 66 insertions(+), 63 deletions(-)


On Wed, Jun 2, 2010 at 2:24 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wr=
ote:
> Hi Linus,
>
> Here's a set of build fixes related to the of_node and of_match_table
> device changes. =A0All trivial fixes.
>
> Thanks,
> g.
>
> The following changes since commit aef4b9aaae1decc775778903922bd0075cce7a=
88:
> =A0Linus Torvalds (1):
> =A0 =A0 =A0 =A0Merge branch 'next' of git://git.kernel.org/.../benh/power=
pc
>
> are available in the git repository at:
>
> =A0git://git.secretlab.ca/git/linux-2.6 merge
>
> Alexandre Bounine (1):
> =A0 =A0 =A0of/powerpc: fix 85xx RapidIO device node pointer
>
> Anatolij Gustschin (3):
> =A0 =A0 =A0of/spi: mpc512x_psc_spi.c: Fix build failures
> =A0 =A0 =A0of/mtd/nand: mpc5121_nfc.c: Fix build failures
> =A0 =A0 =A0of/dma: mpc512x_dma.c: Fix build failures
>
> Grant Likely (3):
> =A0 =A0 =A0of/usb: fix build error due to of_node pointer move
> =A0 =A0 =A0of/spi: Fix build failure on spi_ppc4xx.c
> =A0 =A0 =A0of/rtc: rtc-mpc5121.c: Fix build failures
>
> Michael Guntsche (1):
> =A0 =A0 =A0watchdog: Fix build failure with OF changes
>
> =A0arch/powerpc/sysdev/fsl_rio.c =A0 =A0 | =A0 =A02 +-
> =A0drivers/dma/mpc512x_dma.c =A0 =A0 =A0 =A0 | =A0 10 +++++-----
> =A0drivers/mtd/nand/mpc5121_nfc.c =A0 =A0| =A0 =A08 ++++----
> =A0drivers/rtc/rtc-mpc5121.c =A0 =A0 =A0 =A0 | =A0 14 ++++++++------
> =A0drivers/spi/mpc512x_psc_spi.c =A0 =A0 | =A0 12 ++++++------
> =A0drivers/spi/spi_ppc4xx.c =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0drivers/usb/host/ehci-xilinx-of.c | =A0 =A02 +-
> =A0drivers/watchdog/mpc8xxx_wdt.c =A0 =A0| =A0 =A02 +-
> =A08 files changed, 27 insertions(+), 25 deletions(-)
>
> --
> Grant Likely, B.Sc., P.Eng.
> Secret Lab Technologies Ltd.
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
