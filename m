From: Stefan Popa <stefan.popa@analog.com>
Subject: [PATCH 3/4] dt-bindings: iio: frequency: Add ADF4372 PLL documentation
Date: Mon, 24 Jun 2019 18:12:42 +0300
Message-ID: <1561389162-26291-1-git-send-email-stefan.popa@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, Michael.Hennerich@analog.com, gregkh@linuxfoundation.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stefan.popa@analog.com
List-Id: devicetree@vger.kernel.org

Document support for ADF4372 SPI Wideband Synthesizer.

Signed-off-by: Stefan Popa <stefan.popa@analog.com>
---
 Documentation/devicetree/bindings/iio/frequency/adf4371.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml b/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml
index 8a2a8f6..a268a9d 100644
--- a/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml
+++ b/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml
@@ -4,19 +4,21 @@
 $id: http://devicetree.org/schemas/iio/frequency/adf4371.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Analog Devices ADF4371 Wideband Synthesizer
+title: Analog Devices ADF4371/ADF4372 Wideband Synthesizers
 
 maintainers:
   - Popa Stefan <stefan.popa@analog.com>
 
 description: |
-  Analog Devices ADF4371 SPI Wideband Synthesizer
+  Analog Devices ADF4371/ADF4372 SPI Wideband Synthesizers
   https://www.analog.com/media/en/technical-documentation/data-sheets/adf4371.pdf
+  https://www.analog.com/media/en/technical-documentation/data-sheets/adf4372.pdf
 
 properties:
   compatible:
     enum:
       - adi,adf4371
+      - adi,adf4372
 
   reg:
     maxItems: 1
-- 
2.7.4
