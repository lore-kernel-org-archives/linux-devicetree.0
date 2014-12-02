From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 00/13] Follow up patchset
Date: Tue,  2 Dec 2014 21:27:45 +0100
Message-ID: <1417552078-9269-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Samuel,

Here is a follow up patchset with the updated patches reviewed last night.

Please note patch #8 to #13 are new. I just though it would be better if they
could join those patches. 

Best Regards
Christophe

Christophe Ricard (13):
  NFC: st21nfcb: Remove useless pr_info
  NFC: nci: Add status byte management in case of error.
  NFC: nci: Add management for NCI state for machine rf_deactivate_ntf
  NFC: nci: Add support for different NCI_DEACTIVATE_TYPE
  NFC: netlink: Add new netlink command NFC_CMD_ACTIVATE_TARGET
  NFC: Add se_io NFC operand
  NFC: hci: Add specific hci macro to not create a pipe
  NFC: dts: st21nfca: Fix compatible string spelling to follow other
    drivers
  NFC: dts: st21nfcb: Fix compatible string spelling to follow other
    drivers
  NFC: st21nfca: Report error returned by functions instead of -ENODEV
  NFC: st21nfcb: Report error returned by
    st21nfcb_nci_i2c_request_resources instead of -ENODEV
  NFC: Fix warning "warning: incorrect type in assignment"
  NFC: nci: Fix warning: cast to restricted __le16

 .../devicetree/bindings/net/nfc/st21nfca.txt       |  4 +-
 .../devicetree/bindings/net/nfc/st21nfcb.txt       |  4 +-
 drivers/nfc/st21nfca/i2c.c                         |  8 +--
 drivers/nfc/st21nfcb/i2c.c                         |  8 +--
 include/net/nfc/hci.h                              |  1 +
 include/uapi/linux/nfc.h                           |  1 +
 net/nfc/hci/command.c                              |  3 +
 net/nfc/llcp_commands.c                            |  6 +-
 net/nfc/nci/core.c                                 | 10 +--
 net/nfc/nci/data.c                                 | 11 +++-
 net/nfc/nci/ntf.c                                  | 20 ++++--
 net/nfc/netlink.c                                  | 77 +++++++++++++++++++++-
 12 files changed, 126 insertions(+), 27 deletions(-)

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
