From: Kevin Cernekee <cernekee@gmail.com>
Subject: [PATCH V5 16/23] MIPS: BMIPS: Remove bogus bus name
Date: Fri, 12 Dec 2014 14:07:07 -0800
Message-ID: <1418422034-17099-17-git-send-email-cernekee@gmail.com>
References: <1418422034-17099-1-git-send-email-cernekee@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1418422034-17099-1-git-send-email-cernekee@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ralf@linux-mips.org
Cc: f.fainelli@gmail.com, tglx@linutronix.de, jason@lakedaemon.net, jogo@openwrt.org, arnd@arndb.de, computersforpeace@gmail.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

There is no "bcm3384" bus so let's just remove it to avoid confusion.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 arch/mips/bmips/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
index 5099109..ac402ed 100644
--- a/arch/mips/bmips/setup.c
+++ b/arch/mips/bmips/setup.c
@@ -83,7 +83,7 @@ void __init device_tree_init(void)
 
 int __init plat_of_setup(void)
 {
-	return __dt_register_buses("brcm,bcm3384", "simple-bus");
+	return __dt_register_buses("simple-bus", NULL);
 }
 
 arch_initcall(plat_of_setup);
-- 
2.1.1
