From: Jason Cooper <jason@lakedaemon.net>
Subject: [PATCH 2/7] ARM: Kirkwood: Remove tclk from
 kirkwood_asoc_platform_data.
Date: Tue, 13 Mar 2012 01:57:44 +0000
Message-ID: <9d2db81e89358f51a24f4d189586ac7b1aef8547.1331601448.git.jason@lakedaemon.net>
References: <cover.1331601448.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1331601448.git.jason@lakedaemon.net>
In-Reply-To: <cover.1331601448.git.jason@lakedaemon.net>
References: <cover.1330625877.git.jason@lakedaemon.net>
 <cover.1331601448.git.jason@lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arnd@arndb.de, olof@lixom.net
Cc: nicolas.pitre@linaro.org, andrew@lunn.ch, Jason Cooper <jason@lakedaemon.net>, jm@lentin.co.uk, grant.likely@secretlab.ca, michael@walle.cc, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>

It is not used anywhere in the sound driver.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Jason Cooper <jason@lakedaemon.net>
---
 arch/arm/mach-kirkwood/common.c          |    1 -
 arch/arm/plat-orion/include/plat/audio.h |    1 -
 2 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-kirkwood/common.c b/arch/arm/mach-kirkwood/common.c
index cc15426..eacf7f5 100644
--- a/arch/arm/mach-kirkwood/common.c
+++ b/arch/arm/mach-kirkwood/common.c
@@ -449,7 +449,6 @@ void __init kirkwood_init(void)
 {
 	printk(KERN_INFO "Kirkwood: %s, TCLK=%d.\n",
 		kirkwood_id(), kirkwood_tclk);
-	kirkwood_i2s_data.tclk = kirkwood_tclk;
 
 	/*
 	 * Disable propagation of mbus errors to the CPU local bus,
diff --git a/arch/arm/plat-orion/include/plat/audio.h b/arch/arm/plat-orion/include/plat/audio.h
index 885f8ab..d6a55bd 100644
--- a/arch/arm/plat-orion/include/plat/audio.h
+++ b/arch/arm/plat-orion/include/plat/audio.h
@@ -2,7 +2,6 @@
 #define __PLAT_AUDIO_H
 
 struct kirkwood_asoc_platform_data {
-	u32 tclk;
 	int burst;
 };
 #endif
-- 
1.7.3.4
