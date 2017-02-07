From: David Lechner <david@lechnology.com>
Subject: [PATCH 2/3] ARM: davinci_all_defconfig: Enable TI ADS7950
Date: Tue,  7 Feb 2017 13:22:08 -0600
Message-ID: <1486495329-2789-3-git-send-email-david@lechnology.com>
References: <1486495329-2789-1-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1486495329-2789-1-git-send-email-david@lechnology.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, David Lechner <david@lechnology.com>, Kevin Hilman <khilman@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

This enables the TI ADS7950 IIO driver. This is used on LEGO MINDSTORMS
EV3. The other IIO configs removed in this patch are selected by
CONFIG_TI_ADS7950, so they are not actually being desabled.

Signed-off-by: David Lechner <david@lechnology.com>
---
 arch/arm/configs/davinci_all_defconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/configs/davinci_all_defconfig b/arch/arm/configs/davinci_all_defconfig
index c8663ea..0a95fc4 100644
--- a/arch/arm/configs/davinci_all_defconfig
+++ b/arch/arm/configs/davinci_all_defconfig
@@ -204,12 +204,10 @@ CONFIG_MEMORY=y
 CONFIG_TI_AEMIF=m
 CONFIG_DA8XX_DDRCTL=y
 CONFIG_IIO=m
-CONFIG_IIO_BUFFER=y
 CONFIG_IIO_BUFFER_CB=m
-CONFIG_IIO_KFIFO_BUF=m
-CONFIG_IIO_TRIGGER=y
 CONFIG_IIO_SW_DEVICE=m
 CONFIG_IIO_SW_TRIGGER=m
+CONFIG_TI_ADS7950=m
 CONFIG_IIO_HRTIMER_TRIGGER=m
 CONFIG_IIO_SYSFS_TRIGGER=m
 CONFIG_PWM=y
-- 
2.7.4
