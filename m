Return-Path: <SRS0=hILt=GK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-he1eur01on0074.outbound.protection.outlook.com ([104.47.0.74]:15671
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752614AbeCTKlb (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 20 Mar 2018 06:41:31 -0400
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH 4/5] usb: typec: wcove: remove max_snk_* for sink config
Date: Tue, 20 Mar 2018 18:26:08 +0800
Message-Id: <1521541570-25363-5-git-send-email-jun.li@nxp.com>
In-Reply-To: <1521541570-25363-1-git-send-email-jun.li@nxp.com>
References: <1521541570-25363-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, heikki.krogerus@linux.intel.com, linux@roeck-us.net, hdegoede@redhat.com, rmfrfs@gmail.com, yueyao.zhu@gmail.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

Since max_snk_* is to be deprecated, so remove max_snk_* by adding a
variable PDO for sink config.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/typec_wcove.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/typec/typec_wcove.c b/drivers/usb/typec/typec_wcove.c
index 2e990e0..7c10e06 100644
--- a/drivers/usb/typec/typec_wcove.c
+++ b/drivers/usb/typec/typec_wcove.c
@@ -558,6 +558,7 @@ static const u32 src_pdo[] = {
 static const u32 snk_pdo[] = {
 	PDO_FIXED(5000, 500, PDO_FIXED_DUAL_ROLE | PDO_FIXED_DATA_SWAP |
 		  PDO_FIXED_USB_COMM),
+	PDO_VAR(5000, 12000, 3000),
 };
 
 static struct tcpc_config wcove_typec_config = {
@@ -566,9 +567,6 @@ static struct tcpc_config wcove_typec_config = {
 	.snk_pdo = snk_pdo,
 	.nr_snk_pdo = ARRAY_SIZE(snk_pdo),
 
-	.max_snk_mv = 12000,
-	.max_snk_ma = 3000,
-	.max_snk_mw = 36000,
 	.operating_snk_mw = 15000,
 
 	.type = TYPEC_PORT_DRP,
-- 
2.7.4

