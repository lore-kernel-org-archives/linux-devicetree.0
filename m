From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [RFC 1/4] dt-bindings: iio: introduce trigger providers, consumers
Date: Fri, 17 Feb 2017 17:03:46 +0100
Message-ID: <1487347429-31761-2-git-send-email-fabrice.gasnier@st.com>
References: <1487347429-31761-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1487347429-31761-1-git-send-email-fabrice.gasnier@st.com>
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

Document iio provider and consumer bindings.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 .../devicetree/bindings/iio/iio-bindings.txt       | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/iio-bindings.txt b/Documentation/devicetree/bindings/iio/iio-bindings.txt
index 68d6f8c..3125390 100644
--- a/Documentation/devicetree/bindings/iio/iio-bindings.txt
+++ b/Documentation/devicetree/bindings/iio/iio-bindings.txt
@@ -95,3 +95,40 @@ vdd channel is connected to output 0 of the &ref device.
 		io-channels = <&adc 10>, <&adc 11>;
 		io-channel-names = "adc1", "adc2";
 	};
+
+==IIO trigger providers==
+Sources of IIO triggers can be represented by any node in the device
+tree. Those nodes are designated as IIO trigger providers. IIO trigger
+consumer uses a phandle and an IIO trigger specifier to connect to an
+IIO trigger provider.
+An IIO trigger specifier is an array of one or more cells identifying
+the IIO trigger output on a device. The length of an IIO trigger
+specifier is defined by the value of a #io-trigger-cells property in
+the IIO trigger provider node.
+
+Required properties:
+#io-trigger-cells:
+		Number of cells in an IIO trigger specifier; Typically
+		0 for nodes with a simple IIO trigger output.
+
+Example:
+	gpiotrig0: iio-gpio-trigger0 {
+		#io-trigger-cells = <0>;
+		compatible = "iio-gpio-trigger";
+		gpios = <&gpioa 11 0>;
+	}
+
+==IIO trigger consumers==
+Required properties:
+- io-triggers:	List of phandle representing the IIO trigger specifier.
+
+Optional properties:
+- io-trigger-names :
+		List of IIO trigger name strings that matches elements
+		in 'io-triggers' list property.
+
+Example:
+	some_trigger_consumer {
+		io-triggers = <&gpiotrig0>;
+		io-trigger-names = "mytrig";
+	}
-- 
1.9.1
