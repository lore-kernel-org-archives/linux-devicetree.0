From: Peter Rosin <peda@axentia.se>
Subject: [PATCH v4 2/5] dt-bindings: display: bridge: lvds-transmitter:
 cleanup example
Date: Fri, 11 Jan 2019 15:19:00 +0000
Message-ID: <20190111151843.11114-3-peda@axentia.se>
References: <20190111151843.11114-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190111151843.11114-1-peda@axentia.se>
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
index bc6960741cb5..60091db5dfa5 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
@@ -42,8 +42,6 @@ Example
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
