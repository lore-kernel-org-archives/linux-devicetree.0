From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC v1 00/14] Few fixes, add hibernate and ST21NFCC support
Date: Fri,  1 May 2015 22:19:23 +0200
Message-ID: <1430511577-19678-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Samuel,

The following patchset brings:
- some few code fixes
- support for the proprietary nci command nci_set_mode allowing to set the
clf in low power consumption when deactivated. This command is quite specific
from other nci commands as it can be sent anywhere in the nci state machine in order
to enable/disable the nfc controller.
- support ST21nfcc nfc controller by renaming the driver from st21nfcb to st_nci
as both are using nci and the exact same proprietary commands.

Best Regards
Christophe

Christophe Ricard (14):
  NFC: st21nfcb: Remove inappropriate kfree on a devm_kzalloc pointer
  nfc: nci: Add handle to manage nci response from nci proprietary
    command
  nfc: nci: Add handle to manage nci notification from nci proprietary
    command
  nfc: st21nfcb: Do not remove header once the payload is sent
  nfc: nci: Move close ops call in nci_close_device
  nfc: nci: Remove code style warning
  nfc: st21nfcb: Move st21nfcb_nci_remove in ndlc_remove
  nfc: st21nfcb: remove st21nfcb_nci_i2c_disable in
    st21nfcb_nci_i2c_remove
  nfc: st21nfcb: Move powered flag from phy to ndlc layer
  nfc: st21nfcb: Add ndlc_close in st21nfcb_nci_remove
  nfc: st21nfcb: Add support for nci set mode proprietary command
  nfc: st21nfcb: disable irq when st21nfcb is disabled
  nfc: st21nfcb: Use hibernate nci command in ndlc_open and ndlc_close
  nfc: st-nci: Rename st21nfcb to st-nci to support ST NCI NFC
    controllers

 .../devicetree/bindings/net/nfc/st-nci.txt         |  33 +
 .../devicetree/bindings/net/nfc/st21nfcb.txt       |  33 -
 drivers/nfc/Kconfig                                |   2 +-
 drivers/nfc/Makefile                               |   2 +-
 drivers/nfc/st-nci/Kconfig                         |  23 +
 drivers/nfc/st-nci/Makefile                        |   9 +
 drivers/nfc/st-nci/core.c                          | 245 +++++++
 drivers/nfc/st-nci/i2c.c                           | 385 +++++++++++
 drivers/nfc/st-nci/ndlc.c                          | 307 +++++++++
 drivers/nfc/st-nci/ndlc.h                          |  60 ++
 drivers/nfc/st-nci/st-nci.h                        |  39 ++
 drivers/nfc/st-nci/st-nci_se.c                     | 713 +++++++++++++++++++++
 drivers/nfc/st-nci/st-nci_se.h                     |  61 ++
 drivers/nfc/st21nfcb/Kconfig                       |  22 -
 drivers/nfc/st21nfcb/Makefile                      |   9 -
 drivers/nfc/st21nfcb/i2c.c                         | 398 ------------
 drivers/nfc/st21nfcb/ndlc.c                        | 300 ---------
 drivers/nfc/st21nfcb/ndlc.h                        |  59 --
 drivers/nfc/st21nfcb/st21nfcb.c                    | 143 -----
 drivers/nfc/st21nfcb/st21nfcb.h                    |  38 --
 drivers/nfc/st21nfcb/st21nfcb_se.c                 | 713 ---------------------
 drivers/nfc/st21nfcb/st21nfcb_se.h                 |  61 --
 include/linux/platform_data/st21nfcb.h             |  29 -
 include/linux/platform_data/st_nci.h               |  29 +
 include/net/nfc/nci_core.h                         |   4 +
 net/nfc/nci/core.c                                 |  10 +-
 net/nfc/nci/ntf.c                                  |   9 +-
 net/nfc/nci/rsp.c                                  |   9 +-
 28 files changed, 1932 insertions(+), 1813 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/nfc/st-nci.txt
 delete mode 100644 Documentation/devicetree/bindings/net/nfc/st21nfcb.txt
 create mode 100644 drivers/nfc/st-nci/Kconfig
 create mode 100644 drivers/nfc/st-nci/Makefile
 create mode 100644 drivers/nfc/st-nci/core.c
 create mode 100644 drivers/nfc/st-nci/i2c.c
 create mode 100644 drivers/nfc/st-nci/ndlc.c
 create mode 100644 drivers/nfc/st-nci/ndlc.h
 create mode 100644 drivers/nfc/st-nci/st-nci.h
 create mode 100644 drivers/nfc/st-nci/st-nci_se.c
 create mode 100644 drivers/nfc/st-nci/st-nci_se.h
 delete mode 100644 drivers/nfc/st21nfcb/Kconfig
 delete mode 100644 drivers/nfc/st21nfcb/Makefile
 delete mode 100644 drivers/nfc/st21nfcb/i2c.c
 delete mode 100644 drivers/nfc/st21nfcb/ndlc.c
 delete mode 100644 drivers/nfc/st21nfcb/ndlc.h
 delete mode 100644 drivers/nfc/st21nfcb/st21nfcb.c
 delete mode 100644 drivers/nfc/st21nfcb/st21nfcb.h
 delete mode 100644 drivers/nfc/st21nfcb/st21nfcb_se.c
 delete mode 100644 drivers/nfc/st21nfcb/st21nfcb_se.h
 delete mode 100644 include/linux/platform_data/st21nfcb.h
 create mode 100644 include/linux/platform_data/st_nci.h

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
