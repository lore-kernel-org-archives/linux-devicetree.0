From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: [PATCH 02/14] ARM: Kirkwood: Remove tclk from
 kirkwood_asoc_platform_data.
Date: Wed,  7 Mar 2012 03:44:43 +0000
Message-ID: <86ba431c57ae2f9172bdd92f69fd7a0938e4a374.1331090356.git.jason@lakedaemon.net>
References: <cover.1331090356.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <cover.1331090356.git.jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
In-Reply-To: <cover.1331090356.git.jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
References: <cover.1330625877.git.jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
 <cover.1331090356.git.jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, michael-QKn5cuLxLXY@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>

It is not used anywhere in the sound driver.

Signed-off-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Signed-off-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
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
