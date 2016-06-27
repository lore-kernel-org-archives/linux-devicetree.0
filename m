From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/3] usb: renesas_usbhs: Fix a condition about a log of "transceiver found"
Date: Mon, 27 Jun 2016 21:09:17 +0900
Message-ID: <1467029359-6812-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1467029359-6812-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1467029359-6812-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: stable-owner@vger.kernel.org
To: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This driver should use IS_ERR_OR_NULL() macro for the log. Otherwize,
this driver outputs "transceiver found" even if the gprov->transceiver
has an error from usb_get_phy().

Fixes: b5a2875 ("usb: renesas_usbhs: Allow an OTG PHY driver to provide VBUS")
Cc: <stable@vger.kernel.org> # v4.3+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/mod_gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/renesas_usbhs/mod_gadget.c b/drivers/usb/renesas_usbhs/mod_gadget.c
index 50f3363..6e60297 100644
--- a/drivers/usb/renesas_usbhs/mod_gadget.c
+++ b/drivers/usb/renesas_usbhs/mod_gadget.c
@@ -1073,7 +1073,7 @@ int usbhs_mod_gadget_probe(struct usbhs_priv *priv)
 
 	gpriv->transceiver = usb_get_phy(USB_PHY_TYPE_UNDEFINED);
 	dev_info(dev, "%stransceiver found\n",
-		 gpriv->transceiver ? "" : "no ");
+		 !IS_ERR_OR_NULL(gpriv->transceiver) ? "" : "no ");
 
 	/*
 	 * CAUTION
-- 
1.9.1
