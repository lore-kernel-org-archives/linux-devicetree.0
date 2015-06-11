From: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 0/2] Marvell NFC NCI UART driver and DT configuration
Date: Thu, 11 Jun 2015 14:00:18 +0200
Message-ID: <1434024020-17048-1-git-send-email-cuissard@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Please find patches that add platform data configuration, DT bindings,
and UART driver for nfcmrvl NFC NCI driver.

Br,
Vincent

Vincent Cuissard (2):
  NFC: nfcmrvl: add platform_data and DT configuration
  NFC: nfcmrvl: add UART driver

 .../devicetree/bindings/net/nfc/nfcmrvl.txt        |  29 +++
 drivers/nfc/nfcmrvl/Kconfig                        |  11 +
 drivers/nfc/nfcmrvl/Makefile                       |   3 +
 drivers/nfc/nfcmrvl/main.c                         |  67 ++++--
 drivers/nfc/nfcmrvl/nfcmrvl.h                      |  43 +++-
 drivers/nfc/nfcmrvl/uart.c                         | 225 +++++++++++++++++++++
 drivers/nfc/nfcmrvl/usb.c                          |   6 +-
 include/linux/platform_data/nfcmrvl.h              |  40 ++++
 net/nfc/nci/uart.c                                 |   1 -
 9 files changed, 398 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
 create mode 100644 drivers/nfc/nfcmrvl/uart.c
 create mode 100644 include/linux/platform_data/nfcmrvl.h

--
2.2.0.33.gc18b867
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
