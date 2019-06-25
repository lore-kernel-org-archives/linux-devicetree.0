From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH 3/4] dt-bindings: display/panel: jh057n0090: Document power supply properties
Date: Tue, 25 Jun 2019 19:05:18 +0200
Message-ID: <5ebbc0cf3fc8fcfd0300fb4d81be5acae156a4d4.1561482165.git.agx@sigxcpu.org>
References: <cover.1561482165.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1561482165.git.agx@sigxcpu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Paul E. McKenney" <paulmck@linux.ibm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Purism Kernel Team <kernel@puri.sm>
List-Id: devicetree@vger.kernel.org

Document the vcc-supply and iovcc-supply propertes of the Rocktech
jh057n0090 panel.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 .../bindings/display/panel/rocktech,jh057n00900.txt          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.txt b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.txt
index 1b5763200cf6..a372c5d84695 100644
--- a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.txt
+++ b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.txt
@@ -5,6 +5,9 @@ Required properties:
 - reg: DSI virtual channel of the peripheral
 - reset-gpios: panel reset gpio
 - backlight: phandle of the backlight device attached to the panel
+- vcc-supply: phandle of the regulator that provides the vcc supply voltage.
+- iovcc-supply: phandle of the regulator that provides the iovcc supply
+  voltage.
 
 Example:
 
@@ -14,5 +17,7 @@ Example:
 			reg = <0>;
 			backlight = <&backlight>;
 			reset-gpios = <&gpio3 13 GPIO_ACTIVE_LOW>;
+			vcc-supply = <&reg_2v8_p>;
+			iovcc-supply = <&reg_1v8_p>;
 		};
 	};
-- 
2.20.1
