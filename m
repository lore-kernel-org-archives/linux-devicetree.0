From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 1/3] dt-bindings: display: bridge: lvds-transmitter: add
 ti,ds90c187
Date: Tue, 18 Dec 2018 23:19:18 +0000
Message-ID: <20181218231850.3572-2-peda@axentia.se>
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

This chip is compatible with "lvds-encoder".

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt | 1 =
+
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-transmit=
ter.txt b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter=
.txt
index 50220190c203..f9e7dd666f58 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
@@ -24,6 +24,7 @@ Required properties:
=20
 - compatible: Must be one or more of the following
   - "ti,ds90c185" for the TI DS90C185 FPD-Link Serializer
+  - "ti,ds90c187" for the TI DS90C187 Dual Pixel FPD-Link Serializer
   - "lvds-encoder" for a generic LVDS encoder device
=20
   When compatible with the generic version, nodes must list the
--=20
2.11.0
