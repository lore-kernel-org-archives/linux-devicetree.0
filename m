From: Jason Cooper <jason@lakedaemon.net>
Subject: [PATCH 2/5] ARM: kirkwood: move var setting to correct location.
Date: Fri,  2 Mar 2012 17:50:19 +0000
Message-ID: <f32cdce5ddde93ed6705b505262494efe92db4c7.1330709314.git.jason@lakedaemon.net>
References: <cover.1330709314.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1330709314.git.jason@lakedaemon.net>
In-Reply-To: <cover.1330709314.git.jason@lakedaemon.net>
References: <cover.1330709314.git.jason@lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arnd@arndb.de, grant.likely@secretlab.ca
Cc: devicetree-discuss@lists.ozlabs.org, Jason Cooper <jason@lakedaemon.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This variable should be set within the driver init function that uses
it's struct, not in the generic init function.

Signed-off-by: Jason Cooper <jason@lakedaemon.net>
---
 arch/arm/mach-kirkwood/common.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-kirkwood/common.c b/arch/arm/mach-kirkwood/common.c
index 357fcde..d9e4d99 100644
--- a/arch/arm/mach-kirkwood/common.c
+++ b/arch/arm/mach-kirkwood/common.c
@@ -382,6 +382,7 @@ static struct platform_device kirkwood_pcm_device = {
 void __init kirkwood_audio_init(void)
 {
 	kirkwood_clk_ctrl |= CGC_AUDIO;
+	kirkwood_i2s_data.tclk = kirkwood_tclk;
 	platform_device_register(&kirkwood_i2s_device);
 	platform_device_register(&kirkwood_pcm_device);
 }
@@ -450,7 +451,6 @@ void __init kirkwood_init(void)
 {
 	printk(KERN_INFO "Kirkwood: %s, TCLK=%d.\n",
 		kirkwood_id(), kirkwood_tclk);
-	kirkwood_i2s_data.tclk = kirkwood_tclk;
 
 	/*
 	 * Disable propagation of mbus errors to the CPU local bus,
-- 
1.7.3.4
