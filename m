From: Radek Dostal <radek.dostal@streamunlimited.com>
Subject: [PATCH] ARM: dts: bcm63138: change "interupts" to "interrupts"
Date: Mon, 10 Nov 2014 17:35:58 +0100
Message-ID: <1415637358-24378-1-git-send-email-radek.dostal@streamunlimited.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com, arnd@arndb.de, Radek Dostal <radek.dostal@streamunlimited.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

all other nodes in bcm63138.dtsi use "interrupts", this had to be just a typo
which never got noticed, even it may have quite some consequences.

Signed-off-by: Radek Dostal <radek.dostal@streamunlimited.com>
---
 Hi all,

 when running git grep with typo, I spotted this typo inDT binding, which 
 looks obviously wrong to me. Sorry I do not have the board to test it, but 
 I am pretty sure the patch is correct.

 I hope I included, right people get_maintainer.pl showed bit too many.

 Thanks,
 Radek

 arch/arm/boot/dts/bcm63138.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm63138.dtsi b/arch/arm/boot/dts/bcm63138.dtsi
index f3bb2dd..d2d8e94 100644
--- a/arch/arm/boot/dts/bcm63138.dtsi
+++ b/arch/arm/boot/dts/bcm63138.dtsi
@@ -102,7 +102,7 @@
 		twd_watchdog: watchdog@1e620 {
 			compatible = "arm,cortex-a9-twd-wdt";
 			reg = <0x1e620 0x20>;
-			interupts = <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>;
 		};
 	};
 
-- 
1.7.9.5
