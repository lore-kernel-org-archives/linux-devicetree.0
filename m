From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 00/10] Secure Element support for HCI based NFC controller & st21nfca integration
Date: Tue, 27 Jan 2015 01:18:10 +0100
Message-ID: <1422317900-3810-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Samuel,

I am changing a little bit the way pipes and gates are referenced because 1 gate
on the Terminal Host may connect severals differents Host (e.g: UICC, eSE...). 
I chose to reference a pipe with a tuple {gate, host}.
I chose also to keep the gate --> pipe reference with a little drawback:
- se_io will only be able to send data to an eSE (over SWP)... To my knowledge
the aren't any UICC with APDU Reader gate available in the field.

In this serie, I have taken into account your previous comment on patches #5, #6, #7, #8.
>From the one sent earlier in December 2014:
https://lists.01.org/pipermail/linux-nfc/2014-December/003204.html

I believe there are not much changes other than those one for HCI and st21nfca.

Best Regards
Christophe

Christophe Ricard (10):
  NFC: hci: Change event_received handler gate parameter to pipe
  NFC: hci: Add pipes table to reference them with a tuple {gate, host}
  NFC: hci: Change nfc_hci_send_response gate parameter to pipe
  NFC: hci: Reference every pipe information according to notification
  NFC: hci: Add cmd_received handler
  NFC: pn544: Change event_received gate parameter to pipe
  NFC: microread: Change event_received gate parameter to pipe
  NFC: hci: Remove nfc_hci_pipe2gate function
  NFC: st21nfca: Adding support for secure element
  NFC: dts: st21nfca: Document ese-present & uicc-present DTS property

 .../devicetree/bindings/net/nfc/st21nfca.txt       |   7 +
 drivers/nfc/microread/microread.c                  |   3 +-
 drivers/nfc/pn544/pn544.c                          |   3 +-
 drivers/nfc/st21nfca/Makefile                      |   2 +-
 drivers/nfc/st21nfca/i2c.c                         |  17 +-
 drivers/nfc/st21nfca/st21nfca.c                    | 134 ++++++-
 drivers/nfc/st21nfca/st21nfca.h                    |  21 +-
 drivers/nfc/st21nfca/st21nfca_se.c                 | 390 +++++++++++++++++++++
 drivers/nfc/st21nfca/st21nfca_se.h                 |  63 ++++
 include/linux/platform_data/st21nfca.h             |   2 +
 include/net/nfc/hci.h                              |  25 +-
 net/nfc/hci/command.c                              |  23 +-
 net/nfc/hci/core.c                                 |  97 +++--
 net/nfc/hci/hci.h                                  |  10 +-
 net/nfc/hci/hcp.c                                  |  11 -
 15 files changed, 724 insertions(+), 84 deletions(-)
 create mode 100644 drivers/nfc/st21nfca/st21nfca_se.c
 create mode 100644 drivers/nfc/st21nfca/st21nfca_se.h

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
