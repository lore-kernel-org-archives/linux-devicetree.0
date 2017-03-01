From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: [PATCH v2 1/5] pinctrl: sunxi: refactor pinctrl choice selecting for
 ARM64
Date: Thu,  2 Mar 2017 02:01:07 +0800
Message-ID: <20170301180111.12365-2-icenowy@aosc.xyz>
References: <20170301180111.12365-1-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170301180111.12365-1-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, Icenowy Zheng <icenowy@aosc.xyz>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

ARM64 Allwinner SoCs used to have every pinctrl driver selected in
ARCH_SUNXI. Change this to make their default value to (ARM64 &&
ARCH_SUNXI).

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
Changes in v2:
- Drop PINCTRL_SUN8I_H3_R's dependency on RESET_CONTROLLER, as there's really
  no reset line for H3 R_PIO pin controller. (By experiment and investigation
  on A83T/A80 user manual)

 drivers/pinctrl/sunxi/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
index 816015cf7053..a84bfa7f3c05 100644
--- a/drivers/pinctrl/sunxi/Kconfig
+++ b/drivers/pinctrl/sunxi/Kconfig
@@ -48,8 +48,8 @@ config PINCTRL_SUN8I_H3
 	select PINCTRL_SUNXI
 
 config PINCTRL_SUN8I_H3_R
-	def_bool MACH_SUN8I
-	select PINCTRL_SUNXI_COMMON
+	def_bool MACH_SUN8I || (ARM64 && ARCH_SUNXI)
+	select PINCTRL_SUNXI
 
 config PINCTRL_SUN8I_V3S
 	def_bool MACH_SUN8I
@@ -65,11 +65,11 @@ config PINCTRL_SUN9I_A80_R
 	select PINCTRL_SUNXI
 
 config PINCTRL_SUN50I_A64
-	bool
+	def_bool ARM64 && ARCH_SUNXI
 	select PINCTRL_SUNXI
 
 config PINCTRL_SUN50I_H5
-	bool
+	def_bool ARM64 && ARCH_SUNXI
 	select PINCTRL_SUNXI
 
 endif
-- 
2.11.1
