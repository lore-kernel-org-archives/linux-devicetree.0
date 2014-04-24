From: Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: [PATCH 1/2] i2c: sunxi: add P2WI DT bindings documentation
Date: Thu, 24 Apr 2014 13:55:15 +0200
Message-ID: <1398340516-29547-2-git-send-email-boris.brezillon@free-electrons.com>
References: <1398340516-29547-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1398340516-29547-1-git-send-email-boris.brezillon@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Boris BREZILLON <boris.brezillon@free-electrons.com>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Shuge <shuge@allwinnertech.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, kevin@allwinnertech.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

P2WI (Push/Pull 2 Wire Interface) is an SMBus like bus used to communicate
with some PMICs (like the AXP221).

Document P2WI DT bindings which are pretty much the same as the one defined
for the marvell's mv64xxx controller.

Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
---
 .../devicetree/bindings/i2c/i2c-sunxi-p2wi.txt     | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-sunxi-p2wi.txt

diff --git a/Documentation/devicetree/bindings/i2c/i2c-sunxi-p2wi.txt b/Documentation/devicetree/bindings/i2c/i2c-sunxi-p2wi.txt
new file mode 100644
index 0000000..d59347d
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-sunxi-p2wi.txt
@@ -0,0 +1,27 @@
+
+* Allwinner P2WI (Push/Pull 2 Wire Interface) controller
+
+Required properties :
+
+ - reg             : Offset and length of the register set for the device.
+ - compatible      : Should one of the following:
+                     - "allwinner,sun6i-a31-p2wi"
+ - interrupts      : The interrupt line connected to the P2WI peripheral.
+ - clocks          : The gate clk connected to the P2WI peripheral.
+ - resets          : The reset line connected to the P2WI peripheral.
+
+Optional properties :
+
+ - clock-frequency : Desired P2WI bus clock frequency in Hz. If not set the
+default frequency is 100kHz
+
+Example:
+
+	p2wi@01f03400 {
+		compatible = "allwinner,sun6i-a31-p2wi";
+		reg = <0x01f03400 0x400>;
+		interrupts = <0 39 4>;
+		clocks = <&apb0_gates 3>;
+		clock-frequency = <6000000>;
+		resets = <&apb0_rst 3>;
+	};
-- 
1.8.3.2
