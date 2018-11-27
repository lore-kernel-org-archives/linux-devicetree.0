From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH 3/4] defconfig: arm64: add i.MX system controller RTC support
Date: Tue, 27 Nov 2018 09:41:37 +0000
Message-ID: <1543311334-8807-4-git-send-email-Anson.Huang__31811.8974952542$1543311640$gmane$org@nxp.com>
References: <1543311334-8807-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1543311334-8807-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "a.zummo@towertech.it" <a.zummo@towertech.it>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Aisheng DONG <aisheng.dong@nxp.com>, Andy Gross <andy.gross@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "amit.kucheria@linaro.org" <amit.kucheria@linaro.org>, "ezequiel@collabora.com" <ezequiel@collabora.com>, "olof@lixom.net" <olof@lixom.net>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, devicetree@vger
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch enables CONFIG_RTC_DRV_IMX_SC by default.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6d224f7..6fdf2d0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -573,6 +573,7 @@ CONFIG_RTC_DRV_PL031=y
 CONFIG_RTC_DRV_SUN6I=y
 CONFIG_RTC_DRV_ARMADA38X=y
 CONFIG_RTC_DRV_TEGRA=y
+CONFIG_RTC_DRV_IMX_SC=y
 CONFIG_RTC_DRV_XGENE=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_BCM2835=m
-- 
2.7.4
