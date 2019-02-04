From: Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH v2 2/3] dt-bindings: iio/adc: Add bindings for Ingenic JZ47xx SoCs ADC.
Date: Mon,  4 Feb 2019 01:15:13 +0100
Message-ID: <20190204001514.29891-2-contact@artur-rojek.eu>
References: <20190204001514.29891-1-contact@artur-rojek.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190204001514.29891-1-contact@artur-rojek.eu>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, Artur Rojek <contact@artur-rojek.eu>
List-Id: devicetree@vger.kernel.org

Add device tree bindings for the ADC controller on JZ47xx SoCs,
used by the ingenic-adc driver.

Signed-off-by: Artur Rojek <contact@artur-rojek.eu>
---

 Changes:

 v2: no change

 include/dt-bindings/iio/adc/ingenic,adc.h | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 include/dt-bindings/iio/adc/ingenic,adc.h

diff --git a/include/dt-bindings/iio/adc/ingenic,adc.h b/include/dt-bindings/iio/adc/ingenic,adc.h
new file mode 100644
index 000000000000..82706b2706ac
--- /dev/null
+++ b/include/dt-bindings/iio/adc/ingenic,adc.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _DT_BINDINGS_IIO_ADC_INGENIC_ADC_H
+#define _DT_BINDINGS_IIO_ADC_INGENIC_ADC_H
+
+/* ADC channel idx. */
+#define INGENIC_ADC_AUX		0
+#define INGENIC_ADC_BATTERY	1
+
+#endif
-- 
2.20.1
