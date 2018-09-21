Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 3/5] usb: renesas_usbhs: rcar3: Use OTG mode for R-Car D3
Date: Fri, 21 Sep 2018 21:26:30 +0900
Message-Id: <1537532792-20376-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1537532792-20376-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1537532792-20376-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Since R-Car D3 can use OTG mode, this patch changes the UGCTRL2
value to UGCTRL2_USB0SEL_OTG and UGCTRL2_VBUSSEL like other R-Car
Gen3 SoCs.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/rcar3.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/renesas_usbhs/rcar3.c b/drivers/usb/renesas_usbhs/rcar3.c
index 50e5fb5..aa38204 100644
--- a/drivers/usb/renesas_usbhs/rcar3.c
+++ b/drivers/usb/renesas_usbhs/rcar3.c
@@ -77,7 +77,8 @@ static int usbhs_rcar3_power_and_pll_ctrl(struct platform_device *pdev,
 
 	if (enable) {
 		usbhs_write32(priv, UGCTRL, 0);	/* release PLLRESET */
-		usbhs_rcar3_set_ugctrl2(priv, UGCTRL2_USB0SEL_HSUSB);
+		usbhs_rcar3_set_ugctrl2(priv,
+					UGCTRL2_USB0SEL_OTG | UGCTRL2_VBUSSEL);
 
 		usbhs_bset(priv, LPSTS, LPSTS_SUSPM, LPSTS_SUSPM);
 		do {
-- 
1.9.1
