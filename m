From: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/8] Add some TZ1090 SoC infrastructure
Date: Tue, 23 Apr 2013 15:33:19 +0100
Message-ID: <1366727607-27444-1-git-send-email-james.hogan@imgtec.com>
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
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Toumaz Xenif TZ1090 SoC (AKA Comet) contains a 2-threaded
Linux-capable HTP (Meta 2), and is found in a number of development
boards and digital radios, such as the Minimorph Development Platform.

This patchset adds some core infrastructure for the TZ1090, including
drivers for the powerdown controller (PDC) irqchip, general/PDC pin
controllers, and general/PDC GPIO controllers. It's not yet enough to
get the UARTs going (no common clock framework) so JTAG/QEMU with DA TTY
is still needed to get a shell.

A QEMU with a Meta frontend and some TZ1090 emulation, and the SoC
Technical Reference Manual which documents the registers used by both
GPIO drivers and both pin control drivers can be downloaded from the
Minimorph SDK (registration of a Minimorph is currently required):
http://imgtec.com/meta_insider/metaflow-sdk.asp

I aim to get whatever I can of this patchset into v3.10 (at least the
first two patches) so all review is very much appreciated.

Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>

James Hogan (8):
  metag: of_platform_populate from arch generic code
  metag: minimal TZ1090 (Comet) SoC infrastructure
  irq-imgpdc: add ImgTec PDC irqchip driver
  metag: tz1090: add <asm/soc-tz1090/gpio.h>
  pinctrl-tz1090: add TZ1090 pinctrl driver
  gpio-tz1090: add TZ1090 gpio driver
  pinctrl-tz1090-pdc: add TZ1090 PDC pinctrl driver
  gpio-tz1090pdc: add TZ1090 PDC gpio driver

 .../devicetree/bindings/gpio/gpio-tz1090-pdc.txt   |   40 +
 .../devicetree/bindings/gpio/gpio-tz1090.txt       |   77 +
 .../devicetree/bindings/metag/pdc-intc.txt         |  112 ++
 .../bindings/pinctrl/img,tz1090-pdc-pinctrl.txt    |  125 ++
 .../bindings/pinctrl/img,tz1090-pinctrl.txt        |  214 +++
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 arch/metag/Kconfig.soc                             |   14 +
 arch/metag/Makefile                                |    8 +-
 arch/metag/boot/dts/Makefile                       |    2 +
 arch/metag/boot/dts/tz1090.dtsi                    |  106 +
 arch/metag/boot/dts/tz1090_generic.dts             |   10 +
 arch/metag/configs/tz1090_defconfig                |   41 +
 arch/metag/include/asm/soc-tz1090/gpio.h           |  121 ++
 arch/metag/kernel/setup.c                          |    4 +
 arch/metag/soc/tz1090/Makefile                     |    5 +
 arch/metag/soc/tz1090/setup.c                      |   21 +
 drivers/gpio/Kconfig                               |   14 +
 drivers/gpio/Makefile                              |    2 +
 drivers/gpio/gpio-tz1090-pdc.c                     |  237 +++
 drivers/gpio/gpio-tz1090.c                         |  628 ++++++
 drivers/irqchip/Kconfig                            |    4 +
 drivers/irqchip/Makefile                           |    1 +
 drivers/irqchip/irq-imgpdc.c                       |  553 ++++++
 drivers/pinctrl/Kconfig                            |   12 +
 drivers/pinctrl/Makefile                           |    2 +
 drivers/pinctrl/pinctrl-tz1090-pdc.c               | 1114 +++++++++++
 drivers/pinctrl/pinctrl-tz1090-pdc.h               |   58 +
 drivers/pinctrl/pinctrl-tz1090.c                   | 2018 ++++++++++++++++++++
 drivers/pinctrl/pinctrl-tz1090.h                   |   58 +
 29 files changed, 5601 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-tz1090-pdc.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-tz1090.txt
 create mode 100644 Documentation/devicetree/bindings/metag/pdc-intc.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/img,tz1090-pdc-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/img,tz1090-pinctrl.txt
 create mode 100644 arch/metag/boot/dts/tz1090.dtsi
 create mode 100644 arch/metag/boot/dts/tz1090_generic.dts
 create mode 100644 arch/metag/configs/tz1090_defconfig
 create mode 100644 arch/metag/include/asm/soc-tz1090/gpio.h
 create mode 100644 arch/metag/soc/tz1090/Makefile
 create mode 100644 arch/metag/soc/tz1090/setup.c
 create mode 100644 drivers/gpio/gpio-tz1090-pdc.c
 create mode 100644 drivers/gpio/gpio-tz1090.c
 create mode 100644 drivers/irqchip/irq-imgpdc.c
 create mode 100644 drivers/pinctrl/pinctrl-tz1090-pdc.c
 create mode 100644 drivers/pinctrl/pinctrl-tz1090-pdc.h
 create mode 100644 drivers/pinctrl/pinctrl-tz1090.c
 create mode 100644 drivers/pinctrl/pinctrl-tz1090.h

-- 
1.8.1.2
