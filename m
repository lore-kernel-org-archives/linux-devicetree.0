From: Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH 1/3] dt-bindings: Add vendor prefix for sensortek
Date: Wed,  3 Jul 2019 20:05:57 +0200
Message-ID: <20190703180604.9840-1-luca@z3ntu.xyz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-iio@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Luca Weiss <luca@z3ntu.xyz>, Maxime Ripard <maxime.ripard@bootlin.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Vivek Unune <npcomplete13@gmail.com>, Hannes Schmelzer <hannes.schmelzer@br-automation.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>, Martijn Braam <martijn@brixit.nl>, devicetree@vger.kernel.or
List-Id: devicetree@vger.kernel.org

Sensortek Technology Corp. produces Proximity Sensors with ALS and
Accelerometers.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
This patch series depends on "iio: light: stk3310: Add support for
stk3335", that's curerntly in linux-next.

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 342bb23e0a73..d197c9609ea7 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -813,6 +813,8 @@ patternProperties:
     description: Semtech Corporation
   "^sensirion,.*":
     description: Sensirion AG
+  "^sensortek,.*":
+    description: Sensortek Technology Corporation
   "^sff,.*":
     description: Small Form Factor Committee
   "^sgd,.*":
-- 
2.22.0
