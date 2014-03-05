From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: [PATCH 1/3] ARM: dove: drop pinctrl PMU reg property
Date: Wed,  5 Mar 2014 01:03:08 +0100
Message-ID: <1393977790-29110-2-git-send-email-sebastian.hesselbarth@gmail.com>
References: <1393977790-29110-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1393977790-29110-1-git-send-email-sebastian.hesselbarth@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Marvell Dove's pinctrl does require some PMU regs for muxing PMU
functions to MPP pins. Recently, a discussion started about consolidating
Power Management Unit (PMU) into a single DT node. As we don't want
anymore DT ABI in the way, drop the corresponding reg property from
pinctrl node now. The driver will derive the registers from existing
reg properties.

Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
---
Cc: Rob Herring <robh+dt@kernel.org> 
Cc: Pawel Moll <pawel.moll@arm.com> 
Cc: Mark Rutland <mark.rutland@arm.com> 
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk> 
Cc: Kumar Gala <galak@codeaurora.org> 
Cc: Russell King <linux@arm.linux.org.uk> 
Cc: Jason Cooper <jason@lakedaemon.net> 
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Gregory Clement <gregory.clement@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org 
Cc: linux-arm-kernel@lists.infradead.org 
Cc: linux-kernel@vger.kernel.org
---
 arch/arm/boot/dts/dove.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/dove.dtsi b/arch/arm/boot/dts/dove.dtsi
index b6fc27f8ed66..3b891dd20993 100644
--- a/arch/arm/boot/dts/dove.dtsi
+++ b/arch/arm/boot/dts/dove.dtsi
@@ -395,8 +395,7 @@
 			pinctrl: pin-ctrl@d0200 {
 				compatible = "marvell,dove-pinctrl";
 				reg = <0xd0200 0x14>,
-				      <0xd0440 0x04>,
-				      <0xd802c 0x08>;
+				      <0xd0440 0x04>;
 				clocks = <&gate_clk 22>;
 
 				pmx_gpio_0: pmx-gpio-0 {
-- 
1.8.5.3
