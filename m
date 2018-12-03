From: Bhagavathi Perumal S <bperumal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2 1/3] dt-bindings: net: ath10k: fix node name and device type in qcom ath10k example
Date: Mon,  3 Dec 2018 23:03:33 +0530
Message-ID: <1543858415-23953-2-git-send-email-bperumal@codeaurora.org>
References: <1543858415-23953-1-git-send-email-bperumal@codeaurora.org>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1543858415-23953-1-git-send-email-bperumal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bhagavathi Perumal S <bperumal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In qcom,ath10k documentation, ath10k is used as node name in the example of
pci based device. Normally, node name shoud be class of device and not the model
name, so fix it to node name "wifi". And remove the property device_type pci
since only pci bridges should have this property.

Signed-off-by: Bhagavathi Perumal S <bperumal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
index 2196d1a..ef60f25 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
@@ -74,9 +74,8 @@ pci {
 		#address-cells = <3>;
 		device_type = "pci";
 
-		ath10k@0,0 {
+		wifi@0,0 {
 			reg = <0 0 0 0 0>;
-			device_type = "pci";
 			qcom,ath10k-calibration-data = [ 01 02 03 ... ];
 		};
 	};
-- 
1.9.1
