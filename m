From: Jean-Francois Moine <moinejf@free.fr>
Subject: [PATCH RFC v2 1/6] drm/i2c: tda998x: Add the required port property
Date: Fri, 21 Mar 2014 10:48:43 +0100
Message-ID: <2ad6cd1afa7800826da991ae522ef54368fe8d78.1395397665.git.moinejf@free.fr>
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

According to the media video interface, the video source and sink
ports must be identified by mutual phandles.

This patch adds the 'port' property of the tda998x (sink side).

Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
---
 Documentation/devicetree/bindings/drm/i2c/tda998x.txt | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/drm/i2c/tda998x.txt b/Documentation/devicetree/bindings/drm/i2c/tda998x.txt
index e3f3d65..10c5b5e 100644
--- a/Documentation/devicetree/bindings/drm/i2c/tda998x.txt
+++ b/Documentation/devicetree/bindings/drm/i2c/tda998x.txt
@@ -17,13 +17,22 @@ Optional properties:
   - video-ports: 24 bits value which defines how the video controller
 	output is wired to the TDA998x input - default: <0x230145>
 
+Required nodes:
+  - port: reference of the video source as described in media/video-interfaces
+
 Example:
 
-	tda998x: hdmi-encoder {
+	hdmi: hdmi-encoder {
 		compatible = "nxp,tda19988";
 		reg = <0x70>;
 		interrupt-parent = <&gpio0>;
 		interrupts = <27 2>;		/* falling edge */
 		pinctrl-0 = <&pmx_camera>;
 		pinctrl-names = "default";
+
+		port {
+			hdmi_0: endpoint@0 {
+				remote-endpoint = <&lcd0_0>;
+			};
+		};
 	};
-- 
1.9.1
