From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 3/4] usb: renesas_usbhs: fix the sequence in xfer_work()
Date: Mon, 9 Feb 2015 17:16:13 +0900
Message-ID: <1423469774-6532-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1423469774-6532-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1423469774-6532-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-sh-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, balbi@ti.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: linux-usb@vger.kernel.org, linux-sh@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch fixes the setup sequence in xfer_work(). Otherwise,
sometimes a usb transaction will get stuck.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/fifo.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/fifo.c b/drivers/usb/renesas_usbhs/fifo.c
index 9fae14a..3b77a1b 100644
--- a/drivers/usb/renesas_usbhs/fifo.c
+++ b/drivers/usb/renesas_usbhs/fifo.c
@@ -822,10 +822,10 @@ static void xfer_work(struct work_struct *work)
 		fifo->name, usbhs_pipe_number(pipe), pkt->length, pkt->zero);
 
 	usbhs_pipe_running(pipe, 1);
-	usbhs_pipe_set_trans_count_if_bulk(pipe, pkt->trans);
-	usbhs_pipe_enable(pipe);
 	usbhsf_dma_start(pipe, fifo);
+	usbhs_pipe_set_trans_count_if_bulk(pipe, pkt->trans);
 	dma_async_issue_pending(chan);
+	usbhs_pipe_enable(pipe);
 }
 
 /*
-- 
1.7.9.5

