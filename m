Return-Path: <>
From: Martin Kelly <martin@martingkelly.com>
Subject: [PATCH 2/2] dt-bindings: iio: magn: add LSM9DS1 bindings
Date: Tue, 23 Oct 2018 18:39:48 -0700
Message-Id: <20181024013948.16326-2-martin@martingkelly.com>
In-Reply-To: <20181024013948.16326-1-martin@martingkelly.com>
References: <20181024013948.16326-1-martin@martingkelly.com>
To: linux-iio@vger.kernel.org, devicetree@vger.kernel.org
Cc: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Denis Ciocca <denis.ciocca@st.com>, Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Martin Kelly <martin@martingkelly.com>
List-ID: <devicetree@vger.kernel.org>

From: Martin Kelly <martin@martingkelly.com>

Add DT binding documentation for the LSM9DS1 magnetometer driver.

Signed-off-by: Martin Kelly <martin@martingkelly.com>
---
 Documentation/devicetree/bindings/iio/st-sensors.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/st-sensors.txt b/Documentation/devicetree/bindings/iio/st-sensors.txt
index 6f626f73417e..284e86dcbd69 100644
--- a/Documentation/devicetree/bindings/iio/st-sensors.txt
+++ b/Documentation/devicetree/bindings/iio/st-sensors.txt
@@ -67,6 +67,7 @@ Magnetometers:
 - st,lsm303dlm-magn
 - st,lis3mdl-magn
 - st,lis2mdl
+- st,lsm9ds1
 
 Pressure sensors:
 - st,lps001wp-press
-- 
2.11.0
