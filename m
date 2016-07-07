From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH v2 3/6] dt-bindings: clock: add DT binding for the TBG clocks
 on Armada 3700
Date: Fri,  8 Jul 2016 00:37:48 +0200
Message-ID: <1467931071-31004-4-git-send-email-gregory.clement@free-electrons.com>
References: <1467931071-31004-1-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1467931071-31004-1-git-send-email-gregory.clement@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, devicetree@vger.kernel.org, Hua Jing <jinghua@marvell.com>, Romain Perier <romain.perier@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Omri Itach <omrii@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Victor Gu <xigu@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Terry Zhou <bjzhou@marvell.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

This commit adds the DT binding documentation for the Time Base Generator
clock used in the Marvell Armada 3700 SoCs.

Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/clock/armada3700-tbg-clock.txt        | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/armada3700-tbg-clock.txt

diff --git a/Documentation/devicetree/bindings/clock/armada3700-tbg-clock.txt b/Documentation/devicetree/bindings/clock/armada3700-tbg-clock.txt
new file mode 100644
index 000000000000..0ba1d83ff363
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/armada3700-tbg-clock.txt
@@ -0,0 +1,27 @@
+* Time Base Generator Clock bindings for Marvell Armada 37xx SoCs
+
+Marvell Armada 37xx SoCs provde Time Base Generator clocks which are
+used as parent clocks for the peripheral clocks.
+
+The TBG clock consumer should specify the desired clock by having the
+clock ID in its "clocks" phandle cell.
+
+The following is a list of provided IDs and clock names on Armada 3700:
+ 0 = TBG A P
+ 1 = TBG B P
+ 2 = TBG A S
+ 3 = TBG B S
+
+Required properties:
+- compatible : shall be "marvell,armada-3700-tbg-clock"
+- reg : must be the register address of North Bridge PLL register
+- #clock-cells : from common clock binding; shall be set to 1
+
+Example:
+
+tbg: tbg@13200 {
+	compatible = "marvell,armada-3700-tbg-clock";
+	reg = <0x13200 0x1000>;
+	clocks = <&xtalclk>;
+	#clock-cells = <1>;
+};
-- 
2.5.0
