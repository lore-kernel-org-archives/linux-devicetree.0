From: Sven Eckelmann <sven.eckelmann-lv6y7wLVQPlWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 1/2] dt: bindings: add new dt entry for ath10k calibration variant
Date: Fri,  8 Dec 2017 11:37:41 +0100
Message-ID: <20171208103742.3181-2-sven.eckelmann@openmesh.com>
References: <20171208103742.3181-1-sven.eckelmann@openmesh.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171208103742.3181-1-sven.eckelmann-lv6y7wLVQPlWk0Htik3J/w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ext.waldemar.rymarkiewicz-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org, kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Sven Eckelmann <sven.eckelmann-lv6y7wLVQPlWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The bus + bmi-chip-id + bmi-board-id is not enough to identify the correct
board data file on QCA4019 based devices. Multiple different boards share
the same values. Only the original reference designs can currently be
identified and loaded from the board-2.bin. But these will not result in
the correct calibration data when combined with the pre-calibration data
from the device.

An additional "variant" information has to be provided (via SMBIOS or DT)
to select the correct board data for a design which was modified by an ODM.

Signed-off-by: Sven Eckelmann <sven.eckelmann-lv6y7wLVQPlWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
index 74d7f0af209c..3d2a031217da 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
@@ -41,6 +41,9 @@ Optional properties:
 - qcom,msi_addr: MSI interrupt address.
 - qcom,msi_base: Base value to add before writing MSI data into
 		MSI address register.
+- qcom,ath10k-calibration-variant: string to search for in the board-2.bin
+				   variant list with the same bus and device
+				   specific ids
 - qcom,ath10k-calibration-data : calibration data + board specific data
 				 as an array, the length can vary between
 				 hw versions.
-- 
2.11.0
