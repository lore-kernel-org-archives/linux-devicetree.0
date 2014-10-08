From: Y Vo <yvo@apm.com>
Subject: [PATCH v1 2/3] Documentation: gpio: Add APM X-Gene standby GPIO
 controller DTS binding
Date: Wed,  8 Oct 2014 21:52:27 +0700
Message-ID: <1412779948-28769-3-git-send-email-yvo@apm.com>
References: <1412779948-28769-1-git-send-email-yvo@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1412779948-28769-1-git-send-email-yvo@apm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Tin Huynh <tnhuynh@apm.com>, patches@apm.com, Toan Le <toanle@apm.com>, Y Vo <yvo@apm.com>, Phong Vo <pvo@apm.com>
List-Id: devicetree@vger.kernel.org

Documentation for APM X-Gene standby GPIO controller DTS binding.

Signed-off-by: Y Vo <yvo@apm.com>
---
 .../devicetree/bindings/gpio/gpio-xgene-sb.txt     |   31 ++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-xgene-sb.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-xgene-sb.txt b/Documentation/devicetree/bindings/gpio/gpio-xgene-sb.txt
new file mode 100644
index 0000000..3215e4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-xgene-sb.txt
@@ -0,0 +1,31 @@
+APM X-Gene Standby GPIO controller bindings
+
+This is a gpio controller in standby domain.
+
+There are 20 GPIO pins from 0..21. There is no GPIO_DS14 and GPIO_DS15. 
+Only GPIO_DS8..GPIO_DS13 support interrupt. IRQ mapping 0x28..0x2d.
+
+Required properties:
+- compatible: "apm,xgene-gpio-sb" for X-Gene Standby GPIO controller
+- reg: Physical base address and size of the controller's registers
+- #gpio-cells: Should be two.
+	- first cell is the pin number
+	- second cell is used to specify the gpio polarity:
+		0 = active high
+		1 = active low
+- gpio-controller: Marks the device node as a GPIO controller.
+- interrupts: Shall contains the interrupts.
+
+Example:
+	sbgpio: sbgpio@17001000 {
+		compatible = "apm,xgene-gpio-sb";
+		reg = <0x0 0x17001000 0x0 0x400>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupts = 	<0x0 0x28 0x1>,
+				<0x0 0x29 0x1>,
+				<0x0 0x2a 0x1>,
+				<0x0 0x2b 0x1>,
+				<0x0 0x2c 0x1>,
+				<0x0 0x2d 0x1>;
+	};
-- 
1.7.9.5

CONFIDENTIALITY NOTICE: This e-mail message, including any attachments, 
is for the sole use of the intended recipient(s) and contains information
that is confidential and proprietary to Applied Micro Circuits Corporation or its subsidiaries. 
It is to be used solely for the purpose of furthering the parties' business relationship. 
All unauthorized review, use, disclosure or distribution is prohibited. 
If you are not the intended recipient, please contact the sender by reply e-mail 
and destroy all copies of the original message.
