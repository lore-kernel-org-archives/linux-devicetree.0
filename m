From: Jayachandran C <jnair@caviumnetworks.com>
Subject: [PATCH v3 1/5] arm64: add THUNDER2 processor family
Date: Tue, 7 Feb 2017 21:19:55 +0000
Message-ID: <1486502399-2950-2-git-send-email-jnair@caviumnetworks.com>
References: <1486502399-2950-1-git-send-email-jnair@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1486502399-2950-1-git-send-email-jnair@caviumnetworks.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Jayachandran C <jnair@caviumnetworks.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add support for ThunderX2 CN99XX arm64 server processors. Introduce a
new arm64 platform config option ARCH_THUNDER2 for these processors.

ARCH_THUNDER2 has the same on-chip devices as ARCH_VULCAN, so select
ARCH_VULCAN for now, until the driver dependencies are updated.

Signed-off-by: Jayachandran C <jnair@caviumnetworks.com>
---
 arch/arm64/Kconfig.platforms | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 715ef12..1ee377d 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -190,6 +190,14 @@ config ARCH_THUNDER
 	help
 	  This enables support for Cavium's Thunder Family of SoCs.
 
+config ARCH_THUNDER2
+	bool "Cavium ThunderX2 Server Processors"
+	select ARCH_VULCAN
+	select GPIOLIB
+	help
+	  This enables support for Cavium's ThunderX2 CN99XX family of
+	  server processors.
+
 config ARCH_UNIPHIER
 	bool "Socionext UniPhier SoC Family"
 	select ARCH_HAS_RESET_CONTROLLER
-- 
2.7.4
