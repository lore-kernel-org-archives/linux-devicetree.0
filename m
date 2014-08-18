From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 2/9] arm: multi_v7_defconfig: Enable Mediatek platform
Date: Mon, 18 Aug 2014 16:58:30 +0200
Message-ID: <1408373917-10002-3-git-send-email-matthias.bgg@gmail.com>
References: <1408373917-10002-1-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1408373917-10002-1-git-send-email-matthias.bgg@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, heiko@sntech.de, anders.berg@lsi.com, linus.walleij@linaro.org, stefan@agner.ch, lee.jones@linaro.org, linux@arm.linux.org.uk, pawel.moll@arm.com, srv_yingjoe.chen@mediatek.com, sebastian.hesselbarth@gmail.com, devicetree@vger.kernel.org, jason@lakedaemon.net, arnd@arndb.de, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, matthias.bgg@gmail.com, swarren@nvidia.com, linux-arm-kernel@lists.infradead.org, thomas.petazzoni@free-electrons.com, galak@codeaurora.org, olof@lixom.net, maxime.ripard@free-electrons.com
List-Id: devicetree@vger.kernel.org

Enable Mediatek platform support for multi_v7_defconfig.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 arch/arm/configs/multi_v7_defconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 5fb95fb..4c08101 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -42,6 +42,7 @@ CONFIG_SOC_AM33XX=y
 CONFIG_SOC_AM43XX=y
 CONFIG_SOC_DRA7XX=y
 CONFIG_ARCH_QCOM=y
+CONFIG_ARCH_MEDIATEK=y
 CONFIG_ARCH_MSM8X60=y
 CONFIG_ARCH_MSM8960=y
 CONFIG_ARCH_MSM8974=y
-- 
1.7.9.5
