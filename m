From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 00/35] Few fixes and st21nfca/st-nci vendor_cmds support
Date: Mon, 26 Oct 2015 07:49:40 +0100
Message-ID: <1445842215-28403-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Samuel,

Please find in the following patchset severals fixes as well as vendor_cmds support
for st21nfca and st-nci.
vendor_cmds includes production test, trimmings & firmware update commands.

v3:
- Fix st21nfca vendor_cmds by exporting nfc_llc_start/stop
- Remove #include "st21nfca_vendor_cmds.h" in vendor_cmds as this one does not exist.

v2:
- Propose a more elegant way to switch between NFC target mode (SLEEP, IDLE).
- Remove st21nfca_ and st-nci_ file name prefix.
- Merge st21nfca_xxx.h headers into st21nfca.h. Same for st-nci_xxx.h

Best Regards
Christophe

Christophe Ricard (35):
  nfc: st-nci: Align st-nci driver with other nfc driver
  nfc: st-nci: include st-nci.h instead of ndlc.h
  nfc: st21nfca: Align st21nfca driver with other nfc driver
  nfc: st-nci: Fix incorrect spi buffer size
  nfc: nci: Fix incorrect data chaining when sending data
  nfc: nci: Fix improper management of HCI return code
  nfc: nci: extract pipe value using NCI_HCP_MSG_GET_PIPE
  nfc: nci: add nci_hci_clear_all_pipes functions
  nfc: nci: Add a call to nci_hci_clear_all_pipes at HCI initial
    activation.
  nfc: nci: add capability to create pipe on specific gate in
    nci_hci_connect_gate
  nfc: st-nci: Remove ndev->hci_dev->init_data.gates initialization in
    load_session
  nfc: st21nfca: Remove hdev->init_data.gates initialization in
    load_session
  nfc: st-nci: Open NCI_HCI_LINK_MGMT_PIPE
  nfc: st21nfca: Open NFC_HCI_LINK_MGMT_PIPE
  nfc: st-nci: Keep st_nci_gates unchanged in load_session
  nfc: st21nfca: Keep st21nfca_gates unchanged in load_session
  nfc: st-nci: initialize gate_count in st_nci_hci_network_init
  nfc: st-nci: Add support for NCI_HCI_IDENTITY_MGMT_GATE
  nfc: st-nci: Change st_nci_gates offset when looking for a pipe in the
    table
  nfc: st21nfca: Change st21nfca_gates offset when looking for a pipe in
    the table
  nfc: st-nci: Add support for proprietary commands for factory tests
  nfc: st-nci: Add error messages when an unexpected HCI event occurs
  nfc: netlink: Add missing NFC_ATTR comments
  nfc: st-nci: Add ese-present/uicc-present dts properties
  nfc: st-nci: Increase waiting time between 2 secure element activation
  nfc: st-nci: Fix host_list verification after secure element
    activation
  nfc: st21nfca: Fix host_list verification after secure element
    activation
  nfc: netlink: Add mode parameter to deactivate_target functions
  nfc: st-nci: Add few code style fixes
  nfc: st21nfca: Add few code style fixes
  nfc: st21nfca: Add support for proprietary commands for factory tests
  nfc: st21nfca: Add error messages when an unexpected HCI event occurs
  nfc: st-nci: Make sure irq is not already active when powering the
    device
  nfc: st-nci: remove duplicated skb dump
  nfc: st-nci: Replace st21nfcb by st_nci in makefile

 .../devicetree/bindings/net/nfc/st-nci-i2c.txt     |    7 +
 .../devicetree/bindings/net/nfc/st-nci-spi.txt     |    9 +-
 drivers/nfc/st-nci/Makefile                        |    4 +-
 drivers/nfc/st-nci/core.c                          |   18 +-
 drivers/nfc/st-nci/i2c.c                           |   35 +-
 drivers/nfc/st-nci/ndlc.c                          |    7 +-
 drivers/nfc/st-nci/ndlc.h                          |    5 +-
 drivers/nfc/st-nci/se.c                            |  166 ++-
 drivers/nfc/st-nci/se.h                            |   61 --
 drivers/nfc/st-nci/spi.c                           |   37 +-
 drivers/nfc/st-nci/st-nci.h                        |  117 ++-
 drivers/nfc/st-nci/vendor_cmds.c                   |  516 ++++++++++
 drivers/nfc/st21nfca/Makefile                      |    2 +-
 drivers/nfc/st21nfca/core.c                        | 1056 +++++++++++++++++++
 drivers/nfc/st21nfca/dep.c                         |  689 +++++++++++++
 drivers/nfc/st21nfca/i2c.c                         |    1 +
 drivers/nfc/st21nfca/se.c                          |  428 ++++++++
 drivers/nfc/st21nfca/st21nfca.c                    | 1064 --------------------
 drivers/nfc/st21nfca/st21nfca.h                    |  148 ++-
 drivers/nfc/st21nfca/st21nfca_dep.c                |  689 -------------
 drivers/nfc/st21nfca/st21nfca_dep.h                |   43 -
 drivers/nfc/st21nfca/st21nfca_se.c                 |  420 --------
 drivers/nfc/st21nfca/st21nfca_se.h                 |   63 --
 drivers/nfc/st21nfca/vendor_cmds.c                 |  369 +++++++
 include/linux/platform_data/st-nci.h               |    2 +
 include/net/nfc/nci_core.h                         |    3 +
 include/net/nfc/nfc.h                              |    2 +-
 include/uapi/linux/nfc.h                           |    2 +
 net/nfc/core.c                                     |    4 +-
 net/nfc/digital_core.c                             |    3 +-
 net/nfc/hci/core.c                                 |    3 +-
 net/nfc/hci/llc.c                                  |    2 +
 net/nfc/nci/core.c                                 |   15 +-
 net/nfc/nci/hci.c                                  |  159 ++-
 net/nfc/netlink.c                                  |    2 +-
 net/nfc/nfc.h                                      |    5 +-
 net/nfc/rawsock.c                                  |    3 +-
 37 files changed, 3664 insertions(+), 2495 deletions(-)
 delete mode 100644 drivers/nfc/st-nci/se.h
 create mode 100644 drivers/nfc/st-nci/vendor_cmds.c
 create mode 100644 drivers/nfc/st21nfca/core.c
 create mode 100644 drivers/nfc/st21nfca/dep.c
 create mode 100644 drivers/nfc/st21nfca/se.c
 delete mode 100644 drivers/nfc/st21nfca/st21nfca.c
 delete mode 100644 drivers/nfc/st21nfca/st21nfca_dep.c
 delete mode 100644 drivers/nfc/st21nfca/st21nfca_dep.h
 delete mode 100644 drivers/nfc/st21nfca/st21nfca_se.c
 delete mode 100644 drivers/nfc/st21nfca/st21nfca_se.h
 create mode 100644 drivers/nfc/st21nfca/vendor_cmds.c

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
