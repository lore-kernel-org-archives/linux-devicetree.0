From: Grzegorz Jaszczyk <jaz@semihalf.com>
Subject: [PATCH v2 12/17] ARM: dts: mvebu: armada-39x: enable rtc for all
 Armada-39x SoCs
Date: Thu,  4 Aug 2016 12:14:15 +0200
Message-ID: <1470305660-6601-13-git-send-email-jaz@semihalf.com>
References: <1470305660-6601-1-git-send-email-jaz@semihalf.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1470305660-6601-1-git-send-email-jaz@semihalf.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, andrew@lunn.ch, jason@lakedaemon.net, jaz@semihalf.com, linux@armlinux.org.uk, nadavh@marvell.com, alior@marvell.com, robh+dt@kernel.org, gregory.clement@free-electrons.com, mw@semihalf.com, thomas.petazzoni@free-electrons.com, sebastian.hesselbarth@gmail.com
List-Id: devicetree@vger.kernel.org

Despite that FS states that rtc is present only in A395 and A398 and not in
A390, the rtc is working with A390.

Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>
Acked-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 arch/arm/boot/dts/armada-39x.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/armada-39x.dtsi b/arch/arm/boot/dts/armada-39x.dtsi
index 1225cd8..5bed8b9 100644
--- a/arch/arm/boot/dts/armada-39x.dtsi
+++ b/arch/arm/boot/dts/armada-39x.dtsi
@@ -429,6 +429,13 @@
 				};
 			};
 
+			rtc@a3800 {
+				compatible = "marvell,armada-380-rtc";
+				reg = <0xa3800 0x20>, <0x184a0 0x0c>;
+				reg-names = "rtc", "rtc-soc";
+				interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
 			flash@d0000 {
 				compatible = "marvell,armada370-nand";
 				reg = <0xd0000 0x54>;
-- 
1.8.3.1
