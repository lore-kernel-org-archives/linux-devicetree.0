From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 11/20] ARM: mmp: don't select CACHE_TAUROS2 on all ARCH_MMP
Date: Thu, 22 Aug 2019 11:26:34 +0200
Message-ID: <20190822092643.593488-12-lkundrak@v3.sk>
References: <20190822092643.593488-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190822092643.593488-1-lkundrak@v3.sk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Stephen Boyd <sboyd@kernel.org>, Marc Zyngier <maz@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

MMP3 has a PJ4B with a Tauros 3 cache controller that uses CACHE_L2X0
instead, while CACHE_TAUROS2 is present on PJ4 and PJ1 (Mohawk) based
platforms only.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/arm/mm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index c54cd7ed90ba5..8dabce4507025 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -1045,7 +1045,7 @@ endif
 
 config CACHE_TAUROS2
 	bool "Enable the Tauros2 L2 cache controller"
-	depends on (ARCH_DOVE || ARCH_MMP || CPU_PJ4)
+	depends on (CPU_MOHAWK || CPU_PJ4)
 	default y
 	select OUTER_CACHE
 	help
-- 
2.21.0
