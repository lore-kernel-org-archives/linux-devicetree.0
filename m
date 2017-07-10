From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 1/4] dt-bindings: iio: stm32-dac: add support for STM32F4
Date: Mon, 10 Jul 2017 15:23:57 +0200
Message-ID: <1499693040-12994-2-git-send-email-fabrice.gasnier@st.com>
References: <1499693040-12994-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1499693040-12994-1-git-send-email-fabrice.gasnier@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: jic23@kernel.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, benjamin.gaignard@linaro.org, lars@metafoo.de, alexandre.torgue@st.com, linux-iio@vger.kernel.org, pmeerw@pmeerw.net, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, knaack.h@gmx.de, fabrice.gasnier@st.com, linux-arm-kernel@lists.infradead.org, benjamin.gaignard@st.com
List-Id: devicetree@vger.kernel.org

Introduce new compatible to support STM32F4 DAC (Digital-To-Analog
converter) variant.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 Documentation/devicetree/bindings/iio/dac/st,stm32-dac.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.txt b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.txt
index bcee71f..bf2925c 100644
--- a/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.txt
+++ b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.txt
@@ -10,7 +10,9 @@ current.
 Contents of a stm32 dac root node:
 -----------------------------------
 Required properties:
-- compatible: Must be "st,stm32h7-dac-core".
+- compatible: Should be one of:
+  "st,stm32f4-dac-core"
+  "st,stm32h7-dac-core"
 - reg: Offset and length of the device's register set.
 - clocks: Must contain an entry for pclk (which feeds the peripheral bus
   interface)
-- 
1.9.1
