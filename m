From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] ARM: dts: uniphier: fix size of sdctrl nodes
Date: Sun, 27 Aug 2017 21:02:31 +0900
Message-ID: <1503835351-9685-2-git-send-email-yamada.masahiro@socionext.com>
References: <1503835351-9685-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1503835351-9685-1-git-send-email-yamada.masahiro@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

All registers are located within 0x400 size from the base address.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm/boot/dts/uniphier-pro5.dtsi | 2 +-
 arch/arm/boot/dts/uniphier-pxs2.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/uniphier-pro5.dtsi b/arch/arm/boot/dts/uniphier-pro5.dtsi
index 41a6493ed29a..b026bcd42a06 100644
--- a/arch/arm/boot/dts/uniphier-pro5.dtsi
+++ b/arch/arm/boot/dts/uniphier-pro5.dtsi
@@ -292,7 +292,7 @@
 		sdctrl@59810000 {
 			compatible = "socionext,uniphier-pro5-sdctrl",
 				     "simple-mfd", "syscon";
-			reg = <0x59810000 0x800>;
+			reg = <0x59810000 0x400>;
 
 			sd_clk: clock {
 				compatible = "socionext,uniphier-pro5-sd-clock";
diff --git a/arch/arm/boot/dts/uniphier-pxs2.dtsi b/arch/arm/boot/dts/uniphier-pxs2.dtsi
index 37bbaa4b4de5..90b020c95083 100644
--- a/arch/arm/boot/dts/uniphier-pxs2.dtsi
+++ b/arch/arm/boot/dts/uniphier-pxs2.dtsi
@@ -276,7 +276,7 @@
 		sdctrl@59810000 {
 			compatible = "socionext,uniphier-pxs2-sdctrl",
 				     "simple-mfd", "syscon";
-			reg = <0x59810000 0x800>;
+			reg = <0x59810000 0x400>;
 
 			sd_clk: clock {
 				compatible = "socionext,uniphier-pxs2-sd-clock";
-- 
2.7.4
