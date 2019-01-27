From: Robert Eshleman <bobbyeshleman@gmail.com>
Subject: [PATCH v3 2/2] Add device tree binding documentation for MAX44009
Date: Sun, 27 Jan 2019 09:09:14 -0800
Message-ID: <ab7652d06474f951bf764fdc087035554772d147.1548580142.git.bobbyeshleman@gmail.com>
References: <2b847f2b4ed5a94d21c41274395b97eed3ec39dd.1548580142.git.bobbyeshleman@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2b847f2b4ed5a94d21c41274395b97eed3ec39dd.1548580142.git.bobbyeshleman@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bobbyeshleman@gmail.com
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds device tree documentation for the max44009 ambient light sensor.

Signed-off-by: Robert Eshleman <bobbyeshleman@gmail.com>
---
Changes to v3:
- None

Changes to v2:
- Clean up style

 .../bindings/iio/light/max44009.txt           | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/max44009.txt

diff --git a/Documentation/devicetree/bindings/iio/light/max44009.txt b/Documentation/devicetree/bindings/iio/light/max44009.txt
new file mode 100644
index 000000000000..b287d7732e37
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/light/max44009.txt
@@ -0,0 +1,25 @@
+* MAX44009 Ambient Light Sensor
+
+Required properties:
+
+- compatible: should be "maxim,max44009"
+- reg: the I2C address of the device (default is <0x4a>)
+
+Optional properties:
+
+- interrupts: interrupt mapping for GPIO IRQ. Should be configured with
+  IRQ_TYPE_EDGE_FALLING.
+
+Refer to interrupt-controller/interrupts.txt for generic interrupt client
+node bindings.
+
+Example:
+
+max44009: max44009@4a {
+	compatible = "maxim,max44009";
+	reg = <0x4a>;
+
+	interrupt-parent = <&gpio1>;
+	interrupts = <17 IRQ_TYPE_EDGE_FALLING>;
+};
+
-- 
2.20.1
