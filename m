From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 00/14] Secure Element support for NCI based NFC controller, st21nfcb integration and EVT_TRANSACTION
Date: Tue, 27 Jan 2015 01:28:10 +0100
Message-ID: <1422318504-10039-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Samuel,

I have to introduce dynnamic conn_id management has described in the NCI
specification. Only RF static conn_id was supported so far. I have tried to 
do a minimun changeset in order to bring all the necessary NCI functions in
order to operate with a secure element with ST21NFCB NFC controller. Besides the
standard NCI commands, the HCI commands are sent following a proprietary
implementation.

Miscellaneous
-------------
I am also routing the HCI event TRANSACTION up to user space. It may help to understand
the necessity to reference every pipe with a tuple {gate, host}. This for example allows 
to keep the host information generating this particular event.

Open Questions:
---------------
Both integration may have little gap in their card emulation behavior.
For example:
- ST21NFCA will have card emulation active as soon as we activate a secure element.
- ST21NFCB will have card emulation active according to the selected polling mode.
When do you expect to have card emulation to be active ?

When an application is running, it might be necessary to signals to the under layers
that it has finished to operate with a particular secure element. The goal here is to release
a secure element without deactivating it. For example to allow automatic sleep mode.
With my current implementation, 
- With ST21NFCB, enable_se/disable_se may fit this request as both secure element are kept activated.
- With ST21NFCA, enable_se/disable_se does not fit this requirement as i am completely deactivating 
the secure element.
I am not sure if the SE activation should not be done in the discovery_se without any deactivation 
until the device remove function(?).

Any feedback are welcome.

Best Regards
Christophe

Christophe Ricard (14):
  NFC: nci: Add dynamic conn_id NCI concept.
  NFC: nci: Make nci_request available for nfc driver
  NFC: nci: Add NCI NFCEE constant
  NFC: nci: Add nci_nfcee_discover handler command/response/notification
  NFC: nci: Add nci_nfcee_mode_set handler command/response
  NFC: nci: Add nci_core_conn_create handler command/response
  NFC: nci: Add nci_core_conn_close handler command/response
  NFC: st21nfcb: Add HCI protocol over NCI protocol support
  NFC: st21nfcb: Adding support for secure element
  NFC: Forward NFC_EVT_TRANSACTION up to user space
  NFC: nci: Add support RF_NFCEE_ACTION_NTF
  NFC: nci: Change NCI state machine to LISTEN_ACTIVE and ignore
    parameters in rf_intf_activated_ntf
  NFC: st21nfcb: Add support for HCI event transaction
  NFC: st21nfca: Add support for HCI event transaction

 drivers/nfc/st21nfca/st21nfca_se.c       |  21 +
 drivers/nfc/st21nfcb/Makefile            |   2 +-
 drivers/nfc/st21nfcb/st21nfcb.c          |   8 +-
 drivers/nfc/st21nfcb/st21nfcb.h          |   2 +
 drivers/nfc/st21nfcb/st21nfcb_hci_core.c | 783 +++++++++++++++++++++++++++++++
 drivers/nfc/st21nfcb/st21nfcb_hci_core.h | 134 ++++++
 drivers/nfc/st21nfcb/st21nfcb_se.c       | 631 +++++++++++++++++++++++++
 drivers/nfc/st21nfcb/st21nfcb_se.h       |  59 +++
 include/net/nfc/nci.h                    |  95 ++++
 include/net/nfc/nci_core.h               |  40 +-
 include/net/nfc/nfc.h                    |  27 ++
 include/uapi/linux/nfc.h                 |   1 +
 net/nfc/core.c                           |  21 +
 net/nfc/nci/core.c                       | 112 ++++-
 net/nfc/nci/data.c                       |  57 ++-
 net/nfc/nci/ntf.c                        |  82 +++-
 net/nfc/nci/rsp.c                        |  94 +++-
 net/nfc/netlink.c                        |  47 ++
 net/nfc/nfc.h                            |   2 +
 19 files changed, 2172 insertions(+), 46 deletions(-)
 create mode 100644 drivers/nfc/st21nfcb/st21nfcb_hci_core.c
 create mode 100644 drivers/nfc/st21nfcb/st21nfcb_hci_core.h
 create mode 100644 drivers/nfc/st21nfcb/st21nfcb_se.c
 create mode 100644 drivers/nfc/st21nfcb/st21nfcb_se.h

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
