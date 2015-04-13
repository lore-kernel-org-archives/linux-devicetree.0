From: Martin Fuzzey <mfuzzey@parkeon.com>
Subject: [PATCH 1/2] Doc: DT: Add binding document for GPIO exporter
Date: Mon, 13 Apr 2015 13:05:17 +0200
Message-ID: <20150413110517.9681.2438.stgit@localhost>
References: <20150413110515.9681.58848.stgit@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20150413110515.9681.58848.stgit@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Martin Fuzzey <mfuzzey@parkeon.com>
---
 .../devicetree/bindings/gpio/gpio-exporter.txt     |   40 ++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-exporter.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-exporter.txt b/Documentation/devicetree/bindings/gpio/gpio-exporter.txt
new file mode 100644
index 0000000..58fc2a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-exporter.txt
@@ -0,0 +1,40 @@
+Bindings to export some GPIOs to userspace.
+
+This is useful when some signals are made externally available by a piece
+of hardware (eg terminal blocks to connect sensors, actuators) but no
+special purpose kernel driver exists.
+
+Use of this binding allows userspace to have a stable name and input
+/ output mode across hardware and software versions.
+
+Required properties:
+- compatible: "linux,gpio-exporter"
+
+
+Each GPIO to be exported is represented as a child node with:
+
+Required child properties:
+- gpios : Reference to the GPIO to export (standard gpio binding)
+
+Optional child properties:
+- output : if present GPIO is output, otherwise input
+- initial-state : Initial state (0=low, 1=high) for output
+- allow-direction-change : Present if GPIO direction may be modified
+
+The name of the child node is that exposed to userspace.
+
+Example:
+	gpio_exporter:gpio-exporter {
+		compatible = "linux,gpio-exporter";
+
+		terminalblock_1_out1 {
+			gpios = <&gpio2 12 0>;
+			output;
+			initial-state = <0>;
+		};
+
+		terminalblock_1_in1 {
+			gpios = <&gpio2 15 0>;
+		};
+
+	};
