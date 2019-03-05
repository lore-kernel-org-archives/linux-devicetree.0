Return-Path: <SRS0=Swf5=RI=gateworks.com=rjones@kernel.org>
From: Robert Jones <rjones@gateworks.com>
Subject: [PATCH 1/2] dt-bindings: iio: accel: add LIS2DE12 sensor device binding
Date: Tue,  5 Mar 2019 12:32:51 -0800
Message-Id: <20190305203252.13647-2-rjones@gateworks.com>
In-Reply-To: <20190305203252.13647-1-rjones@gateworks.com>
References: <20190305203252.13647-1-rjones@gateworks.com>
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Robert Jones <rjones@gateworks.com>
List-ID: <devicetree@vger.kernel.org>

Signed-off-by: Robert Jones <rjones@gateworks.com>
---
 Documentation/devicetree/bindings/iio/st-sensors.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/st-sensors.txt b/Documentation/devicetree/bindings/iio/st-sensors.txt
index 52ee4ba..7f24b33 100644
--- a/Documentation/devicetree/bindings/iio/st-sensors.txt
+++ b/Documentation/devicetree/bindings/iio/st-sensors.txt
@@ -49,6 +49,7 @@ Accelerometers:
 - st,lis2dw12
 - st,lis3dhh
 - st,lis3de
+- st,lis2de12-accel
 
 Gyroscopes:
 - st,l3g4200d-gyro
-- 
2.9.2
