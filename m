Return-Path: <SRS0=mYdy=JN=nxp.com=jun.li@kernel.org>
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v8 12/14] staging: typec: tcpci: keep the disconnected cc line open
Date: Wed, 27 Jun 2018 07:45:30 +0800
Message-Id: <1530056732-9640-13-git-send-email-jun.li@nxp.com>
In-Reply-To: <1530056732-9640-1-git-send-email-jun.li@nxp.com>
References: <1530056732-9640-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: a.hajda@samsung.com, jun.li@nxp.com, cw00.choi@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

While set polarity, we should keep the disconnected cc line to be
open.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/staging/typec/tcpci.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
index 4d3b0ae..11c2d37 100644
--- a/drivers/staging/typec/tcpci.c
+++ b/drivers/staging/typec/tcpci.c
@@ -185,15 +185,25 @@ static int tcpci_set_polarity(struct tcpc_dev *tcpc,
 			      enum typec_cc_polarity polarity)
 {
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
+	unsigned int reg;
 	int ret;
 
-	ret = regmap_write(tcpci->regmap, TCPC_TCPC_CTRL,
-			   (polarity == TYPEC_POLARITY_CC2) ?
-			   TCPC_TCPC_CTRL_ORIENTATION : 0);
+	/* Keep the disconnect cc line open */
+	ret = regmap_read(tcpci->regmap, TCPC_ROLE_CTRL, &reg);
 	if (ret < 0)
 		return ret;
 
-	return 0;
+	if (polarity == TYPEC_POLARITY_CC2)
+		reg |= TCPC_ROLE_CTRL_CC_OPEN << TCPC_ROLE_CTRL_CC1_SHIFT;
+	else
+		reg |= TCPC_ROLE_CTRL_CC_OPEN << TCPC_ROLE_CTRL_CC2_SHIFT;
+	ret = regmap_write(tcpci->regmap, TCPC_ROLE_CTRL, reg);
+	if (ret < 0)
+		return ret;
+
+	return regmap_write(tcpci->regmap, TCPC_TCPC_CTRL,
+			   (polarity == TYPEC_POLARITY_CC2) ?
+			   TCPC_TCPC_CTRL_ORIENTATION : 0);
 }
 
 static int tcpci_set_vconn(struct tcpc_dev *tcpc, bool enable)
-- 
2.7.4
