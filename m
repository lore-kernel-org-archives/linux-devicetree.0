From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL] DeviceTree fixes for 4.15, part 2
Date: Fri, 8 Dec 2017 14:04:53 -0600
Message-ID: <CAL_Jsq+puezs3KZSFmzHsnGwpeZ9oB2ogv+A-40vpR=W7TOoBQ@mail.gmail.com>
References: <CAL_Jsq+EztEAQwqV4LLE5111MjnmV6hHCrzUbaRYLuMTWYY7Fg@mail.gmail.com>
 <CAL_JsqLOd7sr3=FMd2yoW2fc7DF6k9_XMYRSWM_obYs9AnS4Ww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLOd7sr3=FMd2yoW2fc7DF6k9_XMYRSWM_obYs9AnS4Ww-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 8, 2017 at 9:07 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Dec 8, 2017 at 8:10 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hi Linus,
>>
>> Please pull another set of DT fixes.
>
> Disregard this one. I've just gotten another overlay fix, so I'm going
> to add that in.

Here's an updated pull request.

Rob

The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:

  Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-fixes-for-4.15-part2

for you to fetch changes up to 589b754df3f37ca0a1f96fccde7f91c59266f38a:

  of: overlay: Make node skipping in init_overlay_changeset() clearer
(2017-12-08 09:32:18 -0600)

----------------------------------------------------------------
DeviceTree fixes for v4.15 (part2):

- Fixes from overlay code rework. A trifecta of fixes to the locking,
  an out of bounds access, and a memory leak in of_overlay_apply().

- Clean-up at25 eeprom binding document

- Remove leading '0x' in unit-addresses from binding docs

----------------------------------------------------------------
Geert Uytterhoeven (9):
      of: unittest: Remove bogus overlay mutex release from overlay_data_add()
      of: Spelling s/changset/changeset/
      of: overlay: Remove else after goto
      dt-bindings: eeprom: at25: Grammar s/are can/can/
      dt-bindings: eeprom: at25: Document device-specific compatible values
      of: overlay: Fix memory leak in of_overlay_apply() error path
      of: overlay: Fix (un)locking in of_overlay_apply()
      of: overlay: Fix out-of-bounds write in init_overlay_changeset()
      of: overlay: Make node skipping in init_overlay_changeset() clearer

