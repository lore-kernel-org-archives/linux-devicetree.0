From: Robert Chiras <robert.chiras@nxp.com>
Subject: [PATCH v4 09/14] dt-bindings: display: Add max-memory-bandwidth property for mxsfb
Date: Thu, 29 Aug 2019 14:30:10 +0300
Message-ID: <1567078215-31601-10-git-send-email-robert.chiras@nxp.com>
References: <1567078215-31601-1-git-send-email-robert.chiras@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567078215-31601-1-git-send-email-robert.chiras@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>, Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add new optional property 'max-memory-bandwidth', to limit the maximum
bandwidth used by the MXSFB_DRM driver.

Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
Tested-by: Guido Günther <agx@sigxcpu.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/mxsfb.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mxsfb.txt b/Documentation/devicetree/bindings/display/mxsfb.txt
index 472e1ea..c8dca50 100644
--- a/Documentation/devicetree/bindings/display/mxsfb.txt
+++ b/Documentation/devicetree/bindings/display/mxsfb.txt
@@ -14,6 +14,11 @@ Required properties:
     - "pix" for the LCDIF block clock
     - (MX6SX-only) "axi", "disp_axi" for the bus interface clock
 
+Optional properties:
+- max-memory-bandwidth: maximum bandwidth in bytes per second that the
+	controller can handle; if not present, the memory
+	interface is fast enough to handle all possible video modes
+
 Required sub-nodes:
   - port: The connection to an encoder chip.
 
-- 
2.7.4
