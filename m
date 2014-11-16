From: Kevin Cernekee <cernekee@gmail.com>
Subject: [PATCH V2 14/22] MIPS: BMIPS: Fix L1_CACHE_SHIFT when BMIPS5000 is selected
Date: Sat, 15 Nov 2014 16:17:38 -0800
Message-ID: <1416097066-20452-15-git-send-email-cernekee@gmail.com>
References: <1416097066-20452-1-git-send-email-cernekee@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1416097066-20452-1-git-send-email-cernekee@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ralf@linux-mips.org
Cc: f.fainelli@gmail.com, jfraser@broadcom.com, dtor@chromium.org, tglx@linutronix.de, jason@lakedaemon.net, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

BMIPS platforms can select multiple CPUs, in which case we'll need to
use the greatest common denominator (= 1 << 7 = 128 bytes, for the
BMIPS5000 L2).

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 3d56928..c0130ec 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1473,6 +1473,7 @@ config CPU_BMIPS
 	select WEAK_ORDERING
 	select CPU_SUPPORTS_HIGHMEM
 	select CPU_HAS_PREFETCH
+	select MIPS_L1_CACHE_SHIFT_7
 	help
 	  Support for BMIPS32/3300/4350/4380 and BMIPS5000 processors.
 
-- 
2.1.1
