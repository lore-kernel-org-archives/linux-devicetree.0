From: Manu Gautam <mgautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v5 08/17] dt-bindings: phy-qcom-qusb2: Update binding for QUSB2 V2 version
Date: Tue, 16 Jan 2018 16:27:03 +0530
Message-ID: <1516100232-18623-9-git-send-email-mgautam@codeaurora.org>
References: <1516100232-18623-1-git-send-email-mgautam@codeaurora.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1516100232-18623-1-git-send-email-mgautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Manu Gautam <mgautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Update generic compatible string for QUSB2 V2 PHY. This will allow
all targets using QUSB2 V2 use same string.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Manu Gautam <mgautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Reviewed-by: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
index aa0fcb0..42c9742 100644
--- a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
+++ b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
@@ -4,7 +4,10 @@ Qualcomm QUSB2 phy controller
 QUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
 
 Required properties:
- - compatible: compatible list, contains "qcom,msm8996-qusb2-phy".
+ - compatible: compatible list, contains
+	       "qcom,msm8996-qusb2-phy" for 14nm PHY on msm8996,
+	       "qcom,qusb2-v2-phy" for QUSB2 V2 PHY.
+
  - reg: offset and length of the PHY register set.
  - #phy-cells: must be 0.
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
