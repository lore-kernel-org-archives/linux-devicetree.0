From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/7] Various OF fixes for little-endian and ARM
Date: Tue, 16 Nov 2010 14:33:48 -0600
Message-ID: <1289939635-30742-1-git-send-email-robherring2@gmail.com>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

This is a mixture of driver fixes for OF on little-endian and ARM platforms.

The last 2 patches need more thought. Currently, it's just copied from PPC. There 
are some ARM platforms which set 64-bit dma_masks (iop13xx and orion5x)
which is not handled. I would think 64-bit PPC would have a similar issue.

Rob Herring (7):
  OF: make drivers depend on CONFIG_OF instead of CONFIG_PPC_OF
  of: Fixes for OF probing on little endian systems
  ipmi: explicitly include of_address.h and of_irq.h
  mmc: sdhci-of: fix build on non-powerpc platforms
  mmc: sdhci-of: support generic OF controllers
  ARM: add dma_mask to pdev_archdata
  OF: set dma_mask for ARM

 arch/arm/include/asm/device.h    |    1 +
 drivers/char/ipmi/ipmi_si_intf.c |   24 +++++++++++++-----------
 drivers/mmc/host/Kconfig         |    2 +-
 drivers/mmc/host/sdhci-of-core.c |   18 ++++++++++++++++--
 drivers/mtd/Kconfig              |    2 +-
 drivers/mtd/maps/Kconfig         |    2 +-
 drivers/net/can/sja1000/Kconfig  |    4 ++--
 drivers/of/platform.c            |    4 ++--
 drivers/serial/Kconfig           |    2 +-
 drivers/usb/host/isp1760-if.c    |    8 ++++----
 10 files changed, 42 insertions(+), 25 deletions(-)
