From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH v4 6/6] arm64: dts: berlin4ct: add default pinmux for uart0
Date: Fri, 9 Oct 2015 16:17:09 +0800
Message-ID: <1444378629-3057-7-git-send-email-jszhang@marvell.com>
References: <1444378629-3057-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1444378629-3057-1-git-send-email-jszhang@marvell.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: sebastian.hesselbarth@gmail.com, linus.walleij@linaro.org, antoine.tenart@free-electrons.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, Jisheng Zhang <jszhang@marvell.com>, linux-gpio@vger.kernel.org, robh+dt@kernel.org, galak@codeaurora.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add urt0 txd and rxd muxing setup in the dtsi because uart0 always uses
them to work, no other possibilities.

Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
---
 arch/arm64/boot/dts/marvell/berlin4ct.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/berlin4ct.dtsi b/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
index 8e66355..a4a1876 100644
--- a/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
+++ b/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
@@ -288,12 +288,19 @@
 				clocks = <&osc>;
 				reg-shift = <2>;
 				status = "disabled";
+				pinctrl-0 = <&uart0_pmux>;
+				pinctrl-names = "default";
 			};
 		};
 
 		system_pinctrl: pin-controller@fe2200 {
 			compatible = "marvell,berlin4ct-system-pinctrl";
 			reg = <0xfe2200 0xc>;
+
+			uart0_pmux: uart0-pmux {
+				groups = "SM_URT0_TXD", "SM_URT0_RXD";
+				function = "uart0";
+			};
 		};
 	};
 };
-- 
2.6.1
