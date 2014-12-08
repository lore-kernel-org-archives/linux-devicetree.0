From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 00/34] Minor clean & Secure Element support for ST21NFCA/ST21NFCB
Date: Mon,  8 Dec 2014 22:08:05 +0100
Message-ID: <1418072919-10535-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Samuel,

I think it is time to drop the ongoing work for Secure Element support for
a first review.

I guess patches #1, #2, #3, #4, #13, #14, #16, #17, #18 and #34 are sanity patches.
May be they could target a second pull request for 3.19 (?)
Most likely:
- #1 and #2 are a resend from the previous patchset trying to not break an
ABI. If you believe they are not necessary, i will understand.
- #3 and #4 are taking into account feedbacks from Dan Carpenter & Julia Lawall.
- #13, #14, #16 and #18 are just sanity patches
- #17 and #34 remove a memory leaks

Secure Element support for HCI based NFC controller:
--------------------------------------------
I am changing a little bit the way pipes and gates are referenced because 1 gate
on the Terminal Host may connect severals differents Host (e.g: UICC, eSE...). 
I chose to reference a pipe with a tuple {gate, host}.
I chose also to keep the gate --> pipe reference with a little drawback:
- se_io will only be able to send data to an eSE (over SWP)... To my knowledge
the aren't any UICC with APDU Reader gate available in the field.

Overall patches:
- #5 to #12 are introducing this pipe referencing changes.
- #15 and #19 are introducing Secure Element complete support for ST21NFCA.

Secure Element support for NCI based NFC controller:
----------------------------------------------------
I have to introduce dynnamic conn_id management has described in the NCI
specification. Only RF static conn_id was supported so far. I have tried to 
do a minimun changeset in order to bring all the necessary NCI functions in
order to operate with a secure element with ST21NFCB NFC controller. Besides the
standard NCI commands, the HCI commands are sent following a proprietary
implementation.

Overall patches:
- #20 to #26 are introducing NCI core changes in order to be able to support
secure element communication.
- #27 is bringing support for HCI protocol allowing to send HCI data over NCI.
- #28 is introducing Secure Element support for ST21NFCB.


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

Christophe Ricard (34):
  NFC: dts: st21nfca: Fix compatible string spelling to follow other
    drivers
  NFC: dts: st21nfcb: Fix compatible string spelling to follow other
    drivers
  NFC: st21nfcb: Fix "WARNING: invalid free of devm_ allocated data"
  NFC: st21nfca: Remove unreachable code
  NFC: hci: Change event_received handler gate parameter to pipe
  NFC: hci: Add pipes table to reference them with a tuple {gate, host}
  NFC: hci: Change nfc_hci_send_response gate parameter to pipe
  NFC: hci: Reference every pipe information according to notification
  NFC: hci: Add cmd_received handler
  NFC: pn544: Change event_received gate parameter to pipe
  NFC: microread: Change event_received gate parameter to pipe
  NFC: hci: Remove nfc_hci_pipe2gate function
  NFC: nfc_enable_se Remove useless blank line at beginning of function
  NFC: nfc_disable_se Remove useless blank line at beginning of function
  NFC: st21nfca: Adding support for secure element
  NFC: st21nfca: Remove useless ST21NFCA_SE_HOST_EVT_HOT_PLUG macro
  NFC: st21nfca: Remove skb_pipe_list and skb_pipe_info useless
    allocation
  NFC: st21nfca: Remove checkpatch.pl warning Possible unnecessary 'out
    of memory' message
  NFC: dts: st21nfca: Document ese-present & uicc-present DTS property
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
  NFC: st21nfca: Fix some skb memory leaks

 .../devicetree/bindings/net/nfc/st21nfca.txt       |  11 +-
 .../devicetree/bindings/net/nfc/st21nfcb.txt       |   4 +-
 drivers/nfc/microread/microread.c                  |   3 +-
 drivers/nfc/pn544/pn544.c                          |   3 +-
 drivers/nfc/st21nfca/Makefile                      |   2 +-
 drivers/nfc/st21nfca/i2c.c                         |  23 +-
 drivers/nfc/st21nfca/st21nfca.c                    | 186 +++--
 drivers/nfc/st21nfca/st21nfca.h                    |  21 +-
 drivers/nfc/st21nfca/st21nfca_se.c                 | 411 +++++++++++
 drivers/nfc/st21nfca/st21nfca_se.h                 |  63 ++
 drivers/nfc/st21nfcb/Makefile                      |   2 +-
 drivers/nfc/st21nfcb/i2c.c                         |   1 +
 drivers/nfc/st21nfcb/ndlc.c                        |   1 -
 drivers/nfc/st21nfcb/st21nfcb.c                    |   8 +-
 drivers/nfc/st21nfcb/st21nfcb.h                    |   2 +
 drivers/nfc/st21nfcb/st21nfcb_hci_core.c           | 783 +++++++++++++++++++++
 drivers/nfc/st21nfcb/st21nfcb_hci_core.h           | 134 ++++
 drivers/nfc/st21nfcb/st21nfcb_se.c                 | 631 +++++++++++++++++
 drivers/nfc/st21nfcb/st21nfcb_se.h                 |  59 ++
 include/linux/platform_data/st21nfca.h             |   2 +
 include/net/nfc/hci.h                              |  27 +-
 include/net/nfc/nci.h                              |  95 +++
 include/net/nfc/nci_core.h                         |  40 +-
 include/net/nfc/nfc.h                              |  27 +
 include/uapi/linux/nfc.h                           |   1 +
 net/nfc/core.c                                     |  23 +-
 net/nfc/hci/command.c                              |  13 +-
 net/nfc/hci/core.c                                 |  96 ++-
 net/nfc/hci/hci.h                                  |  10 +-
 net/nfc/hci/hcp.c                                  |  11 -
 net/nfc/nci/core.c                                 | 112 ++-
 net/nfc/nci/data.c                                 |  57 +-
 net/nfc/nci/ntf.c                                  |  82 ++-
 net/nfc/nci/rsp.c                                  |  94 ++-
 net/nfc/netlink.c                                  |  47 ++
 net/nfc/nfc.h                                      |   2 +
 36 files changed, 2926 insertions(+), 161 deletions(-)
 create mode 100644 drivers/nfc/st21nfca/st21nfca_se.c
 create mode 100644 drivers/nfc/st21nfca/st21nfca_se.h
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
