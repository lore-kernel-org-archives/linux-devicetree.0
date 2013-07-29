Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:51091 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753430Ab3G2HiW (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 29 Jul 2013 03:38:22 -0400
Received: by mail-wi0-f181.google.com with SMTP id en1so2641729wid.14
        for <devicetree@vger.kernel.org>; Mon, 29 Jul 2013 00:38:21 -0700 (PDT)
From: Niels de Vos <ndevos@redhat.com>
Subject: [PATCH] imx2_wdt: expose module alias for loading from device-tree
Date: Mon, 29 Jul 2013 09:38:18 +0200
Message-Id: <1375083498-14822-1-git-send-email-ndevos@redhat.com>
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Wim Van Sebroeck <wim@iguana.be>, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Niels de Vos <ndevos@redhat.com>, Shawn Guo <shawn.guo@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Enable auto loading by udev when imx2_wdt is compiled as a module.

Signed-off-by: Niels de Vos <ndevos@redhat.com>
Cc: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/watchdog/imx2_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
index 693ac3f..17680aa 100644
--- a/drivers/watchdog/imx2_wdt.c
+++ b/drivers/watchdog/imx2_wdt.c
@@ -322,6 +322,7 @@ static const struct of_device_id imx2_wdt_dt_ids[] = {
 	{ .compatible = "fsl,imx21-wdt", },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, imx2_wdt_dt_ids);
 
 static struct platform_driver imx2_wdt_driver = {
 	.remove		= __exit_p(imx2_wdt_remove),
-- 
1.7.11.7

