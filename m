From: Peter Rosin <peda@axentia.se>
Subject: [PATCH v3 2/5] dt-bindings: display: bridge: lvds-transmitter:
 cleanup example
Date: Sat, 29 Dec 2018 07:07:25 +0000
Message-ID: <20181229070649.21308-3-peda@axentia.se>
References: <20181229070649.21308-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181229070649.21308-1-peda@axentia.se>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Peter Rosin <peda@axentia.se>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Drop #address-cells and #size-cells from the root node in the
example, they are unused.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Peter Rosin <peda@axentia.se>
---
 Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt | 2 =
--
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-transmit=
ter.txt b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter=
.txt
index fd39ad34c383..36ce07c8d8e6 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
@@ -38,8 +38,6 @@ Example
=20
 lvds-encoder {
 	compatible =3D "lvds-encoder";
-	#address-cells =3D <1>;
-	#size-cells =3D <0>;
=20
 	ports {
 		#address-cells =3D <1>;
--=20
2.11.0
