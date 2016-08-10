From: Karl Beldan <kbeldan@baylibre.com>
Subject: [PATCH v2 2/4] ARM: davinci_all_defconfig: Enable AEMIF as a module
Date: Wed, 10 Aug 2016 11:00:30 +0000
Message-ID: <20160810110032.29295-3-kbeldan@baylibre.com>
References: <20160810110032.29295-1-kbeldan@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160810110032.29295-1-kbeldan@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Karl Beldan <karl.beldan+oss@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Karl Beldan <kbeldan@baylibre.com>, Santosh Shilimkar <ssantosh@kernel.org>
List-Id: devicetree@vger.kernel.org

This enables the use of the memory/ti-aemif.c driver.
ATM most davinci boards use the mach-davinci aemif code which gets in
the way of genericity and proper DT boot.

Signed-off-by: Karl Beldan <kbeldan@baylibre.com>
---
 arch/arm/configs/davinci_all_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/davinci_all_defconfig b/arch/arm/configs/davinci_all_defconfig
index d037d3d..2802897 100644
--- a/arch/arm/configs/davinci_all_defconfig
+++ b/arch/arm/configs/davinci_all_defconfig
@@ -192,6 +192,8 @@ CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_OMAP=m
 CONFIG_DMADEVICES=y
 CONFIG_TI_EDMA=y
+CONFIG_MEMORY=y
+CONFIG_TI_AEMIF=m
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
 CONFIG_XFS_FS=m
-- 
2.9.2
