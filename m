From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] arm64: dts: uniphier: reserve more memory for LD11/LD20
Date: Fri, 26 May 2017 17:17:42 +0900
Message-ID: <1495786662-27862-1-git-send-email-yamada.masahiro@socionext.com>
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
To: linux-mtd@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Reserve enough space below the kernel base.
The assumed address map is:
  80000000 - 80ffffff : for IPP
  81000000 - 81ffffff : for ARM secure
  82000000 -          : for Linux

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi | 2 +-
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
index 53ede23d68cb..702f5b175456 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
@@ -43,7 +43,7 @@
  *     OTHER DEALINGS IN THE SOFTWARE.
  */
 
-/memreserve/ 0x80000000 0x00080000;
+/memreserve/ 0x80000000 0x02000000;
 
 / {
 	compatible = "socionext,uniphier-ld11";
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
index aa4dad51bf46..f120059e6e24 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
@@ -43,7 +43,7 @@
  *     OTHER DEALINGS IN THE SOFTWARE.
  */
 
-/memreserve/ 0x80000000 0x00080000;
+/memreserve/ 0x80000000 0x02000000;
 
 / {
 	compatible = "socionext,uniphier-ld20";
-- 
2.7.4
