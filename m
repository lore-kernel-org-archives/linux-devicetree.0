From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 3/6] gpio: gpio-cbc: Document bindings of CBC FPGA GPIO block
Date: Fri,  7 Oct 2016 18:20:11 +0300
Message-ID: <1475853614-22409-4-git-send-email-pantelis.antoniou@konsulko.com>
References: <1475853614-22409-1-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1475853614-22409-1-git-send-email-pantelis.antoniou@konsulko.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, linux-kernel@vger.kernel.org, JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Debjit Ghosh <dghosh@juniper.net>, Mohammad Kamil <mkamil@juniper.net>, Georgi Vlaev <gvlaev@juniper.net>, Frank Rowand <frowand.list@gmail.com>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

From: Georgi Vlaev <gvlaev@juniper.net>

Add device tree bindings document for the GPIO driver of
Juniper's CBC FPGA.

Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
[Ported from Juniper kernel]
Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 .../devicetree/bindings/gpio/jnx,gpio-cbc.txt      | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/jnx,gpio-cbc.txt

diff --git a/Documentation/devicetree/bindings/gpio/jnx,gpio-cbc.txt b/Documentation/devicetree/bindings/gpio/jnx,gpio-cbc.txt
new file mode 100644
index 0000000..d205d0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/jnx,gpio-cbc.txt
@@ -0,0 +1,30 @@
+Juniper CBC FPGA GPIO block
+
+Required properties:
+
+- compatible:
+    Must be "jnx,cbc-gpio"
+
+Optional properties:
+
+- reg:
+    Address and length of the register set for the device. This is optional since
+    usually the parent MFD driver fills it in.
+
+- #gpio-cells:
+    Should be <2>.  The first cell is the pin number (within the controller's
+    pin space), and the second is used for the following flags:
+	bit[0]: direction (0 = out, 1 = in)
+	bit[1]: init high
+	bit[2]: active low
+
+- gpio-controller:
+    Specifies that the node is a GPIO controller.
+
+Example:
+
+gpio_cbc {
+	compatible = "jnx,gpio-cbc";
+	#gpio-cells = <2>;
+	gpio-controller;
+};
-- 
1.9.1
