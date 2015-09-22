From: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/9] Marvell NFC drivers for i2c and spi
Date: Tue, 22 Sep 2015 16:26:05 +0200
Message-ID: <1442931974-31526-1-git-send-email-cuissard@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Please find patches that enable Marvell NFC controlled over i2c
and spi. This patchset includes also firmware download support and
few enhancements.

Br,

Vincent Cuissard (9):
  NFC: nfcmrvl: remove unneeded version defines
  NFC: NCI: export nci_send_frame function
  NFC: nfcmrvl: add firmware download support
  NFC: nfcmrvl: allow low level drivers to configure head/tail room
  NFC: nfcmrvl: add i2c driver
  NFC: NCI: move generic spi driver to a module
  NFC: NCI: allow spi driver to choose transfer clock
  NFC: nfcmrvl: add spi driver
  NFC: nfcmrvl: update device tree bindings for Marvell NFC

 .../devicetree/bindings/net/nfc/nfcmrvl.txt        |  61 ++-
 drivers/nfc/nfcmrvl/Kconfig                        |  22 +
 drivers/nfc/nfcmrvl/Makefile                       |   8 +-
 drivers/nfc/nfcmrvl/fw_dnld.c                      | 561 +++++++++++++++++++++
 drivers/nfc/nfcmrvl/fw_dnld.h                      | 105 ++++
 drivers/nfc/nfcmrvl/i2c.c                          | 302 +++++++++++
 drivers/nfc/nfcmrvl/main.c                         |  64 ++-
 drivers/nfc/nfcmrvl/nfcmrvl.h                      |  22 +-
 drivers/nfc/nfcmrvl/spi.c                          | 242 +++++++++
 drivers/nfc/nfcmrvl/uart.c                         |  16 +-
 drivers/nfc/nfcmrvl/usb.c                          |   7 +-
 include/linux/platform_data/nfcmrvl.h              |  11 +
 include/net/nfc/nci.h                              |   1 +
 include/net/nfc/nci_core.h                         |   5 +
 net/nfc/nci/Kconfig                                |   2 +-
 net/nfc/nci/Makefile                               |   3 +-
 net/nfc/nci/core.c                                 |   3 +-
 net/nfc/nci/spi.c                                  |   7 +-
 18 files changed, 1404 insertions(+), 38 deletions(-)
 create mode 100644 drivers/nfc/nfcmrvl/fw_dnld.c
 create mode 100644 drivers/nfc/nfcmrvl/fw_dnld.h
 create mode 100644 drivers/nfc/nfcmrvl/i2c.c
 create mode 100644 drivers/nfc/nfcmrvl/spi.c

--
2.2.0.33.gc18b867
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
