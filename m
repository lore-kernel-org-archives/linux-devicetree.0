Return-Path: <soeren.brinkmann@gmail.com>
Sender: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soeren.brinkmann@gmail.com>
From: Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: [PATCH 4/7] tty: xuartps: Don't write IRQ disable register to enable interrupts
Date: Mon, 10 Mar 2014 14:21:15 -0700
Message-Id: <1394486478-31037-5-git-send-email-soren.brinkmann@xilinx.com>
In-Reply-To: <1394486478-31037-1-git-send-email-soren.brinkmann@xilinx.com>
References: <1394486478-31037-1-git-send-email-soren.brinkmann@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Russell King <linux@arm.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.cz>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Cc: Michal Simek <michal.simek@xilinx.com>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Soren Brinkmann <soren.brinkmann@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

A comment states, that, according to the data sheet, to enable
interrupts the disable register should be written, but the enable
register could be left untouched. And it suspsects a HW bug requiring
to write both.
Reviewing the data sheet, these statements seem wrong. Just as one would
expect. Writing to the enable/disable register enables/disables
interrupts.
Hence the misleading comment and needless write to the disable register
are removed from the enable sequence.

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
---
I added a few lines to comment the change and altered the summary line.
In case this causes issues it should show up a little easier as a
candidate to revert.

	Sören
---
 drivers/tty/serial/xilinx_uartps.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/tty/serial/xilinx_uartps.c b/drivers/tty/serial/xilinx_uartps.c
index a4bd6242e72d..a39c2d290902 100644
--- a/drivers/tty/serial/xilinx_uartps.c
+++ b/drivers/tty/serial/xilinx_uartps.c
@@ -1082,11 +1082,7 @@ static void xuartps_console_write(struct console *co, const char *s,
 
 	xuartps_writel(ctrl, XUARTPS_CR_OFFSET);
 
-	/* restore interrupt state, it seems like there may be a h/w bug
-	 * in that the interrupt enable register should not need to be
-	 * written based on the data sheet
-	 */
-	xuartps_writel(~imr, XUARTPS_IDR_OFFSET);
+	/* restore interrupt state */
 	xuartps_writel(imr, XUARTPS_IER_OFFSET);
 
 	if (locked)
-- 
1.9.0.1.g4196000
