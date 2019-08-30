From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v3 06/16] ARM: l2c: add definition for FWA in PL310 aux
 register
Date: Sat, 31 Aug 2019 00:07:33 +0200
Message-ID: <20190830220743.439670-7-lkundrak@v3.sk>
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

The PL310 also has a "Force write allocate" bits in the Auxiliary
Control Register.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/arm/include/asm/hardware/cache-l2x0.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/include/asm/hardware/cache-l2x0.h b/arch/arm/include/asm/hardware/cache-l2x0.h
index 32edfadb15935..a6d4ee86ba543 100644
--- a/arch/arm/include/asm/hardware/cache-l2x0.h
+++ b/arch/arm/include/asm/hardware/cache-l2x0.h
@@ -118,6 +118,8 @@
 #define L310_AUX_CTRL_STORE_LIMITATION		BIT(11)	/* R2P0+ */
 #define L310_AUX_CTRL_EXCLUSIVE_CACHE		BIT(12)
 #define L310_AUX_CTRL_ASSOCIATIVITY_16		BIT(16)
+#define L310_AUX_CTRL_FWA_SHIFT			23
+#define L310_AUX_CTRL_FWA_MASK			(3 << 23)
 #define L310_AUX_CTRL_CACHE_REPLACE_RR		BIT(25)	/* R2P0+ */
 #define L310_AUX_CTRL_NS_LOCKDOWN		BIT(26)
 #define L310_AUX_CTRL_NS_INT_CTRL		BIT(27)
-- 
2.21.0
