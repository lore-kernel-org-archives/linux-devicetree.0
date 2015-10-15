From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] ARM: dts: uniphier: fix IRQ number for devices on PH1-LD6b
 ref board
Date: Thu, 15 Oct 2015 17:58:16 +0900
Message-ID: <1444899496-1124-1-git-send-email-yamada.masahiro@socionext.com>
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
To: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The IRQ signal from external devices on this board is connected to
the XIRQ1 pin of the SoC.  The IRQ number should be 51, not 50.

Fixes: a5e921b4771f ("ARM: dts: uniphier: add ProXstream2 and PH1-LD6b SoC/board support")
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Hi Olof and Arnd,

Could you apply this simple fix for Linux 4.13, please?
(if it is troublesome, I can wait until Linux 4.14-rc1.)

Thanks



 arch/arm/boot/dts/uniphier-ph1-ld6b-ref.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/uniphier-ph1-ld6b-ref.dts b/arch/arm/boot/dts/uniphier-ph1-ld6b-ref.dts
index 33963ac..3a6f1f6 100644
--- a/arch/arm/boot/dts/uniphier-ph1-ld6b-ref.dts
+++ b/arch/arm/boot/dts/uniphier-ph1-ld6b-ref.dts
@@ -85,7 +85,7 @@
 };
 
 &ethsc {
-	interrupts = <0 50 4>;
+	interrupts = <0 51 4>;
 };
 
 &serial0 {
-- 
1.9.1
