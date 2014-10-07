From: Seraphin Bonnaffe <seraphin.bonnaffe-qxv4g6HH51o@public.gmane.org>
Subject: [RFC PATCH 1/2] mfd: syscon: Document new DT binding "holes"
Date: Tue, 7 Oct 2014 15:22:27 +0200
Message-ID: <1412688148-20835-2-git-send-email-seraphin.bonnaffe@st.com>
References: <54244655.1090801@st.com>
 <1412688148-20835-1-git-send-email-seraphin.bonnaffe@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412688148-20835-1-git-send-email-seraphin.bonnaffe-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: b29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org
Cc: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, seraphin.bonnaffe-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds DT bindings to declare holes in syscon register maps.

Signed-off-by: Seraphin Bonnaffe <seraphin.bonnaffe-qxv4g6HH51o@public.gmane.org>
---
 Documentation/devicetree/bindings/mfd/syscon.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.txt b/Documentation/devicetree/bindings/mfd/syscon.txt
index fe8150b..80ab9ca 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.txt
+++ b/Documentation/devicetree/bindings/mfd/syscon.txt
@@ -13,8 +13,13 @@ Required properties:
 - compatible: Should contain "syscon".
 - reg: the register region can be accessed from syscon
 
+Optional properties:
+- holes: Register regions that cannot be accessed within reg range.
+	 Each hole is described with its offset address, followed by its size.
+
 Examples:
 gpr: iomuxc-gpr@020e0000 {
 	compatible = "fsl,imx6q-iomuxc-gpr", "syscon";
 	reg = <0x020e0000 0x38>;
+	holes = <0x000c 0x8 0x020 0x4>;
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