Mathieu Malaterre (1):
      dt-bindings: Remove leading 0x from bindings notation

 Documentation/devicetree/bindings/arm/ccn.txt      |  2 +-
 .../devicetree/bindings/arm/omap/crossbar.txt      |  2 +-
 .../bindings/arm/tegra/nvidia,tegra20-mc.txt       |  2 +-
 .../devicetree/bindings/clock/axi-clkgen.txt       |  2 +-
 .../bindings/clock/brcm,bcm2835-aux-clock.txt      |  2 +-
 .../devicetree/bindings/clock/exynos4-clock.txt    |  2 +-
 .../devicetree/bindings/clock/exynos5250-clock.txt |  2 +-
 .../devicetree/bindings/clock/exynos5410-clock.txt |  2 +-
 .../devicetree/bindings/clock/exynos5420-clock.txt |  2 +-
 .../devicetree/bindings/clock/exynos5440-clock.txt |  2 +-
 .../bindings/clock/ti-keystone-pllctrl.txt         |  2 +-
 .../devicetree/bindings/clock/zx296702-clk.txt     |  4 +-
 .../devicetree/bindings/crypto/fsl-sec4.txt        |  4 +-
 .../bindings/devfreq/event/rockchip-dfi.txt        |  2 +-
 .../devicetree/bindings/display/atmel,lcdc.txt     |  4 +-
 .../devicetree/bindings/dma/qcom_hidma_mgmt.txt    |  4 +-
 Documentation/devicetree/bindings/dma/zxdma.txt    |  2 +-
 Documentation/devicetree/bindings/eeprom/at25.txt  | 13 ++--
 .../devicetree/bindings/gpio/gpio-altera.txt       |  2 +-
 .../devicetree/bindings/i2c/i2c-jz4780.txt         |  2 +-
 .../devicetree/bindings/iio/pressure/hp03.txt      |  2 +-
 .../bindings/input/touchscreen/bu21013.txt         |  2 +-
 .../bindings/interrupt-controller/arm,gic.txt      |  4 +-
 .../interrupt-controller/img,meta-intc.txt         |  2 +-
 .../bindings/interrupt-controller/img,pdc-intc.txt |  2 +-
 .../interrupt-controller/st,spear3xx-shirq.txt     |  2 +-
 .../devicetree/bindings/mailbox/altera-mailbox.txt |  6 +-
 .../bindings/mailbox/brcm,iproc-pdc-mbox.txt       |  2 +-
 .../devicetree/bindings/media/exynos5-gsc.txt      |  2 +-
 .../devicetree/bindings/media/mediatek-vcodec.txt  |  2 +-
 .../devicetree/bindings/media/rcar_vin.txt         |  2 +-
 .../devicetree/bindings/media/samsung-fimc.txt     |  2 +-
 .../devicetree/bindings/media/sh_mobile_ceu.txt    |  2 +-
 .../devicetree/bindings/media/video-interfaces.txt | 10 +--
 .../bindings/memory-controllers/ti/emif.txt        |  2 +-
 .../bindings/mfd/ti-keystone-devctrl.txt           |  2 +-
 .../devicetree/bindings/misc/brcm,kona-smc.txt     |  2 +-
 .../devicetree/bindings/mmc/brcm,kona-sdhci.txt    |  2 +-
 .../devicetree/bindings/mmc/brcm,sdhci-iproc.txt   |  2 +-
 .../devicetree/bindings/mmc/ti-omap-hsmmc.txt      |  4 +-
 Documentation/devicetree/bindings/mtd/gpmc-nor.txt |  6 +-
 Documentation/devicetree/bindings/mtd/mtk-nand.txt |  2 +-
 .../devicetree/bindings/net/altera_tse.txt         |  4 +-
 Documentation/devicetree/bindings/net/mdio.txt     |  2 +-
 .../devicetree/bindings/net/socfpga-dwmac.txt      |  2 +-
 Documentation/devicetree/bindings/nios2/nios2.txt  |  2 +-
 .../devicetree/bindings/pci/altera-pcie.txt        |  2 +-
 .../devicetree/bindings/pci/fsl,imx6q-pcie.txt     |  2 +-
 .../devicetree/bindings/pci/hisilicon-pcie.txt     |  2 +-
 .../devicetree/bindings/phy/sun4i-usb-phy.txt      |  2 +-
 .../bindings/pinctrl/brcm,cygnus-pinmux.txt        |  2 +-
 .../devicetree/bindings/pinctrl/pinctrl-atlas7.txt |  4 +-
 .../devicetree/bindings/pinctrl/pinctrl-sirf.txt   |  2 +-
 .../bindings/pinctrl/rockchip,pinctrl.txt          |  4 +-
 .../devicetree/bindings/regulator/regulator.txt    |  2 +-
 .../devicetree/bindings/serial/efm32-uart.txt      |  2 +-
 .../bindings/serio/allwinner,sun4i-ps2.txt         |  2 +-
 .../bindings/soc/ti/keystone-navigator-qmss.txt    |  2 +-
 .../devicetree/bindings/sound/adi,axi-i2s.txt      |  2 +-
 .../devicetree/bindings/sound/adi,axi-spdif-tx.txt |  2 +-
 Documentation/devicetree/bindings/sound/ak4613.txt |  2 +-
 Documentation/devicetree/bindings/sound/ak4642.txt |  2 +-
 .../devicetree/bindings/sound/max98371.txt         |  2 +-
 .../devicetree/bindings/sound/max9867.txt          |  2 +-
 .../devicetree/bindings/sound/renesas,fsi.txt      |  2 +-
 .../devicetree/bindings/sound/rockchip-spdif.txt   |  2 +-
 .../devicetree/bindings/sound/st,sti-asoc-card.txt |  8 +--
 .../devicetree/bindings/spi/efm32-spi.txt          |  2 +-
 .../devicetree/bindings/thermal/thermal.txt        | 12 ++--
 Documentation/devicetree/bindings/ufs/ufs-qcom.txt |  4 +-
 .../devicetree/bindings/ufs/ufshcd-pltfrm.txt      |  2 +-
 Documentation/devicetree/bindings/usb/ehci-st.txt  |  2 +-
 Documentation/devicetree/bindings/usb/ohci-st.txt  |  2 +-
 .../bindings/watchdog/ingenic,jz4740-wdt.txt       |  2 +-
 drivers/of/dynamic.c                               |  4 +-
 drivers/of/overlay.c                               | 84 ++++++++++------------
 drivers/of/unittest.c                              |  1 -
 77 files changed, 149 insertions(+), 151 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
