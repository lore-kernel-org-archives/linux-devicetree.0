From: Venkat Reddy Talla <vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] dt-bindings: max77620: add documentation for MPOK property
Date: Wed, 16 Nov 2016 17:22:41 +0530
Message-ID: <1479297161-7705-2-git-send-email-vreddytalla@nvidia.com>
References: <1479297161-7705-1-git-send-email-vreddytalla@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479297161-7705-1-git-send-email-vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, svelpula-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Adding documentation for maxim,power-ok-control dts property

Signed-off-by: Venkat Reddy Talla <vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/mfd/max77620.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/max77620.txt b/Documentation/devicetree/bindings/mfd/max77620.txt
index 2ad44f7..9c16d51 100644
--- a/Documentation/devicetree/bindings/mfd/max77620.txt
+++ b/Documentation/devicetree/bindings/mfd/max77620.txt
@@ -106,6 +106,18 @@ Here supported time periods by device in microseconds are as follows:
 MAX77620 supports 40, 80, 160, 320, 640, 1280, 2560 and 5120 microseconds.
 MAX20024 supports 20, 40, 80, 160, 320, 640, 1280 and 2540 microseconds.
 
+-maxim,power-ok-control: configure map power ok bit
+			1: Enables POK(Power OK) to control nRST_IO and GPIO1
+			POK function.
+			0: Disables POK control.
+			if property missing, do not configure MPOK bit.
+			If POK mapping is enabled for GPIO1/nRST_IO then,
+			GPIO1/nRST_IO pins are HIGH only if all rails
+			that have POK control enabled are HIGH.
+			If any of the rails goes down(which are enabled for POK
+			control) then, GPIO1/nRST_IO goes LOW.
+			this property is valid for max20024 only.
+
 For DT binding details of different sub modules like GPIO, pincontrol,
 regulator, power, please refer respective device-tree binding document
 under their respective sub-system directories.
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
