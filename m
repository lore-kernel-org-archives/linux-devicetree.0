Return-Path: <SRS0=d+eE=TJ=renesas.com=prvs=4032988503=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 10/15] usb: renesas_usbhs: support byte addressable CFIFO
Date: Thu, 9 May 2019 15:11:37 -0500
Message-ID: <20190509201142.10543-11-chris.brandt@renesas.com>
In-Reply-To: <20190509201142.10543-1-chris.brandt@renesas.com>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris
List-ID: <devicetree@vger.kernel.org>

Some SoC have a CFIFO register that is byte addressable. This means
when the CFIFO access is set to 32-bit, you can write 8-bit values to
addresses CFIFO+0, CFIFO+1, CFIFO+2, CFIFO+3.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/usb/renesas_usbhs/common.h | 1 +
 drivers/usb/renesas_usbhs/fifo.c   | 9 +++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_usbhs/common.h
index 211ab8e741be..af4aec703ab1 100644
--- a/drivers/usb/renesas_usbhs/common.h
+++ b/drivers/usb/renesas_usbhs/common.h
@@ -345,6 +345,7 @@ struct usbhs_priv *usbhs_pdev_to_priv(struct platform_device *pdev);
  */
 #define USBHSF_RUNTIME_PWCTRL	(1 << 0)
 #define USBHSF_HAS_CNEN		(1 << 1) /* Single-ended receiver */
+#define USBHSF_CFIFO_BYTE_ADDR	(1 << 2) /* Byte addressable */
 
 #define usbhsc_flags_init(p)   ((p)->flags = 0)
 #define usbhsc_flags_set(p, b) ((p)->flags |=  (b))
diff --git a/drivers/usb/renesas_usbhs/fifo.c b/drivers/usb/renesas_usbhs/fifo.c
index 39fa2fc1b8b7..b313ee637e53 100644
--- a/drivers/usb/renesas_usbhs/fifo.c
+++ b/drivers/usb/renesas_usbhs/fifo.c
@@ -543,8 +543,13 @@ static int usbhsf_pio_try_push(struct usbhs_pkt *pkt, int *is_done)
 	}
 
 	/* the rest operation */
-	for (i = 0; i < len; i++)
-		iowrite8(buf[i], addr + (0x03 - (i & 0x03)));
+	if (usbhsc_flags_has(priv, USBHSF_CFIFO_BYTE_ADDR)) {
+		for (i = 0; i < len; i++)
+			iowrite8(buf[i], addr + (i & 0x03));
+	} else {
+		for (i = 0; i < len; i++)
+			iowrite8(buf[i], addr + (0x03 - (i & 0x03)));
+	}
 
 	/*
 	 * variable update
-- 
2.16.1
