From: Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v3 1/4] dt-bindings: iio: at91-sama5d2_adc: add optional dma
 property
Date: Wed, 15 Nov 2017 14:56:45 +0200
Message-ID: <1510750608-8697-2-git-send-email-eugen.hristev@microchip.com>
References: <1510750608-8697-1-git-send-email-eugen.hristev@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1510750608-8697-1-git-send-email-eugen.hristev@microchip.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: nicolas.ferre@microchip.com, alexandre.belloni@free-electrons.com, linux-iio@vger.kernel.org, lars@metafoo.de, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, ludovic.desroches@microchip.com, jic23@kernel.org
Cc: eugen.hristev@microchip.com
List-Id: devicetree@vger.kernel.org

Added property for DMA configuration of the device.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 Changes in v3:
None, but we discussed on the ML about whether we should have "dma-names"
present in the binding even if it's only one.
The helpers in the kernel to retrieve the channel info rely on the
presence of this property, so I am resending the patch based on this.
If another solution is better, please advise and I can try it and
resend the patch.

 Documentation/devicetree/bindings/iio/adc/at91-sama5d2_adc.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/at91-sama5d2_adc.txt b/Documentation/devicetree/bindings/iio/adc/at91-sama5d2_adc.txt
index 552e7a8..6469a4c 100644
--- a/Documentation/devicetree/bindings/iio/adc/at91-sama5d2_adc.txt
+++ b/Documentation/devicetree/bindings/iio/adc/at91-sama5d2_adc.txt
@@ -17,6 +17,11 @@ Required properties:
   This property uses the IRQ edge types values: IRQ_TYPE_EDGE_RISING ,
   IRQ_TYPE_EDGE_FALLING or IRQ_TYPE_EDGE_BOTH
 
+Optional properties:
+  - dmas: Phandle to dma channel for the ADC.
+  - dma-names: Must be "rx" when dmas property is being used.
+  See ../../dma/dma.txt for details.
+
 Example:
 
 adc: adc@fc030000 {
@@ -31,4 +36,6 @@ adc: adc@fc030000 {
 	vddana-supply = <&vdd_3v3_lp_reg>;
 	vref-supply = <&vdd_3v3_lp_reg>;
 	atmel,trigger-edge-type = <IRQ_TYPE_EDGE_BOTH>;
+	dmas = <&dma0 (AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) | AT91_XDMAC_DT_PERID(25))>;
+	dma-names = "rx";
 }
-- 
2.7.4
