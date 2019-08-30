From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v3 14/16] ARM: mmp: remove MMP3 USB PHY registers from
 regs-usb.h
Date: Sat, 31 Aug 2019 00:07:41 +0200
Message-ID: <20190830220743.439670-15-lkundrak@v3.sk>
References: <20190830220743.439670-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190830220743.439670-1-lkundrak@v3.sk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "To : Olof Johansson" <olof@lixom.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Lubomir Rintel <lkundrak@v3.sk>, "Cc : Rob Herring" <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Nothing in mach-mmp/ uses them and they belong to the PHY driver.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/arm/mach-mmp/regs-usb.h | 94 ------------------------------------
 1 file changed, 94 deletions(-)

diff --git a/arch/arm/mach-mmp/regs-usb.h b/arch/arm/mach-mmp/regs-usb.h
index d9f08c1601542..ed0d1aa0ad6c9 100644
--- a/arch/arm/mach-mmp/regs-usb.h
+++ b/arch/arm/mach-mmp/regs-usb.h
@@ -121,100 +121,6 @@
 
 #define UTMI_OTG_ADDON_OTG_ON			(1 << 0)
 
-/* For MMP3 USB Phy */
-#define USB2_PLL_REG0		0x4
-#define USB2_PLL_REG1		0x8
-#define USB2_TX_REG0		0x10
-#define USB2_TX_REG1		0x14
-#define USB2_TX_REG2		0x18
-#define USB2_RX_REG0		0x20
-#define USB2_RX_REG1		0x24
-#define USB2_RX_REG2		0x28
-#define USB2_ANA_REG0		0x30
-#define USB2_ANA_REG1		0x34
-#define USB2_ANA_REG2		0x38
-#define USB2_DIG_REG0		0x3C
-#define USB2_DIG_REG1		0x40
-#define USB2_DIG_REG2		0x44
-#define USB2_DIG_REG3		0x48
-#define USB2_TEST_REG0		0x4C
-#define USB2_TEST_REG1		0x50
-#define USB2_TEST_REG2		0x54
-#define USB2_CHARGER_REG0	0x58
-#define USB2_OTG_REG0		0x5C
-#define USB2_PHY_MON0		0x60
-#define USB2_RESETVE_REG0	0x64
-#define USB2_ICID_REG0		0x78
-#define USB2_ICID_REG1		0x7C
-
-/* USB2_PLL_REG0 */
-/* This is for Ax stepping */
-#define USB2_PLL_FBDIV_SHIFT_MMP3		0
-#define USB2_PLL_FBDIV_MASK_MMP3		(0xFF << 0)
-
-#define USB2_PLL_REFDIV_SHIFT_MMP3		8
-#define USB2_PLL_REFDIV_MASK_MMP3		(0xF << 8)
-
-#define USB2_PLL_VDD12_SHIFT_MMP3		12
-#define USB2_PLL_VDD18_SHIFT_MMP3		14
-
-/* This is for B0 stepping */
-#define USB2_PLL_FBDIV_SHIFT_MMP3_B0		0
-#define USB2_PLL_REFDIV_SHIFT_MMP3_B0		9
-#define USB2_PLL_VDD18_SHIFT_MMP3_B0		14
-#define USB2_PLL_FBDIV_MASK_MMP3_B0		0x01FF
-#define USB2_PLL_REFDIV_MASK_MMP3_B0		0x3E00
-
-#define USB2_PLL_CAL12_SHIFT_MMP3		0
-#define USB2_PLL_CALI12_MASK_MMP3		(0x3 << 0)
-
-#define USB2_PLL_VCOCAL_START_SHIFT_MMP3	2
-
-#define USB2_PLL_KVCO_SHIFT_MMP3		4
-#define USB2_PLL_KVCO_MASK_MMP3			(0x7<<4)
-
-#define USB2_PLL_ICP_SHIFT_MMP3			8
-#define USB2_PLL_ICP_MASK_MMP3			(0x7<<8)
-
-#define USB2_PLL_LOCK_BYPASS_SHIFT_MMP3		12
-
-#define USB2_PLL_PU_PLL_SHIFT_MMP3		13
-#define USB2_PLL_PU_PLL_MASK			(0x1 << 13)
-
-#define USB2_PLL_READY_MASK_MMP3		(0x1 << 15)
-
-/* USB2_TX_REG0 */
-#define USB2_TX_IMPCAL_VTH_SHIFT_MMP3		8
-#define USB2_TX_IMPCAL_VTH_MASK_MMP3		(0x7 << 8)
-
-#define USB2_TX_RCAL_START_SHIFT_MMP3		13
-
-/* USB2_TX_REG1 */
-#define USB2_TX_CK60_PHSEL_SHIFT_MMP3		0
-#define USB2_TX_CK60_PHSEL_MASK_MMP3		(0xf << 0)
-
-#define USB2_TX_AMP_SHIFT_MMP3			4
-#define USB2_TX_AMP_MASK_MMP3			(0x7 << 4)
-
-#define USB2_TX_VDD12_SHIFT_MMP3		8
-#define USB2_TX_VDD12_MASK_MMP3			(0x3 << 8)
-
-/* USB2_TX_REG2 */
-#define USB2_TX_DRV_SLEWRATE_SHIFT		10
-
-/* USB2_RX_REG0 */
-#define USB2_RX_SQ_THRESH_SHIFT_MMP3		4
-#define USB2_RX_SQ_THRESH_MASK_MMP3		(0xf << 4)
-
-#define USB2_RX_SQ_LENGTH_SHIFT_MMP3		10
-#define USB2_RX_SQ_LENGTH_MASK_MMP3		(0x3 << 10)
-
-/* USB2_ANA_REG1*/
-#define USB2_ANA_PU_ANA_SHIFT_MMP3		14
-
-/* USB2_OTG_REG0 */
-#define USB2_OTG_PU_OTG_SHIFT_MMP3		3
-
 /* fsic registers */
 #define FSIC_MISC			0x4
 #define FSIC_INT			0x28
-- 
2.21.0
