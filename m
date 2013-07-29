Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:47080 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752002Ab3G2HiL (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 29 Jul 2013 03:38:11 -0400
Received: by mail-wg0-f44.google.com with SMTP id l18so4486745wgh.11
        for <devicetree@vger.kernel.org>; Mon, 29 Jul 2013 00:38:09 -0700 (PDT)
From: Niels de Vos <ndevos@redhat.com>
Subject: [PATCH] spi-imx: expose module alias for loading from device-tree
Date: Mon, 29 Jul 2013 09:38:05 +0200
Message-Id: <1375083485-14785-1-git-send-email-ndevos@redhat.com>
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Niels de Vos <ndevos@redhat.com>, Shawn Guo <shawn.guo@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Enable auto loading by udev when spi-imx is compiled as a module.

Signed-off-by: Niels de Vos <ndevos@redhat.com>
Cc: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/spi/spi-imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index 7db4f43..ebfd20e 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -619,6 +619,7 @@ static const struct of_device_id spi_imx_dt_ids[] = {
 	{ .compatible = "fsl,imx51-ecspi", .data = &imx51_ecspi_devtype_data, },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, spi_imx_dt_ids);
 
 static void spi_imx_chipselect(struct spi_device *spi, int is_active)
 {
-- 
1.7.11.7

