From: David Veenstra <davidjulianveenstra@gmail.com>
Subject: [PATCH v2 09/13] staging: iio: ad2s1200: Add documentation for
 device tree binding
Date: Fri, 20 Apr 2018 21:30:54 +0200
Message-ID: <2b0596e9dd109a8ea949c38d9e9abb0e38e8bc5e.1524247563.git.davidjulianveenstra@gmail.com>
References: <cover.1524247563.git.davidjulianveenstra@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <cover.1524247563.git.davidjulianveenstra@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: lars@metafoo.de, jic23@kernel.org, pmeerw@pmeerw.net
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org, robh+dt@kernel.org, knaack.h@gmx.de, daniel.baluta@nxp.com
List-Id: devicetree@vger.kernel.org

Add documentation for the added device tree bindings.

Signed-off-by: David Veenstra <davidjulianveenstra@gmail.com>
---
Changes in v2:
  - Introduced in this version.

 .../bindings/staging/iio/resolver/ad2s1200.txt           | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/staging/iio/resolver/ad2s1200.txt

diff --git a/Documentation/devicetree/bindings/staging/iio/resolver/ad2s1200.txt b/Documentation/devicetree/bindings/staging/iio/resolver/ad2s1200.txt
new file mode 100644
index 000000000000..85c009987878
--- /dev/null
+++ b/Documentation/devicetree/bindings/staging/iio/resolver/ad2s1200.txt
@@ -0,0 +1,16 @@
+Analog Devices AD2S1200 Resolver-to-Digital Converter
+
+Required properties:
+ - compatible : should be "adi,ad2s1200"
+ - reg : the SPI chip select number of the device
+ - sample-gpios : The GPIO pin connected to the SAMPLE line of the AD2S1200
+ - rdvel-gpios : The GPIO pin connected to the RDVEL line of the AD2S1200
+
+Example:
+
+	resolver {
+		compatible = "adi,ad2s1200";
+		reg = <4>;
+		sample-gpios = <&gpio 5 GPIO_ACTIVE_HIGH>;
+		rdvel-gpios = <&gpio 6 GPIO_ACTIVE_HIGH>;
+	};
-- 
2.16.2
