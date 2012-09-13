From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH v3 3/5] arm: mvebu: use GPIO support now that a driver is
 available
Date: Thu, 13 Sep 2012 17:54:16 +0200
Message-ID: <1347551658-24449-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1347551658-24449-1-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1347551658-24449-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Lior Amsalem <alior@marvell.com>, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <rob.herring@calxeda.com>, Maen Suleiman <maen@marvell.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Gregory CLEMENT <gregory.clement@free-electrons.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Gregory Clement <gregory.clement@free-electrons.com>
---
 arch/arm/Kconfig                        |    1 +
 arch/arm/mach-mvebu/include/mach/gpio.h |    1 +
 2 files changed, 2 insertions(+)
 create mode 100644 arch/arm/mach-mvebu/include/mach/gpio.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 2eb3f6b..d00d1a3 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -575,6 +575,7 @@ config ARCH_MVEBU
 	select COMMON_CLK
 	select PLAT_ORION
 	select PINCTRL
+	select ARCH_WANT_OPTIONAL_GPIOLIB
 	help
 	  Support for the Marvell SoC Family with device tree support
 
diff --git a/arch/arm/mach-mvebu/include/mach/gpio.h b/arch/arm/mach-mvebu/include/mach/gpio.h
new file mode 100644
index 0000000..40a8c17
--- /dev/null
+++ b/arch/arm/mach-mvebu/include/mach/gpio.h
@@ -0,0 +1 @@
+/* empty */
-- 
1.7.9.5
