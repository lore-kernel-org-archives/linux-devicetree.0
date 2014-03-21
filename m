From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: [PATCH 2/5] clk: berlin: add berlin clocks DT bindings documentation
Date: Fri, 21 Mar 2014 12:43:37 +0100
Message-ID: <1395402220-23503-3-git-send-email-alexandre.belloni@free-electrons.com>
References: <1395402220-23503-1-git-send-email-alexandre.belloni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1395402220-23503-1-git-send-email-alexandre.belloni@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Mike Turquette <mturquette@linaro.org>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Cc: devicetree@vger.kernel.org
Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 .../devicetree/bindings/clock/berlin-clock.txt     | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/berlin-clock.txt

diff --git a/Documentation/devicetree/bindings/clock/berlin-clock.txt b/Documentation/devicetree/bindings/clock/berlin-clock.txt
new file mode 100644
index 000000000000..ebc78f9b93a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/berlin-clock.txt
@@ -0,0 +1,29 @@
+Device Tree Clock bindings for Marvell Berlin clocks
+
+This binding uses the common clock binding[1].
+
+[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+Required properties:
+- compatible : shall be one of the following:
+	"marvell,berlin2-pll" or
+	"marvell,berlin2q-pll":
+		CPU PLL and System PLL
+- reg : Address and length of the clock register set.
+- #clock-cells : from common clock binding; shall be set to 0.
+- clocks : shall be the input parent clock phandle for the clock.
+
+smclk: sysmgr-clock {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <25000000>;
+};
+
+cpupll: cpupll {
+	compatible = "marvell,berlin2-pll";
+	clocks = <&smclk>;
+	#clock-cells = <0>;
+	reg = <0xf7ea003c 8>;
+};
+
+
-- 
1.8.3.2
