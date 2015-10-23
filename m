From: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 0/9] Marvell NFC drivers for i2c and spi
Date: Fri, 23 Oct 2015 14:22:57 +0200
Message-ID: <1445602986-3254-1-git-send-email-cuissard@marvell.com>
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
  NFC: NCI: export nci_send_frame and nci_send_cmd function
  NFC: nfcmrvl: add firmware download support
  NFC: nfcmrvl: configure head/tail room values per low level drivers
  NFC: nfcmrvl: add i2c driver
  NFC: NCI: move generic spi driver to a module
  NFC: NCI: allow spi driver to choose transfer clock
  NFC: nfcmrvl: add spi driver
  NFC: nfcmrvl: update device tree bindings for Marvell NFC

 .../devicetree/bindings/net/nfc/nfcmrvl.txt        |  61 ++-
 drivers/nfc/nfcmrvl/Kconfig                        |  22 +
 drivers/nfc/nfcmrvl/Makefile                       |   8 +-
 drivers/nfc/nfcmrvl/fw_dnld.c                      | 551 +++++++++++++++++++++
 drivers/nfc/nfcmrvl/fw_dnld.h                      |  98 ++++
 drivers/nfc/nfcmrvl/i2c.c                          | 291 +++++++++++
 drivers/nfc/nfcmrvl/main.c                         |  75 ++-
 drivers/nfc/nfcmrvl/nfcmrvl.h                      |  23 +-
 drivers/nfc/nfcmrvl/spi.c                          | 226 +++++++++
 drivers/nfc/nfcmrvl/uart.c                         |  18 +-
 drivers/nfc/nfcmrvl/usb.c                          |  10 +-
 include/linux/platform_data/nfcmrvl.h              |   8 +
 include/net/nfc/nci.h                              |   1 +
 include/net/nfc/nci_core.h                         |   5 +
 net/nfc/nci/Kconfig                                |   2 +-
 net/nfc/nci/Makefile                               |   3 +-
 net/nfc/nci/core.c                                 |   4 +-
 net/nfc/nci/spi.c                                  |  11 +-
 18 files changed, 1378 insertions(+), 39 deletions(-)
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
