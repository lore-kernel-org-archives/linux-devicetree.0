Return-Path: <SRS0=qowN=HZ=googlemail.com=martin.blumenstingl@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 2/6] dt-bindings: arm: amlogic: add support for the Tronsmart MXIII Plus
Date: Sun,  6 May 2018 11:21:15 +0200
Message-Id: <20180506092119.467-3-martin.blumenstingl@googlemail.com>
In-Reply-To: <20180506092119.467-1-martin.blumenstingl@googlemail.com>
References: <20180506092119.467-1-martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, khilman@baylibre.com, carlo@caione.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: balbes-150@yandex.ru, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-ID: <devicetree@vger.kernel.org>

Add the binding documentation for the Tronsmart MXIII Plus which is an
Android TV box using the Amlogic S812 (Meson8m2) SoC.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
index 6c6642c69de3..69880560c0f0 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -58,6 +58,8 @@ Board compatible values (alphabetically, grouped by SoC):
   - "hardkernel,odroid-c1" (Meson8b)
   - "tronfy,mxq" (Meson8b)
 
+  - "tronsmart,mxiii-plus" (Meson8m2)
+
   - "amlogic,p200" (Meson gxbb)
   - "amlogic,p201" (Meson gxbb)
   - "friendlyarm,nanopi-k2" (Meson gxbb)
-- 
2.17.0
