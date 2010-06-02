From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [git pull] OF-related build breakage fixes
Date: Wed, 2 Jun 2010 14:24:38 -0600
Message-ID: <AANLkTimdqrggRbKC2dZRIuMFe4y_99Oy1TO0oThsWboU@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Michael
List-Id: devicetree@vger.kernel.org

Hi Linus,

Here's a set of build fixes related to the of_node and of_match_table
device changes.  All trivial fixes.

Thanks,
g.

The following changes since commit aef4b9aaae1decc775778903922bd0075cce7a88:
  Linus Torvalds (1):
        Merge branch 'next' of git://git.kernel.org/.../benh/powerpc

are available in the git repository at:

  git://git.secretlab.ca/git/linux-2.6 merge

Alexandre Bounine (1):
      of/powerpc: fix 85xx RapidIO device node pointer

Anatolij Gustschin (3):
      of/spi: mpc512x_psc_spi.c: Fix build failures
      of/mtd/nand: mpc5121_nfc.c: Fix build failures
      of/dma: mpc512x_dma.c: Fix build failures

Grant Likely (3):
      of/usb: fix build error due to of_node pointer move
      of/spi: Fix build failure on spi_ppc4xx.c
      of/rtc: rtc-mpc5121.c: Fix build failures

Michael Guntsche (1):
      watchdog: Fix build failure with OF changes

 arch/powerpc/sysdev/fsl_rio.c     |    2 +-
 drivers/dma/mpc512x_dma.c         |   10 +++++-----
 drivers/mtd/nand/mpc5121_nfc.c    |    8 ++++----
 drivers/rtc/rtc-mpc5121.c         |   14 ++++++++------
 drivers/spi/mpc512x_psc_spi.c     |   12 ++++++------
 drivers/spi/spi_ppc4xx.c          |    2 +-
 drivers/usb/host/ehci-xilinx-of.c |    2 +-
 drivers/watchdog/mpc8xxx_wdt.c    |    2 +-
 8 files changed, 27 insertions(+), 25 deletions(-)

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
