From: Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: [PATCH 1/6] serial: sh-sci: Reveal ptrval in dev_dbg
Date: Sat,  4 May 2019 02:42:53 +0200
Message-ID: <20190504004258.23574-2-erosca@de.adit-jv.com>
References: <20190504004258.23574-1-erosca@de.adit-jv.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190504004258.23574-1-erosca@de.adit-jv.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Chris Brandt <chris.brandt@renesas.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "George G . Davis" <george_davis@mentor.com>, Andy Lowe <andy_lowe@mentor.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eugeniu Rosca <erosca@de.adit-jv.com>, Eugeniu Rosca <roscaeugeniu@gmail.com>
List-Id: devicetree@vger.kernel.org

Starting with v4.15-rc2 commit ad67b74d2469d9 ("printk: hash addresses
printed with %p"), enabling debug prints in sh-sci.c would generate
output like below confusing the users who try to sneak into the
internals of the driver:

sh-sci e6e88000.serial: sci_request_dma: TX: got channel (____ptrval____)
sh-sci e6e88000.serial: sci_request_dma: mapped 4096@(____ptrval____) to 0x00000006798bf000
sh-sci e6e88000.serial: sci_request_dma: RX: got channel (____ptrval____)
sh-sci e6e88000.serial: sci_dma_tx_work_fn: (____ptrval____): 0...2, cookie 2

There are two possible fixes for that:
 - get rid of '%p' prints if they don't reveal any useful information
 - s/%p/%px/, since it is unlikely we have any concerns leaking the
   pointer values when running a debug/non-production kernel

Go second route to preserve original debug output and minimize the diff.

Fixes: ad67b74d2469d9 ("printk: hash addresses printed with %p")
Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 drivers/tty/serial/sh-sci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 3cd139752d3f..82660f8e6d86 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1434,7 +1434,7 @@ static void sci_dma_tx_work_fn(struct work_struct *work)
 		goto switch_to_pio;
 	}
 
-	dev_dbg(port->dev, "%s: %p: %d...%d, cookie %d\n",
+	dev_dbg(port->dev, "%s: %px: %d...%d, cookie %d\n",
 		__func__, xmit->buf, xmit->tail, xmit->head, s->cookie_tx);
 
 	dma_async_issue_pending(chan);
@@ -1570,7 +1570,7 @@ static void sci_request_dma(struct uart_port *port)
 		return;
 
 	chan = sci_request_dma_chan(port, DMA_MEM_TO_DEV);
-	dev_dbg(port->dev, "%s: TX: got channel %p\n", __func__, chan);
+	dev_dbg(port->dev, "%s: TX: got channel %px\n", __func__, chan);
 	if (chan) {
 		/* UART circular tx buffer is an aligned page. */
 		s->tx_dma_addr = dma_map_single(chan->device->dev,
@@ -1581,7 +1581,7 @@ static void sci_request_dma(struct uart_port *port)
 			dev_warn(port->dev, "Failed mapping Tx DMA descriptor\n");
 			dma_release_channel(chan);
 		} else {
-			dev_dbg(port->dev, "%s: mapped %lu@%p to %pad\n",
+			dev_dbg(port->dev, "%s: mapped %lu@%px to %pad\n",
 				__func__, UART_XMIT_SIZE,
 				port->state->xmit.buf, &s->tx_dma_addr);
 
@@ -1591,7 +1591,7 @@ static void sci_request_dma(struct uart_port *port)
 	}
 
 	chan = sci_request_dma_chan(port, DMA_DEV_TO_MEM);
-	dev_dbg(port->dev, "%s: RX: got channel %p\n", __func__, chan);
+	dev_dbg(port->dev, "%s: RX: got channel %px\n", __func__, chan);
 	if (chan) {
 		unsigned int i;
 		dma_addr_t dma;
-- 
2.21.0
