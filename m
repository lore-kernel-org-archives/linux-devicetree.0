From: Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>
Subject: [GIT PULL] USB: LPC32xx device tree related OHCI and UDC patch series
Date: Sun, 29 Apr 2012 16:57:06 +0200
Message-ID: <4F9D56C2.2050307@antcom.de>
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
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kevin.wells-3arQi8VN3Tc@public.gmane.org, srinivas.bakki-3arQi8VN3Tc@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

this is the pull request for the just re-posted series of LPC32xx related
USB patches (just ported onto current usb.git's usb-next).

Thanks in advance,

Roland


The following changes since commit 4212cd74ca6f0c42f5a0065797dd1c310a485ad8:

  USB: usb-skeleton.c: remove err() usage (2012-04-27 11:24:45 -0700)

are available in the git repository at:

  git://git.antcom.de/linux-2.6.git ohci-nxp

for you to fetch changes up to 5fc7346be73e695bb976d7bea2a421f1c443fa6c:

  USB: ohci-nxp: Use isp1301 driver (2012-04-29 15:27:20 +0200)

----------------------------------------------------------------
Roland Stigge (5):
      ohci-nxp: Driver cleanup
      ohci-nxp: Device tree support
      USB: Add driver for NXP ISP1301 USB transceiver
      USB: gadget driver for LPC32xx
      USB: ohci-nxp: Use isp1301 driver

 Documentation/devicetree/bindings/usb/isp1301.txt  |   25 +
 .../devicetree/bindings/usb/lpc32xx-udc.txt        |   28 +
 Documentation/devicetree/bindings/usb/ohci-nxp.txt |   24 +
 drivers/usb/Kconfig                                |    2 +
 drivers/usb/Makefile                               |    1 +
 drivers/usb/gadget/Kconfig                         |   11 +
 drivers/usb/gadget/Makefile                        |    1 +
 drivers/usb/gadget/gadget_chips.h                  |    3 +
 drivers/usb/gadget/lpc32xx_udc.c                   | 3538 ++++++++++++++++++++
 drivers/usb/host/Kconfig                           |    1 +
 drivers/usb/host/ohci-nxp.c                        |  165 +-
 drivers/usb/phy/Kconfig                            |   17 +
 drivers/usb/phy/Makefile                           |    7 +
 drivers/usb/phy/isp1301.c                          |   77 +
 include/linux/usb/isp1301.h                        |   80 +
 15 files changed, 3861 insertions(+), 119 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/isp1301.txt
 create mode 100644 Documentation/devicetree/bindings/usb/lpc32xx-udc.txt
 create mode 100644 Documentation/devicetree/bindings/usb/ohci-nxp.txt
 create mode 100644 drivers/usb/gadget/lpc32xx_udc.c
 create mode 100644 drivers/usb/phy/Kconfig
 create mode 100644 drivers/usb/phy/Makefile
 create mode 100644 drivers/usb/phy/isp1301.c
 create mode 100644 include/linux/usb/isp1301.h
