From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: [PATCH 0/5] dmaengine: convert dw_dmac/spear13xx to generic binding
Date: Mon, 28 Jan 2013 17:57:32 +0000
Message-ID: <1359395857-1235-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi everyone,

This is my attempt to convert the spear platform and the dw_dmac to
the generic device tree binding for DMA, so that we don't get
a release with the broken version. I'm pretty sure that this
has bugs, but it's as good as I could do without access to
hardware or specs.

Please review and comment,

	Arnd

Arnd Bergmann (5):
  dmaengine: dw_dmac: move to generic DMA binding
  spi: pl022: use generic DMA slave configuration if possible
  serial: pl011: use generic DMA slave configuration if possible
  ata: arasan: remove the need for platform_data
  ARM: SPEAr13xx: Pass generic DW DMAC platform data from DT

 .../devicetree/bindings/ata/pata-arasan.txt        |  22 ++++
 Documentation/devicetree/bindings/dma/snps-dma.txt |  70 +++++------
 arch/arm/boot/dts/spear1340.dtsi                   |   2 +
 arch/arm/boot/dts/spear13xx.dtsi                   |  25 +++-
 arch/arm/mach-spear/generic.h                      |   6 -
 arch/arm/mach-spear/include/mach/spear.h           |   2 -
 arch/arm/mach-spear/spear1310.c                    |  30 +----
 arch/arm/mach-spear/spear1340.c                    |  32 +----
 arch/arm/mach-spear/spear13xx-dma.h                | 128 --------------------
 arch/arm/mach-spear/spear13xx.c                    |  58 ---------
 drivers/ata/pata_arasan_cf.c                       |  31 +++--
 drivers/dma/dw_dmac.c                              | 130 ++++++++++-----------
 drivers/dma/dw_dmac_regs.h                         |   4 -
 drivers/spi/spi-pl022.c                            |  43 ++++++-
 drivers/tty/serial/amba-pl011.c                    |  62 ++++++----
 include/linux/dw_dmac.h                            |   5 -
 include/linux/pata_arasan_cf_data.h                |   2 -
 17 files changed, 243 insertions(+), 409 deletions(-)
 delete mode 100644 arch/arm/mach-spear/spear13xx-dma.h

-- 
1.8.0

Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Jeff Garzik <jgarzik-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>
Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
spi-devel-general-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
