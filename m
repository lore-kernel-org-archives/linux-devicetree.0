From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH v2 1/2] dt-bindings: iio: stm32-adc: add option to set
 resolution
Date: Fri, 31 Mar 2017 14:32:37 +0200
Message-ID: <1490963559-32159-2-git-send-email-fabrice.gasnier@st.com>
References: <1490963559-32159-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1490963559-32159-1-git-send-email-fabrice.gasnier@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: jic23@kernel.org, linux@armlinux.org.uk, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, benjamin.gaignard@linaro.org, lars@metafoo.de, alexandre.torgue@st.com, linux-iio@vger.kernel.org, pmeerw@pmeerw.net, mcoquelin.stm32@gmail.com, knaack.h@gmx.de, fabrice.gasnier@st.com, linus.walleij@linaro.org, benjamin.gaignard@st.com
List-Id: devicetree@vger.kernel.org

Add documentation for 'assigned-resolution-bits' dt optional property.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
Changes in v2:
- rename property from 'st,adc-res' to 'assigned-resolution-bits' so it
  is more common.
---
 Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
index 5dfc88e..e35f9f1 100644
--- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
+++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
@@ -57,6 +57,9 @@ Optional properties:
 - dmas: Phandle to dma channel for this ADC instance.
   See ../../dma/dma.txt for details.
 - dma-names: Must be "rx" when dmas property is being used.
+- assigned-resolution-bits: Resolution (bits) to use for conversions. Must
+  match device available resolutions (e.g. can be 6, 8, 10 or 12 on stm32f4).
+  Default is maximum resolution if unset.
 
 Example:
 	adc: adc@40012000 {
@@ -84,6 +87,7 @@ Example:
 			st,adc-channels = <8>;
 			dmas = <&dma2 0 0 0x400 0x0>;
 			dma-names = "rx";
+			assigned-resolution-bits = <8>;
 		};
 		...
 		other adc child nodes follow...
-- 
1.9.1
