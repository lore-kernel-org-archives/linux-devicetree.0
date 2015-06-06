From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC v2 00/18] Few fixes, add hibernate and ST21NFCC support
Date: Sat,  6 Jun 2015 13:16:36 +0200
Message-ID: <1433589413-19680-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Samuel,

Sorry for the delay.
I agree with your proposal. However, i added an additionnal minor fix patch
to get it to work.

I also got to the option to add a specific handler to send proprietary commands.

Best Regards
Christophe

Christophe Ricard (17):
  nci: Handle proprietary response and notifications
  nfc: nci: Add few fixes to handle proprietary response and
    notification
  nfc: nci: Add NCI_RESET return code check before setup
  nfc: nci: Add nci init ops for early device initialization
  nfc: nci: Add nci_prop_cmd allowing to send proprietary nci cmd
  nfc: st21nfcb: Remove inappropriate kfree on a devm_kzalloc pointer
  nfc: st21nfcb: Do not remove header once the payload is sent
  nfc: st21nfcb: remove st21nfcb_nci_i2c_disable in
    st21nfcb_nci_i2c_remove
  nfc: st21nfcb: Add ndlc_close in st21nfcb_nci_remove
  nfc: st21nfcb: Fix st21nfcb_nci_close
  nfc: st21nfcb: Add support for nci proprietary commands
  nfc: nci: Move close ops call in nci_close_device
  nfc: st21nfcb: Move st21nfcb_nci_remove in ndlc_remove
  nfc: st21nfcb: Move powered flag from phy to ndlc layer
  nfc: st21nfcb: disable irq when st21nfcb is disabled
  nfc: st21nfcb: Configure CLF with nci proprietary command during
    init/deinit stage
  nfc: st-nci: Rename st21nfcb to st-nci to support ST NCI NFC
    controllers

 .../devicetree/bindings/net/nfc/st-nci.txt         |  33 +
 .../devicetree/bindings/net/nfc/st21nfcb.txt       |  33 -
 drivers/nfc/Kconfig                                |   2 +-
 drivers/nfc/Makefile                               |   2 +-
 drivers/nfc/st-nci/Kconfig                         |  23 +
 drivers/nfc/st-nci/Makefile                        |   9 +
 drivers/nfc/st-nci/core.c                          | 179 ++++++
 drivers/nfc/st-nci/i2c.c                           | 385 +++++++++++
 drivers/nfc/st-nci/ndlc.c                          | 313 +++++++++
 drivers/nfc/st-nci/ndlc.h                          |  60 ++
 drivers/nfc/st-nci/st-nci.h                        |  50 ++
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
 include/linux/platform_data/st-nci.h               |  29 +
 include/linux/platform_data/st21nfcb.h             |  29 -
 include/net/nfc/nci_core.h                         |  17 +
 net/nfc/nci/core.c                                 | 103 ++-
 net/nfc/nci/ntf.c                                  |  10 +
 net/nfc/nci/rsp.c                                  |  10 +
 28 files changed, 1989 insertions(+), 1815 deletions(-)
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
 create mode 100644 include/linux/platform_data/st-nci.h
 delete mode 100644 include/linux/platform_data/st21nfcb.h

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
