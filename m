From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 00/11] Follow up patches and several new fixes
Date: Sat, 13 Sep 2014 10:28:42 +0200
Message-ID: <1410596933-5530-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Please find in those patches a set of followup items according to
previous submissions feedback:
- NFC: st21nfca: Fix few coding style issue
- NFC: st21nfca: Fix potential skb leaks in NFC-DEP code
- NFC: st21nfca: Fix potential double kfree_skb error
are patches related to previous patch:
[PATCH 2/8] NFC: st21nfca: Fix potential skb leaks in NFC-DEP code

NFC: st21nfca: Replace all remaining IS_ERR(skb) with !skb is related
with [PATCH 4/5] NFC: st21nfca: Remove all remaining IS_ERR(skb) for
simple !skb condition.
I have tried to review again and add some more explanation. Hope that
will be acceptable.

Other patches are new they:
- fix recursive fault in p2p target mode with st21nfca
- fix bad behavior on st21nfcb
- add ISO15693 technology for st21nfcb with a specific prioprietary
RF protocol value.
- fix st21nfcb dts documentation

Best Regards
Christophe

Christophe Ricard (11):
  NFC: st21nfca: Fix few coding style issue
  NFC: st21nfca: Fix potential skb leaks in NFC-DEP code
  NFC: st21nfca: Fix recursive fault when doing p2p in target mode.
  NFC: dts: st21nfcb_i2c: Fix invalid interrupts polarity.
  NFC: st21nfcb: Fix improper management of -EREMOTEIO error code.
  NFC: st21nfcb: Fix improper ndlc T2 management
  NFC: nci: Add support for proprietary RF Protocols
  NFC: st21nfcb: Add ISO15693 Reader/Writer support
  NFC: st21nfcb: remove error output
  NFC: st21nfca: ERR_PTR vs NULL fix
  NFC: st21nfca: Fix potential double kfree_skb error

 .../devicetree/bindings/net/nfc/st21nfcb.txt       |  2 +-
 drivers/nfc/st21nfca/st21nfca.c                    | 11 ++++------
 drivers/nfc/st21nfca/st21nfca_dep.c                | 25 ++++++++++++----------
 drivers/nfc/st21nfcb/i2c.c                         | 23 +++++---------------
 drivers/nfc/st21nfcb/ndlc.c                        |  6 +++++-
 drivers/nfc/st21nfcb/ndlc.h                        |  4 ++++
 drivers/nfc/st21nfcb/st21nfcb.c                    | 11 ++++++++++
 include/net/nfc/nci_core.h                         |  9 ++++----
 net/nfc/nci/ntf.c                                  |  9 +++++++-
 9 files changed, 57 insertions(+), 43 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
