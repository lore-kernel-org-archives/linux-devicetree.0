From: Joe.C <srv_yingjoe.chen@mediatek.com>
Subject: [RESEND PATCH v2 3/4] arm: mediatek: Add intpol in mt6589.dtsi
Date: Wed, 13 Aug 2014 10:11:23 +0800
Message-ID: <1407895884-18131-4-git-send-email-srv_yingjoe.chen@mediatek.com>
References: <1407895884-18131-1-git-send-email-srv_yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1407895884-18131-1-git-send-email-srv_yingjoe.chen@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@arm.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, "Joe.C" <yingjoe.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Olof Johansson <olof@lixom.net>, Jonas Jensen <jonas.jensen@gmail.com>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: srv_heupstream@mediatek.com, yingjoe.chen@gmail.com, hc.yen@mediatek.com, yh.chen@mediatek.com, nathan.chung@mediatek.com, eddie.huang@mediatek.com
List-Id: devicetree@vger.kernel.org

From: "Joe.C" <yingjoe.chen@mediatek.com>

Add intpol settings for mt6589.
This also correct timer interrupt flag setting. The old setting
works because 6589 boot loader already set polarity for time
interrupt. Without intpol support, the setting was not changed
so gic can get the irq correctly.

Signed-off-by: Joe.C <yingjoe.chen@mediatek.com>
---
 arch/arm/boot/dts/mt6589.dtsi | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mt6589.dtsi b/arch/arm/boot/dts/mt6589.dtsi
index d0297a0..18df47f 100644
--- a/arch/arm/boot/dts/mt6589.dtsi
+++ b/arch/arm/boot/dts/mt6589.dtsi
@@ -76,11 +76,16 @@
 		timer: timer@10008000 {
 			compatible = "mediatek,mt6577-timer";
 			reg = <0x10008000 0x80>;
-			interrupts = <GIC_SPI 113 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&system_clk>, <&rtc_clk>;
 			clock-names = "system-clk", "rtc-clk";
 		};
 
+		intpol: intpol@10200100 {
+			compatible = "mediatek,mt6577-intpol";
+			reg = <0x10200100 0x1c>;
+		};
+
 		gic: interrupt-controller@10212000 {
 			compatible = "arm,cortex-a15-gic";
 			interrupt-controller;
-- 
1.8.1.1.dirty
