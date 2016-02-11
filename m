From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 2/2] ARM: dts: vf-colibri: assign Ethernet clock explicitly
Date: Wed, 10 Feb 2016 16:02:26 -0800
Message-ID: <1455148946-26903-2-git-send-email-stefan@agner.ch>
References: <1455148946-26903-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1455148946-26903-1-git-send-email-stefan@agner.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, kernel@pengutronix.de
Cc: devicetree@vger.kernel.org, Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Assign Ethernet clock parents explicitly. The Colibri VF61
uses the 50MHz Ethernet clock provided by PLL5.

The Vybrid SoC has two ethernet interfaces (fec0 and fec1) which
use the same clock source (VF610_CLK_ENET). Therefore this parent
configuration affects multiple consumer devices and need to be
specified in the clock provider node.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/vf-colibri.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/vf-colibri.dtsi b/arch/arm/boot/dts/vf-colibri.dtsi
index c4312c4..8a889af 100644
--- a/arch/arm/boot/dts/vf-colibri.dtsi
+++ b/arch/arm/boot/dts/vf-colibri.dtsi
@@ -38,6 +38,13 @@
 	status = "disabled";
 };
 
+&clks {
+	assigned-clocks = <&clks VF610_CLK_ENET_SEL>,
+			  <&clks VF610_CLK_ENET_TS_SEL>;
+	assigned-clock-parents = <&clks VF610_CLK_ENET_50M>,
+				 <&clks VF610_CLK_ENET_50M>;
+};
+
 &dspi1 {
 	bus-num = <1>;
 	pinctrl-names = "default";
-- 
2.7.1
