From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: [PATCH 06/14] ARM: kirkwood: convert uart0 to devicetree.
Date: Wed,  7 Mar 2012 03:44:47 +0000
Message-ID: <80fb8cef577eee14364e95009f7a590fd9056ee3.1331090356.git.jason@lakedaemon.net>
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

This uart is the primary console for the dreamplug.  Removed
kirkwood_uart0_init() call from board-dt.c.

Signed-off-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Reviewed-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Acked-by: Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---
 arch/arm/boot/dts/kirkwood-dreamplug.dts |    7 +++++++
 arch/arm/mach-kirkwood/board-dt.c        |    2 --
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/kirkwood-dreamplug.dts b/arch/arm/boot/dts/kirkwood-dreamplug.dts
index 578806d..ebb2c87 100644
--- a/arch/arm/boot/dts/kirkwood-dreamplug.dts
+++ b/arch/arm/boot/dts/kirkwood-dreamplug.dts
@@ -15,4 +15,11 @@
 		bootargs = "console=ttyS0,115200n8 earlyprintk";
 	};
 
+	serial@f1012000 {
+		compatible = "ns16550a";
+		reg = <0xf1012000 0xff>;
+		reg-shift = <2>;
+		interrupts = <33>;
+		clock-frequency = <200000000>;
+	};
 };
diff --git a/arch/arm/mach-kirkwood/board-dt.c b/arch/arm/mach-kirkwood/board-dt.c
index f9f446b..b55d25b 100644
--- a/arch/arm/mach-kirkwood/board-dt.c
+++ b/arch/arm/mach-kirkwood/board-dt.c
@@ -143,8 +143,6 @@ static void __init dreamplug_init(void)
 	 */
 	kirkwood_mpp_conf(dreamplug_mpp_config);
 
-	kirkwood_uart0_init();
-
 	spi_register_board_info(dreamplug_spi_slave_info,
 				ARRAY_SIZE(dreamplug_spi_slave_info));
 	kirkwood_spi_init();
-- 
1.7.3.4
