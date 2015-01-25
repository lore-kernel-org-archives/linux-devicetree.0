From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 00/13] 3.19 st21nfc fixes
Date: Sun, 25 Jan 2015 23:33:18 +0100
Message-ID: <1422225211-27510-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Please find in the following series a set of fixes found during the
3.19 window merge timeframe by Dan Carpenter, Julia Lawall, Anda-Maria Nicolae
or myself.

Some of those patches are taken out of the serie sent in December 2014:
https://lists.01.org/pipermail/linux-nfc/2014-December/003204.html

They were mixing new features and fixes.

Hope those fixes can join kernel revision 3.19.

2 others series will be sent later for secure element support for st21nfca and
for st21nfcb.

Best Regards
Christophe
 
Christophe Ricard (13):
  NFC: dts: st21nfca: Fix compatible string spelling to follow other
    drivers
  NFC: dts: st21nfcb: Fix compatible string spelling to follow other
    drivers
  NFC: st21nfcb: Fix "WARNING: invalid free of devm_ allocated data"
  NFC: st21nfca: Remove unreachable code
  NFC: st21nfcb: Avoid use of skb after free
  NFC: nfc_enable_se Remove useless blank line at beginning of function
  NFC: nfc_disable_se Remove useless blank line at beginning of function
  NFC: st21nfca: Remove skb_pipe_list and skb_pipe_info useless
    allocation
  NFC: st21nfca: Remove checkpatch.pl warning Possible unnecessary 'out
    of memory' message
  NFC: st21nfca: Fix some skb memory leaks
  NFC: st21nfcb: Fix "NULL pointer dereference" possible error
  NFC: st21nfcb: Remove useless include
  NFC: st21nfcb: Fix copy/paste error in comment

 .../devicetree/bindings/net/nfc/st21nfca.txt       |  4 +-
 .../devicetree/bindings/net/nfc/st21nfcb.txt       |  4 +-
 drivers/nfc/st21nfca/i2c.c                         |  6 +--
 drivers/nfc/st21nfca/st21nfca.c                    | 52 +++++++++-------------
 drivers/nfc/st21nfcb/i2c.c                         | 19 +++++---
 drivers/nfc/st21nfcb/ndlc.c                        |  3 +-
 include/linux/platform_data/st21nfcb.h             |  4 +-
 net/nfc/core.c                                     |  2 -
 8 files changed, 41 insertions(+), 53 deletions(-)

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
