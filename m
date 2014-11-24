From: Kevin Cernekee <cernekee@gmail.com>
Subject: [PATCH V3 10/11] MIPS: Reorder MIPS_L1_CACHE_SHIFT priorities
Date: Sun, 23 Nov 2014 18:40:45 -0800
Message-ID: <1416796846-28149-11-git-send-email-cernekee@gmail.com>
References: <1416796846-28149-1-git-send-email-cernekee@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1416796846-28149-1-git-send-email-cernekee@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ralf@linux-mips.org
Cc: f.fainelli@gmail.com, jfraser@broadcom.com, dtor@chromium.org, tglx@linutronix.de, jason@lakedaemon.net, jogo@openwrt.org, arnd@arndb.de, computersforpeace@gmail.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Enabling support for more than one BMIPS CPU in the same build may
result in different L1_CACHE_SHIFT values, e.g.

    CPU_BMIPS5000 selects MIPS_L1_CACHE_SHIFT_7
    CPU_BMIPS4380 selects MIPS_L1_CACHE_SHIFT_6
    anything else defaults to MIPS_L1_CACHE_SHIFT_5

Ensure that if more than one MIPS_L1_CACHE_SHIFT_x option is selected,
Kconfig sets CONFIG_MIPS_L1_CACHE_SHIFT to the highest value.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 arch/mips/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ae8ae77b2ecd..9c09a5a43f87 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1167,10 +1167,10 @@ config MIPS_L1_CACHE_SHIFT_7
 
 config MIPS_L1_CACHE_SHIFT
 	int
-	default "4" if MIPS_L1_CACHE_SHIFT_4
-	default "5" if MIPS_L1_CACHE_SHIFT_5
-	default "6" if MIPS_L1_CACHE_SHIFT_6
 	default "7" if MIPS_L1_CACHE_SHIFT_7
+	default "6" if MIPS_L1_CACHE_SHIFT_6
+	default "5" if MIPS_L1_CACHE_SHIFT_5
+	default "4" if MIPS_L1_CACHE_SHIFT_4
 	default "5"
 
 config HAVE_STD_PC_SERIAL_PORT
-- 
2.1.1
