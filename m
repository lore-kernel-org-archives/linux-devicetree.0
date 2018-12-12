From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v1 1/2] dt-bindings: iio: adc: Add binding for ADC on pms405 PMIC
Date: Wed, 12 Dec 2018 15:47:54 +0530
Message-ID: <3aac8c4cd7648589d0eef994376357509e284030.1544599950.git.amit.kucheria@linaro.org>
References: <cover.1544599950.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1544599950.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1544599950.git.amit.kucheria@linaro.org>
References: <cover.1544599950.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, mka@chromium.org, khasim.mohammed@linaro.org, devicetree@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Douglas Anderson <dianders@chromium.org>, Siddartha Mohanadoss <smohanad@codeaurora.org>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

PMS405 contains a variant of the spmi-adc-rev2 ADC. Create a new
compatible inorder to handle any differences.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.txt b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.txt
index b3c86f4ac7cd..7ee94496b144 100644
--- a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.txt
+++ b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.txt
@@ -13,6 +13,7 @@ VADC node:
     Definition: Should contain "qcom,spmi-vadc".
                 Should contain "qcom,spmi-adc5" for PMIC5 ADC driver.
                 Should contain "qcom,spmi-adc-rev2" for PMIC rev2 ADC driver.
+                Should contain "qcom,pms405-adc" for PMS405 PMIC
 
 - reg:
     Usage: required
-- 
2.17.1
