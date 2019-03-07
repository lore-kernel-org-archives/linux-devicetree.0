From: Patrick Havelange <patrick.havelange@essensium.com>
Subject: [PATCH v6 2/4] dt-bindings: iio/temperature: Add doc for thermocouple-type
Date: Thu,  7 Mar 2019 11:34:07 +0100
Message-ID: <20190307103409.24174-2-patrick.havelange@essensium.com>
References: <20190307103409.24174-1-patrick.havelange@essensium.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190307103409.24174-1-patrick.havelange@essensium.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matt Weber <matthew.weber@rockwellcollins.com>, Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Patrick Havelange <patrick.havelange@essensium.com>
List-Id: devicetree@vger.kernel.org

This explains the new generic property "thermocouple-type" that
can be used with temperature sensors.

Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
---
Changes v6
 - Add this file
---
 .../bindings/iio/temperature/temperature-bindings.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/temperature/temperature-bindings.txt

diff --git a/Documentation/devicetree/bindings/iio/temperature/temperature-bindings.txt b/Documentation/devicetree/bindings/iio/temperature/temperature-bindings.txt
new file mode 100644
index 000000000000..69a6441d8083
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/temperature/temperature-bindings.txt
@@ -0,0 +1,11 @@
+If the temperature sensor device can be configured to use some specific
+thermocouple type, you can use the defined types provided in the file
+"include/dt-bindings/iio/temperature/thermocouple.h".
+
+Optional property:
+thermocouple-type:	The type of the thermocouple used by the device.
+
+For example:
+	device {
+		thermocouple-type = <THERMOCOUPLE_TYPE_K> ;
+	};
-- 
2.19.1
