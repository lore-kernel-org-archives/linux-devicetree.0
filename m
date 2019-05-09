Return-Path: <SRS0=d+eE=TJ=renesas.com=prvs=4032988503=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 09/15] usb: renesas_usbhs: add support for CNEN bit
Date: Thu, 9 May 2019 15:11:36 -0500
Message-ID: <20190509201142.10543-10-chris.brandt@renesas.com>
In-Reply-To: <20190509201142.10543-1-chris.brandt@renesas.com>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris
List-ID: <devicetree@vger.kernel.org>

For some SoC, CNEN must be set for USB Device mode operation.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 6 ++++++
 drivers/usb/renesas_usbhs/common.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index efb26ffd9809..820636fc4dc9 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -116,6 +116,12 @@ void usbhs_sys_function_ctrl(struct usbhs_priv *priv, int enable)
 	u16 mask = DCFM | DRPD | DPRPU | HSE | USBE;
 	u16 val  = HSE | USBE;
 
+	/* CNEN bit is required for function operation */
+	if (usbhsc_flags_has(priv, USBHSF_HAS_CNEN)) {
+		mask |= CNEN;
+		val  |= CNEN;
+	}
+
 	/*
 	 * if enable
 	 *
diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_usbhs/common.h
index 1ca94b8f5508..211ab8e741be 100644
--- a/drivers/usb/renesas_usbhs/common.h
+++ b/drivers/usb/renesas_usbhs/common.h
@@ -104,6 +104,7 @@ struct usbhs_priv;
 
 /* SYSCFG */
 #define SCKE	(1 << 10)	/* USB Module Clock Enable */
+#define CNEN	(1 << 8)	/* Single-ended receiver operation Enable */
 #define HSE	(1 << 7)	/* High-Speed Operation Enable */
 #define DCFM	(1 << 6)	/* Controller Function Select */
 #define DRPD	(1 << 5)	/* D+ Line/D- Line Resistance Control */
@@ -343,6 +344,7 @@ struct usbhs_priv *usbhs_pdev_to_priv(struct platform_device *pdev);
  * flags
  */
 #define USBHSF_RUNTIME_PWCTRL	(1 << 0)
+#define USBHSF_HAS_CNEN		(1 << 1) /* Single-ended receiver */
 
 #define usbhsc_flags_init(p)   ((p)->flags = 0)
 #define usbhsc_flags_set(p, b) ((p)->flags |=  (b))
-- 
2.16.1
