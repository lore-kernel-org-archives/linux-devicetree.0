From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: [PATCH 1/9] ARM: orion: spi: remove enable_clock_fix which is not used
Date: Fri, 16 Mar 2012 04:21:21 +0000
Message-ID: <eefe66c948eeb87f67f28ff162ad905de273a650.1331868507.git.jason@lakedaemon.net>
References: <cover.1331868507.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <cover.1331868507.git.jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
In-Reply-To: <cover.1331868507.git.jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
References: <cover.1330625877.git.jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
 <cover.1331868507.git.jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org, michael-QKn5cuLxLXY@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>

Signed-off-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Signed-off-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 drivers/spi/spi-orion.c       |    5 -----
 include/linux/spi/orion_spi.h |    1 -
 2 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-orion.c b/drivers/spi/spi-orion.c
index 13448c8..e496f79 100644
--- a/drivers/spi/spi-orion.c
+++ b/drivers/spi/spi-orion.c
@@ -359,11 +359,6 @@ static int orion_spi_setup(struct spi_device *spi)
 
 	orion_spi = spi_master_get_devdata(spi->master);
 
-	/* Fix ac timing if required.   */
-	if (orion_spi->spi_info->enable_clock_fix)
-		orion_spi_setbits(orion_spi, ORION_SPI_IF_CONFIG_REG,
-				  (1 << 14));
-
 	if ((spi->max_speed_hz == 0)
 			|| (spi->max_speed_hz > orion_spi->max_speed))
 		spi->max_speed_hz = orion_spi->max_speed;
diff --git a/include/linux/spi/orion_spi.h b/include/linux/spi/orion_spi.h
index decf6d8..b4d9fa6 100644
--- a/include/linux/spi/orion_spi.h
+++ b/include/linux/spi/orion_spi.h
@@ -11,7 +11,6 @@
 
 struct orion_spi_info {
 	u32	tclk;		/* no <linux/clk.h> support yet */
-	u32	enable_clock_fix;
 };
 
 
-- 
1.7.3.4
