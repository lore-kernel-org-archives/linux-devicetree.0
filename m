From: <c_traja-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org>
Subject: [PATCHv2 3/4] dt: bindings: add new dt entry for BTCOEX feature in qcom,ath10k.txt
Date: Thu, 17 Nov 2016 17:14:23 +0530
Message-ID: <1479383064-25718-4-git-send-email-c_traja@qti.qualcomm.com>
References: <1479383064-25718-1-git-send-email-c_traja@qti.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479383064-25718-1-git-send-email-c_traja-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tamizhchelvam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Tamizh chelvam <tamizhchelvam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

There two things done in this patch.

1) 'btcoex_support' flag for BTCOEX feature support by the hardware.
2) 'wlan_btcoex_gpio' is used to fill wlan priority pin number for
   BTCOEX priority feature support.

Signed-off-by: Tamizh chelvam <tamizhchelvam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 .../bindings/net/wireless/qcom,ath10k.txt          |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
index 74d7f0a..08150e2d 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
@@ -46,6 +46,10 @@ Optional properties:
 				 hw versions.
 - qcom,ath10k-pre-calibration-data : pre calibration data as an array,
 				     the length can vary between hw versions.
+- btcoex_support  : should contain eithr "0" or "1" to indicate btcoex
+		    support by the hardware.
+- btcoex_gpio_pin :  btcoex gpio pin number for the device which
+		     supports BTCOEX.
 
 Example (to supply the calibration data alone):
 
-- 
1.7.9.5
