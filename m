Return-Path: <SRS0=A7Xe=IP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr00069.outbound.protection.outlook.com ([40.107.0.69]:14464
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753134AbeE1DJ2 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 27 May 2018 23:09:28 -0400
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v6 03/15] staging: typec: tcpci: add compatible string for nxp ptn5110
Date: Mon, 28 May 2018 10:52:35 +0800
Message-Id: <1527475967-15201-4-git-send-email-jun.li@nxp.com>
In-Reply-To: <1527475967-15201-1-git-send-email-jun.li@nxp.com>
References: <1527475967-15201-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: cw00.choi@samsung.com, a.hajda@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, garsilva@embeddedor.com, gsomlo@gmail.com, jun.li@nxp.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

Add nxp ptn5110 typec controller compatible string: "nxp,ptn5110",
which is a standard tcpci chip with power delivery support. Meanwhile
remove "usb,tcpci" because it doesn't follow the binding format rule
and has not been used yet.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/staging/typec/tcpci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
index 076d97e..dd29288 100644
--- a/drivers/staging/typec/tcpci.c
+++ b/drivers/staging/typec/tcpci.c
@@ -575,7 +575,7 @@ MODULE_DEVICE_TABLE(i2c, tcpci_id);
 
 #ifdef CONFIG_OF
 static const struct of_device_id tcpci_of_match[] = {
-	{ .compatible = "usb,tcpci", },
+	{ .compatible = "nxp,ptn5110", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, tcpci_of_match);
-- 
2.7.4

