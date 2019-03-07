From: Patrick Havelange <patrick.havelange@essensium.com>
Subject: [PATCH v6 1/4] dt-bindings: iio/temperature: Add thermocouple types
Date: Thu,  7 Mar 2019 11:34:06 +0100
Message-ID: <20190307103409.24174-1-patrick.havelange@essensium.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matt Weber <matthew.weber@rockwellcollins.com>, Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Patrick Havelange <patrick.havelange@essensium.com>
List-Id: devicetree@vger.kernel.org

This patch introduces common thermocouple types used by various
temperature sensors.

Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
---
Changes v6
 - Add this file
---
 .../dt-bindings/iio/temperature/thermocouple.h   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 include/dt-bindings/iio/temperature/thermocouple.h

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
