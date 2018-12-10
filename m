From: Bhagavathi Perumal S <bperumal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v3 2/3] dt-bindings: net: ath10k: add new dt entry to identify external FEM
Date: Tue, 11 Dec 2018 00:01:30 +0530
Message-ID: <1544466691-11821-3-git-send-email-bperumal@codeaurora.org>
References: <1544466691-11821-1-git-send-email-bperumal@codeaurora.org>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1544466691-11821-1-git-send-email-bperumal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bhagavathi Perumal S <bperumal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds new dt entry ext-fem-name, it is used by ath10k driver
to select correct timing parameters and configure it in target wifi hardware.
The Front End Module(FEM) normally includes tx power amplifier(PA) and
rx low noise amplifier(LNA). The default timing parameters like tx end to
PA off timing values were fine tuned for internal FEM used in reference
design. And these timing values can not be same if ODM modifies hardware
design with different external FEM. This DT entry helps to choose correct
timing values in driver if different external FEM hardware used.

Signed-off-by: Bhagavathi Perumal S <bperumal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
index ef60f25..71530fd 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
@@ -61,8 +61,14 @@ Optional properties:
 	Value type: <phandle>
 	Definition: reference to the reserved-memory for the msa region
 		    used by the wifi firmware running in Q6.
+- ext-fem-name:
+	Usage: Optional
+	Value type: string
+	Definition: Name of external front end module used. Some valid FEM names
+		    for example: "microsemi-lx5586", "sky85703-11"
+		    and "sky85803" etc.
 
-Example (to supply the calibration data alone):
+Example (to supply PCI based wifi block details):
 
 In this example, the node is defined as child node of the PCI controller.
 
@@ -77,6 +83,7 @@ pci {
 		wifi@0,0 {
 			reg = <0 0 0 0 0>;
 			qcom,ath10k-calibration-data = [ 01 02 03 ... ];
+			ext-fem-name = "microsemi-lx5586";
 		};
 	};
 };
-- 
1.9.1
