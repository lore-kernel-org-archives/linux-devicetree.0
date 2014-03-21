From: Jean-Francois Moine <moinejf@free.fr>
Subject: [PATCH RFC v2 3/6] drm/tilcd: dts: Add the video output port
Date: Fri, 21 Mar 2014 10:31:45 +0100
Message-ID: <c4ed6b6a68b7445ed8625b07596c2e8e0879f809.1395397665.git.moinejf@free.fr>
References: <cover.1395397665.git.moinejf@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cover.1395397665.git.moinejf@free.fr>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Russell King <rmk+kernel@arm.linux.org.uk>, Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The connection between the video source and sink must follow
the media video interface.

Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
---
 Documentation/devicetree/bindings/drm/tilcdc/tilcdc.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/drm/tilcdc/tilcdc.txt b/Documentation/devicetree/bindings/drm/tilcdc/tilcdc.txt
index fff10da..d0de848 100644
--- a/Documentation/devicetree/bindings/drm/tilcdc/tilcdc.txt
+++ b/Documentation/devicetree/bindings/drm/tilcdc/tilcdc.txt
@@ -18,6 +18,12 @@ Optional properties:
  - max-pixelclock: The maximum pixel clock that can be supported
    by the lcd controller in KHz.
 
+Optional nodes:
+
+ - port: reference of the video sink as described in media/video-interfaces.
+   This reference is required when the video sink is the TDA19988 HDMI
+   transmitter.
+
 Example:
 
 	fb: fb@4830e000 {
@@ -27,3 +33,11 @@ Example:
 		interrupts = <36>;
 		ti,hwmods = "lcdc";
 	};
+
+	&fb {
+		port {
+			lcd_0: endpoint@0 {
+				remote-endpoint = <&hdmi_0>;
+			};
+		};
+	};
-- 
1.9.1
