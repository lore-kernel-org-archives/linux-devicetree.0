From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH v4 2/2] ARM: digicolor: select syscon and timer
Date: Thu, 29 Jan 2015 00:04:11 +0200
Message-ID: <2d0359c67f731aab3befa4b3f059cc9fdbcf2ff6.1422481097.git.baruch@tkos.co.il>
References: <8b74c50aebadc781a5aa8061f7639c9164433e84.1422481097.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <8b74c50aebadc781a5aa8061f7639c9164433e84.1422481097.git.baruch@tkos.co.il>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

The digicolor interrupt controller driver now needs syscon.

Also, as per clocksource maintainer request, we now have a separate config
symbol, CONFIG_DIGICOLOR_TIMER, for the digicolor timer.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v4:
   New patch in this series

 arch/arm/mach-digicolor/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-digicolor/Kconfig b/arch/arm/mach-digicolor/Kconfig
index 5a0669a2738e..4f36d8d2bc57 100644
--- a/arch/arm/mach-digicolor/Kconfig
+++ b/arch/arm/mach-digicolor/Kconfig
@@ -2,4 +2,6 @@ config ARCH_DIGICOLOR
 	bool "Conexant Digicolor SoC Support"
 	depends on ARCH_MULTI_V7
 	select CLKSRC_MMIO
+	select DIGICOLOR_TIMER
 	select GENERIC_IRQ_CHIP
+	select MFD_SYSCON
-- 
2.1.4
