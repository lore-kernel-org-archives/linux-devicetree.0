From: Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH 1/6] dt-bindings: media: cedrus: Add H6 compatible
Date: Mon, 28 Jan 2019 21:54:59 +0100
Message-ID: <20190128205504.11225-2-jernej.skrabec@siol.net>
References: <20190128205504.11225-1-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190128205504.11225-1-jernej.skrabec@siol.net>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@bootlin.com, wens@csie.org
Cc: mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

This adds a compatible for H6. H6 VPU supports 10-bit HEVC decoding and
additional AFBC output format for HEVC.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 Documentation/devicetree/bindings/media/cedrus.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/cedrus.txt b/Documen=
tation/devicetree/bindings/media/cedrus.txt
index bce0705df953..20c82fb0c343 100644
--- a/Documentation/devicetree/bindings/media/cedrus.txt
+++ b/Documentation/devicetree/bindings/media/cedrus.txt
@@ -13,6 +13,7 @@ Required properties:
 			- "allwinner,sun8i-h3-video-engine"
 			- "allwinner,sun50i-a64-video-engine"
 			- "allwinner,sun50i-h5-video-engine"
+			- "allwinner,sun50i-h6-video-engine"
 - reg			: register base and length of VE;
 - clocks		: list of clock specifiers, corresponding to entries in
 			  the clock-names property;
--=20
2.20.1
