From: Kevin Cernekee <cernekee@gmail.com>
Subject: [PATCH V5 10/23] MIPS: Let __dt_register_buses accept a single bus type
Date: Fri, 12 Dec 2014 14:07:01 -0800
Message-ID: <1418422034-17099-11-git-send-email-cernekee@gmail.com>
References: <1418422034-17099-1-git-send-email-cernekee@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1418422034-17099-1-git-send-email-cernekee@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ralf@linux-mips.org
Cc: f.fainelli@gmail.com, tglx@linutronix.de, jason@lakedaemon.net, jogo@openwrt.org, arnd@arndb.de, computersforpeace@gmail.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Some machines only have one bus type to register (e.g. "simple-bus").

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 arch/mips/kernel/prom.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/prom.c b/arch/mips/kernel/prom.c
index 452d435..e303cb1 100644
--- a/arch/mips/kernel/prom.c
+++ b/arch/mips/kernel/prom.c
@@ -64,7 +64,10 @@ int __init __dt_register_buses(const char *bus0, const char *bus1)
 		panic("device tree not present");
 
 	strlcpy(of_ids[0].compatible, bus0, sizeof(of_ids[0].compatible));
-	strlcpy(of_ids[1].compatible, bus1, sizeof(of_ids[1].compatible));
+	if (bus1) {
+		strlcpy(of_ids[1].compatible, bus1,
+			sizeof(of_ids[1].compatible));
+	}
 
 	if (of_platform_populate(NULL, of_ids, NULL, NULL))
 		panic("failed to populate DT");
-- 
2.1.1
