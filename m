From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 00/11] Few st21nfca/st-nci NFC fixes and SPI phy support for st-nci
Date: Fri, 14 Aug 2015 22:33:29 +0200
Message-ID: <1439584420-5446-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Samuel,

Please find in this serie:
- some few patches provided earlier:
https://lists.01.org/pipermail/linux-nfc/2015-July/003609.html
- SPI phy support for st-nci. SPI is only supported on st21nfcb CLF.
For your information I2C is the only valid interface on ST21NFCA.
- One fix for the vendor_cmd interface i am currently working on for
ST CLFs.

Best Regards
Christophe

Christophe Ricard (11):
  nfc: st-nci: Remove duplicate file
    include/linux/platform_data/st_nci.h
  nfc: st-nci: Fix typo when changing from st21nfcb to st-nci
  nfc: st-nci: Fix non accurate comment for st_nci_i2c_read
  NFC: st21nfca: fix use of uninitialized variables in error path
  NFC: st-nci: fix use of uninitialized variables in error path
  nfc: st-nci: Remove data from ack_pending_q when receiving a NDLC
    PCB_SYNC_ACK
  nfc: st-nci: Free data with irrelevant NDLC PCB_SYNC value
  nfc: st-nci: Add spi phy support for st21nfcb
  nfc: st-nci: Add device tree documentation for spi phy
  nfc: st-nci: Remove pr_err in llt_ndlc_rcv_queue when ndlc header is
    unknown
  nfc: netlink: Add check on NFC_ATTR_VENDOR_DATA

 .../devicetree/bindings/net/nfc/st-nci-i2c.txt     |  33 ++
 .../devicetree/bindings/net/nfc/st-nci-spi.txt     |  31 ++
 .../devicetree/bindings/net/nfc/st-nci.txt         |  33 --
 drivers/nfc/st-nci/Kconfig                         |  11 +
 drivers/nfc/st-nci/Makefile                        |   3 +
 drivers/nfc/st-nci/i2c.c                           |  23 +-
 drivers/nfc/st-nci/ndlc.c                          |   7 +-
 drivers/nfc/st-nci/spi.c                           | 392 +++++++++++++++++++++
 drivers/nfc/st-nci/st-nci_se.c                     |   8 +-
 drivers/nfc/st21nfca/st21nfca.c                    |  11 +-
 include/linux/platform_data/st_nci.h               |  29 --
 net/nfc/netlink.c                                  |   7 +-
 12 files changed, 496 insertions(+), 92 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/nfc/st-nci-i2c.txt
 create mode 100644 Documentation/devicetree/bindings/net/nfc/st-nci-spi.txt
 delete mode 100644 Documentation/devicetree/bindings/net/nfc/st-nci.txt
 create mode 100644 drivers/nfc/st-nci/spi.c
 delete mode 100644 include/linux/platform_data/st_nci.h

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
