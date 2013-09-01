From: Markus Pargmann <mpa@pengutronix.de>
Subject: [PATCH v3 7/7] ARM: imx27: enable pinctrl
Date: Sun,  1 Sep 2013 09:28:08 +0200
Message-ID: <1378020488-21129-8-git-send-email-mpa@pengutronix.de>
References: <1378020488-21129-1-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1378020488-21129-1-git-send-email-mpa@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Markus Pargmann <mpa@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
---
 arch/arm/mach-imx/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index f7a5ad1..52c5e7e 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -120,6 +120,8 @@ config SOC_IMX27
 	select IMX_HAVE_IOMUX_V1
 	select MACH_MX27
 	select MXC_AVIC
+	select PINCTRL
+	select PINCTRL_IMX27
 
 config SOC_IMX31
 	bool
-- 
1.8.4.rc3
