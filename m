From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 2/3] dt-bindings: display: bridge: lvds-transmitter: add
 pwdn-gpios
Date: Tue, 18 Dec 2018 23:19:28 +0000
Message-ID: <20181218231850.3572-3-peda@axentia.se>
References: <20181218231850.3572-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181218231850.3572-1-peda@axentia.se>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Peter Rosin <peda@axentia.se>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add optional property to specify a power-down GPIO.
The pwdn-gpios name is already in use by the thine,thc63lvdm83d
binding, so go with that.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt | 3 =
+++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-transmit=
ter.txt b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter=
.txt
index f9e7dd666f58..47941d39f92f 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
@@ -31,6 +31,9 @@ Required properties:
   device-specific version corresponding to the device first
   followed by the generic version.
=20
+Optional properties:
+- pwdn-gpios: Power-down control GPIO
+
 Required nodes:
=20
 This device has two video ports. Their connections are modeled using the O=
F
--=20
2.11.0
