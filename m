Return-Path: <SRS0=goDf=FR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:35368 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751654AbeBWNin (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 23 Feb 2018 08:38:43 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 5/9] serial: pxa: Fix out-of-bounds access through serial port index
Date: Fri, 23 Feb 2018 14:38:33 +0100
Message-Id: <1519393117-31998-6-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1519393117-31998-1-git-send-email-geert+renesas@glider.be>
References: <1519393117-31998-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Barry Song <baohua@kernel.org>, Vineet Gupta <vgupta@synopsys.com>, Jiri Slaby <jslaby@suse.com>, Michal Simek <michal.simek@xilinx.com>, linux-serial@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

The serial_pxa_ports[] array is indexed using a value derived from the
"serialN" alias in DT, or from platform data, which may lead to an
out-of-bounds access.

Fix this by adding a range check.

Fixes: 699c20f3e6310aa2 ("serial: pxa: add OF support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Fix Fixes reference,
  - Fix off-by-one error (use ">="),
  - Update patch description for platform data.
---
 drivers/tty/serial/pxa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/tty/serial/pxa.c b/drivers/tty/serial/pxa.c
index baf552944d5686e8..eda3c7710d6a745f 100644
--- a/drivers/tty/serial/pxa.c
+++ b/drivers/tty/serial/pxa.c
@@ -885,6 +885,10 @@ static int serial_pxa_probe(struct platform_device *dev)
 		sport->port.line = dev->id;
 	else if (ret < 0)
 		goto err_clk;
+	if (sport->port.line >= ARRAY_SIZE(serial_pxa_ports)) {
+		dev_err(&dev->dev, "serial%d out of range\n", sport->port.line);
+		return -EINVAL;
+	}
 	snprintf(sport->name, PXA_NAME_LEN - 1, "UART%d", sport->port.line + 1);
 
 	sport->port.membase = ioremap(mmres->start, resource_size(mmres));
-- 
2.7.4

