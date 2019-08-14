From: Robert Chiras <robert.chiras@nxp.com>
Subject: [PATCH v2 09/15] dt-bindings: display: Add max-res property for mxsfb
Date: Wed, 14 Aug 2019 13:48:45 +0300
Message-ID: <1565779731-1300-10-git-send-email-robert.chiras@nxp.com>
References: <1565779731-1300-1-git-send-email-robert.chiras@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1565779731-1300-1-git-send-email-robert.chiras@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>, Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add new optional property 'max-res', to limit the maximum supported
resolution by the MXSFB_DRM driver.

Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
---
 Documentation/devicetree/bindings/display/mxsfb.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mxsfb.txt b/Documentation/devicetree/bindings/display/mxsfb.txt
index 472e1ea..55e22ed 100644
--- a/Documentation/devicetree/bindings/display/mxsfb.txt
+++ b/Documentation/devicetree/bindings/display/mxsfb.txt
@@ -17,6 +17,12 @@ Required properties:
 Required sub-nodes:
   - port: The connection to an encoder chip.
 
+Optional properties:
+- max-res:	an array with a maximum of two integers, representing the
+		maximum supported resolution, in the form of
+		<maxX>, <maxY>; if one of the item is <0>, the default
+		driver-defined maximum resolution for that axis is used
+
 Example:
 
 	lcdif1: display-controller@2220000 {
-- 
2.7.4
