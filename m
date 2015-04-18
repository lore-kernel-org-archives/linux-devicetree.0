From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [git pull] devicetree updates for v4.1
Date: Sat, 18 Apr 2015 08:52:44 +0100
Message-ID: <CACxGe6sSFe4PE_Az7G=N9LLK61qV6MWc+tOPjGphRPSMBj74Kw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Here are the devicetree changes queued up for v4.1. Nothing really
exciting here. Rob has another few commits for big-endian attached
UARTs, but those will be sent in a separate merge request since they
haven't been as thoroughly tested as this batch.

Please merge

Thanks,
g.

The following changes since commit bc465aa9d045feb0e13b4a8f32cc33c1943f62d6:

  Linux 4.0-rc5 (2015-03-22 16:50:21 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/glikely/linux.git
tags/devicetree-for-linus

for you to fetch changes up to a2166ca5f3204794e8b59f01c93a0f1564e3e138:

  Merge remote-tracking branch 'robh/for-next' into devicetree/next
(2015-03-29 08:59:58 +0100)

----------------------------------------------------------------
Devicetree changes for v4.1

devicetree changes queued up for v4.1. Here are the highlights:
- Lots of unittest cleanup from Frank Rowand
- Bugfixes and updates to the of_graph code
- Tighten up of_get_mac_address() code
- Documentation updates

----------------------------------------------------------------
Benjamin Herrenschmidt (1):
      drivers/of: Add empty ranges quirk for PA-Semi

Frank Rowand (6):
      dt: OF_UNITTEST make dependency broken
      of/unittest: add const where needed
      of/unittest: typo in error string
      of/unittest: reduce checkpatch noise - line after declarations
      of/unittest: breadcrumbs to reduce pain of future maintainers
      of/unittest: early return from test skips tests

Geert Uytterhoeven (1):
      of: Allow selection of OF_DYNAMIC and OF_OVERLAY if OF_UNITTEST

Grant Likely (2):
      of/unittest: Fix of_platform_depopulate test case
      Merge remote-tracking branch 'robh/for-next' into devicetree/next

Mark Brown (1):
      of: Explicitly include linux/types.h in of_graph.h

Pantelis Antoniou (2):
      MAINTAINERS: Pantelis Antoniou device tree overlay maintainer
      of: Empty node & property flag accessors when !OF

Philipp Zabel (3):
      of: Decrement refcount of previous endpoint in of_graph_get_next_endpoint
      of: Add for_each_endpoint_of_node helper macro
      of: Add of_graph_get_port_by_id function

Rob Herring (1):
      Merge tag 'of-graph-for-4.0' of
git://git.pengutronix.de/git/pza/linux into for-next

Scott Branden (1):
      dt-bindings: brcm: rationalize Broadcom documentation naming

Sergei Shtylyov (1):
      of_net: factor out repetitive code from of_get_mac_address()

Wang Long (3):
      Documentation: update the of_selftest.txt
      Documentation: rename of_selftest.txt to of_unittest.txt
      of/unittest: replace 'selftest' with 'unittest'

 ...351-cpu-method => brcm,bcm11351-cpu-method.txt} |   0
 .../arm/bcm/{bcm11351.txt => brcm,bcm11351.txt}    |   0
 .../arm/bcm/{bcm21664.txt => brcm,bcm21664.txt}    |   0
 .../arm/{bcm2835.txt => bcm/brcm,bcm2835.txt}      |   0
 .../arm/{bcm4708.txt => bcm/brcm,bcm4708.txt}      |   0
 .../arm/bcm/{bcm63138.txt => brcm,bcm63138.txt}    |   0
 .../arm/{brcm-brcmstb.txt => bcm/brcm,brcmstb.txt} |   0
 .../arm/bcm/{cygnus.txt => brcm,cygnus.txt}        |   0
 .../bindings/bus/{bcma.txt => brcm,bus-axi.txt}    |   0
 .../{bcm-kona-clock.txt => brcm,kona-ccu.txt}      |   0
 .../dma/{bcm2835-dma.txt => brcm,bcm2835-dma.txt}  |   0
 .../gpio/{gpio-bcm-kona.txt => brcm,kona-gpio.txt} |   0
 .../i2c/{i2c-bcm-kona.txt => brcm,kona-i2c.txt}    |   0
 .../mfd/{bcm590xx.txt => brcm,bcm59056.txt}        |   0
 .../{bcm3384-intc.txt => brcm,bcm3384-intc.txt}    |   0
 .../mips/brcm/{bmips.txt => brcm,bmips.txt}        |   0
 .../mips/brcm/{cm-dsl.txt => brcm,cm-dsl.txt}      |   0
 .../bindings/misc/{smc.txt => brcm,kona-smc.txt}   |   0
 .../mmc/{kona-sdhci.txt => brcm,kona-sdhci.txt}    |   0
 ...oadcom-sf2.txt => brcm,bcm7445-switch-v4.0.txt} |   0
 .../{broadcom-bcmgenet.txt => brcm,bcmgenet.txt}   |   0
 ...broadcom-systemport.txt => brcm,systemport.txt} |   0
 ...oadcom-mdio-unimac.txt => brcm,unimac-mdio.txt} |   0
 .../phy/{bcm-phy.txt => brcm,kona-usb2-phy.txt}    |   0
 .../pwm/{bcm-kona-pwm.txt => brcm,kona-pwm.txt}    |   0
 .../brcm,bcm21664-resetmgr.txt}                    |   0
 .../{bcm63xx-uart.txt => brcm,bcm6345-uart.txt}    |   0
 .../{bcm2835-i2s.txt => brcm,bcm2835-i2s.txt}      |   0
 .../kona-timer.txt => timer/brcm,kona-timer.txt}   |   0
 Documentation/devicetree/bindings/unittest.txt     |  44 +-
 .../brcm/usb.txt => usb/brcm,bcm3384-usb.txt}      |   0
 .../kona-wdt.txt => watchdog/brcm,kona-wdt.txt}    |   0
 .../{of_selftest.txt => of_unittest.txt}           |  28 +-
 MAINTAINERS                                        |   9 +
 drivers/coresight/of_coresight.c                   |  13 +-
 drivers/gpu/drm/imx/imx-drm-core.c                 |  11 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |  15 +-
 drivers/media/platform/am437x/am437x-vpfe.c        |   1 -
 drivers/media/platform/soc_camera/soc_camera.c     |   3 +-
 drivers/of/Kconfig                                 |  11 +-
 drivers/of/Makefile                                |   5 +-
 drivers/of/address.c                               |  11 +-
 drivers/of/base.c                                  |  41 +-
 drivers/of/of_net.c                                |  29 +-
 drivers/of/unittest-data/.gitignore                |   2 +
 drivers/of/unittest-data/Makefile                  |   7 +
 drivers/of/unittest-data/tests-overlay.dtsi        | 108 +--
 drivers/of/unittest.c                              | 744 +++++++++++----------
 drivers/video/fbdev/omap2/dss/omapdss-boot-init.c  |   7 +-
 include/linux/of.h                                 |  32 +
 include/linux/of_graph.h                           |  20 +
 51 files changed, 620 insertions(+), 521 deletions(-)
 rename Documentation/devicetree/bindings/arm/bcm/{brcm,bcm11351-cpu-method
=> brcm,bcm11351-cpu-method.txt} (100%)
 rename Documentation/devicetree/bindings/arm/bcm/{bcm11351.txt =>
brcm,bcm11351.txt} (100%)
 rename Documentation/devicetree/bindings/arm/bcm/{bcm21664.txt =>
brcm,bcm21664.txt} (100%)
 rename Documentation/devicetree/bindings/arm/{bcm2835.txt =>
bcm/brcm,bcm2835.txt} (100%)
 rename Documentation/devicetree/bindings/arm/{bcm4708.txt =>
bcm/brcm,bcm4708.txt} (100%)
 rename Documentation/devicetree/bindings/arm/bcm/{bcm63138.txt =>
brcm,bcm63138.txt} (100%)
 rename Documentation/devicetree/bindings/arm/{brcm-brcmstb.txt =>
bcm/brcm,brcmstb.txt} (100%)
 rename Documentation/devicetree/bindings/arm/bcm/{cygnus.txt =>
brcm,cygnus.txt} (100%)
 rename Documentation/devicetree/bindings/bus/{bcma.txt =>
brcm,bus-axi.txt} (100%)
 rename Documentation/devicetree/bindings/clock/{bcm-kona-clock.txt =>
brcm,kona-ccu.txt} (100%)
 rename Documentation/devicetree/bindings/dma/{bcm2835-dma.txt =>
brcm,bcm2835-dma.txt} (100%)
 rename Documentation/devicetree/bindings/gpio/{gpio-bcm-kona.txt =>
brcm,kona-gpio.txt} (100%)
 rename Documentation/devicetree/bindings/i2c/{i2c-bcm-kona.txt =>
brcm,kona-i2c.txt} (100%)
 rename Documentation/devicetree/bindings/mfd/{bcm590xx.txt =>
brcm,bcm59056.txt} (100%)
 rename Documentation/devicetree/bindings/mips/brcm/{bcm3384-intc.txt
=> brcm,bcm3384-intc.txt} (100%)
 rename Documentation/devicetree/bindings/mips/brcm/{bmips.txt =>
brcm,bmips.txt} (100%)
 rename Documentation/devicetree/bindings/mips/brcm/{cm-dsl.txt =>
brcm,cm-dsl.txt} (100%)
 rename Documentation/devicetree/bindings/misc/{smc.txt =>
brcm,kona-smc.txt} (100%)
 rename Documentation/devicetree/bindings/mmc/{kona-sdhci.txt =>
brcm,kona-sdhci.txt} (100%)
 rename Documentation/devicetree/bindings/net/{broadcom-sf2.txt =>
brcm,bcm7445-switch-v4.0.txt} (100%)
 rename Documentation/devicetree/bindings/net/{broadcom-bcmgenet.txt
=> brcm,bcmgenet.txt} (100%)
 rename Documentation/devicetree/bindings/net/{broadcom-systemport.txt
=> brcm,systemport.txt} (100%)
 rename Documentation/devicetree/bindings/net/{broadcom-mdio-unimac.txt
=> brcm,unimac-mdio.txt} (100%)
 rename Documentation/devicetree/bindings/phy/{bcm-phy.txt =>
brcm,kona-usb2-phy.txt} (100%)
 rename Documentation/devicetree/bindings/pwm/{bcm-kona-pwm.txt =>
brcm,kona-pwm.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/bcm/kona-resetmgr.txt
=> reset/brcm,bcm21664-resetmgr.txt} (100%)
 rename Documentation/devicetree/bindings/serial/{bcm63xx-uart.txt =>
brcm,bcm6345-uart.txt} (100%)
 rename Documentation/devicetree/bindings/sound/{bcm2835-i2s.txt =>
brcm,bcm2835-i2s.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/bcm/kona-timer.txt =>
timer/brcm,kona-timer.txt} (100%)
 rename Documentation/devicetree/bindings/{mips/brcm/usb.txt =>
usb/brcm,bcm3384-usb.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/bcm/kona-wdt.txt =>
watchdog/brcm,kona-wdt.txt} (100%)
 rename Documentation/devicetree/{of_selftest.txt => of_unittest.txt} (90%)
 create mode 100644 drivers/of/unittest-data/.gitignore
 create mode 100644 drivers/of/unittest-data/Makefile
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
