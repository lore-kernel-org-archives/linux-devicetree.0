Return-Path: <SRS0=bntt=JN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr00068.outbound.protection.outlook.com ([40.107.0.68]:30800
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1754129AbeF0ACl (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 Jun 2018 20:02:41 -0400
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v8 03/14] staging: typec: tcpci: add compatible string for nxp ptn5110
Date: Wed, 27 Jun 2018 07:45:21 +0800
Message-Id: <1530056732-9640-4-git-send-email-jun.li@nxp.com>
In-Reply-To: <1530056732-9640-1-git-send-email-jun.li@nxp.com>
References: <1530056732-9640-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: a.hajda@samsung.com, jun.li@nxp.com, cw00.choi@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

Add nxp ptn5110 typec controller compatible string: "nxp,ptn5110",
which is a standard tcpci chip with power delivery support. Meanwhile
remove "usb,tcpci" because it doesn't follow the binding format rule
and has not been used yet.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
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

