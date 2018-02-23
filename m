Return-Path: <SRS0=goDf=FR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:45412 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751699AbeBWNin (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 23 Feb 2018 08:38:43 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/9] serial: fsl_lpuart: Fix out-of-bounds access through DT alias
Date: Fri, 23 Feb 2018 14:38:30 +0100
Message-Id: <1519393117-31998-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1519393117-31998-1-git-send-email-geert+renesas@glider.be>
References: <1519393117-31998-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Barry Song <baohua@kernel.org>, Vineet Gupta <vgupta@synopsys.com>, Jiri Slaby <jslaby@suse.com>, Michal Simek <michal.simek@xilinx.com>, linux-serial@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

The lpuart_ports[] array is indexed using a value derived from the
"serialN" alias in DT, which may lead to an out-of-bounds access.

Fix this by adding a range check.

Fixes: c9e2e946fb0ba5d2 ("tty: serial: add Freescale lpuart driver support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Fix Fixes reference,
  - Use ARRAY_SIZE().
---
 drivers/tty/serial/fsl_lpuart.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpuart.c
index 8cf112f2efc30707..51e47a63d61accef 100644
--- a/drivers/tty/serial/fsl_lpuart.c
+++ b/drivers/tty/serial/fsl_lpuart.c
@@ -2145,6 +2145,10 @@ static int lpuart_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "failed to get alias id, errno %d\n", ret);
 		return ret;
 	}
+	if (ret >= ARRAY_SIZE(lpuart_ports)) {
+		dev_err(&pdev->dev, "serial%d out of range\n", ret);
+		return -EINVAL;
+	}
 	sport->port.line = ret;
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	sport->port.membase = devm_ioremap_resource(&pdev->dev, res);
-- 
2.7.4

