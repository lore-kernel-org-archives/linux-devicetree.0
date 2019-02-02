Return-Path: <>
From: Martin Kelly <martin@martingkelly.com>
Subject: [PATCH v4 4/6] dt-bindings: document open-drain property
Date: Sat,  2 Feb 2019 13:55:59 -0800
Message-Id: <20190202215601.20275-5-martin@martingkelly.com>
In-Reply-To: <20190202215601.20275-1-martin@martingkelly.com>
References: <20190202215601.20275-1-martin@martingkelly.com>
To: linux-iio@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Daniel Baluta <daniel.baluta@gmail.com>, devicetree@vger.kernel.org, Martin Kelly <martin@martingkelly.com>
List-ID: <devicetree@vger.kernel.org>

From: Martin Kelly <martin@martingkelly.com>

We have added an optional boolean property for configuring a BMI160
interrupt pin as open-drain, as opposed to the default push-pull, so
document this.

Signed-off-by: Martin Kelly <martin@martingkelly.com>
---
 Documentation/devicetree/bindings/iio/imu/bmi160.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/imu/bmi160.txt b/Documentation/devicetree/bindings/iio/imu/bmi160.txt
index 1aec19997fb5..900c169de00f 100644
--- a/Documentation/devicetree/bindings/iio/imu/bmi160.txt
+++ b/Documentation/devicetree/bindings/iio/imu/bmi160.txt
@@ -12,6 +12,8 @@ Optional properties:
  - interrupts : interrupt mapping for IRQ
  - interrupt-names : set to "INT1" if INT1 pin should be used as interrupt
    input, set to "INT2" if INT2 pin should be used instead
+ - drive-open-drain : set if the specified interrupt pin should be configured as
+   open drain. If not set, defaults to push-pull.
 
 Examples:
 
-- 
2.11.0
