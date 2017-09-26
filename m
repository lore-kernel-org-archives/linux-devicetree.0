From: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 08/12] staging: typec: tcpci: correct drp toggling
Date: Tue, 26 Sep 2017 08:45:23 +0800
Message-ID: <1506386727-16370-9-git-send-email-jun.li@nxp.com>
References: <1506386727-16370-1-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506386727-16370-1-git-send-email-jun.li-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: yueyao-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, o_leveque-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org, peter.chen-3arQi8VN3Tc@public.gmane.org, aisheng.dong-3arQi8VN3Tc@public.gmane.org, jun.li-3arQi8VN3Tc@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Per tcpci spec 4.4.5.2 ROLE_CONTROL description: "the TCPM shall
write B6 (DRP) =1b and the starting value of Rp/Rd to B3..0 (CC1/CC2)
to indicate DRP autonomous toggling mode to the TCPC", so add CC1/CC2
setting, also we should issue COMMAND.Look4Connection to start it.

Signed-off-by: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
---
 drivers/staging/typec/tcpci.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
index 851d026..cea67f9 100644
--- a/drivers/staging/typec/tcpci.c
+++ b/drivers/staging/typec/tcpci.c
@@ -109,6 +109,7 @@ static int tcpci_start_drp_toggling(struct tcpc_dev *tcpc,
 {
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
 	unsigned int reg = TCPC_ROLE_CTRL_DRP;
+	int ret;
 
 	switch (cc) {
 	default:
@@ -126,7 +127,19 @@ static int tcpci_start_drp_toggling(struct tcpc_dev *tcpc,
 		break;
 	}
 
-	return regmap_write(tcpci->regmap, TCPC_ROLE_CTRL, reg);
+	if (cc == TYPEC_CC_RD)
+		reg |= (TCPC_ROLE_CTRL_CC_RD << TCPC_ROLE_CTRL_CC1_SHIFT) |
+			(TCPC_ROLE_CTRL_CC_RD << TCPC_ROLE_CTRL_CC2_SHIFT);
+	else
+		reg |= (TCPC_ROLE_CTRL_CC_RP << TCPC_ROLE_CTRL_CC1_SHIFT) |
+			(TCPC_ROLE_CTRL_CC_RP << TCPC_ROLE_CTRL_CC2_SHIFT);
+
+	ret = regmap_write(tcpci->regmap, TCPC_ROLE_CTRL, reg);
+	if (ret < 0)
+		return ret;
+
+	return regmap_write(tcpci->regmap, TCPC_COMMAND,
+				TCPC_CMD_LOOK4CONNECTION);
 }
 
 static enum typec_cc_status tcpci_to_typec_cc(unsigned int cc, bool sink)
-- 
2.6.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
