From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v7 0/3] Add Rockchip SFC(serial flash controller) support
Date: Tue, 25 Jul 2017 18:07:31 +0800
Message-ID: <1500977251-15001-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


This is try to support SFC found on Rockchip RV1108 platform.
As Shawn's workload is a little heavy, I go on with his steps
from v6 [1].

Feature:
(1) Support x1, x2, x4 data bits mode
(2) Support up to 4 chip select
(3) Support two independent clock domain: AHB clock and SPI clock
(4) Support DMA master up to 16KB/transfer

Test environment:
This patchset was tested on RK1108 evb boards with Winboud w25q256,
Gigadevice GD25Q256, working fine with PIO or DMA mode.

[1] https://patchwork.kernel.org/patch/9586107/

Changes in v7:
- correct the fifo status check in pio read/write mode.
- copy data from user buffer to dma buffer

Changes in v6:
- fold in Andy's improvement for checking fifo level
  before pio read
- rename the controller to rv1108 since offically it's
  renamed and acked by Rob.
- use dma_coerce_mask_and_coherent suggested by Andy.

Changes in v5:
- check if the buf is aligned to 32bit
- check if the buf for dma comes from vmalloc
- fix to use 1-1-n according to the current framework
- avoid bytes cnt overflow

Changes in v4:
- use uppercase DMA for description
- simplify the code of get_if_type
- use dma_dir to simplify the code
- simplify the rockchip_sfc_do_rd_wr
- some minor improvements
- add reset controller when doing resume

Changes in v3:
- use io{read32,write32}_rep to simplify the corner cases
- remove more unnecessary bit definitions
- some minor comment fixes and improvement
- fix wrong unregister function
- unify more code
- use nor to avoid constantly replicating the whole
  sfc->flash[sfc->num_chip].nor
- add email for MODULE_AUTHOR
- remove #if 1 --- #endif
- extract DMA code to imporve the code structure
- reset all when failing to do dma
- pass sfc to get_if_type
- rename sfc-no-dma to sfc-no-DMA

Changes in v2:
- fix typos
- add some comment for buffer and others operations
- rename SFC_MAX_CHIP_NUM to MAX_CHIPSELECT_NUM
- use u8 for cs
- return -EINVAL for default case of get_if_type
- use readl_poll_*() to check timeout cases
- simplify and clarify some condition checks
- rework the bitshifts to simplify the code
- define SFC_CMD_DUMMY(x)
- fix ummap for dma read path and finish all the
  cache maintenance.
- rename to rockchip_sfc_chip_priv and embed struct spi_nor
  in it.
- add MODULE_AUTHOR
- add runtime PM and general PM support.
- Thanks for Marek's comments. Link:
  http://lists.infradead.org/pipermail/linux-mtd/2016-November/070321.html

Andy Yan (1):
  ARM: dts: rockchip: enable sfc for rv1108 evb

Shawn Lin (2):
  mtd: spi-nor: Bindings for Rockchip serial flash controller
  mtd: spi-nor: add rockchip serial flash controller driver

 .../devicetree/bindings/mtd/rockchip-sfc.txt       |  31 +
 MAINTAINERS                                        |   8 +
 arch/arm/boot/dts/rv1108-evb.dts                   |  10 +
 arch/arm/boot/dts/rv1108.dtsi                      |  13 +
 drivers/mtd/spi-nor/Kconfig                        |   7 +
 drivers/mtd/spi-nor/Makefile                       |   3 +-
 drivers/mtd/spi-nor/rockchip-sfc.c                 | 942 +++++++++++++++++++++
 7 files changed, 1013 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/rockchip-sfc.txt
 create mode 100644 drivers/mtd/spi-nor/rockchip-sfc.c

-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
