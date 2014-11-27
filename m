From: Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Subject: [PATCH v4 1/2] dt: bindings: add ath10k wireless device
Date: Thu, 27 Nov 2014 14:08:56 +0200
Message-ID: <20141127120856.17546.32014.stgit@potku.adurom.net>
References: <20141127120727.17546.61202.stgit@potku.adurom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141127120727.17546.61202.stgit-5n+v4hRq/7bEFBQscRVz1g@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, toshik-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Document how calibration data can be provided to ath10k via Device Tree.

Signed-off-by: Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
---
 .../bindings/net/wireless/qcom,ath10k.txt          |   30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
new file mode 100644
index 000000000000..edefc26c6204
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
@@ -0,0 +1,30 @@
+* Qualcomm Atheros ath10k wireless devices
+
+For ath10k devices the calibration data can be provided through Device
+Tree. The node is a child node of the PCI controller.
+
+Required properties:
+-compatible : Should be "qcom,ath10k"
+
+Optional properties:
+- qcom,ath10k-calibration-data : calibration data as an array, the
+				 length can vary between hw versions
+
+
+Example:
+
+pci {
+	pcie@0 {
+		reg = <0 0 0 0 0>;
+		#interrupt-cells = <1>;
+		#size-cells = <2>;
+		#address-cells = <3>;
+		device_type = "pci";
+
+		ath10k@0,0 {
+			reg = <0 0 0 0 0>;
+			device_type = "pci";
+			qcom,ath10k-calibration-data = [ 01 02 03 ... ];
+		};
+	};
+};

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
