From: <patrice.chotard@st.com>
Subject: [PATCH v3 05/11] ARM: dts: STi: Add fake reg property for irq-syscfg
Date: Tue, 13 Feb 2018 13:53:31 +0100
Message-ID: <1518526417-11919-6-git-send-email-patrice.chotard@st.com>
References: <1518526417-11919-1-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1518526417-11919-1-git-send-email-patrice.chotard@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: patrice.chotard@st.com
List-Id: devicetree@vger.kernel.org

From: Patrice Chotard <patrice.chotard@st.com>

Add fake reg property to irq-syscfg node.
This allows to fix the following warning when compiling
dtb with W=1 option:

arch/arm/boot/dts/stih407-b2120.dtb: Warning (simple_bus_reg):
Node /soc/irq-syscfg missing or empty reg/ranges property
arch/arm/boot/dts/stih410-b2120.dtb: Warning (simple_bus_reg):
Node /soc/irq-syscfg missing or empty reg/ranges property
arch/arm/boot/dts/stih410-b2260.dtb: Warning (simple_bus_reg):
Node /soc/irq-syscfg missing or empty reg/ranges property
arch/arm/boot/dts/stih418-b2199.dtb: Warning (simple_bus_reg):
Node /soc/irq-syscfg missing or empty reg/ranges property

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---
v3: _ none
v2: _ add a fake reg property to node without reg property

 arch/arm/boot/dts/stih407-family.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
index e279cd07ba67..c8dc659fd14e 100644
--- a/arch/arm/boot/dts/stih407-family.dtsi
+++ b/arch/arm/boot/dts/stih407-family.dtsi
@@ -181,8 +181,9 @@
 			reg = <0x94b5100 0x1000>;
 		};
 
-		irq-syscfg {
+		irq-syscfg@0 {
 			compatible    = "st,stih407-irq-syscfg";
+			reg = <0 0>;
 			st,syscfg     = <&syscfg_core>;
 			st,irq-device = <ST_IRQ_SYSCFG_PMU_0>,
 					<ST_IRQ_SYSCFG_PMU_1>;
-- 
1.9.1
