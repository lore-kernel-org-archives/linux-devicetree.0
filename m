From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 12/13] NFC: Fix warning "warning: incorrect type in assignment"
Date: Tue,  2 Dec 2014 21:27:57 +0100
Message-ID: <1417552078-9269-13-git-send-email-christophe-h.ricard@st.com>
References: <1417552078-9269-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417552078-9269-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Fix warnings:
net/nfc/llcp_commands.c:421:14: warning: incorrect type in assignment (different base types)
net/nfc/llcp_commands.c:421:14:    expected unsigned short [unsigned] [usertype] miux
net/nfc/llcp_commands.c:421:14:    got restricted __be16
net/nfc/llcp_commands.c:477:14: warning: incorrect type in assignment (different base types)
net/nfc/llcp_commands.c:477:14:    expected unsigned short [unsigned] [usertype] miux
net/nfc/llcp_commands.c:477:14:    got restricted __be16

Procedure to reproduce:
make ARCH=x86_64 allmodconfig
make C=1 CF=-D__CHECK_ENDIAN__

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 net/nfc/llcp_commands.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/nfc/llcp_commands.c b/net/nfc/llcp_commands.c
index a3ad69a..c3435f8 100644
--- a/net/nfc/llcp_commands.c
+++ b/net/nfc/llcp_commands.c
@@ -401,7 +401,8 @@ int nfc_llcp_send_connect(struct nfc_llcp_sock *sock)
 	u8 *miux_tlv = NULL, miux_tlv_length;
 	u8 *rw_tlv = NULL, rw_tlv_length, rw;
 	int err;
-	u16 size = 0, miux;
+	u16 size = 0;
+	__be16 miux;
 
 	pr_debug("Sending CONNECT\n");
 
@@ -465,7 +466,8 @@ int nfc_llcp_send_cc(struct nfc_llcp_sock *sock)
 	u8 *miux_tlv = NULL, miux_tlv_length;
 	u8 *rw_tlv = NULL, rw_tlv_length, rw;
 	int err;
-	u16 size = 0, miux;
+	u16 size = 0;
+	__be16 miux;
 
 	pr_debug("Sending CC\n");
 
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
