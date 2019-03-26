From: Ibtsam Ul-Haq <ibtsam.haq.0x01@gmail.com>
Subject: [PATCH v3 2/2] dt-bindings: iio: Add bindings for TI TLA202x ADCs
Date: Tue, 26 Mar 2019 14:56:20 +0100
Message-ID: <1553608583-29006-2-git-send-email-ibtsam.haq.0x01@gmail.com>
References: <1553608583-29006-1-git-send-email-ibtsam.haq.0x01@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553608583-29006-1-git-send-email-ibtsam.haq.0x01@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org
Cc: Ibtsam Ul-Haq <ibtsam.haq.0x01@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This adds devicetree bindings for TI TLA202x ADCs.

Signed-off-by: Ibtsam Ul-Haq <ibtsam.haq.0x01@gmail.com>
---
 .../devicetree/bindings/iio/adc/ti-tla2024.txt     | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ti-tla2024.txt

diff --git a/Documentation/devicetree/bindings/iio/adc/ti-tla2024.txt b/Documentation/devicetree/bindings/iio/adc/ti-tla2024.txt
new file mode 100644
index 0000000..a4934df
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ti-tla2024.txt
@@ -0,0 +1,45 @@
+Texas Instruments' TLA2021/TLA2022/TLA2024 12-bit ADC driver
+
+Required properties:
+
+- compatible: should be one of:
+  "ti,tla2024"
+  "ti,tla2022"
+  "ti,tla2021"
+
+- reg: should contain the I2C Address of the device
+
+Required subnodes:
+
+The ADC channels are configured as subnodes of the ADC.
+The channels can be single-ended or differential, the input pins are
+also set in the subnode.
+
+Possible channels in TLA2024:
+  single: <0>, <1>, <2>, <3>
+  differential: <0 1>, <0 3>, <1 3>, <2 3>
+
+In TLA2021/TLA2022 only the differential channel <0 1> is allowed.
+
+Example:
+
+tla2024_0: adc0@49 {
+	compatible = "ti,tla2024";
+	reg = <0x49>;
+
+	v0@0 {
+		single-channel = <0>;
+	};
+
+	v1@1 {
+		single-channel = <1>;
+	};
+
+	v23@2 {
+		diff-channels = <2 3>;
+	};
+
+	v01@3 {
+		diff-channels = <0 1>;
+	};
+};
-- 
2.7.4
