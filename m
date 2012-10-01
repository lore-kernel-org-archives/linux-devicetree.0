From: Marek Belisko <marek.belisko@open-nandra.com>
Subject: [PATCH] arm/dts: at91sam9g20ek_common: Fix typos in buttons labels.
Date: Mon,  1 Oct 2012 22:46:09 +0200
Message-ID: <1349124369-28742-1-git-send-email-marek.belisko@open-nandra.com>
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
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Marek Belisko <marek.belisko@open-nandra.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 arch/arm/boot/dts/at91sam9g20ek_common.dtsi |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/at91sam9g20ek_common.dtsi b/arch/arm/boot/dts/at91sam9g20ek_common.dtsi
index b06c0db..e6391a4 100644
--- a/arch/arm/boot/dts/at91sam9g20ek_common.dtsi
+++ b/arch/arm/boot/dts/at91sam9g20ek_common.dtsi
@@ -126,14 +126,14 @@
 		#size-cells = <0>;
 
 		btn3 {
-			label = "Buttin 3";
+			label = "Button 3";
 			gpios = <&pioA 30 1>;
 			linux,code = <0x103>;
 			gpio-key,wakeup;
 		};
 
 		btn4 {
-			label = "Buttin 4";
+			label = "Button 4";
 			gpios = <&pioA 31 1>;
 			linux,code = <0x104>;
 			gpio-key,wakeup;
-- 
1.7.9.5
