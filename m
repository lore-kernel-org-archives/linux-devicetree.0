From: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH resend 11/12] staging: typec: tcpci: Only touch target bit when enable vconn
Date: Tue, 26 Sep 2017 12:05:22 +0800
Message-ID: <1506398723-19359-12-git-send-email-jun.li@nxp.com>
References: <1506398723-19359-1-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506398723-19359-1-git-send-email-jun.li-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: yueyao-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, o_leveque-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org, peter.chen-3arQi8VN3Tc@public.gmane.org, aisheng.dong-3arQi8VN3Tc@public.gmane.org, jun.li-3arQi8VN3Tc@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

We need regmap_update_bits to avoid touch any other bits when
enable or disable vconn.

Signed-off-by: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
---
 drivers/staging/typec/tcpci.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
index c7c45da..293a07c 100644
--- a/drivers/staging/typec/tcpci.c
+++ b/drivers/staging/typec/tcpci.c
@@ -202,14 +202,10 @@ static int tcpci_set_polarity(struct tcpc_dev *tcpc,
 static int tcpci_set_vconn(struct tcpc_dev *tcpc, bool enable)
 {
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
-	int ret;
 
-	ret = regmap_write(tcpci->regmap, TCPC_POWER_CTRL,
-			   enable ? TCPC_POWER_CTRL_VCONN_ENABLE : 0);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return regmap_update_bits(tcpci->regmap, TCPC_POWER_CTRL,
+				TCPC_POWER_CTRL_VCONN_ENABLE,
+				enable ? TCPC_POWER_CTRL_VCONN_ENABLE : 0);
 }
 
 static int tcpci_set_roles(struct tcpc_dev *tcpc, bool attached,
-- 
2.6.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
