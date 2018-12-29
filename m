From: Peter Rosin <peda@axentia.se>
Subject: [PATCH v3 3/5] dt-bindings: display: bridge: thc63lvdm83d: use
 standard powerdown-gpios
Date: Sat, 29 Dec 2018 07:07:31 +0000
Message-ID: <20181229070649.21308-4-peda@axentia.se>
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

The name powerdown-gpios is the standard property name for the
functionality covered by the previous pwdn-gpios name. This rename
should be safe to do since the linux driver supporting the binding
(lvds-encoder.c) never implemented the property, and no dts file
names it. At least not upstream.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 Documentation/devicetree/bindings/display/bridge/thine,thc63lvdm83d.txt | =
2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/thine,thc63lv=
dm83d.txt b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd=
m83d.txt
index 527e236e9a2a..fee3c88e1a17 100644
--- a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvdm83d.t=
xt
+++ b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvdm83d.t=
xt
@@ -10,7 +10,7 @@ Required properties:
=20
 Optional properties:
=20
-- pwdn-gpios: Power down control GPIO
+- powerdown-gpios: Power down control GPIO (the /PWDN pin, active low).
=20
 Required nodes:
=20
--=20
2.11.0
