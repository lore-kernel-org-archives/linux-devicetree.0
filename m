Return-Path: <SRS0=Hucj=TO=renesas.com=prvs=40371367b7=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3 10/15] usb: renesas_usbhs: support byte addressable CFIFO
Date: Tue, 14 May 2019 09:56:00 -0500
Message-ID: <20190514145605.19112-11-chris.brandt@renesas.com>
In-Reply-To: <20190514145605.19112-1-chris.brandt@renesas.com>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris
List-ID: <devicetree@vger.kernel.org>

Some SoC have a CFIFO register that is byte addressable. This means
when the CFIFO access is set to 32-bit, you can write 8-bit values to
addresses CFIFO+0, CFIFO+1, CFIFO+2, CFIFO+3.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v2:
 * options ahve moved from flags to param
---
 drivers/usb/renesas_usbhs/fifo.c  | 9 +++++++--
 include/linux/usb/renesas_usbhs.h | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/fifo.c b/drivers/usb/renesas_usbhs/fifo.c
index 39fa2fc1b8b7..452b456ac24e 100644
--- a/drivers/usb/renesas_usbhs/fifo.c
+++ b/drivers/usb/renesas_usbhs/fifo.c
@@ -543,8 +543,13 @@ static int usbhsf_pio_try_push(struct usbhs_pkt *pkt, int *is_done)
 	}
 
 	/* the rest operation */
-	for (i = 0; i < len; i++)
-		iowrite8(buf[i], addr + (0x03 - (i & 0x03)));
+	if (usbhs_get_dparam(priv, cfifo_byte_addr)) {
+		for (i = 0; i < len; i++)
+			iowrite8(buf[i], addr + (i & 0x03));
+	} else {
+		for (i = 0; i < len; i++)
+			iowrite8(buf[i], addr + (0x03 - (i & 0x03)));
+	}
 
 	/*
 	 * variable update
diff --git a/include/linux/usb/renesas_usbhs.h b/include/linux/usb/renesas_usbhs.h
index 9097a38fcda8..87043fd21d54 100644
--- a/include/linux/usb/renesas_usbhs.h
+++ b/include/linux/usb/renesas_usbhs.h
@@ -191,6 +191,7 @@ struct renesas_usbhs_driver_param {
 	u32 has_usb_dmac:1; /* for USB-DMAC */
 	u32 runtime_pwctrl:1;
 	u32 has_cnen:1;
+	u32 cfifo_byte_addr:1; /* CFIFO is byte addressable */
 #define USBHS_USB_DMAC_XFER_SIZE	32	/* hardcode the xfer size */
 };
 
-- 
2.16.1
