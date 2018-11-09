From: Stefan Popa <stefan.popa@analog.com>
Subject: [PATCH v4 2/4] dt-bindings: iio: adc: Add common ADCs properties to a separate file
Date: Fri, 9 Nov 2018 17:40:55 +0200
Message-ID: <1541778055-7629-1-git-send-email-stefan.popa@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, Michael.Hennerich@analog.com, gregkh@linuxfoundation.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stefan.popa@analog.com
List-Id: devicetree@vger.kernel.org

There are several ADC drivers that depend on the same device tree
bindings. Rather than continue to duplicate the properties, this patch
adds a common adc binding document that can be referenced. For beginning,
only two properties are documented.

Signed-off-by: Stefan Popa <stefan.popa@analog.com>
---
Changes in v2, v3:
	- N/A.
Changes in v4:
	- Added this commit.

 Documentation/devicetree/bindings/iio/adc/adc.txt | 25 +++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/adc.txt

diff --git a/Documentation/devicetree/bindings/iio/adc/adc.txt b/Documentation/devicetree/bindings/iio/adc/adc.txt
new file mode 100644
index 0000000..1e3cc21
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/adc.txt
@@ -0,0 +1,25 @@
+Common ADCs properties
+
+This binding is a work-in-progress
+
+Optional properties for child nodes:
+- bipolar : Boolean, if set the channel is used in bipolar mode.
+- diff-channels : Differential channels muxed for this ADC. The first value
+		specifies the positive input pin, the second value the negative
+		input pin.
+
+Example:
+	adc@0 {
+		compatible = "some,adc";
+		...
+		channel@0 {
+			bipolar;
+			diff-channels = <0 1>;
+			...
+		};
+
+		channel@1 {
+			diff-channels = <2 3>;
+			...
+		};
+	};
-- 
2.7.4
