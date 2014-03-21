From: Jean-Francois Moine <moinejf@free.fr>
Subject: [PATCH RFC v2 5/6] drm/tilcd: dts: Remove unused slave description
Date: Fri, 21 Mar 2014 10:31:45 +0100
Message-ID: <4bde6edb48bad767730b7f909cd61c1ec5bd5ff0.1395397665.git.moinejf@free.fr>
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

The tda998x being converted to a normal DRM encoder/connector,
there is no slave notion anymore.

Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
---
 Documentation/devicetree/bindings/drm/tilcdc/slave.txt | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/drm/tilcdc/slave.txt

diff --git a/Documentation/devicetree/bindings/drm/tilcdc/slave.txt b/Documentation/devicetree/bindings/drm/tilcdc/slave.txt
deleted file mode 100644
index 3d2c524..0000000
--- a/Documentation/devicetree/bindings/drm/tilcdc/slave.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-Device-Tree bindings for tilcdc DRM encoder slave output driver
-
-Required properties:
- - compatible: value should be "ti,tilcdc,slave".
- - i2c: the phandle for the i2c device the encoder slave is connected to
-
-Recommended properties:
- - pinctrl-names, pinctrl-0: the pincontrol settings to configure
-   muxing properly for pins that connect to TFP410 device
-
-Example:
-
-	hdmi {
-		compatible = "ti,tilcdc,slave";
-		i2c = <&i2c0>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&nxp_hdmi_bonelt_pins>;
-	};
-- 
1.9.1
