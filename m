From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [Patch v5 00/13] add imx usb driver for mx28/6x
Date: Wed, 13 Jun 2012 20:34:10 +0800
Message-ID: <1339590863-10564-1-git-send-email-richard.zhao@freescale.com>
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
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: marex-ynQEQJNshbs@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

The work is based on  ci13xxx rework done by Alexander Shishkin.

Status:
  - this version only support host
  - usbotg controler works at host role

Changes since last version:
 - collect ack received.

Richard Zhao (13):
  usb: otg: add notify_connect/notify_disconnect callback
  USB: move transceiver from ehci_hcd and ohci_hcd to hcd and rename it
    as phy
  USB: notify phy when root hub port connect change
  usb: chipidea: permit driver bindings pass phy pointer
  usb: otg: add basic mxs phy driver support
  usb: chipidea: add imx platform driver
  ARM: imx6q: correct device name of usbphy and usb controller clock
    export
  ARM: imx6q: add config-on-boot gpios
  ARM: imx6q: add usbphy clocks
  ARM: imx6q: disable usb charger detector
  ARM: dts: imx6q-sabrelite: add usb devices
  ARM: mxs: clk_register_clkdev mx28 usb clocks
  ARM: dts: imx28-evk: add usb devices

 .../devicetree/bindings/arm/config-on-boot.txt     |   12 ++
 .../devicetree/bindings/usb/ci13xxx-imx.txt        |   20 ++
 Documentation/devicetree/bindings/usb/mxs-phy.txt  |   13 ++
 arch/arm/boot/dts/imx28-evk.dts                    |   36 ++++
 arch/arm/boot/dts/imx28.dtsi                       |   12 +-
 arch/arm/boot/dts/imx6q-sabrelite.dts              |   35 ++++
 arch/arm/boot/dts/imx6q.dtsi                       |   36 +++-
 arch/arm/mach-imx/clk-imx6q.c                      |   12 +-
 arch/arm/mach-imx/mach-imx6q.c                     |   59 ++++++
 drivers/clk/mxs/clk-imx28.c                        |    4 +
 drivers/usb/chipidea/Makefile                      |    3 +
 drivers/usb/chipidea/ci.h                          |    2 +
 drivers/usb/chipidea/ci13xxx_imx.c                 |  189 ++++++++++++++++++
 drivers/usb/chipidea/core.c                        |    4 +
 drivers/usb/chipidea/host.c                        |    1 +
 drivers/usb/chipidea/udc.c                         |   11 +-
 drivers/usb/core/hub.c                             |    8 +
 drivers/usb/host/ehci-fsl.c                        |   21 +-
 drivers/usb/host/ehci-hub.c                        |    2 +-
 drivers/usb/host/ehci.h                            |    4 -
 drivers/usb/host/ohci-omap.c                       |   27 +--
 drivers/usb/host/ohci.h                            |    5 -
 drivers/usb/otg/Kconfig                            |    8 +
 drivers/usb/otg/Makefile                           |    1 +
 drivers/usb/otg/mxs-phy.c                          |  204 ++++++++++++++++++++
 include/linux/usb/chipidea.h                       |    3 +
 include/linux/usb/hcd.h                            |    6 +
 include/linux/usb/otg.h                            |   21 ++
 28 files changed, 715 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/config-on-boot.txt
 create mode 100644 Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
 create mode 100644 Documentation/devicetree/bindings/usb/mxs-phy.txt
 create mode 100644 drivers/usb/chipidea/ci13xxx_imx.c
 create mode 100644 drivers/usb/otg/mxs-phy.c

-- 
1.7.9.5
