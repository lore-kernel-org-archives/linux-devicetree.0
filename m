Return-Path: <SRS0=goDf=FR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:60008 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751948AbeBWNiq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 23 Feb 2018 08:38:46 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 8/9] serial: sirf: Fix out-of-bounds access through DT alias
Date: Fri, 23 Feb 2018 14:38:36 +0100
Message-Id: <1519393117-31998-9-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1519393117-31998-1-git-send-email-geert+renesas@glider.be>
References: <1519393117-31998-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Barry Song <baohua@kernel.org>, Vineet Gupta <vgupta@synopsys.com>, Jiri Slaby <jslaby@suse.com>, Michal Simek <michal.simek@xilinx.com>, linux-serial@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

The sirf_ports[] array is indexed using a value derived from the
"serialN" alias in DT, which may lead to an out-of-bounds access.

Fix this by adding a range check.

Fixes: a6ffe8966acbb66b ("serial: sirf: use dynamic method allocate uart structure")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Fix Fixes reference,
  - Use ARRAY_SIZE().
---
 drivers/tty/serial/sirfsoc_uart.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/tty/serial/sirfsoc_uart.c b/drivers/tty/serial/sirfsoc_uart.c
index 9925b00a97772a1b..38622f2a30a92e7d 100644
--- a/drivers/tty/serial/sirfsoc_uart.c
+++ b/drivers/tty/serial/sirfsoc_uart.c
@@ -1283,6 +1283,11 @@ static int sirfsoc_uart_probe(struct platform_device *pdev)
 		goto err;
 	}
 	sirfport->port.line = of_alias_get_id(np, "serial");
+	if (sirfport->port.line >= ARRAY_SIZE(sirf_ports)) {
+		dev_err(&pdev->dev, "serial%d out of range\n",
+			sirfport->port.line);
+		return -EINVAL;
+	}
 	sirf_ports[sirfport->port.line] = sirfport;
 	sirfport->port.iotype = UPIO_MEM;
 	sirfport->port.flags = UPF_BOOT_AUTOCONF;
-- 
2.7.4

