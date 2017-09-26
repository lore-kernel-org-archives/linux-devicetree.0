From: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 09/12] usb: typec: tcpm: only drives the connected cc line when attached
Date: Tue, 26 Sep 2017 08:45:24 +0800
Message-ID: <1506386727-16370-10-git-send-email-jun.li@nxp.com>
References: <1506386727-16370-1-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506386727-16370-1-git-send-email-jun.li-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: yueyao-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, o_leveque-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org, peter.chen-3arQi8VN3Tc@public.gmane.org, aisheng.dong-3arQi8VN3Tc@public.gmane.org, jun.li-3arQi8VN3Tc@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

As we should only drive connected cc line to be the right state when
attached, and keeps the other one to be open, so update the set_cc
interface for that.

Signed-off-by: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
---
 drivers/usb/typec/tcpm.c | 12 +++++++++++-
 include/linux/usb/tcpm.h |  3 ++-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c
index 38a6223..c9966ee 100644
--- a/drivers/usb/typec/tcpm.c
+++ b/drivers/usb/typec/tcpm.c
@@ -1857,9 +1857,15 @@ static bool tcpm_start_drp_toggling(struct tcpm_port *port,
 
 static void tcpm_set_cc(struct tcpm_port *port, enum typec_cc_status cc)
 {
+	bool attached;
+
 	tcpm_log(port, "cc:=%d", cc);
 	port->cc_req = cc;
-	port->tcpc->set_cc(port->tcpc, cc);
+	if (port->state == SRC_ATTACHED || port->state == SNK_ATTACHED)
+		attached = true;
+	else
+		attached = false;
+	port->tcpc->set_cc(port->tcpc, cc, attached, port->polarity);
 }
 
 static int tcpm_init_vbus(struct tcpm_port *port)
@@ -1913,6 +1919,8 @@ static int tcpm_src_attach(struct tcpm_port *port)
 	if (ret < 0)
 		return ret;
 
+	tcpm_set_cc(port, tcpm_rp_cc(port));
+
 	ret = tcpm_set_roles(port, true, TYPEC_SOURCE, TYPEC_HOST);
 	if (ret < 0)
 		return ret;
@@ -2028,6 +2036,8 @@ static int tcpm_snk_attach(struct tcpm_port *port)
 	if (ret < 0)
 		return ret;
 
+	tcpm_set_cc(port, TYPEC_CC_RD);
+
 	ret = tcpm_set_roles(port, true, TYPEC_SINK, TYPEC_DEVICE);
 	if (ret < 0)
 		return ret;
diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
index a67cf77..a007e2a1 100644
--- a/include/linux/usb/tcpm.h
+++ b/include/linux/usb/tcpm.h
@@ -159,7 +159,8 @@ struct tcpc_dev {
 	int (*init)(struct tcpc_dev *dev);
 	int (*get_vbus)(struct tcpc_dev *dev);
 	int (*get_current_limit)(struct tcpc_dev *dev);
-	int (*set_cc)(struct tcpc_dev *dev, enum typec_cc_status cc);
+	int (*set_cc)(struct tcpc_dev *dev, enum typec_cc_status cc,
+			bool attached, enum typec_cc_polarity polarity);
 	int (*get_cc)(struct tcpc_dev *dev, enum typec_cc_status *cc1,
 		      enum typec_cc_status *cc2);
 	int (*set_polarity)(struct tcpc_dev *dev,
-- 
2.6.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
