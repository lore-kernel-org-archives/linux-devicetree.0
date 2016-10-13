From: Noam Camus <noamca@mellanox.com>
Subject: [PATCH 2/3] ARC: [plat-eznps] remove macros for timer0 TSI
Date: Thu, 13 Oct 2016 17:52:29 +0300
Message-ID: <1476370350-3853-3-git-send-email-noamca@mellanox.com>
References: <1476370350-3853-1-git-send-email-noamca@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1476370350-3853-1-git-send-email-noamca@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Noam Camus <noamca@mellanox.com>
List-Id: devicetree@vger.kernel.org

From: Noam Camus <noamca@mellanox.com>

Now it is defined at include/soc/nps/mtm.h
It will be used by module from driver/clocksource/

Signed-off-by: Noam Camus <noamca@mellanox.com>
---
 arch/arc/plat-eznps/include/plat/ctop.h |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/arc/plat-eznps/include/plat/ctop.h b/arch/arc/plat-eznps/include/plat/ctop.h
index 9d6718c..ee2e32d 100644
--- a/arch/arc/plat-eznps/include/plat/ctop.h
+++ b/arch/arc/plat-eznps/include/plat/ctop.h
@@ -46,9 +46,7 @@
 #define CTOP_AUX_UDMC				(CTOP_AUX_BASE + 0x300)
 
 /* EZchip core instructions */
-#define CTOP_INST_HWSCHD_OFF_R3			0x3B6F00BF
 #define CTOP_INST_HWSCHD_OFF_R4			0x3C6F00BF
-#define CTOP_INST_HWSCHD_RESTORE_R3		0x3E6F70C3
 #define CTOP_INST_HWSCHD_RESTORE_R4		0x3E6F7103
 #define CTOP_INST_SCHD_RW			0x3E6F7004
 #define CTOP_INST_SCHD_RD			0x3E6F7084
-- 
1.7.1
