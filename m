From: Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH v2 2/3] dt-bindings: iio/adc: Add AUX2 channel idx for JZ4770 SoC ADC
Date: Sat, 27 Jul 2019 21:59:39 +0200
Message-ID: <20190727195940.14010-2-contact@artur-rojek.eu>
References: <20190727195940.14010-1-contact@artur-rojek.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190727195940.14010-1-contact@artur-rojek.eu>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Paul Cercueil <paul@crapouillou.net>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Artur Rojek <contact@artur-rojek.eu>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Introduce support for AUX2 channel found in ADC hardware present on
Ingenic JZ4770 SoC.

Signed-off-by: Artur Rojek <contact@artur-rojek.eu>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Changes:

v2: no change

 include/dt-bindings/iio/adc/ingenic,adc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/iio/adc/ingenic,adc.h b/include/dt-bindings/iio/adc/ingenic,adc.h
index 82706b2706ac..42f871ab3272 100644
--- a/include/dt-bindings/iio/adc/ingenic,adc.h
+++ b/include/dt-bindings/iio/adc/ingenic,adc.h
@@ -6,5 +6,6 @@
 /* ADC channel idx. */
 #define INGENIC_ADC_AUX		0
 #define INGENIC_ADC_BATTERY	1
+#define INGENIC_ADC_AUX2	2
 
 #endif
-- 
2.22.0
