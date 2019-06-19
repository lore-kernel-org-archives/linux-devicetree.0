From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 1/5] dt-bindings: iio: adc: stm32: add missing vdda supply
Date: Wed, 19 Jun 2019 14:29:54 +0200
Message-ID: <1560947398-11592-2-git-send-email-fabrice.gasnier@st.com>
References: <1560947398-11592-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560947398-11592-1-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, robh+dt@kernel.org, alexandre.torgue@st.com
Cc: mark.rutland@arm.com, mcoquelin.stm32@gmail.com, lars@metafoo.de, knaack.h@gmx.de, pmeerw@pmeerw.net, fabrice.gasnier@st.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add missing vdda-supply, analog power supply, to STM32 ADC. It's required
to properly supply the ADC.

Fixes: 841fcea454fe ("Documentation: dt-bindings: Document STM32 ADC DT
bindings")

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
index 8346bcb..93a0bd2 100644
--- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
+++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
@@ -38,6 +38,7 @@ Required properties:
     It's required on stm32h7.
 - clock-names: Must be "adc" and/or "bus" depending on part used.
 - interrupt-controller: Identifies the controller node as interrupt-parent
+- vdda-supply: Phandle to the vdda input analog voltage.
 - vref-supply: Phandle to the vref input analog reference voltage.
 - #interrupt-cells = <1>;
 - #address-cells = <1>;
-- 
2.7.4
