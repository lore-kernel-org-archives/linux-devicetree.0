From: Ian Lartey <ian@slimlogic.co.uk>
Subject: [PATCH v9 04/11] watchdog: Kconfig for Palmas watchdog
Date: Fri, 22 Mar 2013 13:36:06 +0000
Message-ID: <1363959373-10671-5-git-send-email-ian@slimlogic.co.uk>
References: <1363959373-10671-1-git-send-email-ian@slimlogic.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1363959373-10671-1-git-send-email-ian@slimlogic.co.uk>
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
Cc: linux-doc@vger.kernel.org, linus.walleij@linaro.org, grant.likely@secretlab.ca, wim@iguana.be, ldewangan@nvidia.com, gg@slimlogic.co.uk, linux-leds@vger.kernel.org, sfr@canb.auug.org.au, mturquette@linaro.org, sameo@linux.intel.com, linux-watchdog@vger.kernel.org, swarren@wwwdotorg.org, devicetree-discuss@lists.ozlabs.org, cooloney@gmail.com, rob.herring@calxeda.com, linux-arm-kernel@lists.infradead.org, j-keerthy@ti.com, broonie@opensource.wolfsonmicro.com, lgirdwood@gmail.com, t-kristo@ti.com, rpurdie@rpsys.net, rob@landley.net, akpm@linux-foundation.org
List-Id: devicetree@vger.kernel.org

Add the Kconfig and Makefile for the Palmas watchdog driver

Signed-off-by: Ian Lartey <ian@slimlogic.co.uk>
Signed-off-by: Graeme Gregory <gg@slimlogic.co.uk>
---
 drivers/watchdog/Kconfig  |    8 ++++++++
 drivers/watchdog/Makefile |    1 +
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 9fcc70c..d48cb0e 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -103,6 +103,14 @@ config WM8350_WATCHDOG
 	  Support for the watchdog in the WM8350 AudioPlus PMIC.  When
 	  the watchdog triggers the system will be reset.
 
+config PALMAS_WATCHDOG
+	tristate "Palmas Watchdog"
+	depends on MFD_PALMAS
+	select WATCHDOG_CORE
+	help
+	  Support for the watchdog in the Palmas family of PMICs. When the
+	  watchdog times out system will be reset.
+
 # ALPHA Architecture
 
 # ARM Architecture
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index a300b94..e845c21 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -171,3 +171,4 @@ obj-$(CONFIG_WM831X_WATCHDOG) += wm831x_wdt.o
 obj-$(CONFIG_WM8350_WATCHDOG) += wm8350_wdt.o
 obj-$(CONFIG_MAX63XX_WATCHDOG) += max63xx_wdt.o
 obj-$(CONFIG_SOFT_WATCHDOG) += softdog.o
+obj-$(CONFIG_PALMAS_WATCHDOG) += palmas_wdt.o
-- 
1.7.0.4
