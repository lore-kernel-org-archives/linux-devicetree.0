From: Patrick Havelange <patrick.havelange@essensium.com>
Subject: [PATCH v7 1/3] dt-bindings: iio/temperature: Add thermocouple types (and doc)
Date: Tue, 26 Mar 2019 12:18:40 +0100
Message-ID: <20190326111842.12399-1-patrick.havelange@essensium.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>, Matt Weber <matthew.weber@rockwellcollins.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Patrick Havelange <patrick.havelange@essensium.com>
List-Id: devicetree@vger.kernel.org

This patch introduces common thermocouple types used by various
temperature sensors. Also a brief documentation explaining this
"thermocouple-type" property.

Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
---
Changes v7
 - Merge header and doc in same patch
 - Doc:add it's a single cell entry
 - Doc:removed non complete example

Changes v6
 - Add this file
---
 .../iio/temperature/temperature-bindings.txt     |  7 +++++++
 .../dt-bindings/iio/temperature/thermocouple.h   | 16 ++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/temperature/temperature-bindings.txt
 create mode 100644 include/dt-bindings/iio/temperature/thermocouple.h

diff --git a/Documentation/devicetree/bindings/iio/temperature/temperature-bindings.txt b/Documentation/devicetree/bindings/iio/temperature/temperature-bindings.txt
new file mode 100644
index 000000000000..8f339cab74ae
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/temperature/temperature-bindings.txt
@@ -0,0 +1,7 @@
+If the temperature sensor device can be configured to use some specific
+thermocouple type, you can use the defined types provided in the file
+"include/dt-bindings/iio/temperature/thermocouple.h".
+
+Property:
+thermocouple-type:	A single cell representing the type of the thermocouple
+			used by the device.
diff --git a/include/dt-bindings/iio/temperature/thermocouple.h b/include/dt-bindings/iio/temperature/thermocouple.h
new file mode 100644
index 000000000000..ce037f5238ac
--- /dev/null
+++ b/include/dt-bindings/iio/temperature/thermocouple.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _DT_BINDINGS_TEMPERATURE_THERMOCOUPLE_H
+#define _DT_BINDINGS_TEMPERATURE_THERMOCOUPLE_H
+
+
+#define THERMOCOUPLE_TYPE_B	0x00
+#define THERMOCOUPLE_TYPE_E	0x01
+#define THERMOCOUPLE_TYPE_J	0x02
+#define THERMOCOUPLE_TYPE_K	0x03
+#define THERMOCOUPLE_TYPE_N	0x04
+#define THERMOCOUPLE_TYPE_R	0x05
+#define THERMOCOUPLE_TYPE_S	0x06
+#define THERMOCOUPLE_TYPE_T	0x07
+
+#endif /* _DT_BINDINGS_TEMPERATURE_THERMOCOUPLE_H */
-- 
2.19.1
