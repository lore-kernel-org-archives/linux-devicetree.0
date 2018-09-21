Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 5/5] usb: renesas_usbhs: add support for R-Car E3
Date: Fri, 21 Sep 2018 21:26:32 +0900
Message-Id: <1537532792-20376-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1537532792-20376-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1537532792-20376-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds support for R-Car E3. This SoC needs to release
the PLL reset by the UGCTRL register like R-Car D3. So, this patch
adds a usbhs_of_match entry for this SoC with
"USBHS_TYPE_RCAR_GEN3_WITH_PLL".

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 522cc09..a3e1290 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -560,6 +560,10 @@ static int usbhsc_drvcllbck_notify_hotplug(struct platform_device *pdev)
 		.data = (void *)USBHS_TYPE_RCAR_GEN3,
 	},
 	{
+		.compatible = "renesas,usbhs-r8a77990",
+		.data = (void *)USBHS_TYPE_RCAR_GEN3_WITH_PLL,
+	},
+	{
 		.compatible = "renesas,usbhs-r8a77995",
 		.data = (void *)USBHS_TYPE_RCAR_GEN3_WITH_PLL,
 	},
-- 
1.9.1
